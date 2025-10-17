%let path=~/Demos/Fuzzy Matching in PROC SQL/fuzzy;
libname catyums "&path/data";
proc datasets library=catyums kill nolist nodetails;
run; quit;
%include "&path/data/supporting_code/create*.sas";
