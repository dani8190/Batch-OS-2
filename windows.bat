@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=C:\Users\Daniel\batch_projekter\batch os 2\windows.exe
REM BFCPEICON=
REM BFCPEICONINDEX=0
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=0
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Product Name
REM BFCPEVERDESC=Product Description
REM BFCPEVERCOMPANY=Your Company
REM BFCPEVERCOPYRIGHT=Copyright Info
REM BFCPEOPTIONEND
@ECHO ON
@echo off
rem CenterSelf
title Batch OS 2

:boot
cls
cd\
cd %userprofile%
set sysfolder=%userprofile%\BatchOS2\Bos\systemquantum
set osfolder=%userprofile%\BatchOS2

echo Booting....
Timeout /T 2 /nobreak >Nul

for /l %%a in (1,1,79) do (
rem ShadeBoxAt 25 %%a 1 1 4)
timeout /T 2 /nobreak >Nul
cls

rem PrintBoxAt 6 21 10 40 1
rem printcenter "Programmed by" 7 8 0
rem printCenter N.I.R.M 9 12 0
rem printcenter U.I 10 15 0
rem Locate 25 1
choice /C zc /T 1 /N /M "Press Z for Bios" /D c
if %errorlevel%==1 (echo Z was pressed & timeout /t 3)
cls
timeout /T 1 /nobreak >Nul
rem PrintBoxAt 6 21 10 40 1
rem PrintCenter System_Quantum 10 12 0
timeout /T 2 /nobreak >Nul


if exist BatchOS2 goto installed

:notinstalled
cls
rem LocateAt 18 31
rem PrintCenter "Batch OS 2 is loading files" 18 7 0
rem ShadeBoxAt 21 1 1 79 2
rem Wait 500
for /l %%a in (1,1,79) do (
rem ShadeBoxAt 21 %%a 1 1 4
rem timeout /T 0 >NUl
)
rem Wait 500

cls

rem LocateAt 6 31
echo Create a user
rem PrintBoxAt 11 21 3 40 1
rem PrintBoxAt 15 21 3 40 1

rem LocateAt 12 22
set /p usrname=Username:
rem LocateAt 16 22
echo Password:
rem LocateAt 16 31
rem GetMasked
set pswd=%result%
cls
rem LocateAt 1 1
echo Installing....

mkdir BatchOS2
cd BatchOS2
mkdir users programs BoS\systemquantum\logs
set usrname=%usrname:\=_%
mkdir users\%usrname%
mkdir BoS\systemquantum\errorsys
echo set installed=false >BoS\systemquantum\logs\installed.bat
rem PrintBoxAt 16 31 3 20 1
rem ChangeColor 4 7
for /l %%a in (32,2,49) do (
rem ShadeBoxAt 17 %%a 1 1 2
timeout /T 1 >NUl
)
rem ChangeColor 7 0
mkdir users\%usrname%\main\documents
mkdir users\%usrname%\main\pictures
mkdir users\%usrname%\main\music
mkdir users\%usrname%\main\appdata\local
echo set truepassword=%pswd% >%osfolder%\users\%usrname%\logon.bat

echo msgbox"Your username or password was incorrect",0,"Wrong Login" > BoS\systemquantum\errorsys\logon_error.vbs
echo set installed=true >BoS\systemquantum\logs\installed.bat
cls
echo Batch OS 2 is now installed.
pause >Nul


:installed
cd\
cd %userprofile%\BatchOS2
rem ChangeColor 7 0
:login
cd\
cd %userprofile%\BatchOS2
rem ChangeColor 15 4
cls
rem LocateAt 7 38
echo Login
rem PrintBoxAt 6 21 10 40 1
rem PrintBoxAt 8 27 3 27 1
rem PrintBoxAt 12 27 3 27 1
rem LocateAt 9 28
set /p usrname=Username:
rem LocateAt 13 28
echo Password:
rem LocateAt 13 37
rem GetMasked
set pswd=%result%

:checkingLogin
set usrname=%usrname:\=_%
cd users
if not exist %usrname% (goto LoginError)
set logged_user=%usrname%
cd %usrname%
if exist logon.bat (call logon.bat) else (goto b4access)
if %pswd%==%truepassword% goto b4access
goto LoginError

:b4access
echo set logged_user=%logged_user% >>%userprofile%\BatchOS2\BoS\systemquantum\logged_user.bat

:access
cd\
cd %userprofile%\BatchOS2\users\%logged_user%
rem ChangeColor 7 0
cls
rem LocateAt 1 1
echo logged in as: %logged_user%
rem PrintBoxAt 23 1 3 80 1
rem Locate 24 2
echo Start
rem MouseCMD 1,23,7,25
if %result%==1 goto popup
goto access


:popup
rem printBoxAt 11 1 12 19 1
rem LocateAt 21 2
echo Shutdown
rem LocateAt 20 2
echo Settings
rem LocateAt 19 2
echo Programs
rem MouseCMD 1,23,7,25 1,21,12,21 1,20,11,20 1,19,12,19 
if %result%==1 goto access
if %result%==2 goto abtshutdown
if %result%==3 goto controlpanel
if %result%==4 goto programs
goto access

:abtshutdown
cls
rem PrintBoxAt 6 31 10 20 1
rem LocateAt 8 33 
echo log out
rem LocateAt 11 33 
echo restart
rem LocateAt 14 33 
echo shutdown
rem LocateAt 25 1
rem MouseCMD 33,8,44,8 33,11,49,11 33,14,49,14 
if %result%==1 goto logout
if %result%==2 goto reboot
if %result%==3 goto shutdown
goto abtshutdown

:logout
cls
set redirect=installed
goto _secure_

:reboot
cls
rem PrintBoxAt 6 31 5 20 1
rem Locate 7 32
echo rebooting...
timeout /t 3 /nobreak >nul
set redirect=boot
goto _secure_

:shutdown
cls
rem Wait 150
rem PrintBoxAt 6 31 5 20 1
rem Locate 7 32
echo Shutting Down...
timeout /T 3 /nobreak >Nul
exit

:controlpanel
cls
rem PrintBoxAt 23 1 3 80 1
rem Locate 24 2
echo Start
rem PrintBoxAt 6 11 15 60 1
rem LocateAt 9 14
echo Usersettings
rem LocateAt 12 14 
echo empty
rem LocateAt 15 14
echo empty
rem LocateAt 18 14 
echo empty
rem LocateAt 9 37 
echo empty
rem LocateAt 12 37 
echo empty
rem LocateAt 15 37 
echo uninstall
rem LocateAt 18 37 
echo close
rem MouseCMD 14,9,34,9 14,12,34,12 14,15,34,15 14,18,34,18 37,9,62,9 37,12,62,12 37,15,63,15 37,18,64,18 
if %result%==1 goto CP_usersettings
if %result%==8 goto access
goto controlpanel

:CP_usersettings
cls
rem PrintBoxAt 23 1 3 80 1
rem Locate 24 2
echo Start
rem PrintBoxAt 6 11 15 60 1
rem LocateAt 9 14
echo Change username
rem LocateAt 12 14 
echo Change password
rem LocateAt 15 14
echo Disable password
rem LocateAt 18 14 
echo Create new user
rem MouseCMD 13,9,29,9 13,12,29,12 13,15,30,15 13,18,29,18 
if %result%==1 goto CP_changeusername
if %result%==2 goto CP_changePassword
if %result%==3 goto CP_ablepswd
if %result%==4 goto CP_createNewUser
goto access

:CP_createNewUser
cls
rem LocateAt 6 31
echo Create a new user
rem PrintBoxAt 11 21 3 40 1
rem PrintBoxAt 15 21 3 40 1
rem LocateAt 12 22
set /p usrname=Username:
rem LocateAt 16 22
echo Password:
rem LocateAt 16 31
rem GetMasked
set pswd=%result%
cls
rem LocateAt 1 1
:progress_createNewUser
set usrname=%usrname:\=_%
cd\
cd %userprofile%\BatchOS2\
cls
cd users
if exist %usrname% set message=User exists already & set redirect=CP_createNewUser & goto errorMessage
mkdir %usrname%\main
echo set truepassword=%pswd% >%usrname%\logon.bat
mkdir %usrname%\main\documents
mkdir %usrname%\main\pictures
mkdir %usrname%\main\music
mkdir %usrname%\main\appdata\local
set redirect=access
goto _secure_

:CP_changeusername
rem ChangeColor 7 0
cls
rem PrintBoxAt 6 21 7 40 1
rem PrintBoxAt 8 23 3 36 1
rem LocateAt 9 24
set /p new_usrname=New name:
set usrname=%usrname:\=_%
cd\
if exist %userprofile%\BatchOS2\users\%new_usrname% set message=User exists already & set redirect=CP_changeusername & goto errorMessage
ren %userprofile%\BatchOS2\users\%logged_user% %new_usrname%
set logged_user=%new_usrname%
set message=Username changed & set redirect=access & goto grantedMessage
goto access

:CP_changePassword
cls
rem PrintBoxAt 6 21 10 40 1
rem PrintBoxAt 8 23 3 36 1
rem PrintBoxAt 12 23 3 36 1
rem LocateAt 9 24
echo Old password:
rem LocateAt 9 37
rem Getmasked
set oldpswd=%result%
rem LocateAt 13 24
echo New password:
rem LocateAt 13 37
rem Getmasked
set newpswd=%result%
cd\
cd %userprofile%\BatchOS2\users
cd %logged_user%
if exist logon.bat (call logon.bat) else (set truepassword=1 & set oldpswd=1)
if not %oldpswd%==%truepassword% set message=wrong password & set redirect=CP_changePassword & goto errorMessage
echo set truepassword=%newpswd% >logon.bat
set message=password changed & set redirect=access & goto grantedMessage

:CP_ablepswd
cls
rem PrintBoxAt 6 21 7 40 1
rem PrintBoxAt 8 23 3 36 1
rem LocateAt 9 24
echo Password:
rem LocateAt 9 33
rem Getmasked
set pswd=%result%
call %osfolder%\users\%logged_user%\logon.bat
if %pswd%==%truepassword% (
erase %osfolder%\users\%logged_user%\logon.bat /Q
set message=password removed & set redirect=access & goto grantedMessage
)
set message=wrong password & set redirect=access & goto errorMessage

:programs
rem PrintBoxAt 8 21 12 15 1
rem LocateAt 9 22 
echo CMD
rem MouseCMD 22,9,34,9 
if %result%==1 explorer %userprofile%\BatchOS2\programs\cmd.bat & goto access


:errorMessage
cls
rem PrintBoxAt 6 21 9 40 1
rem LocateAt 8 23
rem ChangeColor 12 0
echo %message%
pause >nul
rem ChangeColor 7 0
goto %redirect%
goto access

:grantedMessage
cls
rem PrintBoxAt 6 21 9 40 1
rem LocateAt 8 23
rem ChangeColor 10 0
echo %message%
pause >nul
rem ChangeColor 7 0
goto %redirect%
goto access


:LoginError
cd\
cd %userprofile%\BatchOS2\
start BoS\systemquantum\errorsys\logon_error.vbs
cls
set redirect=login

:_secure_
set truepassword=%random%%random%%random%%random%%random%%random%%random%%random%
set usrname=%random%%random%%random%%random%%random%%random%%random%%random%
set pswd=%random%%random%%random%%random%%random%%random%%random%%random%
set choice=%random%%random%%random%%random%%random%%random%%random%%random%
set username=%random%%random%%random%%random%%random%%random%%random%%random%
set password=%random%%random%%random%%random%%random%%random%%random%%random%
set result=%random%%random%%random%%random%%random%%random%%random%%random%
cd\
cd %userprofile%
goto %redirect%