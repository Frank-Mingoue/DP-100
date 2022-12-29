ECHO OFF
REM [20220422:KR] Modify Parameter ATTACHMENT_DIRECTORY_INPUT from D:\SBA81\siebsrvr\INPUT to D:\SBA81\siebsrvr\input 
REM [20220316:KR] As per migration of MRUDEV14 to MRUIP14: Update server MRUDEV14 into MRUIP14
REM [20220316:KR] As per migration of MRUDEV14 to MRUIP14: Update server MRUDEV14 into MRUIP14
REM [20180622:JL]DEF489-Add session s_Update_Primary_Contact
REM [20171212:RG] CHG123940: Added FTM for file copy from Production to UAT 
REM [20171012:AR] Defect467 : Add parameter Initial Generate Contact sales workflow 
REM [20170919:RG] CHG116971: Added path for QlikView folder
REM [20170911:GU] CHG117002 : Add parameter CN sales workflow 
REM [20170901:AR] Add parameter EXPORT_SOA_RU
REM [20170831:SR] INC2096652- COMMENT set OLAP_OBIEE_11G=SIEBEL_OLAP_UAT_EU2_11G
REM [20170613:SR] INC2003459 - Added FTM log deletion retention period
REM [20170303:VS] CHG107678 New parameter JTI_Bank_Account_Export_WF added
REM [20161125:RM] INC1792027 New parameter JTI_OTM_Submit_Order added
REM [20160406:RR] CHG091395 New parameter CommitTransaction added
REM [20151008_GU]As per INC1386481 new paramter added for Product_inventory
REM Process ID: Upgrade IP14 
REM Author: Vikram Seeburn/Misa Rakotoasimbahoaka/Njara Rasoloarimanana
REM Decription: Centralised Environment Variables to be used by all shell scripts

set STAGING=E:\Staging_IP14
set JAVA_HOME=D:\Informatica\10.4.0\java
set PHPRC=E:\Staging_IP14\Scripts\PHP
set INTERFACE=E:\Interfaces_IP14
set INFA=D:\Informatica\10.4.0\server\bin
REM QlikviewAudit_Register_Log.bat & QlikviewAudit_Archive_Log.bat
set QKLVIEW=E:\QlikView
set QKLVIEW_PROCESSED=E:\QlikView\ToBeProcessed
set QKLVIEW_ARCHIVE=E:\QlikView\Archived
set QKLVIEW_DD_RET=14
set QLIKVIEW_SRV_PRD=MRUINFA10
set QLIKVIEW_SRV_UAT=MRUINFA10\Interfaces_IP14\United_Kingdom\IERR

:::::::::::::::::::::::::::::::::::::::::Scripts::::::::::::::::::::::::::::::::::::::::::::::
REM Active_Market_Settings.bat
::Active market for each Entity/ For adding new Active market for a new entity: SET ACTIVE_MARKET_NEW_ENTITY=MARKET1 MARKET2 MARKET3
SET ACTIVE_MARKET_SRS_Contract=RU
SET ACTIVE_MARKET_SRS=US CA
SET ACTIVE_MARKET_Payment_Export=CA
SET ACTIVE_MARKET_Compliance=CA
SET ACTIVE_MARKET_Order=CA
SET ACTIVE_MARKET_ProductInvloc=PL ES

REM 
REM DEV : SET ACTIVE_MARKET_CommitTransaction=ES IT WW UA FR BE NL RU CH MY TW KR CA RO IE EC KZ PL CZ AT SR GE PT SE XX UK EX GR CI US SK HU
SET ACTIVE_MARKET_CommitTransaction=ES IT WW UA FR BE NL RU CH MY TW KR CA RO IE EC KZ PL CZ AT SR GE PT SE XX UK EX GR CI US SK HU

REM USED IN REGRESSION TESTING : SET ACTIVE_MARKET_CommitTransaction= MY TW KZ KR
REM SET ACTIVE_MARKET_CommitTransaction= MY TW KZ KR

SET ACTIVE_MARKET_CommitTransaction_GE=GE
SET ACTIVE_MARKET_JTI_OTM_Submit_Order=CA FR
SET ACTIVE_MARKET_Bank_Account_Export=CA AT UA
SET ACTIVE_MARKET_Autogen_Approval=US
SET ACTIVE_MARKET_ContactFileTransfer=RU
SET ACTIVE_MARKET_Initial_Generate_Contact=RU
SET ACTIVE_MARKET_UpdatePrimaryContact=RU
SET ACTIVE_MARKET_Legal_Entity_Export=RU
::Workflow Sales Name by entity
SET SALES_WF_SRS_Contract=JTI_OBIEE_saveResultSet_Contract
SET SALES_WF_SRS=JTI_OBIEE_saveResultSet
SET SALES_WF_Payment_Export=JTI_Payment_Export
SET SALES_WF_Compliance=JTI_Compliance_PDF_Transfer
SET SALES_WF_Order=JTI_Order_PDF_Transfer
SET SALES_WF_ProductInvloc=JTI_EIM_Products_InvTrans
SET SALES_WF_CommitTransaction=JTI_WF_Commit_Transaction
SET SALES_WF_CommitTransaction_GE=JTI_WF_Commit_Transaction
SET SALES_WF_JTI_OTM_Submit_Order="JTI OTM Submit Order"
SET SALES_WF_Bank_Account_Export=JTI_Bank_Account_Export_WF
SET SALES_WF_Autogen_Approval="JTI Payment Autogen Approval"
SET SALES_WF_ContactFileTransfer=JTI_Contact_File_Transfer_WF
SET SALES_WF_Initial_Generate_Contact=JTI_Generate_Contact_XML_WF
SET SALES_WF_UpdatePrimaryContact=JTI_Update_Accnt_Primary_Contact
SET SALES_WF_Legal_Entity_Export=JTI_Legal_Entity_Export_WF
::Session Data Name by entity that call the Main batch file
SET SESSION_SRS_Contract=s_JTI_Cluster_Refresh_SRS_Contract
SET SESSION_SRS=s_JTI_Cluster_Refresh_SRS
SET SESSION_Payment_Export=wrk_Payment_Electronic_FundTransfer_Outbound_CA.Pre_Insert
SET SESSION_Compliance=CA_Sales_PDF_Transfer
SET SESSION_Order=CA_Sales_PDF_Transfer
SET SESSION_ProductInvloc=wrk_Products_Interface.Post_Update
SET SESSION_CommitTransaction=wrk_Inventory_Transactions_Inbound.s_COMMIT_TRANSACTION
SET SESSION_CommitTransaction_GE=wrk_Inventory_Transactions_Inbound_GE_only.s_COMMIT_TRANSACTION
SET SESSION_JTI_OTM_Submit_Order=s_JTI_OTM_Submit_Order_Batch
SET SESSION_Bank_Account_Export=wrk_Bank_Account_Outbound_CA.Pre_Insert  wrk_Bank_Account_Outbound_AT.Pre_Insert wrk_Bank_Account_Outbound_UA.Pre_Insert
SET SESSION_Autogen_Approval=s_Payment_Auto_Approval
SET SESSION_ContactFileTransfer=s_JTI_Contact_File_Transfer_WF
SET SESSION_Initial_Generate_Contact=s_Call_JTI_Initial_Generate_Contact
SET SESSION_Legal_Entity_Export=s_Call_JTI_Legal_Entity_Export_WF
SET SESSION_UpdatePrimaryContact=wrk_POST_EIM_Compulsory.wrk_Unlink_Inactive_Contact_Account.s_Update_Primary_Contact
::Workflow Data Name by entity that call the Main batch file
SET WORKFLOW_SRS_Contract=JTI_Cluster_Refresh_ETL
SET WORKFLOW_SRS=JTI_Cluster_Refresh_ETL
SET WORKFLOW_Payment_Export=JTI_DWH_ETLComplete_Incremental
SET WORKFLOW_Compliance=RUN_OUTBOUND_SO_CA
SET WORKFLOW_Order=RUN_OUTBOUND_SO_CA
SET WORKFLOW_ProductInvloc=JTI_DWH_ETLComplete_Incremental\RUN_EIM_PROCESS
SET WORKFLOW_CommitTransaction=JTI_DWH_ETLComplete_Incremental\RUN_EIM_PROCESS_JAVA\RUN_EIM_PROCESS\RUN_EIM_PROCESS_ADHOC
SET WORKFLOW_CommitTransaction_GE=RUN_Inventory_Transaction_Inbound
SET WORKFLOW_JTI_OTM_Submit_Order=RUN_OUTBOUND_SO_CA
SET WORKFLOW_Bank_Account_Export=JTI_DWH_ETLComplete_Incremental
SET WORKFLOW_Autogen_Approval=SIL_Gen_Potential_Payment
SET WORKFLOW_ContactFileTransfer=RUN_INTERFACE_CN
SET WORKFLOW_Initial_Generate_Contact=RUN_SBL_WF_Initial_Generate_Contact
SET WORKFLOW_UpdatePrimaryContact=JTI_DWH_ETLComplete_Incremental\JTI_OLTP_EIM\RUN_EIM_PROCESS\RUN_EIM_PROCESS_JAVA
SET WORKFLOW_Legal_Entity_Export=RUN_OUTBOUND_TOLEGE_RU

::Correspond to DEV, UAT, PRD
SET PLATFORM=UAT

REM check_dac_status.bat
set NLS_LANG=american_america.utf8

REM AC_AD_Email_AC.bat/AC_AD_Email_AD.bat
set NLS_LANG_AC_AD=

REM EC4U_SeedCachingiBots_new.bat
set ORACLE_CLIENT=C:\Program Files\Oracle Business Intelligence Enterprise Edition Plus Client Tools

REM Clear_Cache_11g.bat
set OLAP_11G=SIEBEL_OLAP_UAT_EU2_11G
REM set OLAP_OBIEE_11G=SIEBEL_OLAP_UAT_EU2_11G
set OBIEE_User=AdminWKF
set OBIEE_Pwd=DEVSales11

REM Run_Siebel_BusinessServices_XX.bat/Run_Siebel_BusinessServices.bat/Run_Siebel_BusinessServices_CA.bat/run-EIM-process.bat/StartTxnMerger.bat/StopTxnMerger.bat/srvrmgr.bat
set SIEBGATEWAY=MRUIP14
set SIEBENTERPRISE=ES_DEV
set SIEBSRVR=SS_DEV_1

REM Run_Siebel_BusinessServices.bat
set SIEBUSER=SADMIN
set SIEBPWD=SADMIN

REM Run_Siebel_BusinessServices_CA.bat
set SIEBUSERCA=SADMIN
set SIEBPWDCA=SADMIN

REM run-EIM-process.bat
set SIEBEIMUSER=SADMIN
set SIEBEIMPWD=SADMIN

REM srvrmgr.bat/CALL_SRVRMGR.BAT/Run_Siebel_BusinessServices_XX.bat/run-EIM-process.bat
set SRVRMGR_PATH=\\MRUIP14\SBA81\siebsrvr\BIN

REM seed-settings2.bat/env-settings.bat
set APPLICATION=D:\Applications

REM StartTxnMerger.bat/StopTxnMerger.bat
set SIEBELUSER=SADMIN
set SIEBELPWD=SADMIN
set COMPONENT1=SS_DEV_1
set COMPONENT2=
set COMPONENT5=
set COMPONENT6=
set SERVER1=SRV1
set SERVER2=
set SERVER5=
set SERVER6=

REM EC4U_AnalyticsSetting.bat
set AnalyticsSrvr=MRUOBIDEV
set AnalyticsBinSrvr=C:\OracleBI

REM Market
set ENV=EU3

:::::::::::::::::::::::::::::::::::::::::File_Transfer_Mechanism::::::::::::::::::::::::::::::::::::::::::::::
REM Analytics_FileBackup.bat
set SiebelAnalytics=Swigva01-srv-44

REM FTM
SET INTERFACES=10.186.26.22\Interfaces_IP14
SET INTERFACES_PRD=10.186.26.9\Interfaces
SET INTERFACES_OLD=10.186.26.27\Interfaces

SET "BU_LIST=AT BE FR IT RU CA KZ SK HU"

SET PRD2UAT_FTM_FLG=Y
SET PROCESS_BAD_FILES_FLG=Y
SET ETL_PATH_PRD_FR=%INTERFACES_PRD%\France
SET ETL_PATH_PRD_IT=%INTERFACES_PRD%\Italy
SET ETL_PATH_PRD_RU=
SET ETL_PATH_PRD_CA=
SET ETL_PATH_PRD_KZ=

SET "ETL_PATH_FR=%INTERFACES%\France"
SET "ETL_PATH_IT=%INTERFACES%\Italy"
SET "ETL_PATH_RU=%INTERFACES%\Russia"
SET "ETL_PATH_CA=%INTERFACES%\Canada"
SET "ETL_PATH_KZ=%INTERFACES%\Kazakhstan"
SET "ETL_PATH_BE=%INTERFACES%\Belgium"
SET "ETL_PATH_AT=%INTERFACES%\Austria"
SET "ETL_PATH_SK=%INTERFACES%\Slovakia"
SET "ETL_PATH_HU=%INTERFACES%\Hungary"

SET TME_INTERFACES_FR=%INTERFACES_PRD%\France
SET TME_INTERFACES_IT=%INTERFACES_PRD%\Italy
SET TME_INTERFACES_RU=%INTERFACES_PRD%\Russia
SET TME_INTERFACES_CA=%INTERFACES_PRD%\Canada
SET TME_INTERFACES_KZ=%INTERFACES_PRD%\Kazakhstan
SET TME_INTERFACES_US=%INTERFACES%\United_States
SET TME_INTERFACES_SK=%INTERFACES%\Slovakia
SET TME_INTERFACES_HU=%INTERFACES%\Hungary

SET OLD_TME_INTERFACES_FR=%INTERFACES_OLD%\France
SET OLD_TME_INTERFACES_IT=%INTERFACES_OLD%\Italy
SET OLD_TME_INTERFACES_RU=%INTERFACES_OLD%\Russia
SET OLD_TME_INTERFACES_CA=%INTERFACES_OLD%\Canada

SET EXPORT_SOA_RU=10.186.26.9\Interfaces\Russia\IUNP
SET EXPORT_SOA_FR=
SET EXPORT_SOA_IT=
SET EXPORT_SOA_CA=

SET INBOUND_SR_RU=10.186.26.9\Interfaces\Russia

SET FTM_RETENTION_PERIOD=3

REM USER & PASSWORD
SET GVADSDEV_USER=\Shared
SET GVADSDEV_PWD=Access123

REM ATTACHMENT
SET ATTACHMENT_DIRECTORY_INPUT=D:\SBA81\siebsrvr\input 
SET ATTACHMENT_DIRECTORY_OUTPUT=D:\SBA81\siebsrvr\OUTPUT

:::::::::::::::::::::::::::::::::::::::::JTI OTM Submit Order::::::::::::::::::::::::::::::::::::::::::::::
SET OTM_SUBMIT_ORDER_SEARCHSPE_CA="[Status] =  LookupValue(""FS_ORDER_STATUS"", ""Mobile Submitted"") AND [Primary Organization Id]=""1-2O83"""
SET OTM_SUBMIT_ORDER_SEARCHSPE_FR="[Status] =  LookupValue(""FS_ORDER_STATUS"", ""Mobile Submitted"") AND [Primary Organization Id]=""1-1ISXG"""
SET OTM_SUBMIT_ORDER_SEARCHSPE_RU="[Status] = ""Active"" AND [Created] <= ""07/08/2012"" AND [JTI Export Status] IS NULL AND [Account Id] IS NOT NULL AND [Primary Organization Id] = ""1-21FD5"""