SELECT 
	DISTINCT
	S_ASSESS.ROW_ID, 
	S_ASSESS.MODIFICATION_NUM, 
	S_ASSESS.LAST_UPD,
S_ASSESS.DB_LAST_UPD,
IMG.ETL_PROC_WID
FROM 
	S_ASSESS,
	S_TMPL_PLANITEM,
	S_ETL_I_IMG_184 IMG
WHERE 
	(
	IMG.ROW_ID = S_TMPL_PLANITEM.ROW_ID      
	AND
	S_ASSESS.ASSESS_TMPL_ID = S_TMPL_PLANITEM.ROW_ID
	) 
	AND NOT EXISTS   
	(	SELECT 'X' 
		FROM 
		S_ETL_I_IMG_4 IMG1
		WHERE  
		IMG1.ROW_ID = S_ASSESS.ROW_ID
		)

UNION --[CHG214588] BEGIN

SELECT S_ASSESS.ROW_ID
	,S_ASSESS.MODIFICATION_NUM
	,S_ASSESS.LAST_UPD
	,S_ASSESS.DB_LAST_UPD
	,IMG.ETL_PROC_WID
FROM S_ASSESS
	,S_ETL_I_IMG_20 IMG
	,S_EVT_ACT
WHERE IMG.ROW_ID = S_ASSESS.ACTIVITY_ID
	AND IMG.ROW_ID = S_EVT_ACT.ROW_ID
	AND NOT EXISTS (
		SELECT 'X'
		FROM S_ETL_I_IMG_4 IMG1
		WHERE IMG1.ROW_ID = S_ASSESS.ROW_ID
		)
	
	AND S_EVT_ACT.X_BU_ID IN (  
		SELECT MARKET_ID
		FROM WC_ETL_MARKET_PARAM_G
		WHERE ETL_PROCESS_NAME = 'AUX_IMG PREV_ACT_ID - S_ASSESS'
			AND EXECUTION_FLG = 'Y'
		)
	--[CHG214588] END




--old

SELECT 
	DISTINCT
	S_ASSESS.ROW_ID, 
	S_ASSESS.MODIFICATION_NUM, 
	S_ASSESS.LAST_UPD,
S_ASSESS.DB_LAST_UPD,
IMG.ETL_PROC_WID
FROM 
	S_ASSESS,
	S_TMPL_PLANITEM,
	S_ETL_I_IMG_184 IMG
WHERE 
	(
	IMG.ROW_ID = S_TMPL_PLANITEM.ROW_ID      
	AND
	S_ASSESS.ASSESS_TMPL_ID = S_TMPL_PLANITEM.ROW_ID
	) 
	AND NOT EXISTS   
	(	SELECT 'X' 
		FROM 
		S_ETL_I_IMG_4 IMG1
		WHERE  
		IMG1.ROW_ID = S_ASSESS.ROW_ID
		)