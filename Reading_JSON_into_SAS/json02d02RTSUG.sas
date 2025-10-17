************************************************************************;
* Demo 2.02: Reading a JSON file with Nested Objects and Arrays        *;
* NOTE: Execute the libname.sas program if necessary.                  *;
************************************************************************;

/*************************************************************/
/* 1. View the contents of the person_info.json file         */
/*************************************************************/

/* Reference the JSON file */
filename myfile "&path./data/person_info.json";

data _null_;
	rc=jsonpp('myfile','log');
run;



/**************************************************/
/* 2. Create a library reference to the JSON file */
/**************************************************/

/* Create a library reference to the JSON file */
libname myfile JSON fileref=myfile;

/* View the SAS tables in the library*/
proc contents data=myfile._all_ nods;
run;



/***************************************************************/
/* 3. View the SAS tables created from the JSON file           */
/* NOTE: Compare the tables to the JSON file side by side      */
/***************************************************************/
/* View the JSON file in the log */
data _null_;
	rc = jsonpp('myfile','log');
run;

/* View the SAS tables and column metadata */

title "Table: ALLDATA";
proc print data=myfile.alldata;
run;
title;

title "Table: ROOT";
proc print data=myfile.root;
run;
title;

title "Table: ADDRESS";
proc print data=myfile.address;
run;
title;

title "Table: PHONENUMBERS";
proc print data=myfile.phonenumbers;
run;
title;

title "Table: CHILDREN";
proc print data=myfile.children;
run;
title;



/***************************************************/
/* 4. Clear the library reference to the JSON file */
/***************************************************/
libname myfile clear;



/*****************************************************/
/* 5. View the contents of the people_info.json file */
/*****************************************************/
/* Reference the JSON file */
filename myfile "&path./data/people_info.json";

/* View the JSON file */
data _null_;
	rc = jsonpp('myfile','log');
run;

/* Create a library reference to the JSON file */
libname myfile json fileref=myfile noalldata; /* <--- suppresses the ALLDATA SAS table */

/* View tables in the myFile library */
proc contents data=myfile._all_ nods;
run;



/***************************************************************/
/* 6. View the SAS tables created from the JSON file           */
/* NOTE: Compare the tables to the JSON file side by side      */
/***************************************************************/
/* View the JSON file in the log */
data _null_;
	rc = jsonpp('myfile','log');
run;

/* View the SAS tables */
title "Table: ROOT";
proc print data=myfile.root;
run;
title;

title "Table: ADDRESS";
proc print data=myfile.address;
run;
title;

title "Table: PHONENUMBERS";
proc print data=myfile.phonenumbers;
run;
title;

title "Table: CHILDREN";
proc print data=myfile.children;
run;
title;



/****************************************************************/
/* 7. Prepare the data to obtain phone numbers for each person  */
/****************************************************************/

proc sql;
/* Create a table with names and phone numbers */
create table work.phoneNumbersList as
	select r.lastName,
	       r.firstName,
	       ph.type as phType,
	       ph.number as phNumber
	 from myfile.root r inner join
	      myfile.phonenumbers ph
	 on r.ordinal_root = ph.ordinal_root;
	 
	 /* View the table */
	 select * from work.phoneNumbersList;
quit;



/***************************************************/
/* 8. Clear the library reference to the JSON file */
/***************************************************/
libname myfile clear;