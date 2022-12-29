SELECT TOP 10 * FROM WC_ORG_D WHERE INTEGRATION_ID IN ('1-11BQS-0','1-11BQS-1','1-11BQS-2') 
SELECT * FROM MERGE_WC_ORG_D WHERE INTEGRATION_ID = '1-11BQS-2' 

DELETE FROM WC_ORG_D WHERE INTEGRATION_ID in ( '1-2OWSOL', '1-11BQS-2')
DELETE FROM WC_ORG_HISTORY_D WHERE INTEGRATION_ID = '1-HNY0G' 


DELETE FROM WC_ORG_DS
GO



SELECT PR_POSTN_ID,X_ACCNT_POSTN_ID, X_POSTN_NAME, INTEGRATION_ID, ATTRIB_93, ATTRIB_53, ATTRIB_52, X_TRADING_AS_TXT, X_TT_EOID_TXT, X_TT_FID_TXT, X_TT_UPDATE_STAT_CD, X_TT_REQUEST_DT
, X_TT_REQ_BY, X_TT_REJECT_APP_DT, X_TT_REJECT_APP_BY, X_ACCNT_POSTN_ID,* 
FROM WC_ORG_DS
WHERE INTEGRATION_ID in ( '1-HNY0G')
GO

SELECT INTEGRATION_ID, ATTRIB_93, ATTRIB_53, ATTRIB_52, X_TRADING_AS_TXT, X_TT_EOID_TXT
, X_TT_FID_TXT, X_TT_UPDATE_STAT_CD, X_TT_REQUEST_DT, X_TT_REQ_BY,* 
FROM WC_ORG_D 
WHERE INTEGRATION_ID in ( '1-2OWSOL', '1-11BQS-2')


SELECT POSITION_NAME, INTEGRATION_ID, ATTRIB_93, ATTRIB_53, ATTRIB_52, X_TRADING_AS_TXT, X_TT_EOID_TXT, X_TT_FID_TXT, X_TT_UPDATE_STAT_CD, X_TT_REQUEST_DT
, X_TT_REQ_BY, X_TT_REJECT_APP_DT, X_TT_REJECT_APP_BY,* 
 FROM WC_ORG_HISTORY_D
 WHERE INTEGRATION_ID = '1-HNY0G'




 SELECT INTEGRATION_ID, ATTRIB_93, ATTRIB_53, ATTRIB_52, X_TRADING_AS_TXT, X_TT_EOID_TXT
, X_TT_FID_TXT, X_TT_UPDATE_STAT_CD, X_TT_REQUEST_DT, X_TT_REQ_BY,*  
FROM MERGE_WC_ORG_D WHERE INTEGRATION_ID = '1-11BQS-2' 

SELECT W_POSITION_D.POSITION_NAME as POSITION_NAME, W_POSITION_D.INTEGRATION_ID as INTEGRATION_ID FROM W_POSITION_D (NOLOCK)
WHERE EXISTS (SELECT 1 FROM WC_ORG_DS WHERE WC_ORG_DS.PR_POSTN_ID =W_POSITION_D.INTEGRATION_ID  ) 

select * from W_POSITION_D where INTEGRATION_ID = '1-HNY0G'

