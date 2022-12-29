---------------------------------------------------------------------------------
--Check Contracts to be impacted
---------------------------------------------------------------------------------
SELECT  STAT_CD, *
FROM S_DOC_AGREE (NOLOCK)
WHERE ROW_ID IN ('1-100UO3') --183 records provided in INC


---------------------------------------------------------------------------------
--BACKUP
---------------------------------------------------------------------------------

SELECT * INTO StagingDB.dbo.S_DOC_AGREE_INC3912461_20211013_JJ
FROM S_DOC_AGREE (NOLOCK)
WHERE ROW_ID IN ('1-100UO3') 

SELECT STAT_CD,* FROM StagingDB.dbo.S_DOC_AGREE_INC3912461_20211013_JJ
---------------------------------------------------------------------------------
--POPULATE EIM TABLE
---------------------------------------------------------------------------------

DELETE FROM EIM_AGREEMENT WHERE IF_ROW_BATCH_NUM BETWEEN 80000 AND 80999

SELECT IF_ROW_BATCH_NUM, IF_ROW_STAT, COUNT(1),CREATED
FROM EIM_AGREEMENT(NOLOCK)
WHERE IF_ROW_BATCH_NUM BETWEEN 80000 AND 80999
GROUP BY IF_ROW_BATCH_NUM, IF_ROW_STAT,CREATED
ORDER BY 1


---------------------------------------------------------------------------------
--EIM INSERT 
---------------------------------------------------------------------------------
DELETE FROM EIM_AGREEMENT WHERE IF_ROW_BATCH_NUM BETWEEN 80000 AND 80999

SELECT IF_ROW_BATCH_NUM, IF_ROW_STAT, COUNT(1),CREATED
FROM EIM_AGREEMENT(NOLOCK)
WHERE IF_ROW_BATCH_NUM BETWEEN 80000 AND 80999
GROUP BY IF_ROW_BATCH_NUM, IF_ROW_STAT,CREATED
ORDER BY 1


INSERT INTO EIM_AGREEMENT
(
ROW_ID,IF_ROW_BATCH_NUM,IF_ROW_STAT,
AGR_NAME,TARGET_ACCNT_BU,TARGET_ACCNT_LOC,TARGET_ACCNT_NAME,AGR_REV_NUM,AGR_BU,
AGR_STAT_CD
)
SELECT
AG.ROW_ID,80000,'FOR_UPDATE',
AG.NAME,ACBU.NAME,AC.LOC, AC.NAME,AG.REV_NUM,AGBU.NAME,
'Inactive'
FROM  S_DOC_AGREE AG
LEFT JOIN S_ORG_EXT AC ON AC.ROW_ID=AG.TARGET_OU_ID
LEFT join S_BU AGBU(nolock) on AGBU.ROW_ID = AG.BU_ID
LEFT join S_BU ACBU(nolock) on ACBU.ROW_ID = AC.BU_ID
where AG.ROW_ID IN (select ROW_ID from StagingDB.dbo.S_DOC_AGREE_INC3912461_20211013_JJ)


SELECT DISTINCT VAL
FROM S_LST_OF_VAL
WHERE TYPE='SRV_AGREE_STATUS'

--VERIFY EIM

SELECT 
ROW_ID,IF_ROW_BATCH_NUM,IF_ROW_STAT,
AGR_NAME,TARGET_ACCNT_BU,TARGET_ACCNT_LOC,TARGET_ACCNT_NAME,AGR_REV_NUM,AGR_BU,
AGR_STAT_CD
FROM  EIM_AGREEMENT(NOLOCK)
WHERE IF_ROW_BATCH_NUM BETWEEN 80000 AND 80999

---------------------------------------------------------------------------------
--IFB
---------------------------------------------------------------------------------
[Siebel Interface Manager]

      LOG TRANSACTIONS = TRUE
      SET BASED LOGGING = TRUE
      LOG TRANSACTIONS TO FILE = TRUE
      PROCESS = UPDATE ALL

[UPDATE ALL]
     TYPE = SHELL
     INCLUDE = "Update_Agreement"

[Update_Agreement]
      TYPE = IMPORT
      BATCH = 80000
      TABLE = EIM_AGREEMENT

      ONLY BASE TABLES = S_DOC_AGREE

      INSERT ROWS= S_DOC_AGREE,FALSE
      UPDATE ROWS= S_DOC_AGREE,TRUE

      ONLY BASE COLUMNS= S_DOC_AGREE.NAME,\
                    S_DOC_AGREE.TARGET_OU_ID,\
                    S_DOC_AGREE.REV_NUM,\
                    S_DOC_AGREE.BU_ID,\
                    S_DOC_AGREE.STAT_CD


\\mrudev14\Admin
http://mrudev14/siebel14_homepage.html
