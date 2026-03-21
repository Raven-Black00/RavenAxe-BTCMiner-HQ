@echo off
title RavenMiner HQ v3.6 - Build EXE
color 5F

echo.
echo  =====================================================
echo   RAVENMINER HQ v3.6 - PyInstaller EXE Builder
echo  =====================================================
echo.

:: Check Python
python --version >nul 2>&1
if errorlevel 1 (
    echo  [ERROR] Python not found. Install from https://python.org
    pause
    exit /b 1
)
echo  [OK] Python found

:: Check pip
pip --version >nul 2>&1
if errorlevel 1 (
    echo  [ERROR] pip not found.
    pause
    exit /b 1
)
echo  [OK] pip found

:: Install dependencies
echo.
echo  [*] Installing requirements...
pip install -r requirements.txt --quiet
if errorlevel 1 (
    echo  [ERROR] Failed to install requirements.
    pause
    exit /b 1
)
echo  [OK] Requirements installed

:: Install PyInstaller
echo  [*] Checking PyInstaller...
pip install pyinstaller --quiet
echo  [OK] PyInstaller ready

:: Clean old build
echo.
echo  [*] Cleaning previous build...
if exist build   rmdir /s /q build
if exist dist    rmdir /s /q dist
if exist __pycache__ rmdir /s /q __pycache__
echo  [OK] Clean done

:: Build EXE
echo.
echo  [*] Building EXE - please wait...
echo.
pyinstaller ravenminer_hq_v3.6.spec
if errorlevel 1 (
    echo.
    echo  [ERROR] Build failed. Check output above.
    pause
    exit /b 1
)

:: Confirm output
if exist dist\ravenminer_hq_v3.6.exe (
    echo.
    echo  =====================================================
    echo   [SUCCESS] EXE built:
    echo   dist\ravenminer_hq_v3.6.exe
    echo  =====================================================
    echo.
    echo  Copy ravenminer_config.json beside the EXE before running.
    echo.
    choice /m "  Open dist folder now?"
    if errorlevel 2 goto end
    explorer dist
) else (
    echo  [ERROR] EXE not found after build.
)

:end
echo.
pause
