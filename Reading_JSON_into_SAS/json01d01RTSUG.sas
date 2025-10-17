************************************************************************;
* Demo 1.01: Working with JSON Files Using SAS                         *;
* NOTE: Execute the libname.sas program if necessary.                  *;
************************************************************************;


**********;
* Step 1 *;
**********;
***********************************************************;
* Open, review, and run the libname.sas program           *;
***********************************************************;
* Course folder > libname.sas                             *;
***********************************************************;
* Note: You must complete the Setting Up Your Practice    *;
*       Files instructions at the end of Course Overview  *;
*       and Datea Setup section to create the libname.sas *;
*       program.                                          *;
***********************************************************;



********************************************************;
* Step 2 - View the JSON file                          *;
********************************************************;
/*******************************************************************************************************************/
/* The JSON file was obtain from the world bank at this address (valid 01/2023):                                   */
/* https://api.worldbank.org/v2/country/GR;BR;US/indicator/NY.GDP.MKTP.CD/?format=json&per_page=100&date=2000:2022 */
/*******************************************************************************************************************/

filename myFile "&path/data/countries_gdp.json";

data _null_;
	rc=jsonpp('myfile','log');
run;



********************************************************;
* Step 3 - Working with a JSON file using SAS          *;
********************************************************;

*******************************************;
* a. Read JSON file and create SAS tables *;
*******************************************;
libname jsonFile JSON fileref=myFile noalldata;


****************************************;
* b. Preview the SAS tables            *;
****************************************;
title "New SAS tables";
title2 "Root";
proc print data=jsonFile.root(obs=5);
run;

title2 "Country";
proc print data=jsonFile.country(obs=5);
run;

title2 "Indicator";
proc print data=jsonFile.indicator(obs=5);
run;
title;


****************************************;
* c. Prepare the data                  *;
****************************************;
proc sql;
create table work.countries_gdp as 
	select r.countryiso3code, 
		   ctry.value as Country,
		   input(r.date,8.) as date, 
		   r.value as GDP format=dollar20.,
		   i.value as Unit
		from jsonFile.root as r 
		inner join jsonFile.country as ctry 
			on r.ordinal_root=ctry.ordinal_root
		inner join jsonFile.indicator as i 
			on r.ordinal_root=i.ordinal_root
		order by Country, Date;
quit;

title "Prepared data";
proc print data=work.countries_gdp;
run;
title;





*******************************************************;
* e. Create a final JSON file from the prepared data  *;
*******************************************************;
filename outFile "&outpath./json01d01_json_output.json";

proc json out=outFile pretty nosastags;
	write open object;

		write values "Data Name" "countries_gdp";
		write values "Description" "Combined data from Greece, USA and Brazil (2000 - 2022)";
		write values "Source" "World Bank";
		write values "Permission" "Open Data";
		write values "Comments" "Data was cleaned and combined";
		write values "User" "Peter S";
		
		write values "Data";
		write open array;
				export work.countries_gdp;
		write close;
	write close;
run;


libname jsonFile clear;
filename myfile clear;
filename outfile clear;
