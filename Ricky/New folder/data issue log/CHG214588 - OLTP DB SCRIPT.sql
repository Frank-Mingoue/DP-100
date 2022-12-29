DELETE
FROM WC_ETL_MARKET_PARAM_G
WHERE ETL_PROCESS_NAME IN (
		'AUX_IMG PREV_ACT_ID - S_EVT_ACT'
		,'AUX_IMG PREV_ACT_ID - S_ASSESS'
		)
GO

INSERT INTO WC_ETL_MARKET_PARAM_G
SELECT S_BU.ROW_ID, S_ORG_EXT.LOC,S_ORG_EXT.NAME, 'AUX_IMG PREV_ACT_ID - S_EVT_ACT', case when S_ORG_EXT.LOC = 'IE' then 'Y' else 'N'END
FROM S_BU INNER JOIN S_ORG_EXT ON S_ORG_EXT .ROW_ID = S_BU.ROW_ID
GO

INSERT INTO WC_ETL_MARKET_PARAM_G
SELECT S_BU.ROW_ID, S_ORG_EXT.LOC,S_ORG_EXT.NAME, 'AUX_IMG PREV_ACT_ID - S_ASSESS', case when S_ORG_EXT.LOC = 'IE' then 'Y' else 'N'END
FROM S_BU INNER JOIN S_ORG_EXT ON S_ORG_EXT .ROW_ID = S_BU.ROW_ID
GO
