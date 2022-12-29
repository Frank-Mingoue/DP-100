SELECT 
	S_EVT_ACT.ROW_ID, 
	S_EVT_ACT.MODIFICATION_NUM, 
	S_EVT_ACT.LAST_UPD,
	S_EVT_ACT.DB_LAST_UPD,
	IMG.ETL_PROC_WID
FROM 
	S_EVT_ACT,
	S_EXP_ITEM,
	S_ETL_I_IMG_69 IMG
WHERE
	(
	IMG.ROW_ID = S_EXP_ITEM.ROW_ID     
	AND
	S_EVT_ACT.ROW_ID = S_EXP_ITEM.ACTIVITY_ID
	) 
UNION ALL
SELECT 
	S_EVT_ACT.ROW_ID, 
	S_EVT_ACT.MODIFICATION_NUM, 
	S_EVT_ACT.LAST_UPD,
	S_EVT_ACT.DB_LAST_UPD,
	IMG.ETL_PROC_WID
FROM 
	S_EVT_ACT,
	S_ACTPART_MVMT,
	S_ETL_I_IMG_67 IMG
WHERE
	(
	IMG.ROW_ID = S_ACTPART_MVMT.ROW_ID    
	AND
	S_EVT_ACT.ROW_ID = S_ACTPART_MVMT.ACTIVITY_ID
	) 
UNION ALL
SELECT 
	S_EVT_ACT.ROW_ID, 
	S_EVT_ACT.MODIFICATION_NUM, 
	S_EVT_ACT.LAST_UPD,
	S_EVT_ACT.DB_LAST_UPD,
	IMG.ETL_PROC_WID 
FROM 
	S_EVT_ACT,
	S_TMSHT_ITEM,
	S_ETL_I_IMG_68 IMG
WHERE
	(
	IMG.ROW_ID = S_TMSHT_ITEM.ROW_ID    
	AND
	S_EVT_ACT.ROW_ID = S_TMSHT_ITEM.ACTIVITY_ID
	) 
UNION ALL
SELECT 
	S_EVT_ACT.ROW_ID, 
	S_EVT_ACT.MODIFICATION_NUM, 
	S_EVT_ACT.LAST_UPD,
	S_EVT_ACT.DB_LAST_UPD,
	IMG.ETL_PROC_WID 
FROM 
	S_EVT_ACT,
	S_SRV_ACT,
	S_ETL_I_IMG_77 IMG
WHERE
	(
	IMG.ROW_ID = S_SRV_ACT.ROW_ID    
	AND
	S_EVT_ACT.ROW_ID = S_SRV_ACT.PAR_ROW_ID
	)

UNION -- CHG214588 START

SELECT S_EVT_ACT.ROW_ID
	,S_EVT_ACT.MODIFICATION_NUM
	,S_EVT_ACT.LAST_UPD
	,S_EVT_ACT.DB_LAST_UPD
	,IMG.ETL_PROC_WID
FROM S_EVT_ACT
	,S_ETL_I_IMG_20 IMG
WHERE IMG.ROW_ID = S_EVT_ACT.PREV_ACT_ID
	AND S_EVT_ACT.X_BU_ID IN (
		SELECT MARKET_ID
		FROM WC_ETL_MARKET_PARAM_G
		WHERE ETL_PROCESS_NAME = 'AUX_IMG PREV_ACT_ID - S_EVT_ACT'
			AND EXECUTION_FLG = 'Y'
		) -- CHG214588 END