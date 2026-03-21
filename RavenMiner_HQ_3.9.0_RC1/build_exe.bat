@echo off
mode con: cols=72 lines=28
title RavenMiner HQ -- Build EXE
color 0E
cls
echo.
echo   +------------------------------------------------------------------+
echo   |   RavenMiner HQ 3.9.0 RC1  --  PyInstaller EXE Builder         |
echo   +------------------------------------------------------------------+
echo.
color 0F
python --version >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo   [ERROR] Python not found.
    pause & exit /b 1
)
color 0D
echo   [*] Installing PyInstaller...
color 0F
pip install pyinstaller --quiet --disable-pip-version-check
color 0D
echo   [*] Building EXE -- please wait...
color 0F
pyinstaller --onefile --windowed --name RavenMiner_HQ_3.9.0_RC1 Ravenminer_HQ_3.9.0_RC1.py
if %errorlevel% neq 0 (
    color 0C
    echo.
    echo   [ERROR] Build failed. Check output above.
    pause & exit /b 1
)
color 0A
echo.
echo   [OK] Build complete!
echo   Find RavenMiner_HQ_3.9.0_RC1.exe in the dist\ folder.
echo.
color 0E
echo   The All-Father smiles upon your forge.
echo.
color 0F
pause
