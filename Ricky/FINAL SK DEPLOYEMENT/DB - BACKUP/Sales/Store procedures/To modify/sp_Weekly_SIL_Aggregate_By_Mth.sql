IF  EXISTS (SELECT * FROM sys.procedures WHERE object_id = OBJECT_ID(N'[dbo].[sp_Weekly_SIL_Aggregate_By_Mth]'))
DROP PROCEDURE [dbo].[sp_Weekly_SIL_Aggregate_By_Mth]
GO 

CREATE PROCEDURE [dbo].[sp_Weekly_SIL_Aggregate_By_Mth] with recompile
as
DECLARE @RECALC_MONTHS    NUMERIC(4,0) ,
        @SINGLE_TABLE_RUN NCHAR(1)

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
		  @SP_NAME = 'sp_Weekly_SIL_Aggregate_By_Mth'; -- name of stored proc being executed		
				
EXEC sp_INSERT_WC_SP_DECOMMISION @SP_NAME,				
				 @DATE_OF_EXECUTION;
-- End				


  IF EXISTS (SELECT  1 FROM WC_BU_D (NOLOCK) WHERE COUNTRY_CODE IN ( 'SR','AT','GE','PT','IT','ES','BE','NL','CH','WW','UA','FR', 'RO', 'CA','IE', 'PL','EC','CZ','SE','UK','SK','HU')) /* CR 6343*/
    BEGIN 

	  --------------------------
      -- 12 months back processing
      --------------------------
	/*
   	  SET @RECALC_MONTHS = 12

	  UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_9002_FR')

	  EXEC sp_Agg_By_Mth_SD_M_A 'Y';
     
	  --------------------------
      -- 11 months back processing
      --------------------------
	
   	  SET @RECALC_MONTHS = 11

	  UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_9002_FR')

	  EXEC sp_Agg_By_Mth_SD_M_A 'Y';

	  --------------------------
      -- 10 months back processing
      --------------------------
	
   	  SET @RECALC_MONTHS = 10

	  UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_9002_FR')

	  EXEC sp_Agg_By_Mth_SD_M_A 'Y';

	  --------------------------
      -- 9 months back processing
      --------------------------
	
   	  SET @RECALC_MONTHS = 9

	  UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_9002_FR')

	  EXEC sp_Agg_By_Mth_SD_M_A 'Y';

	  --------------------------
      -- 8 months back processing
      --------------------------
	
   	  SET @RECALC_MONTHS = 8

	  UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_9002_FR')

	  EXEC sp_Agg_By_Mth_SD_M_A 'Y';

	  --------------------------
      -- 7 months back processing
      --------------------------
	
   	  SET @RECALC_MONTHS = 7

	  UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_9002_FR')

	  EXEC sp_Agg_By_Mth_SD_M_A 'Y';

	  --------------------------
      -- 6 months back processing
      --------------------------
	
   	  SET @RECALC_MONTHS = 6

	  UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_9002_FR')

	  EXEC sp_Agg_By_Mth_SD_M_A 'Y';

	  --------------------------
      -- 5 months back processing
      --------------------------
	
   	  SET @RECALC_MONTHS = 5

	  UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_9002_FR')

	  EXEC sp_Agg_By_Mth_SD_M_A 'Y';

	  --------------------------
      -- 4 months back processing
      --------------------------
	
   	  SET @RECALC_MONTHS = 4

	  UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_9002_FR')

	  EXEC sp_Agg_By_Mth_SD_M_A 'Y';

      --------------------------
      -- 3 month back processing
      --------------------------

      SET @RECALC_MONTHS = 3

       -- Non YTD COuntries
       UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_ES' ,
                              'WC_SALES_M_A_RU' ,
                              'WC_SALES_M_A_CH' ,
			      'WC_SALES_M_A_RO' ,
			      'WC_SALES_M_A_CA',
				  'WC_SALES_M_A_IE',
				  'WC_SALES_M_A_EC',
				  'WC_SALES_M_A_PL',
				  'WC_SALES_M_A_CZ',
				  'WC_SALES_M_A_SR',
				  'WC_SALES_M_A_GE',
				  'WC_SALES_M_A_PT',
				  'WC_SALES_M_A_AT',
				  'WC_SALES_M_A_SK',
				   WC_SALES_M_A_HU'				  
                            ) /* CR 6343*/

       --  YTD COuntries
       UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_BE'      ,
                              'WC_SALES_M_A_NL'      ,  
                              'WC_SALES_M_A_WW'      ,
                              'WC_SALES_M_A_UA'      ,
                              'WC_SALES_M_A_9000_FR' , 
                              'WC_SALES_M_A_9001_FR' , 
                              'WC_SALES_M_A_9002_FR' ,
                              'WC_SALES_M_A_9003_FR' ,
                              'WC_SALES_M_A_9004_FR' , 
                              'WC_SALES_M_A_9005_FR' ,
                              'WC_SALES_M_A_9006_FR' , 
                              'WC_SALES_M_A_NONDAILY_FR' ,
                              'WC_SALES_M_A_DAILY_FR'--,
                             -- 'WC_STOCK_LEVELS_M_A_R',
                             -- 'WC_STOCK_MOVEMENTS_M_A_R'
                            )
  
       EXEC sp_Agg_By_Mth_SD_M_A 'Y';
       --EXEC sp_Agg_By_Mth_SM_M_A_R   ;
       --EXEC sp_Agg_By_Mth_SL_M_A_R   ;

       --------------------------
       -- 2 month back processing
       --------------------------

      SET @RECALC_MONTHS = 2
     
       -- Non YTD COuntries
       UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_ES' ,
                              'WC_SALES_M_A_RU' ,
                              'WC_SALES_M_A_CH' ,
			      'WC_SALES_M_A_RO' ,
			      'WC_SALES_M_A_CA' ,
				  'WC_SALES_M_A_IE',
				  'WC_SALES_M_A_EC', 
				  'WC_SALES_M_A_PL', 
				  'WC_SALES_M_A_CZ',
				  'WC_SALES_M_A_SR',
				  'WC_SALES_M_A_GE',
				  'WC_SALES_M_A_PT',
				  'WC_SALES_M_A_AT',
				  'WC_SALES_M_A_SK'	,
				  'WC_SALES_M_A_HU'	 						  
                            ) /* CR 6343*/

       --  YTD COuntries
       UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              YTD               = 'Y'
       WHERE TABLE_NAME IN ( 'WC_SALES_M_A_BE'      ,
                             'WC_SALES_M_A_NL'      ,  
                             'WC_SALES_M_A_WW'      ,
                             'WC_SALES_M_A_UA'      ,
                             'WC_SALES_M_A_9000_FR' , 
                             'WC_SALES_M_A_9001_FR' , 
                             'WC_SALES_M_A_9002_FR' ,
                             'WC_SALES_M_A_9003_FR' ,
                             'WC_SALES_M_A_9004_FR' , 
                             'WC_SALES_M_A_9005_FR' ,
                             'WC_SALES_M_A_9006_FR' , 
                             'WC_SALES_M_A_NONDAILY_FR' ,
                             'WC_SALES_M_A_DAILY_FR'--,
                             --'WC_STOCK_LEVELS_M_A_R',
                             --'WC_STOCK_MOVEMENTS_M_A_R'
                          )
   
      EXEC sp_Agg_By_Mth_SD_M_A 'Y';
     -- EXEC sp_Agg_By_Mth_SM_M_A_R   ;
     -- EXEC sp_Agg_By_Mth_SL_M_A_R   ;

      --------------------------
      -- last month's back processing
      --------------------------

     SET @RECALC_MONTHS = 1

      -- Non YTD COuntries
      UPDATE WC_AGG_RECALC_POLICY_P
         SET CALC_ONLY_THIS_FLG = 'Y', 
             RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
    					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
             RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
    					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
             YTD                = 'Y'
       WHERE TABLE_NAME IN ( 'WC_SALES_M_A_ES' ,
                             'WC_SALES_M_A_RU' ,
                             'WC_SALES_M_A_CH' ,
			     'WC_SALES_M_A_RO' ,
			     'WC_SALES_M_A_CA' ,
				 'WC_SALES_M_A_IE',
				 'WC_SALES_M_A_EC',
				 'WC_SALES_M_A_PL',
				 'WC_SALES_M_A_CZ',
				  'WC_SALES_M_A_SR',
				  'WC_SALES_M_A_GE',
				  'WC_SALES_M_A_PT',
				  'WC_SALES_M_A_AT',
				  'WC_SALES_M_A_SK',
				  'WC_SALES_M_A_HU'		
                           ) /* CR 6343*/

      --  YTD COuntries
      UPDATE WC_AGG_RECALC_POLICY_P
         SET CALC_ONLY_THIS_FLG = 'Y', 
             RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
    					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
             RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
             YTD                = 'Y'
       WHERE TABLE_NAME IN ( 'WC_SALES_M_A_BE'      ,
                             'WC_SALES_M_A_NL'      ,  
                             'WC_SALES_M_A_WW'      ,
                             'WC_SALES_M_A_UA'      ,
                             'WC_SALES_M_A_9000_FR' , 
                             'WC_SALES_M_A_9001_FR' , 
                             'WC_SALES_M_A_9002_FR' ,
                             'WC_SALES_M_A_9003_FR' ,    
                             'WC_SALES_M_A_9004_FR' , 
                             'WC_SALES_M_A_9005_FR' ,
                             'WC_SALES_M_A_9006_FR' , 
                             'WC_SALES_M_A_NONDAILY_FR' ,
                             'WC_SALES_M_A_DAILY_FR',
                           --  'WC_STOCK_LEVELS_M_A_R',
                           --  'WC_STOCK_MOVEMENTS_M_A_R',
                             'WC_SALES_M_A_IT'      ,
                             'WC_SALES_M_A_9007_FR' , 
                             'WC_SALES_M_A_9008_FR' ,
                             'WC_SALES_M_A_9009_FR' --,
                            -- 'WC_SALES_M_A_R_IT'      
                           )
      
      EXEC sp_Agg_By_Mth_SD_M_A 'Y' ;
     -- EXEC sp_Agg_By_Mth_SD_M_A_R_IT;
     -- EXEC sp_Agg_By_Mth_SM_M_A_R   ;
     -- EXEC sp_Agg_By_Mth_SL_M_A_R   ;

      --------------------------
      -- Current month back processing
      --------------------------

      SET @RECALC_MONTHS = 0

      -- Non YTD COuntries
      UPDATE WC_AGG_RECALC_POLICY_P
         SET CALC_ONLY_THIS_FLG = 'Y', 
             RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
             RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
             YTD                = 'Y'
       WHERE TABLE_NAME IN ( 'WC_SALES_M_A_ES' ,
                             'WC_SALES_M_A_RU' ,
                             'WC_SALES_M_A_CH' ,
			     'WC_SALES_M_A_RO' ,
			     'WC_SALES_M_A_CA' ,
				 'WC_SALES_M_A_IE',
				  'WC_SALES_M_A_EC',
				  'WC_SALES_M_A_PL',
				  'WC_SALES_M_A_CZ',
				  'WC_SALES_M_A_SR',
				  'WC_SALES_M_A_GE',
				  'WC_SALES_M_A_PT',
				  'WC_SALES_M_A_AT',
				  'WC_SALES_M_A_SK',
				  'WC_SALES_M_A_HU'						 
                           ) /* CR 6343*/

      --  YTD COuntries
      UPDATE WC_AGG_RECALC_POLICY_P
         SET CALC_ONLY_THIS_FLG = 'Y', 
             RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
    					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
             RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
    					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
             YTD               = 'Y'
       WHERE TABLE_NAME IN ( 'WC_SALES_M_A_BE'      ,
                             'WC_SALES_M_A_NL'      ,  
                             'WC_SALES_M_A_WW'      ,
                             'WC_SALES_M_A_UA'      ,
                             'WC_SALES_M_A_9000_FR' , 
                             'WC_SALES_M_A_9001_FR' , 
                             'WC_SALES_M_A_9002_FR' ,
                             'WC_SALES_M_A_9003_FR' ,
                             'WC_SALES_M_A_9004_FR' , 
                             'WC_SALES_M_A_9005_FR' ,
                             'WC_SALES_M_A_9006_FR' , 
                             'WC_SALES_M_A_NONDAILY_FR' ,
                             'WC_SALES_M_A_DAILY_FR',
                            -- 'WC_STOCK_LEVELS_M_A_R',
                            -- 'WC_STOCK_MOVEMENTS_M_A_R',
                             'WC_SALES_M_A_IT'      ,
                             'WC_SALES_M_A_9007_FR' , 
                             'WC_SALES_M_A_9008_FR' ,
                             'WC_SALES_M_A_9009_FR' --,
                            -- 'WC_SALES_M_A_R_IT'    
                           )
  
      EXEC sp_Agg_By_Mth_SD_M_A 'Y' ;
     -- EXEC sp_Agg_By_Mth_SD_M_A_R_IT;
     -- EXEC sp_Agg_By_Mth_SM_M_A_R   ;
     -- EXEC sp_Agg_By_Mth_SL_M_A_R   ;
  
      --------------------------
*/
      SET @RECALC_MONTHS = 0

      UPDATE WC_AGG_RECALC_POLICY_P
         SET CALC_ONLY_THIS_FLG = 'Y', 
             RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
    					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
             RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
	    				+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate()))
       WHERE TABLE_NAME = 'WCV_GOALS_M_A'  
     
      EXEC sp_Weekly_SIL_Aggregate_Goals  'Y';

      --------------------------

      PRINT 'Start of weekly goals '

      --EXEC sp_Weekly_SIL_Aggregate_Yearly  'N';

      PRINT 'Start of weekly YEArly'

   END 

  IF EXISTS (SELECT  1 FROM WC_BU_D (NOLOCK) WHERE COUNTRY_CODE IN ( 'MY','TW','KR', 'KZ') )
    BEGIN 

       --------------------------
       -- 3 month back processing
       --------------------------
      /* SET @RECALC_MONTHS = 3

       -- Non YTD COuntries
       UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_MY' ,
                              'WC_SALES_M_A_TW' ,
                              'WC_SALES_M_A_KR' ,
                              'WC_SALES_M_A_KZ' 
                            )
  
       EXEC sp_Agg_By_Mth_SD_M_A_ASI 'Y';


       --------------------------
       -- 2 month back processing
       --------------------------

       SET @RECALC_MONTHS = 2

       -- Non YTD COuntries
       UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_MY' ,
                              'WC_SALES_M_A_TW' ,
                              'WC_SALES_M_A_KR' ,
                              'WC_SALES_M_A_KZ' 
                            )
  
       EXEC sp_Agg_By_Mth_SD_M_A_ASI 'Y';


       --------------------------
       -- 1 month back processing
       --------------------------

       SET @RECALC_MONTHS = 1

       -- Non YTD COuntries
       UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_MY' ,
                              'WC_SALES_M_A_TW' ,
                              'WC_SALES_M_A_KR' ,
                              'WC_SALES_M_A_KZ' 
                            )
  
       EXEC sp_Agg_By_Mth_SD_M_A_ASI 'Y';


       --------------------------
       -- Current month back processing
       --------------------------

       SET @RECALC_MONTHS = 0

       -- Non YTD COuntries
       UPDATE WC_AGG_RECALC_POLICY_P
          SET CALC_ONLY_THIS_FLG = 'Y', 
              RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
              RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
     					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
               YTD               = 'Y'
        WHERE TABLE_NAME IN ( 'WC_SALES_M_A_MY' ,
                              'WC_SALES_M_A_TW' ,
                              'WC_SALES_M_A_KR' ,
                              'WC_SALES_M_A_KZ' 
                            )
  
       EXEC sp_Agg_By_Mth_SD_M_A_ASI 'Y';

      --------------------------

     */ SET @RECALC_MONTHS = 0

      UPDATE WC_AGG_RECALC_POLICY_P
         SET CALC_ONLY_THIS_FLG = 'Y', 
             RECALC_START       = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
    					+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate())),
             RECALC_END         = YEAR(DATEADD(MONTH, - @RECALC_MONTHS , getdate())) * 100
	    				+ MONTH(DATEADD(MONTH, -@RECALC_MONTHS, getdate()))
       WHERE TABLE_NAME = 'WCV_GOALS_M_A'  
     
      EXEC sp_Weekly_SIL_Aggregate_Goals  'Y';

      --------------------------

      PRINT 'Start of weekly goals '

      --EXEC sp_Weekly_SIL_Aggregate_Yearly_ASI  'N';

      PRINT 'Start of weekly YEArly'
    END 
END


