REM Process ID: Upgrade IP14 
REM Last Modified: Vikram Seeburn/Misa Rakotoasimbahoaka/Njara Rasoloarimanana
REM Decription: Modified the contain as per variables centralised in the Set_Env_Variables.bat

echo ON

pushd %~dp0 
call "Tech Arch\Set_Env_Variables.bat"

::Enable extensive features
SETLOCAL ENABLEDELAYEDEXPANSION
SETLOCAL ENABLEEXTENSIONS

SET FILE_NAME=%1
SET PATH_NAME=%2

cd %STAGING%\IndirectFiles\Export\Script
CALL FTM_PE_XML %PATH_NAME%

cd %STAGING%\IndirectFiles\Export\PE\%PATH_NAME%

DIR *.xml /B /S > %STAGING%\IndirectFiles\Export\List\%FILE_NAME%

IF %ERRORLEVEL% NEQ 0 (ECHO %STAGING%\IndirectFiles\Export\List\Dummy.xml > %STAGING%\IndirectFiles\Export\List\%FILE_NAME%)