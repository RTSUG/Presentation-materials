/* Do the join using COMPLEV 
   Once with cutoff at 5 
   Once with cutoff at 10
   What difference do you see?*/

%let cutoff=5;
*%let cutoff=10;
 
proc sql noprint;
create table complev as 
select cat.SubscriberID
      ,cat.Name as CatLover
      ,cust.CustomerID
      ,catx(' ',cust.Firstname,cust.lastname) length=80 as Customer 
      ,case 
         when SubscriberID not in (&goodlist) then 'False Positive' 
         when SubscriberID in (&joinlist) then 'As Joined'
         else 'New Match' 
       end as Status
      ,sum(COMPLEV(scan(cat.name, 1,' '),FirstName,99,'iln'),
           COMPLEV(scan(cat.name,-1,' '),LastName ,99,'iln')) as Score
   from catyums.customers as cust
      inner join
        catyums.catlovers as cat
            /* uppercase FirstName and LastName match OR total COMPLEV score <= cutoff */
      on (upcase(scan(cat.name,-1,' '))=upcase(LastName) and upcase(scan(cat.name,1,' '))=upcase(FirstName)
          or (sum(COMPLEV(scan(cat.name, 1,' '),FirstName,99,'iln')
               ,COMPLEV(scan(cat.name,-1,' '),LastName ,99,'iln')) <= &cutoff))
            /* City and State match OR Zip codes match */
         and (upcase(cat.State)=upcase(cust.state) and upcase(cat.City)=upcase(cust.city)
             or put(Zipcode,z5.)=scan(Zip,1,'-'))
;
select SubscriberID 
   into :complevlist separated by ','
   from complev
;
select put(count(*)/&matchObs, percent6.1) 
   into :complevPct trimmed
   from complev
    where Status ^= 'False Positive'
; 
quit;

data result;
   merge complev matches;
   by subscriberid;
   if missing(Status) then Status='Missed';
run;

title "COMPLEV (&complevPCT) vs. Join (&joinPct)";
title2 "Cutoff = &cutoff";
title3   "8 new matches, 0 misses, 1 false positive";
%if &cutoff=5 %then %do;
title3   "4 new matches, 4 misses, 1 false positive";
%end;

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

