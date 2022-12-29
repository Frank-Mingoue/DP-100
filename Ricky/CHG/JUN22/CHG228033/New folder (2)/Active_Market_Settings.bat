REM [20171012:AR] Defect467 : Add parameter Initial Generate Contact sales workflow 
REM [20170911:GU] CHG117002 : Add parameter CN sales workflow 
REM [20170303:VS] CHG107678 New parameter JTI_Bank_Account_Export_WF added
REM [20161125:RM] INC1792027 New parameter JTI_OTM_Submit_Order added
REM [20160406:RR] CHG091395 New parameter CommitTransaction added
REM [20151008_GU] As per INC1386481 new paramter added for Product_inventory
REM Process ID: Upgrade IP14 
REM Last Modified: Vikram Seeburn/Misa Rakotoasimbahoaka/Njara Rasoloarimanana
REM Decription: Modified the contain as per variables centralised in the Set_Env_Variables.bat

REM Version: 1.0
REM Author: Rakotoasimbahoaka Misa
REM Creation Date: 05/04/2015
REM Change: CHG071953 - Settings for active market/workflow name/platform

ECHO OFF

pushd %~dp0
call "%~dp0Tech Arch\Set_Env_Variables.bat"

::creation of batch file log
echo %~dp0%0 has been called at %DATE% %TIME% >> %STAGING%\IndirectFiles\Scripts\BatchFiles-Logs\BatchFileLog.txt

::Active market for each Entity/ For adding new Active market for a new entity: SET ACTIVE_MARKET_NEW_ENTITY=MARKET1 MARKET2 MARKET3
SET ACTIVE_MARKET_SRS_Contract=%ACTIVE_MARKET_SRS_Contract%
SET ACTIVE_MARKET_SRS=%ACTIVE_MARKET_SRS%
SET ACTIVE_MARKET_Payment_Export=%ACTIVE_MARKET_Payment_Export%
SET ACTIVE_MARKET_Compliance=%ACTIVE_MARKET_Compliance%
SET ACTIVE_MARKET_Order=%ACTIVE_MARKET_Order%
SET ACTIVE_MARKET_ProductInvloc=%ACTIVE_MARKET_ProductInvloc%
SET ACTIVE_MARKET_CommitTransaction=%ACTIVE_MARKET_CommitTransaction%
SET ACTIVE_MARKET_CommitTransaction_GE=%ACTIVE_MARKET_CommitTransaction_GE%
SET ACTIVE_MARKET_JTI_OTM_Submit_Order=%ACTIVE_MARKET_JTI_OTM_Submit_Order%
SET ACTIVE_MARKET_Bank_Account_Export=%ACTIVE_MARKET_Bank_Account_Export%
SET ACTIVE_MARKET_ContactFileTransfer=%ACTIVE_MARKET_ContactFileTransfer%
SET ACTIVE_MARKET_Initial_Generate_Contact=%ACTIVE_MARKET_Initial_Generate_Contact%
SET ACTIVE_MARKET_Legal_Entity_Export=%ACTIVE_MARKET_Legal_Entity_Export%
::Workflow Sales Name by entity
SET SALES_WF_SRS_Contract=%SALES_WF_SRS_Contract%
SET SALES_WF_SRS=%SALES_WF_SRS%
SET SALES_WF_Payment_Export=%SALES_WF_Payment_Export%
SET SALES_WF_Compliance=%SALES_WF_Compliance%
SET SALES_WF_Order=%SALES_WF_Order%
SET SALES_WF_ProductInvloc=%SALES_WF_ProductInvloc%
SET SALES_WF_CommitTransaction=%SALES_WF_CommitTransaction%
SET SALES_WF_CommitTransaction_GE=%SALES_WF_CommitTransaction_GE%
SET SALES_WF_JTI_OTM_Submit_Order=%SALES_WF_JTI_OTM_Submit_Order%
SET SALES_WF_Bank_Account_Export=%SALES_WF_Bank_Account_Export%
SET SALES_WF_ContactFileTransfer=%SALES_WF_ContactFileTransfer%
SET SALES_WF_Initial_Generate_Contact=%SALES_WF_Initial_Generate_Contact%
SET SALES_WF_Legal_Entity_Export=%SALES_WF_Legal_Entity_Export%
::Session Data Name by entity that call the Main batch file
SET SESSION_SRS_Contract=%SESSION_SRS_Contract%
SET SESSION_SRS=%SESSION_SRS%
SET SESSION_Payment_Export=%SESSION_Payment_Export%
SET SESSION_Compliance=%SESSION_Compliance%
SET SESSION_Order=%SESSION_Order%
SET SESSION_ProductInvloc=%SESSION_ProductInvloc%
SET SESSION_CommitTransaction=%SESSION_CommitTransaction%
SET SESSION_CommitTransaction_GE=%SESSION_CommitTransaction_GE%
SET SESSION_JTI_OTM_Submit_Order=%SESSION_JTI_OTM_Submit_Order%
SET SESSION_Bank_Account_Export=%SESSION_Bank_Accountt_Export%
SET SESSION_ContactFileTransfer=%SESSION_ContactFileTransfer%
SET SESSION_Initial_Generate_Contact=%SESSION_Initial_Generate_Contact%
SET SESSION_Legal_Entity_Export=%SESSION_Legal_Entity_Export%
::Workflow Data Name by entity that call the Main batch file
SET WORKFLOW_SRS_Contract=%WORKFLOW_SRS_Contract%
SET WORKFLOW_SRS=%WORKFLOW_SRS%
SET WORKFLOW_Payment_Export=%WORKFLOW_Payment_Export%
SET WORKFLOW_Compliance=%WORKFLOW_Compliance%
SET WORKFLOW_Order=%WORKFLOW_Order%
SET WORKFLOW_ProductInvloc=%WORKFLOW_ProductInvloc%
SET WORKFLOW_CommitTransaction=%WORKFLOW_CommitTransaction%
SET WORKFLOW_CommitTransaction_GE=%WORKFLOW_CommitTransaction_GE%
SET WORKFLOW_JTI_OTM_Submit_Order=%WORKFLOW_JTI_OTM_Submit_Order%
SET WORKFLOW_Bank_Account_Export=%WORKFLOW_Bank_Account_Export%
SET WORKFLOW_ContactFileTransfer=%WORKFLOW_ContactFileTransfer%
SET WORKFLOW_Initial_Generate_Contact=%WORKFLOW_Initial_Generate_Contact%
SET WORKFLOW_Legal_Entity_Export=%WORKFLOW_Legal_Entity_Export%
::Correspond to DEV, UAT, PRD
SET PLATFORM=%PLATFORM%

::DATE & TIME
SET /a Log_date = %date:~10,4%%date:~4,2%%date:~7,2%
SET HH=%time:~0,2%
IF "%HH:~0,1%" == " " SET HH=0%HH:~1,1%
SET MM=%time:~3,2%
IF "%MM:~0,1%" == " " SET MM=0%MM:~1,1%
SET SS=%time:~6,2%
IF "%SS:~0,1%" == " " SET SS=0%SS:~1,1%
SET DATE=%DATE%
SET TIME=%TIME%
SET ERRORLEVEL=%ERRORLEVEL%
set DATETIME=%Log_date%_%HH%%MM%%SS%