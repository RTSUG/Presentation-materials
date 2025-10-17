/* Sample the Data */
proc FedSQL;
	title "Customers";
	select Name,Street1,City, State from catyums.Customers2 limit 15;
	title "Cat Lovers Mailing List";
	select Name,Address,City, State from catyums.CatLovers2 limit 15;
quit;
proc sql number;
select Cat.Name as CatLover
      ,Cust.Name as CustName
      ,cat.Address as CatStreet
      ,cust.Street1 as CustStreet
      ,cat.City as CatCity
      ,cust.City as CustCity 
      ,Cat.State as CatState
      ,Cust.State as CustState
      ,Cat.Zip as CatZip
      ,Cust.Zip as CustZip
      ,case
 		  when upcase(substr(cat.Address,1,10))=upcase(substr(cust.Street1,1,10))
              and upcase(cat.City)=upcase(cust.City)
              and upcase(substr(cat.State,1,2))=upcase(cust.State)
              and cat.Zip=cust.Zip
           then 'Yes'
           else 'No'
       end as Match
		from catyums.Customers2 as cust
		 left join 
         catyums.CatLovers2 as cat
	on    upcase(substr(cat.Address,1,10))=upcase(substr(cust.Street1,1,10))
	  and upcase(cat.City)=upcase(cust.City)
      and upcase(cat.State)=upcase(cust.State)
	  and cat.Zip=cust.Zip
	where calculated Match='Yes'
;
quit;
title;

/* Use DQ fuzzy matching */
proc options group=dataquality;
run;
/* Check DQ settings */
%DQLOAD(DQSETUPLOC="QKB CI 33", DQLOCALE=(ENUSA),DQINFO=1);
/* What match definitions are available in the ENUSA locale? */
data _null_;
	num=dqLocaleInfoList('match', 'ENUSA');
run;

/* Let's use match codes based on the 'City - State/Province - Postal Code' definition to find the matches */
TITLE "Cat Lovers who are already Customers";
proc sql number;
select cust.CustomerID
	  ,Cat.Name as CatLover
      ,Cust.Name 'CustName'
      ,cat.Address as CatStreet
      ,cust.Street1 'CustStreet'
      ,cat.City as CatCity
      ,cust.City 'CustCity' 
      ,Cat.State as CatState
      ,Cust.State 'CustState'
      ,Cat.Zip as CatZip
      ,Cust.Zip 'CustZip'
      ,case
 		  when 	dqmatch(catx(',',cat.Address,cat.City,cat.State,cat.Zip),'City - State/Province - Postal Code')
              =dqmatch(catx(',',cust.Street1,cust.City,cust.State,cust.Zip),'City - State/Province - Postal Code')
			then 'Yes'
            else 'No'
       end as Match
	   into :CustIDs separated by ','
           ,:ExcludeNames separated by '","'
		from catyums.Customers2 as cust
		 left join 
         catyums.CatLovers2 as cat
	on  dqmatch(catx(',',cat.Address,cat.City,cat.State,cat.Zip),'City - State/Province - Postal Code')
       =dqmatch(catx(',',cust.Street1,cust.City,cust.State,cust.Zip),'City - State/Province - Postal Code')
	where calculated Match ='Yes'
	order by cat.Name
;
quit;
title;


%put NOTE: Exclude these names: "&ExcludeNames";

proc sql ;
create table SolicitationMailingList as
select * 
	from catyums.CatLovers2 
	where Name not in
	("&ExcludeNames")
	order by Name
;
quit;

title "Solicitation Mailing List";
proc sql number;
select * 
	from SolicitationMailingList
	order by Name
;	
quit;
title;
