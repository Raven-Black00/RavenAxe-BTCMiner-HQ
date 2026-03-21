@echo off
title RavenMiner HQ — Build
echo.
echo  ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚿ  Build Script
echo  ================================
echo.

:: Check Python is available
python --version >nul 2>&1
if errorlevel 1 (
    echo  [ERROR] Python not found. Install Python 3.10+ and try again.
    pause & exit /b 1
)

:: Install / upgrade dependencies
echo  [1/3] Installing dependencies...
pip install -r requirements.txt --quiet
if errorlevel 1 (
    echo  [ERROR] pip install failed.
    pause & exit /b 1
)

:: Run PyInstaller with the spec file
echo  [2/3] Building .exe with PyInstaller...
pyinstaller build.spec --clean --noconfirm
if errorlevel 1 (
    echo  [ERROR] PyInstaller build failed.
    pause & exit /b 1
)

:: Done
echo.
echo  [3/3] Build complete!
echo  Output: dist\RavenMinerHQ.exe
echo.
echo  NOTE: ravenminer_config.json will be created next to the .exe
echo        on first run when you enter your miner IP.
echo.
pause
