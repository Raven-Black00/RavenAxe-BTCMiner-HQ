@echo off
title RavenMiner HQ Build

echo.
echo  ==============================================
echo   RavenMiner HQ v3.7.5  PyInstaller Build
echo  ==============================================
echo.

python --version >nul 2>&1
if errorlevel 1 (
    echo  [ERROR] Python not found in PATH.
    pause
    exit /b 1
)

echo  [1/4] Installing dependencies...
pip install -r requirements.txt --quiet
if errorlevel 1 (
    echo  [ERROR] pip install failed.
    pause
    exit /b 1
)
echo        Done.

echo  [2/4] Checking ravenminer_alerts.json...
if not exist ravenminer_alerts.json (
    echo        Creating default alerts config...
    python -c "import json; f=open('ravenminer_alerts.json','w'); json.dump({'discord_webhook':'','alert_temp_threshold':85.0,'alert_vr_temp_threshold':85.0,'alert_hash_threshold':0.5,'alert_on_block':True,'alert_on_offline':True},f,indent=2); f.close()"
    echo        Created.
) else (
    echo        Found. Skipping.
)

echo  [3/4] Cleaning previous build...
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
del /q *.spec 2>nul
echo        Done.

echo  [4/4] Building executable...
pyinstaller --onefile --windowed --name ravenminer_hq_v3.7.5 --add-data ravenminer_alerts.json;. ravenminer_hq_v3.7.5.py

if errorlevel 1 (
    echo.
    echo  [ERROR] Build failed. See output above.
    pause
    exit /b 1
)

echo.
echo  ==============================================
echo   BUILD COMPLETE
echo   Output: dist\ravenminer_hq_v3.7.5.exe
echo  ==============================================
echo.
explorer dist
pause
