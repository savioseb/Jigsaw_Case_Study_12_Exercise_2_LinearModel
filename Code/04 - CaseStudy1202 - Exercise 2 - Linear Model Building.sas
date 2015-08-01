/*********************************
Case Study - Class 12 - Exercise 2
Claims Data - Risk Prediction using Linear Model
STEP 4: Model Building
*****************************************/

LIBNAME CS12E02 '/folders/myshortcuts/myfolder/SSCode/20150724/Datasets';


	
/** Creating the Model **/
PROC REG
	DATA = CS12E02.CLAIMS_DATA_ADDING_DUMMIES
	/* to allow plotting *
	PLOTS(MAXPOINTS=NONE) 
	/**/ 
	;

	MODEL 
		Claim = 
			
			IDV
			/** */
			Policy_Number
			City_AHMEDABAD
			City_BANGALORE
			City_BHOPAL
			City_CALICUT
			City_CHENNAI
			City_GURGAON
			City_Guwahati
			City_INDORE
			City_JALANDHAR
			City_KOLHAPUR
			City_KOLKATTA
			City_LUDHIANA
			City_MATHURA
			City_NOIDA
			City_VARANASI

			Mfr_Model_Ford_Figo
			Mfr_Model_Honda_Accord
			Mfr_Model_Honda_City
			Mfr_Model_Honda_Civic
			Mfr_Model_Hyundai_Santro
			Mfr_Model_Mahindra_Scorpio
			Mfr_Model_Maruti_Swift
			Mfr_Model_Mitsubishi_Cedia
			Mfr_Model_Tata_Indica
			Mfr_Model_Tata_Indigo
			Mfr_Model_Tata_Safari
			Year_2006
			Year_2007
			Year_2008
			Year_2009
			Year_2010
			Year_2011	
			
			;
			
	OUTPUT 
		OUT=CS12E02.CLAIMS_DATA_W_PREDICTED 
		RESIDUAL=Residuals PREDICTED=Predicted_Claims;
	TITLE1 "The Predicted Values are not reliable - R-square is too Low - 0.5";
	TITLE2 "More Independent Variables are required to finalize this model!";
RUN;
	
