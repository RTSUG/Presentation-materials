/* Coding for Data Quality - Part 3: Matching */
/* Check DQ settings */
%DQLOAD(DQSETUPLOC="QKB CI 33", DQLOCALE=(ENUSA),DQINFO=1);
proc options group=dataquality;
run;
/* Sample the Data */
proc FedSQL;
	title "Customers";
	select Name,Street1,City, State from catyums.Customers2 limit 5;
	title "Cat Lovers Mailing List";
	select Name,Address,City, State from catyums.CatLovers2 limit 5;
quit;

/* Get a list of match definitions available in the ENUSA locale */
data _null_;
	x=DQLOCALEINFOLIST('match', 'ENUSA');
run;

/* Peek at some match codes */
proc SQL;
title "Address Match Codes";
select 'Customer List' as Source,Street1,dqmatch(Street1,'Address') 'Match Code'
		from catyums.Customers2 (obs=1)
		union all
	select 'Cat Lovers',Address,dqmatch(Address,'Address')
		from catyums.CatLovers2 (obs=1);
quit;

proc sql;
title "Solicitation list";
select 'Customer List' as Source,City, State
		,dqmatch(CATX(', ',City, State),'City - State/Province - Postal Code') 'Match Code'
		from catyums.Customers2 (obs=1)
		union all
	select 'Cat Lovers',City, State
		,dqmatch(CATX(', ',City, State),'City - State/Province - Postal Code') 
		from catyums.CatLovers2 (obs=1);
quit;

proc dqmatch data=catyums.Customers2 out=work.customers(keep=CustomerID Name Street1 City State Zip MatchID)
				 matchcode=matchID  locale='ENUSA';
   criteria var=Street1 matchdef='Address';
   criteria var=City matchdef='City';
   criteria var=State matchdef='City - State/Province - Postal Code';
run;

proc dqmatch data=catyums.CatLovers2 out=work.catlovers(keep=Name Address City State Zip MatchID)
				 matchcode=matchID  locale='ENUSA';
   criteria var=Address matchdef='Address';
   criteria var=City matchdef='City';
   criteria var=State matchdef='City - State/Province - Postal Code';
run;

proc FedSQL;
select cl.Name,cl.Address,cl.City,cl.State,cl.Zip 
	from work.catlovers as cl
		left join work.customers as c
		on c.MatchID=cl.MatchID
	where CustomerID is null;
quit;

			  