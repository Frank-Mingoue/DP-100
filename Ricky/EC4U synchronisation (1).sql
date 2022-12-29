--OLTP
SELECT MAX(ETL_PROC_WID) FROM CX_BWH_PARAM
SELECT MAX(NUMERIC_ROW_ID)FROM S_ETL_RUN
SELECT * FROM S_ETL_RUN WHERE STATUS_CD='RUNNING'

-- UPDATE  CX_BWH_PARAM SET ETL_PROC_WID = 15773 WHERE ETL_PROC_WID = 12863

UPDATE S_ETL_RUN SET NUMERIC_ROW_ID = 15853 WHERE NUMERIC_ROW_ID = 15851

UPDATE S_ETL_RUN SET STATUS_CD='COMPLETED' WHERE ROW_ID=15943



--select TOP 10 LAST_REFRESH_DT,ETL_PROC_WID,*  from CX_BWH_PARAM WHERE ETL_PROC_WID = 2621


/*
update S_ETL_RUN
set NUMERIC_ROW_ID=9723,
ROW_ID=9720
where NUMERIC_ROW_ID=9720

*/

-------------------------------------------

--OLAP
SELECT MAX(NUMERIC_ROW_ID)FROM W_ETL_RUN_S
SELECT * FROM W_ETL_RUN_S WHERE STATUS_CD = 'RUNNING'
SELECT ETL_PROC_WID from W_PARAM_G


UPDATE W_ETL_RUN_S SET STATUS_CD='COMPLETED' WHERE INTEGRATION_ID = '15943'


update W_ETL_RUN_S
set NUMERIC_ROW_ID=15853,
ROW_WID=15853,
INTEGRATION_ID=15853
where NUMERIC_ROW_ID=15851




--UPDATE W_PARAM_G SET ETL_PROC_WID=1483

------------------------

---REPOS
Select MAX(W_ETL_DEFN_RUN.ETL_PROC_WID) from W_ETL_DEFN_RUN 
SELECT  ETL_PROC_WID,* FROM W_ETL_DWPARAM
select STATUS from W_ETL_DEFN_RUN where ETL_PROC_WID= 1536

--UPDATE W_ETL_DEFN_RUN SET STATUS= 'Completed' WHERE ETL_PROC_WID=1536
Select MAX(W_ETL_DEFN_RUN.ETL_PROC_WID) from W_ETL_DEFN_RUN where W_ETL_DEFN_RUN.STATUS='Completed'



----UPDATE W_ETL_DWPARAM SET ETL_PROC_WID = 2936 WHERE ETL_PROC_WID = 2880
---UPDATE W_ETL_DEFN_RUN SET ETL_PROC_WID = 2936 WHERE ETL_PROC_WID = 2880
---------------------------------------------------------------------------------------------------

--Control Lock
---LAUNCH FIRST QUERY ON BASE REPOS PRD-- NO RESULTS SHOULD BE OBTAINED. 
select *   from         OPB_WFLOW_RUN        
INNER JOIN OPB_SUBJECT ON OPB_SUBJECT.SUBJ_ID=OPB_WFLOW_RUN.SUBJECT_ID  
where         OPB_WFLOW_RUN.RUN_STATUS_CODE IN (6, 7 ,8)        AND         UPPER(OPB_SUBJECT.SUBJ_NAME)='EC4U'


--In case the above script return,execute the following update statement.
--Then launch the above script again.It should not return anything.

--UPDATE OPB_WFLOW_RUN
SET RUN_STATUS_CODE=1
from         OPB_WFLOW_RUN        
INNER JOIN OPB_SUBJECT ON OPB_SUBJECT.SUBJ_ID=OPB_WFLOW_RUN.SUBJECT_ID  
where         OPB_WFLOW_RUN.RUN_STATUS_CODE IN (6, 7 ,8)        AND         UPPER(OPB_SUBJECT.SUBJ_NAME)='EC4U'

--- WHEN THE FOLLOWING QUEYR IS LAUNCHED THE RUNSTATUS CODE SHOULD BE 1 EVERYWHERE.
--SELECT distinct  RUN_STATUS_CODE FROM OPB_WFLOW_RUN
--WHERE RUN_STATUS_CODE NOT IN (6, 7 ,8) 


