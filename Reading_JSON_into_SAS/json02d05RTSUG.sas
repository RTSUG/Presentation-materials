************************************************************************;
* Demo 2.05: Creating JSON Files with PROC JSON                        *;
* NOTE: Execute the libname.sas program if necessary.                  *;
************************************************************************;

/********************************************/
/* 1. Create a JSON file using a SAS table  */
/********************************************/

/* View the SAS table */
proc print data=pg.people;
run;


/* Export the SAS table as a JSON file */
proc json out="&outpath./xj02d05_1_simple.json";
	export pg.people;
run;


/* Manually view the file */



/***************************************/
/* 2. Format the output JSON file      */
/***************************************/

/* Create the JSON file */
filename out_json "&outpath./xj02d05_2_pretty.json";


/* Add the PRETTY and NOSASTAGS options */
proc json out=out_json pretty nosastags;
	export pg.people;
run;

/* Manually view the file */



/***********************************************/
/* 3. Write simple values to the JSON file     */
/***********************************************/

/* a. Create a new JSON file */
filename out_json "&outpath./xj02d05_3_simple_text.json";

/* Single string (error) */
proc json out=out_json pretty nosastags;
	write values "Name";
run;


/* b. Create an object with a single key-value pair */
proc json out=out_json pretty nosastags;
	write values "Name" "Peter";
run;

/* View the JSON file */
data _null_;
	rc = jsonpp('out_json', 'log');
run;


/* c. Create an object with multiple key-value pairs */
proc json out=out_json pretty nosastags;
	write values "Name" "Peter";
	write values "Age" 35;
	write values "spouse" FALSE;
	write values "workFromHome" NULL;
run;

data _null_;
	rc = jsonpp('out_json', 'log');
run;



/*******************************************************/
/* 4. Use JSON containers to create arrays             */
/*******************************************************/

/* Create the JSON file reference */
filename out_json "&outpath./xj02d05_4_json_arrays.json";

/*Create an array with multiple elements */
proc json out=out_json pretty nosastags;
	/* Create an array */
	write open array;
	
		/* first array element */
		write open array;
			write values "Peter" 35 TRUE NULL;
		write close;
		
		/* second array element */
		write open array;
			write values "Steve" 63 FALSE FALSE;
		write close;
		
	/* Close array */
	write close;
run;

/* View the contents of the JSON file */
data _null_;
	rc = jsonpp('out_json', 'log');
run;



/*******************************************************/
/* 5. Use JSON containers to create objects            */
/*******************************************************/

/* Create a new JSON file */
filename out_json "&outpath./xj02d05_5_json_objects.json";

/* Create objects in an array */ 
proc json out=out_json pretty nosastags;
	/* Create an array */
	write open array;
	
		/* Object 1 */
		write open object;
			write values "Name" "Peter";
			write values "Age" 35;
		write close;
		
		/* Object 2*/
		write open object;
			write values "Name" "Kristi";
			write values "Age" 32;
		write close;
		
	write close;
run;

/* View the contents of the JSON file */
data _null_;
	rc = jsonpp('out_json', 'log');
run;



/*******************************************************/
/* 6. Create the final JSON file                       */
/*******************************************************/

/* Create a new JSON file */
filename out_json "&outpath./xj02d05_6_final.json";

proc json out=out_json pretty nosastags;
	/* Top level object */
	write open object;
	
		/* Create key value pairs with information about the SAS table */
		write values "TableName" "PEOPLE";
		write values "Description" "Data contains information about people.";
		write values "Confidential" TRUE;
		write values "CreatedOn" "2/27/2024";
			
		/* Create a key to hold the table as an array */
		write values 'Data';
		write open array;
			export pg.people;
		write close;
		
	/* Close top level object */
	write close;
run;

/* View the JSON file */
data _null_;
	rc = jsonpp('out_json', 'log');
run;

filename out_json clear;
