REM Process ID: Upgrade IP14 
REM Last Modified: Vikram Seeburn/Misa Rakotoasimbahoaka/Njara Rasoloarimanana
REM Decription: Modified the contain as per variables centralised in the Set_Env_Variables.bat

::Version: 1.0
::Author: Rakotoasimbahoaka Misa
::Creation Date: 05/04/2015
::Change: CHG071953 - Call files 'Active_Market_Settings.bat', 'Environment_Settings.bat' and vbscript 'Process_Files.vbs'/ And retrieve the value of ENTITY from the session.

ECHO OFF

pushd %~dp0
call "..\..\Scripts\Tech Arch\Set_Env_Variables.bat"

::Entity Name retrieved from the session
set ENTITY=%1

::Call files
call "%STAGING%\IndirectFiles\Scripts\Tech Arch\Environment_Settings.bat"
call "%STAGING%\IndirectFiles\Scripts\Active_Market_Settings.bat"

cscript Process_Files.vbs //Nologo >> %STAGING%\IndirectFiles\Scripts\SalesWkf-Logs\Logs_%ENTITY%\%ENTITY%_%DATETIME%.log 2>&1