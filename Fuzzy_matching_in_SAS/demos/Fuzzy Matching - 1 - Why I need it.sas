/******************************************************************************
 I have some control data I can use to identify actual matches. While not 
 available in real world applications, it makes the matches, false positives, 
 and false negatives easy to see for the demo. 
******************************************************************************/
proc sql noprint;
create table matches as
select cat.SubscriberID
      ,cat.Name as CatLover
      ,cust.CustomerID
      ,catx(' ',cust.Firstname,cust.lastname) length=80 as Customer 
   from catyums.customers as cust
      inner join
        catyums.crossref as x
      on x.CustomerID=cust.CustomerID
      inner join
       catyums.catlovers as cat
      on x.SubscriberID=cat.SubscriberID
;
create table matches_full as
select cat.SubscriberID
      ,cat.Name as CatLover
      ,cat.Address1
      ,cat.City
       ,cat.State
       ,cat.Zip
      ,cust.CustomerID
      ,catx(' ',cust.Firstname,cust.lastname) length=80 as Customer
       ,cust.StreetAddress
       ,cust.City
       ,cust.State
       ,cust.ZipCode
   from catyums.customers as cust
      inner join
        catyums.crossref as x
      on x.CustomerID=cust.CustomerID
      inner join
       catyums.catlovers as cat
      on x.SubscriberID=cat.SubscriberID
;
/* We can use this list see if future joined rows are false positive or false negatives. */
select SubscriberID
   into :goodlist separated by ','
   from matches
;
/* Remember how many rows actually match. */
select count(*) 
   into :matchObs trimmed
   from matches
; 
quit;


proc sql noprint;
/* Join just using text field casing and the 5 digit zipcodes */
create table joined as
select cat.SubscriberID
      ,cat.Name as CatLover
      ,cust.CustomerID
      ,catx(' ',cust.Firstname,cust.lastname) length=80 as Customer 
      ,'Got it!    ' as Status
   from catyums.customers as cust
      inner join
        catyums.catlovers as cat
      on upcase(scan(cat.name,-1,' '))=upcase(LastName)
         and upcase(scan(cat.name,1,' ')) =upcase(FirstName)
         and upcase(cat.State)=upcase(cust.state)
         and upcase(cat.City)=upcase(cust.city)
         and put(Zipcode,z5.)=scan(Zip,1,'-')
;
/* Get the IDs for the join results */
select SubscriberID 
   into :joinlist separated by ','
   from joined
;

/* Calculate the percentage of actual matches found using this technique */
select put(count(*)/&matchObs, percent6.1) 
   into :joinPct trimmed
   from joined
; 
quit;

/* Prep a table for reporting */
data result;
   merge joined matches;
   by subscriberid;
   if missing(Status) then Status='Missed';
run;

title "Join Results - &joinPct found";
proc report data=result nowd;
     column SubscriberID CatLover CustomerID Customer Status;
     define SubscriberID / order;
     define CatLover / display;
     define CustomerID / display;
     define Customer / display;
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

/******************************************************************************
 BONUS: "ANNA CHRISTIAN" and "Anna Christian" did not match. Why? The following 
        code displays all variables used for the match, including state, city, 
        and zip. Observe the output to see if all variables match in each row.
******************************************************************************/

/* /* Create tables to show join variables from each list */ */
/* proc sql; */
/* /* CatLovers match criteria */ */
/* create table catjoin1 as */
/* select cat.SubscriberID */
/* ,upcase(scan(cat.name,-1,' ')) as CatLN */
/* ,upcase(scan(cat.name,1,' ')) as CatFN */
/* ,upcase(cat.State) as CatState */
/* ,upcase(cat.City) as CatCity */
/* ,scan(Zip,1,'-') as CatZip */
/* ,r.Status */
/*    from catyums.catlovers as cat */
/*       inner join */
/*        result as r */
/*       on r.SubscriberID=cat.SubscriberID */
/* ; */
/* /* Customers match criteria */ */
/* create table custjoin1 as */
/* select cust.CustomerID */
/* ,upcase(LastName) as CustLN */
/* ,upcase(FirstName) as CustFN */
/* ,upcase(cust.state) as CustState */
/* ,upcase(cust.city) as CustCity */
/* ,put(Zipcode,z5.) as CustZip */
/* ,r.Status */
/*    from catyums.customers as cust */
/*       inner join */
/*        result as r */
/*       on r.CustomerID=cust.CustomerID */
/* ; */
/* quit; */
/*  */
/* /* Print reports */ */
/* title "Cat join criteria (City mismatch)"; */
/* proc report data=catjoin1 nowd; */
/*      column SubscriberID CatLN CatFN CatState CatCity CatZip Status; */
/*      define SubscriberID / order; */
/*      define CatLN / display; */
/*      define CatFN / display; */
/*      define CatState / display; */
/*      define CatCity / display; */
/*     define CatZip / display; */
/*     define Status / display; */
/*      compute Status; */
/*       if SubscriberID=10010188 then */
/*         call define(_row_,"style","style={background=#F9E247}"); */
/*        else if Status= 'New Match' then */
/*           call define(_row_,"style","style={background=#00FFFF}"); */
/*        else if Status = 'False Positive' then */
/*           call define(_row_,"style","style={background=#F3AAAA}"); */
/*        else if Status ='Missed' then */
/*           call define(_row_,"style","style={background=#FFF3A0}"); */
/*      endcomp; */
/*    compute CatCity; */
/*       if CatCity='FT WALTON BEACH' then */
/*          call define(_col_,"style","style={background=#F99E47}"); */
/*     endcomp; */
/* run; */
/*  */
/* title "Customer join criteria (City mismatch)"; */
/* proc report data=custjoin1 nowd; */
/*      column CustomerID CustLN CustFN CustState CustCity CustZip Status; */
/*      define CustomerID / order; */
/*      define CustLN / display; */
/*      define CustFN / display; */
/*      define CustState / display; */
/*      define CustCity / display; */
/*     define CustZip / display; */
/*     define Status / display; */
/*      compute Status; */
/*       if CustomerID=000100000012 then */
/*         call define(_row_,"style","style={background=#F9E247}"); */
/*        else if Status= 'New Match' then */
/*           call define(_row_,"style","style={background=#00FFFF}"); */
/*        else if Status = 'False Positive' then */
/*           call define(_row_,"style","style={background=#F3AAAA}"); */
/*        else if Status ='Missed' then */
/*           call define(_row_,"style","style={background=#FFF3A0}"); */
/*      endcomp; */
/*    compute CustCity; */
/*       if CustCity='FORT WALTON BEACH' then */
/*          call define(_col_,"style","style={background=#F99E47}"); */
/*     endcomp; */
/* run; */
/* title; */
