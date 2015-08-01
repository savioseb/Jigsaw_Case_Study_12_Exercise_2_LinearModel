/*********************************
Case Study - Class 12 - Exercise 2
Claims Data - Risk Prediction using Linear Model
STEP 1: Getting the Data
*****************************************/

LIBNAME CS12E02 '/folders/myshortcuts/myfolder/SSCode/20150724/Datasets';


/** Importing the Dataset **/
PROC IMPORT
	Datafile='/folders/myshortcuts/myfolder/Foundation Exercises/Assignments/Class12 - Linear Regression with SAS/Claims_Data_Sample.csv'
	DBMS=CSV
	REPLACE
	OUT=CS12E02.CLAIMS_DATA;
RUN;


