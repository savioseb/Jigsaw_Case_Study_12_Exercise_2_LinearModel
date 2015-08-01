/*********************************
Case Study - Class 12 - Exercise 2
Claims Data - Risk Prediction using Linear Model
STEP 5: Followup Tasks
*****************************************/

LIBNAME CS12E02 '/folders/myshortcuts/myfolder/SSCode/20150724/Datasets';

	
/** Grouping the Data using IQR **/	
PROC MEANS Q1 Q3 MEDIAN MAX MIN NOPRINT
	DATA=CS12E02.CLAIMS_DATA_W_PREDICTED;
	VAR Predicted_Claims;
	OUTPUT
		OUT=CS12E02.QUARTILE_DATA
		Q1(Predicted_Claims) = Predicted_Claims_Q1
		Q3(Predicted_Claims) = Predicted_Claims_Q3;
RUN;

/** Preparing the Quartile Data for Join **/
DATA CS12E02.QUARTILE_DATA_WITH_JOIN_FIELD;
	SET CS12E02.QUARTILE_DATA;
	FIELD=1;
RUN;


/** Preparing the Claims Data with Predicted Claims for Join with Quartile Info **/
DATA CS12E02.CLAIMS_DATA_W_PRED_W_JOIN_FLD;
	SET CS12E02.CLAIMS_DATA_W_PREDICTED;
	FIELD=1;
RUN;


/** Merging the Predicted Claims Data along with the Quartile info to make the Table */
DATA CS12E02.CLAIMS_DATA_MERGE_QUARTILE;
	MERGE CS12E02.CLAIMS_DATA_W_PRED_W_JOIN_FLD CS12E02.QUARTILE_DATA_WITH_JOIN_FIELD;
	BY FIELD;
	
	RISK_PERCENT_HIGH = 0.03;
	RISK_PERCENT_MEDIUM = 0.02;
	RISK_PERCENT_LOW = 0.01;
	
	IF Predicted_Claims < Predicted_Claims_Q1 
		THEN DO;
			Risk_Profile_Low=1;
			Risk_Profile = "Low     ";
			SUGGESTED_PREMIUM = RISK_PERCENT_LOW * IDV;
		END;
	ELSE IF Predicted_Claims < Predicted_Claims_Q3
		THEN DO;
			Risk_Profile_Medium=1;
			Risk_Profile = "Medium";
			SUGGESTED_PREMIUM = RISK_PERCENT_MEDIUM * IDV;
		END;
	ELSE DO;
		Risk_Profile_High = 1 ;
		Risk_Profile = "High     ";
		SUGGESTED_PREMIUM = RISK_PERCENT_HIGH * IDV;
	END;
	IF Risk_Profile_Low = . THEN Risk_Profile_Low = 0;
	IF Risk_Profile_Medium = . THEN Risk_Profile_Medium = 0;
	IF Risk_Profile_High = . THEN Risk_Profile_High = 0;
	/** 2% of Premium as surcharges **/
	SUGGESTED_PREMIUM = SUGGESTED_PREMIUM + (.02 * SUGGESTED_PREMIUM);
RUN;
	


/** Printing the Suggested Premiums and Risk Profiles **/
PROC PRINT
	DATA=CS12E02.CLAIMS_DATA_MERGE_QUARTILE(OBS=20);
	VAR IDV Mfr_Model Year Risk_Profile SUGGESTED_PREMIUM Premium;
	TITLE1 "Suggested Premium";
RUN;


	

/** Exporting the Model Data with Predicted Values **/
PROC EXPORT 
	DATA = CS12E02.CLAIMS_DATA_MERGE_QUARTILE 
	OUTFILE = "/folders/myshortcuts/myfolder/SSCode/JigsawCaseStudy12Exercise2_LinearModel/CSVs/CaseStudy1202_Exercise2.CSV"
	DBMS = CSV 
	REPLACE;
RUN;