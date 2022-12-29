IF  EXISTS (SELECT * FROM sys.procedures WHERE object_id = OBJECT_ID(N'[dbo].[sp_sales_m_denorm_sk]'))
DROP PROCEDURE [dbo].[sp_sales_m_denorm_sk]
GO 

CREATE	PROCEDURE [dbo].[sp_sales_m_denorm_sk] @BU NVARCHAR(100)
AS
BEGIN

/*				
Executing stored proc sp_INSERT_WC_SP_DECOMMISION to populate table WC_SP_DECOMMISION 				
in the context of EXADATA project to indicate whether the stored proc has been run				
*/				
-- Added by Hursha				
-- Begin				
				
DECLARE 				
		  @SP_NAME	  NVARCHAR(100),	
		  @DATE_OF_EXECUTION	  DATETIME	
				
SET 				
		  @SP_NAME = 'sp_sales_m_denorm_SK'; -- name of stored proc being executed		
				
EXEC sp_INSERT_WC_SP_DECOMMISION @SP_NAME,				
				 @DATE_OF_EXECUTION;
-- End				



DECLARE	@COUNT1 INT
DECLARE	@ACTIVE NCHAR(1)
DECLARE	@FREQUENCY NVARCHAR(30)
DECLARE	@START_PERIOD NCHAR(8)
DECLARE	@END_PERIOD NCHAR(8)
DECLARE	@REPEATING_UNIT NCHAR
DECLARE	@LAST_REPEATING_DATE DateTime
DECLARE @REPEATING_NUMBER INT ,@DELTA_DENORM NCHAR(1)


--Validate Param
SELECT @COUNT1 = COUNT(1)
FROM WC_SALES_DENORM_PARAM (NOLOCK)
WHERE DENORM_TABLE = 'WC_SALES_M_DENORM_EIM_SK'

IF @COUNT1 = 0 
BEGIN
	PRINT('There is no parameter for WC_SALES_M_DENORM_EIM_SK denormalization')
	RETURN 1
END

IF @COUNT1 > 1 
BEGIN
	PRINT('There is more that one parameter for WC_SALES_M_DENORM_EIM_SK denormalization')
	RETURN 1
END


--Get Param
SELECT 	@ACTIVE=ACTIVE,
	@FREQUENCY=FREQUENCY,
	@START_PERIOD=START_PERIOD,
	@END_PERIOD=END_PERIOD,
	@REPEATING_UNIT=REPEATING_UNIT,
	@REPEATING_NUMBER=REPEATING_NUMBER,
	@LAST_REPEATING_DATE=LAST_REPEATING_DATE --,@DELTA_DENORM = DELTA_DENORM
FROM WC_SALES_DENORM_PARAM (NOLOCK)
WHERE DENORM_TABLE = 'WC_SALES_M_DENORM_EIM_SK'

PRINT @ACTIVE
PRINT @FREQUENCY
PRINT @START_PERIOD
PRINT @END_PERIOD
PRINT @REPEATING_UNIT
PRINT @LAST_REPEATING_DATE


IF @ACTIVE = 'N' 
BEGIN
	PRINT('WC_SALES_M_DENORM_EIM_SK denormalization not active')
	RETURN 0
END
/*
IF @DELTA_DENORM='Y'
BEGIN
		EXEC sp_sales_m_denorm_SK_delta 'Y';
		RETURN 0;
END 
*/
PRINT('#######################sp_sales_m_denorm_SK #########################')

--TRUNCATE TEMP TABLE
TRUNCATE TABLE WC_SALES_M_DENORM_EIM_SK  

PRINT 'Executing for WC_SALES_M_DENORM_EIM_SK'

--If Frequency is one time
IF @FREQUENCY = 'O'
BEGIN
	IF LEN(@START_PERIOD) <> 6 OR @START_PERIOD IS NULL
	BEGIN
		PRINT('Incorrect parameter for Start Period of WC_SALES_M_DENORM_EIM_SK denormalization. It should be YYYYMM')
		RETURN 1
	END
	
	IF LEN(@END_PERIOD) <> 6 OR @END_PERIOD IS NULL
	BEGIN
		PRINT('Incorrect parameter for End Period of WC_SALES_M_DENORM_EIM_SK denormalization. It should be YYYYMM')
		RETURN 1
	END
END

--If stored proc is called on a weekly basis and thus calculate the start/end month of the monly denorm
IF @FREQUENCY = 'W'
BEGIN
	--validate the repeating number column =>which represents the number of months that the denorm should be run
	IF @REPEATING_NUMBER IS NULL OR @REPEATING_NUMBER < 0
	BEGIN
		PRINT('Incorrect parameter for Repeating Number of WC_SALES_M_DENORM_EIM_SK denormalization. It should be Month')
		RETURN 1
	END

	--set start period the last run month and end period the current period
	IF @LAST_REPEATING_DATE IS NULL
	BEGIN
		--run for current month - @REPEATING_NUMBER
		SET @START_PERIOD = CONVERT(NCHAR(6), DATEADD(month,-1*@REPEATING_NUMBER,getdate()), 112) 
		SET @END_PERIOD = CONVERT(NCHAR(6), getdate(), 112)
		--Update to the first run
		UPDATE WC_SALES_DENORM_PARAM
		SET 	START_PERIOD = @START_PERIOD,
			END_PERIOD = @END_PERIOD,
			LAST_REPEATING_DATE = GETDATE()
		WHERE DENORM_TABLE = 'WC_SALES_M_DENORM_EIM_SK'		
	END
	ELSE
	BEGIN
		--run for last run month - @REPEATING_NUMBER
		SET @START_PERIOD = CONVERT(NCHAR(6), DATEADD(month,-1*@REPEATING_NUMBER,@LAST_REPEATING_DATE), 112) 
		SET @END_PERIOD = CONVERT(NCHAR(6), getdate(), 112)
		--Update to the first run
		UPDATE WC_SALES_DENORM_PARAM
		SET 	START_PERIOD = @START_PERIOD,
			END_PERIOD = @END_PERIOD,
			LAST_REPEATING_DATE = GETDATE()
		WHERE DENORM_TABLE = 'WC_SALES_M_DENORM_EIM_SK'		
	END

END

--If stored proc is called on a dialy basis and thus calculate if time has come to run the denorm
IF @FREQUENCY = 'D'
BEGIN
	--validate the repeating unit
	IF @REPEATING_UNIT IS NULL OR @REPEATING_UNIT <> 'Month'
	BEGIN
		PRINT('Incorrect parameter for Repeating Unit of WC_SALES_M_DENORM_EIM_SK denormalization. It should be Month')
		RETURN 1
	END

	--If last run date is not null, calculate the periods
	IF @LAST_REPEATING_DATE IS NOT NULL
	BEGIN
		SET @START_PERIOD = CONVERT(NCHAR(6), @LAST_REPEATING_DATE, 112) 
		SET @END_PERIOD = CONVERT(NCHAR(6), getdate(), 112)
	END

	--set start period the last run month and end period the current period
	IF @LAST_REPEATING_DATE IS NULL
	BEGIN
		--run for current month
		SET @START_PERIOD = CONVERT(NCHAR(6), getdate(), 112) 
		SET @END_PERIOD = @START_PERIOD
		--Update to the first run
		UPDATE WC_SALES_DENORM_PARAM
		SET LAST_REPEATING_DATE = GETDATE()
		WHERE DENORM_TABLE = 'WC_SALES_M_DENORM_EIM_SK'		
	END

	--if run period has not been reached yet, no run
	IF CONVERT(NCHAR(6), DATEADD(Month, @REPEATING_NUMBER, @LAST_REPEATING_DATE), 112) <> CONVERT(NCHAR(6), getdate(), 112)
	BEGIN
		PRINT('WC_SALES_M_DENORM_EIM_SK denormalization will not be run. Frequency round not reached yet')
		RETURN 1
	END
END

	--perform the denorm
	INSERT INTO WC_SALES_M_DENORM_EIM_SK
	(
	PERIOD_NAME,
	SALES_TYPE,
	ACCNT_LOC,
	ACCNT_NAME,
	PROD_NAME,
	PROD_VENDOR_LOC,
	PROD_VENDOR_NAME,
	ACTL_SHIPMENT_QTY_CASES,
	ACTL_SHIPMENT_QTY
	)
	SELECT 
		P.NAME PERIOD_NAME,
		'Prodeje z VO' SALES_TYPE,
		ORG.ACCNT_LOC ACCNT_LOC,
		ORG.NAME ACCNT_NAME,
		D.PROD_NAME PROD_NAME,
		CASE D.VENDOR_LOC WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_LOC END PROD_VENDOR_LOC,
		CASE D.VENDOR_NAME WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_NAME END PROD_VENDOR_NAME,
		SUM(F.ACTL_SHIPMENT_QTY_C) ACTL_SHIPMENT_QTY_C,
		SUM(F.ACTL_SHIPMENT_QTY) ACTL_SHIPMENT_QTY
	
		FROM WCV_SALES_M_A F WITH (NOLOCK)
		INNER JOIN WC_SALES_TYPE_D ST ON (ST.ROW_WID = F.SALES_TYPE_WID)
		INNER JOIN W_ORG_D ORG ON (ORG.ROW_WID = F.TGT_ACCNT_WID)		INNER JOIN WC_BU_D BU ON (BU.INTEGRATION_ID = ORG.VIS_PR_BU_ID)
		INNER JOIN W_PERIOD_D P ON (CONVERT(NCHAR(6),F.MONTH_WID)+'01' = CONVERT(NCHAR(8),P.START_DT,112) AND P.PERIOD_CD = 'Month' AND P.BU = 'Default Organization')
		INNER JOIN W_PRODUCT_DH DH ON (F.PRODUCT_WID = DH.PROD_WID)
		INNER JOIN W_PRODUCT_D D ON (DH.LVL4ANC_PROD_ID = D.INTEGRATION_ID)
		WHERE F.MONTH_WID BETWEEN @START_PERIOD and @END_PERIOD  
		  AND ST.INTEGRATION_ID = 'Distributor Data'
		  AND BU.COUNTRY_NAME = 'Slovakia, SK'
	
	GROUP BY 
		P.NAME,
		ORG.ACCNT_LOC,
		ORG.NAME,
		D.PROD_NAME,
		CASE D.VENDOR_LOC WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_LOC END,
		CASE D.VENDOR_NAME WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_NAME END
	HAVING SUM(F.ACTL_SHIPMENT_QTY_C) <> 0 OR SUM(F.ACTL_SHIPMENT_QTY) <> 0
	

	INSERT INTO WC_SALES_M_DENORM_EIM_SK
	(
	PERIOD_NAME,
	SALES_TYPE,
	ACCNT_LOC,
	ACCNT_NAME,
	PROD_NAME,
	PROD_VENDOR_LOC,
	PROD_VENDOR_NAME,
	ACTL_SHIPMENT_QTY_CASES,
	ACTL_SHIPMENT_QTY
	)
	SELECT 
		P.NAME PERIOD_NAME,
		'Prodeje od OZ' SALES_TYPE,
		ORG.ACCNT_LOC ACCNT_LOC,
		ORG.NAME ACCNT_NAME,
		D.PROD_NAME PROD_NAME,
		CASE D.VENDOR_LOC WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_LOC END PROD_VENDOR_LOC,
		CASE D.VENDOR_NAME WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_NAME END PROD_VENDOR_NAME,
		SUM(F.ACTL_SHIPMENT_QTY_C) ACTL_SHIPMENT_QTY_C,
		SUM(F.ACTL_SHIPMENT_QTY) ACTL_SHIPMENT_QTY
	
		FROM WCV_SALES_M_A F WITH (NOLOCK)
		INNER JOIN WC_SALES_TYPE_D ST ON (ST.ROW_WID = F.SALES_TYPE_WID)
		INNER JOIN W_ORG_D ORG ON (ORG.ROW_WID = F.TGT_ACCNT_WID)		INNER JOIN WC_BU_D BU ON (BU.INTEGRATION_ID = ORG.VIS_PR_BU_ID)
		INNER JOIN W_PERIOD_D P ON (CONVERT(NCHAR(6),F.MONTH_WID)+'01' = CONVERT(NCHAR(8),P.START_DT,112) AND P.PERIOD_CD = 'Month' AND P.BU = 'Default Organization')
		INNER JOIN W_PRODUCT_DH DH ON (F.PRODUCT_WID = DH.PROD_WID)
		INNER JOIN W_PRODUCT_D D ON (DH.LVL4ANC_PROD_ID = D.INTEGRATION_ID)
		WHERE F.MONTH_WID BETWEEN @START_PERIOD and @END_PERIOD  
		  AND ST.INTEGRATION_ID = 'Ex Car Sales'
		  AND BU.COUNTRY_NAME = 'Slovakia, SK'
	
	GROUP BY 
		P.NAME,
		ORG.ACCNT_LOC,
		ORG.NAME,
		D.PROD_NAME,
		CASE D.VENDOR_LOC WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_LOC END,
		CASE D.VENDOR_NAME WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_NAME END
	HAVING SUM(F.ACTL_SHIPMENT_QTY_C) <> 0 OR SUM(F.ACTL_SHIPMENT_QTY) <> 0
	
	
	INSERT INTO WC_SALES_M_DENORM_EIM_SK
	(
	PERIOD_NAME,
	SALES_TYPE,
	ACCNT_LOC,
	ACCNT_NAME,
	PROD_NAME,
	PROD_VENDOR_LOC,
	PROD_VENDOR_NAME,
	ACTL_SHIPMENT_QTY_CASES,
	ACTL_SHIPMENT_QTY
	)
	SELECT 
		P.NAME PERIOD_NAME,
		'Prodeje z MO' SALES_TYPE,
		ORG.ACCNT_LOC ACCNT_LOC,
		ORG.NAME ACCNT_NAME,
		D.PROD_NAME PROD_NAME,
		CASE D.VENDOR_LOC WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_LOC END PROD_VENDOR_LOC,
		CASE D.VENDOR_NAME WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_NAME END PROD_VENDOR_NAME,
		SUM(F.ACTL_SHIPMENT_QTY_C) ACTL_SHIPMENT_QTY_C,
		SUM(F.ACTL_SHIPMENT_QTY) ACTL_SHIPMENT_QTY
	
		FROM WCV_SALES_M_A F WITH (NOLOCK)
		INNER JOIN WC_SALES_TYPE_D ST ON (ST.ROW_WID = F.SALES_TYPE_WID)
		INNER JOIN W_ORG_D ORG ON (ORG.ROW_WID = F.TGT_ACCNT_WID)		INNER JOIN WC_BU_D BU ON (BU.INTEGRATION_ID = ORG.VIS_PR_BU_ID)
		INNER JOIN W_PERIOD_D P ON (CONVERT(NCHAR(6),F.MONTH_WID)+'01' = CONVERT(NCHAR(8),P.START_DT,112) AND P.PERIOD_CD = 'Month' AND P.BU = 'Default Organization')
		INNER JOIN W_PRODUCT_DH DH ON (F.PRODUCT_WID = DH.PROD_WID)
		INNER JOIN W_PRODUCT_D D ON (DH.LVL4ANC_PROD_ID = D.INTEGRATION_ID)
		WHERE F.MONTH_WID BETWEEN @START_PERIOD and @END_PERIOD  
		  AND ST.INTEGRATION_ID = 'Scaning data'
		  AND BU.COUNTRY_NAME = 'Slovakia, SK'
	
	GROUP BY 
		P.NAME,
		ORG.ACCNT_LOC,
		ORG.NAME,
		D.PROD_NAME,
		CASE D.VENDOR_LOC WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_LOC END,
		CASE D.VENDOR_NAME WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_NAME END
	HAVING SUM(F.ACTL_SHIPMENT_QTY_C) <> 0 OR SUM(F.ACTL_SHIPMENT_QTY) <> 0

	
	INSERT INTO WC_SALES_M_DENORM_EIM_SK
	(
	PERIOD_NAME,
	SALES_TYPE,
	ACCNT_LOC,
	ACCNT_NAME,
	PROD_NAME,
	PROD_VENDOR_LOC,
	PROD_VENDOR_NAME,
	ACTL_SHIPMENT_QTY_CASES,
	ACTL_SHIPMENT_QTY
	)
	SELECT 
		P.NAME PERIOD_NAME,
		'Prodeje dle provozovny' SALES_TYPE,
		ORG.ACCNT_LOC ACCNT_LOC,
		ORG.NAME ACCNT_NAME,
		D.PROD_NAME PROD_NAME,
		CASE D.VENDOR_LOC WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_LOC END PROD_VENDOR_LOC,
		CASE D.VENDOR_NAME WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_NAME END PROD_VENDOR_NAME,
		SUM(F.ACTL_SHIPMENT_QTY_C) ACTL_SHIPMENT_QTY_C,
		SUM(F.ACTL_SHIPMENT_QTY) ACTL_SHIPMENT_QTY
	
		FROM WCV_SALES_M_A F WITH (NOLOCK)
		INNER JOIN WC_SALES_TYPE_D ST ON (ST.ROW_WID = F.SALES_TYPE_WID)
		INNER JOIN W_ORG_D ORG ON (ORG.ROW_WID = F.TGT_ACCNT_WID)		INNER JOIN WC_BU_D BU ON (BU.INTEGRATION_ID = ORG.VIS_PR_BU_ID)
		INNER JOIN W_PERIOD_D P ON (CONVERT(NCHAR(6),F.MONTH_WID)+'01' = CONVERT(NCHAR(8),P.START_DT,112) AND P.PERIOD_CD = 'Month' AND P.BU = 'Default Organization')
		INNER JOIN W_PRODUCT_DH DH ON (F.PRODUCT_WID = DH.PROD_WID)
		INNER JOIN W_PRODUCT_D D ON (DH.LVL4ANC_PROD_ID = D.INTEGRATION_ID)
		WHERE F.MONTH_WID BETWEEN @START_PERIOD and @END_PERIOD  
		  AND ST.INTEGRATION_ID = 'Sales Collection Data'
		  AND BU.COUNTRY_NAME = 'Slovakia, SK'
	
	GROUP BY 
		P.NAME,
		ORG.ACCNT_LOC,
		ORG.NAME,
		D.PROD_NAME,
		CASE D.VENDOR_LOC WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_LOC END,
		CASE D.VENDOR_NAME WHEN 'Unspecified' THEN NULL ELSE D.VENDOR_NAME END
	HAVING SUM(F.ACTL_SHIPMENT_QTY_C) <> 0 OR SUM(F.ACTL_SHIPMENT_QTY) <> 0
	
END





GO


