/* Do the join using SPEDIS 
   Once with cutoff at 50 
   Once with cutoff at 175
   What difference do you see?*/

%let cutoff=50;
*%let cutoff=175; 

proc sql noprint;
create table spedis as
select cat.SubscriberID
      ,cat.Name as CatLover
      ,cust.CustomerID
      ,catx(' ',cust.Firstname,cust.lastname) length=80 as Customer 
      ,case
         when SubscriberID not in (&goodlist) then 'False Positive'
         when SubscriberID in (&joinlist) then 'As Joined'
         else 'New Match'
       end as Status
      ,SUM(SPEDIS(scan(upcase(cat.name), 1,' '),upcase(FirstName))
         ,SPEDIS(scan(upcase(cat.name),-1,' '),upcase(LastName))) as Score
   from catyums.customers as cust
      inner join
        catyums.catlovers as cat
            /* uppercase FirstName and LastName match OR total SPEDIS score <= cutoff */
      on (upcase(scan(cat.name,-1,' '))=upcase(LastName) and upcase(scan(cat.name,1,' '))=upcase(FirstName)
          or (SUM(SPEDIS(scan(upcase(cat.name), 1,' '),upcase(FirstName))
               ,SPEDIS(scan(upcase(cat.name),-1,' '),upcase(LastName))) <= &cutoff))
            /* City and State match OR Zip codes match */
         and (upcase(cat.State)=upcase(cust.state) and upcase(cat.City)=upcase(cust.city)
             or put(Zipcode,z5.)=scan(Zip,1,'-'))
;
select SubscriberID 
   into :spedislist separated by ','
   from spedis
;
select put(count(*)/&matchObs, percent6.1) 
   into :spedisPct trimmed
   from spedis
    where Status ^= 'False Positive'
; 
quit;

data result;
   merge spedis matches;
   by subscriberid;
   if missing(Status) then Status='Missed';
run;

title "SPEDIS (&spedisPCT) vs. Join (&joinPct)";
title2 "Cutoff = &cutoff";
title3 "8 new matches, 0 misses, 1 false positive";
%if &cutoff=50 %then %do;
title3 "2 new matches, 6 misses, 1 false positive";
%end;

;
proc report data=result nowd;
     column SubscriberID CatLover CustomerID Customer Score Status;
     define SubscriberID / order;
     define CatLover / display;
     define CustomerID / display;
     define Customer / display;
     define Score / display;
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
