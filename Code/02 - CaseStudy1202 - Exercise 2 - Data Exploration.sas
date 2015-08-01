/*********************************
Case Study - Class 12 - Exercise 2
Claims Data - Risk Prediction using Linear Model
STEP 2: Data Exploration
*****************************************/

LIBNAME CS12E02 '/folders/myshortcuts/myfolder/SSCode/20150724/Datasets';



/** remove missing values data if any **/
DATA CS12E02.CLAIMS_DATA_REMOVE_MISSING;
	SET CS12E02.CLAIMS_DATA;
	IF 
		Policy_Number ^= . AND
		Year ^= . AND
		IDV ^= . AND
		City ^= "" AND 
		State ^= "" AND 
		Claim ^= . AND
		Cubic_Capacity ^= . AND
		Mfr_Model ^= "" AND 
		Premium ^= . ;
RUN;


/** PROC FREQ on the  Data **/
PROC FREQ
	DATA=CS12E02.CLAIMS_DATA_REMOVE_MISSING;
	TABLE
		Year
		City
		State
		Cubic_Capacity 
		Mfr_Model;
	TITLE1 "PROC Freq of Year , City , State , Cubic_Capacity , Mfr_Model"; 
RUN;



/** PROC MEANS on the  Data **/
PROC MEANS
	DATA=CS12E02.CLAIMS_DATA_REMOVE_MISSING;
	VAR
		Year
		Cubic_Capacity;
	TITLE1 "PROC MEANS of Year , Cubic_Capacity"; 
RUN;




/** PROC FREQ to understand relationship of City / State **/
PROC FREQ
	DATA=CS12E02.CLAIMS_DATA_REMOVE_MISSING;
	TABLES
		City * State;
	TITLE1 "PROC FREQ to understand relationship of City / State"; 
RUN;


/** PROC FREQ to understand relationship between Mfr_Model * Cubic_Capacity **/
PROC FREQ
	DATA=CS12E02.CLAIMS_DATA_REMOVE_MISSING;
	TABLE
		Mfr_Model * Cubic_Capacity /NOCOL NOCUM NOPERCENT ;
	TITLE1 "PROC FREQ to understand relationship between Mfr_Model * Cubic_Capacity "; 
	TITLE2 "The Cubic Capacity is a function of the Model - so it is not an Independent Variable";
RUN;





/** PROC FREQ OF Policy Numbers - to see if there are multiple claims per policy */
PROC FREQ NOPRINT
	DATA=CS12E02.CLAIMS_DATA_REMOVE_MISSING;
	TABLE
		Policy_Number / OUT=POLICY_NUMBER_FREQ;
RUN;


/** Printing the Policy numbers with multiple claims **/
PROC PRINT
	DATA=CS12E02.POLICY_NUMBER_FREQ;
	WHERE COUNT > 1;
	TITLE1 "Some Policies do have multiple Claims";
	TITLE2 "So Policy Number has to be an Independent Variable";
	
