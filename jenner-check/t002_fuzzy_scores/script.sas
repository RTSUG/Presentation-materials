/* Fuzzy-match scoring with the functions from the RTSUG "Fuzzy Matching in SAS"
   demos: SOUNDEX, SPEDIS, COMPLEV and COMPGED. The scoring expressions are taken
   verbatim from Fuzzy_matching_in_SAS/demos (SOUNDEX/SPEDIS/COMPLEV/COMPGED), run
   here as a single self-contained PROC SQL over the customers and catlovers tables. */
proc sql;
create table fuzzy_scores as
select cat.SubscriberID
      ,cat.Name as CatLover length=50
      ,catx(' ',cust.Firstname,cust.lastname) as Customer length=80
      ,catx(', ',SOUNDEX(scan(cat.name,1,' ')),SOUNDEX(scan(cat.name,-1,' '))) as SoundexCode length=12
      ,SUM(SPEDIS(scan(upcase(cat.name), 1,' '),upcase(FirstName))
          ,SPEDIS(scan(upcase(cat.name),-1,' '),upcase(LastName))) as SpedisScore
      ,sum(COMPLEV(scan(cat.name, 1,' '),FirstName,99,'iln')
          ,COMPLEV(scan(cat.name,-1,' '),LastName ,99,'iln')) as ComplevScore
      ,SUM(COMPGED(scan(cat.name, 1,' '),FirstName,250,'iln')
          ,COMPGED(scan(cat.name,-1,' '),LastName ,250,'iln')) as CompgedScore
   from work.customers as cust
      inner join work.catlovers as cat
      on (upcase(cat.State)=upcase(cust.state) and upcase(cat.City)=upcase(cust.city)
          or put(Zipcode,z5.)=scan(Zip,1,'-'))
   order by SpedisScore
;
quit;

title "Fuzzy-match scores (SOUNDEX / SPEDIS / COMPLEV / COMPGED)";
proc print data=fuzzy_scores label noobs;
run;
title;
