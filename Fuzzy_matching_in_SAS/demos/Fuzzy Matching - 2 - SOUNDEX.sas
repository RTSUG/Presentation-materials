/* Join using SOUNDEX */
proc sql noprint;
create table soundex as
select cat.SubscriberID
      ,cat.Name as CatLover
      ,cust.CustomerID
      ,catx(' ',cust.Firstname,cust.lastname) length=80 as Customer 
      /* Identify the validity of the results based on the list of known good match IDs */
      ,case
         when SubscriberID not in (&goodlist) then 'False Positive'
         when SubscriberID in (&joinlist) then 'As Joined'
         else 'New Match'
       end as Status
     ,catx(', ',SOUNDEX(scan(cat.name,1,' ')),SOUNDEX(scan(cat.name,-1,' '))) length=10 as CatLoverScores
     ,catx(', ',SOUNDEX(FirstName),SOUNDEX(LastName)) length=10 as CustomerScores
   from catyums.customers as cust
      inner join
        catyums.catlovers as cat
            /* uppercase FirstName and LastName match OR SOUNDEX scores for FirstName and LastName match */
      on (upcase(scan(cat.name,-1,' '))=upcase(LastName) and upcase(scan(cat.name,1,' '))=upcase(FirstName)
          or SOUNDEX(scan(cat.name,1,' '))=SOUNDEX(FirstName) and SOUNDEX(scan(cat.name,-1,' '))=SOUNDEX(LastName))
            /* City and State match OR Zip codes match */
         and (upcase(cat.State)=upcase(cust.state) and upcase(cat.City)=upcase(cust.city)
              or put(Zipcode,z5.)=scan(Zip,1,'-'))
;
/* remember the IDs found with SOUNDEX */
select SubscriberID 
   into :soundexlist separated by ','
   from soundex
;
/* Remember the percentage found with SOUNDEX */
select put(count(*)/&matchObs, percent6.1) 
   into :soundexPct trimmed
   from soundex
    where Status ^= 'False Positive'
; 
quit;

/* Prep a table for reporting */
data result;
   merge soundex matches;
   by subscriberid;
   if missing(Status) then Status='Missed';
run;

/* MICHEAL sounds like MICHAEL*/
title "SOUNDEX (&soundexPCT) vs. Join (&joinPct)";
title3 "2 new matches, 6 misses, 0 false positives";
proc report data=result nowd;
     column SubscriberID CatLover CustomerID Customer CatLoverScores CustomerScores Status;
     define SubscriberID / order;
     define CatLover / display;
     define CustomerID / display;
     define Customer / display;
    define CatLoverScores / display;
     define CustomerScores / display;
     define Status / display;
     compute Status;
       if Status= 'New Match' then
          call define(_row_,"style","style={background=#00FFFF}");
       else if Status = 'False Positive' then
          call define(_row_,"style","style={background=#F3AAAA}");
       else if Status ='Missed' then
          call define(_row_,"style","style={background=#FFF3A0}");
     endcomp;
run;
title;
