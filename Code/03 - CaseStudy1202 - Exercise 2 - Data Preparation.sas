/*********************************
Case Study - Class 12 - Exercise 2
Claims Data - Risk Prediction using Linear Model
STEP 3: Data Preparation
*****************************************/

LIBNAME CS12E02 '/folders/myshortcuts/myfolder/SSCode/20150724/Datasets';


	
/** Creating Dummy Variables for City and Mfr_Model */
DATA CS12E02.CLAIMS_DATA_ADDING_DUMMIES;
	SET CS12E02.CLAIMS_DATA_REMOVE_MISSING;
	
	/** Making Dummy variables for Cities - Except for NewDelhi **/
	IF City = "AHMEDABAD" THEN City_AHMEDABAD = 1;
	IF City = "BANGALORE" THEN City_BANGALORE = 1;
	IF City = "BHOPAL" THEN City_BHOPAL = 1;
	IF City = "CALICUT" THEN City_CALICUT = 1;
	IF City = "CHENNAI" THEN City_CHENNAI = 1;
	IF City = "GURGAON" THEN City_GURGAON = 1;
	IF City = "Guwahati" THEN City_Guwahati = 1;
	IF City = "INDORE" THEN City_INDORE = 1;
	IF City = "JALANDHAR" THEN City_JALANDHAR = 1;
	IF City = "KOLHAPUR" THEN City_KOLHAPUR = 1;
	IF City = "KOLKATTA" THEN City_KOLKATTA = 1;
	IF City = "LUDHIANA" THEN City_LUDHIANA = 1;
	IF City = "MATHURA" THEN City_MATHURA = 1;
	IF City = "NOIDA" THEN City_NOIDA = 1;
	IF City = "VARANASI" THEN City_VARANASI = 1;
	
	/** If empty value then 0 **/
	IF City_AHMEDABAD = . THEN City_AHMEDABAD = 0;
	IF City_BANGALORE = . THEN City_BANGALORE = 0;
	IF City_BHOPAL = . THEN City_BHOPAL = 0;
	IF City_CALICUT = . THEN City_CALICUT = 0;
	IF City_CHENNAI = . THEN City_CHENNAI = 0;
	IF City_GURGAON = . THEN City_GURGAON = 0;
	IF City_Guwahati = . THEN City_Guwahati = 0;
	IF City_INDORE = . THEN City_INDORE = 0;
	IF City_JALANDHAR = . THEN City_JALANDHAR = 0;
	IF City_KOLHAPUR = . THEN City_KOLHAPUR = 0;
	IF City_KOLKATTA = . THEN City_KOLKATTA = 0;
	IF City_LUDHIANA = . THEN City_LUDHIANA = 0;
	IF City_MATHURA = . THEN City_MATHURA = 0;
	IF City_NOIDA = . THEN City_NOIDA = 0;
	IF City_VARANASI = . THEN City_VARANASI = 0;
	
	
	/** Creating Dummy Variables for all Manufacture / Models */
	IF Mfr_Model = "Ford Figo" THEN Mfr_Model_Ford_Figo = 1;
	IF Mfr_Model = "Honda Accord" THEN Mfr_Model_Honda_Accord = 1;
	IF Mfr_Model = "Honda City" THEN Mfr_Model_Honda_City = 1;
	IF Mfr_Model = "Honda Civic" THEN Mfr_Model_Honda_Civic = 1;
	IF Mfr_Model = "Hyundai Santro" THEN Mfr_Model_Hyundai_Santro = 1;
	IF Mfr_Model = "Mahindra Scorpio" THEN Mfr_Model_Mahindra_Scorpio = 1;
	IF Mfr_Model = "Maruti Swift" THEN Mfr_Model_Maruti_Swift = 1;
	IF Mfr_Model = "Mitsubishi Cedia" THEN Mfr_Model_Mitsubishi_Cedia = 1;
	IF Mfr_Model = "Tata Indica" THEN Mfr_Model_Tata_Indica = 1;
	IF Mfr_Model = "Tata Indigo" THEN Mfr_Model_Tata_Indigo = 1;
	IF Mfr_Model = "Tata Safari" THEN Mfr_Model_Tata_Safari = 1;
	
	IF Mfr_Model_Ford_Figo = . THEN Mfr_Model_Ford_Figo = 0;
	IF Mfr_Model_Honda_Accord = . THEN Mfr_Model_Honda_Accord = 0;
	IF Mfr_Model_Honda_City = . THEN Mfr_Model_Honda_City = 0;
	IF Mfr_Model_Honda_Civic = . THEN Mfr_Model_Honda_Civic = 0;
	IF Mfr_Model_Hyundai_Santro = . THEN Mfr_Model_Hyundai_Santro = 0;
	IF Mfr_Model_Mahindra_Scorpio = . THEN Mfr_Model_Mahindra_Scorpio = 0;
	IF Mfr_Model_Maruti_Swift = . THEN Mfr_Model_Maruti_Swift = 0;
	IF Mfr_Model_Mitsubishi_Cedia = . THEN Mfr_Model_Mitsubishi_Cedia = 0;
	IF Mfr_Model_Tata_Indica = . THEN Mfr_Model_Tata_Indica = 0;
	IF Mfr_Model_Tata_Indigo = . THEN Mfr_Model_Tata_Indigo = 0;
	IF Mfr_Model_Tata_Safari = . THEN Mfr_Model_Tata_Safari = 0;
	
	/** For Year */
	IF Year = 2006 THEN Year_2006 = 1;
	IF Year = 2007 THEN Year_2007 = 1;
	IF Year = 2008 THEN Year_2008 = 1;
	IF Year = 2009 THEN Year_2009 = 1;
	IF Year = 2010 THEN Year_2010 = 1;
	IF Year = 2011 THEN Year_2011 = 1;
	IF Year_2006 = . THEN Year_2006 = 0;
	IF Year_2007 = . THEN Year_2007 = 0;
	IF Year_2008 = . THEN Year_2008 = 0;
	IF Year_2009 = . THEN Year_2009 = 0;
	IF Year_2010 = . THEN Year_2010 = 0;
	IF Year_2011 = . THEN Year_2011 = 0;
	
	Claim_IDV = Claim / IDV; 
	
RUN;
