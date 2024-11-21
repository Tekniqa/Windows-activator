@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrator privileges. Re-running with admin rights...
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)
title Windows Activation tool
color 09
mode 60,40
echo Made by Tekniqas
echo =====================================
echo Windows Activation Tool
echo =====================================
echo Choose the product key to use:
echo 1. Home: TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
echo 2. Home N: 3KHY7-WNT83-DGQKR-F7HPR-844BM
echo 3. Home Single Language: 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
echo 4. Home Country Specific: PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
echo 5. Professional: W269N-WFGWX-YVC9B-4J6C9-T83GX
echo 6. Professional N: MH37W-N47XK-V7XM9-C7227-GCQG9
echo 7. Education: NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
echo 8. Education N: 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
echo 9. Enterprise: NPPR9-FWDCX-D2C8J-H872K-2YT43
echo =====================================
set /p choice="Press the number corresponding to your choice: "

if "%choice%"=="1" set key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
if "%choice%"=="2" set key=3KHY7-WNT83-DGQKR-F7HPR-844BM
if "%choice%"=="3" set key=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
if "%choice%"=="4" set key=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
if "%choice%"=="5" set key=W269N-WFGWX-YVC9B-4J6C9-T83GX
if "%choice%"=="6" set key=MH37W-N47XK-V7XM9-C7227-GCQG9
if "%choice%"=="7" set key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
if "%choice%"=="8" set key=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
if "%choice%"=="9" set key=NPPR9-FWDCX-D2C8J-H872K-2YT43

echo Selected Key: %key%
echo Uninstalling current product key...
slmgr.vbs /upk

echo Installing the selected product key: %key%
slmgr.vbs /ipk %key%

echo Setting KMS server to zh.us.to...
slmgr.vbs /skms zh.us.to

echo Activating Windows...
slmgr.vbs /ato

echo Activation process completed.
pause