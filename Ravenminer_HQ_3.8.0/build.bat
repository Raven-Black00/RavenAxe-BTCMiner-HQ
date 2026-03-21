@echo off
chcp 65001 >nul
mode con: cols=62 lines=35
color 06
title  ᚱᚨᚁᛖᚾᛗᛁᚾᛖᚱ ᚺᚷᛃ  v3.8.0  Builder

echo.
echo  +----------------------------------------------------------+
echo  ^|                                                          ^|
echo  ^|        ᚱ ᚨ ᚁ ᛖ ᚾ ᛗ ᛁ ᚾ ᛖ ᚱ   ᚺ ᚷ ᛃ                    ^|
echo  ^|           R A V E N M I N E R   H Q                     ^|
echo  ^|                   v 3 . 8 . 0                            ^|
echo  ^|                                                          ^|
echo  ^|         Son Of Odin -- sonofodin@outlook.com             ^|
echo  ^|                                                          ^|
echo  +----------------------------------------------------------+
echo.

python --version >nul 2>&1
if errorlevel 1 (
    color 0C
    echo  [ERROR] Python not found in PATH.
    pause
    exit /b 1
)

echo  ᚠ  [1/4] Installing dependencies...
pip install -r requirements.txt --quiet
if errorlevel 1 (
    color 0C
    echo  [ERROR] pip install failed.
    pause
    exit /b 1
)
echo         Done.
echo.

echo  ᚢ  [2/4] Checking ravenminer_alerts.json...
if not exist ravenminer_alerts.json (
    echo         Creating default alerts config...
    python -c "import json; f=open('ravenminer_alerts.json','w'); json.dump({'discord_webhook':'','alert_temp_threshold':85.0,'alert_vr_temp_threshold':85.0,'alert_hash_threshold':0.5,'alert_on_block':True,'alert_on_offline':True},f,indent=2); f.close()"
    echo         Created.
) else (
    echo         Found. Skipping.
)
echo.

echo  ᚦ  [3/4] Cleaning previous build...
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
del /q *.spec 2>nul
echo         Done.
echo.

echo  ᛟ  [4/4] Forging executable...
echo.
pyinstaller --onefile --windowed --name ravenminer_hq_v3.8.0 --add-data ravenminer_alerts.json;. ravenminer_hq_v3.8.0.py

if errorlevel 1 (
    color 0C
    echo.
    echo  [ERROR] Build failed. See output above.
    pause
    exit /b 1
)

color 0E
echo.
echo  +----------------------------------------------------------+
echo  ^|                                                          ^|
echo  ^|   ᛋᛟᚾ  ᛟᚠ  ᛟᛞᛁᚾ   --   FORGE COMPLETE                  ^|
echo  ^|                                                          ^|
echo  ^|   Output:  dist\ravenminer_hq_v3.8.0.exe                ^|
echo  ^|                                                          ^|
echo  +----------------------------------------------------------+
echo.
explorer dist
pause
