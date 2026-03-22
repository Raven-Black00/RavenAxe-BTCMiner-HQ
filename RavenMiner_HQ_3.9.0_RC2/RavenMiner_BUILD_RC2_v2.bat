@echo off
chcp 65001 >nul 2>&1
cls
color 0C

echo.
echo  =======================================================================
echo   RAVENM INER HQ -- BUILD FORGE -- v3.9.0 RC2
echo   FEHU URUZ ANSUZ RAIDO KENAZ GEBO WUNJO
echo   FEO TIR ODINN -- The hammer of Thor falls upon the forge
echo  =======================================================================
echo.

:: -----------------------------------------------------------------------
::  Anchor to the folder this .bat lives in
:: -----------------------------------------------------------------------
cd /d "%~dp0"
echo  [PATH]  BAT location: %~dp0
echo.

:: -----------------------------------------------------------------------
::  AUTO-LOCATE the source .py file
::  Checks 5 common locations relative to where the bat was placed
:: -----------------------------------------------------------------------
set SRC=

:: Location 1 -- same folder as the bat
if exist "%~dp0Ravenminer_HQ_3.9.0_RC2.py" (
    set SRC=%~dp0Ravenminer_HQ_3.9.0_RC2.py
    goto :found_src
)

:: Location 2 -- src\ next to the bat
if exist "%~dp0src\Ravenminer_HQ_3.9.0_RC2.py" (
    set SRC=%~dp0src\Ravenminer_HQ_3.9.0_RC2.py
    goto :found_src
)

:: Location 3 -- one folder up (bat is inside build_tools\)
if exist "%~dp0..\Ravenminer_HQ_3.9.0_RC2.py" (
    set SRC=%~dp0..\Ravenminer_HQ_3.9.0_RC2.py
    goto :found_src
)

:: Location 4 -- ..\src\ (standard release layout)
if exist "%~dp0..\src\Ravenminer_HQ_3.9.0_RC2.py" (
    set SRC=%~dp0..\src\Ravenminer_HQ_3.9.0_RC2.py
    goto :found_src
)

:: Location 5 -- two folders up
if exist "%~dp0..\..\Ravenminer_HQ_3.9.0_RC2.py" (
    set SRC=%~dp0..\..\Ravenminer_HQ_3.9.0_RC2.py
    goto :found_src
)

:: -----------------------------------------------------------------------
::  Still not found -- ask the user
:: -----------------------------------------------------------------------
echo  [WARN]  Could not auto-locate Ravenminer_HQ_3.9.0_RC2.py
echo.
echo          Please drag the .py file onto this window and press Enter,
echo          OR type the full path manually and press Enter:
echo.
set /p SRC=  Path: 

:: Strip any surrounding quotes the user may have dragged in
set SRC=%SRC:"=%

if not exist "%SRC%" (
    echo.
    echo  [FAIL]  File still not found: %SRC%
    echo          Make sure you are pointing to Ravenminer_HQ_3.9.0_RC2.py
    echo.
    pause
    exit /b 1
)

:found_src
echo  [OK]   Source found: %SRC%
echo.

:: -----------------------------------------------------------------------
::  Set output paths relative to where the .py file lives
:: -----------------------------------------------------------------------
for %%F in ("%SRC%") do set SRC_DIR=%%~dpF
set DIST_DIR=%SRC_DIR%dist
set WORK_DIR=%SRC_DIR%_build_temp

echo  [PATH]  Output .exe : %DIST_DIR%
echo  [PATH]  Build temp  : %WORK_DIR%
echo.

:: -----------------------------------------------------------------------
::  STEP 1 -- Check Python
:: -----------------------------------------------------------------------
echo  [1/4]  Checking Python...
python --version
if errorlevel 1 (
    echo.
    echo  [FAIL]  Python not found in PATH.
    echo          Download from https://python.org
    echo          Check "Add Python to PATH" during install.
    echo.
    pause
    exit /b 1
)
echo  [OK]   Python found.
echo.

:: -----------------------------------------------------------------------
::  STEP 2 -- Check / Install PyInstaller
:: -----------------------------------------------------------------------
echo  [2/4]  Checking PyInstaller...
python -m PyInstaller --version >nul 2>&1
if errorlevel 1 (
    echo  [...]  Not found. Installing PyInstaller...
    pip install pyinstaller
    if errorlevel 1 (
        echo  [FAIL]  pip install pyinstaller failed.
        pause
        exit /b 1
    )
) else (
    echo  [OK]   PyInstaller already installed.
)
echo.

:: -----------------------------------------------------------------------
::  STEP 3 -- Check / Install Pillow
:: -----------------------------------------------------------------------
echo  [3/4]  Checking Pillow...
python -c "from PIL import Image" >nul 2>&1
if errorlevel 1 (
    echo  [...]  Not found. Installing Pillow...
    pip install Pillow
    if errorlevel 1 (
        echo  [FAIL]  pip install Pillow failed.
        pause
        exit /b 1
    )
) else (
    echo  [OK]   Pillow already installed.
)
echo.

:: -----------------------------------------------------------------------
::  STEP 4 -- Check / Install pystray
:: -----------------------------------------------------------------------
echo  [4/4]  Checking pystray...
python -c "import pystray" >nul 2>&1
if errorlevel 1 (
    echo  [...]  Not found. Installing pystray...
    pip install pystray
    if errorlevel 1 (
        echo  [WARN]  pystray failed -- tray icon disabled, build continues.
    ) else (
        echo  [OK]   pystray installed.
    )
) else (
    echo  [OK]   pystray already installed.
)
echo.

:: -----------------------------------------------------------------------
::  Create output folders
:: -----------------------------------------------------------------------
if not exist "%DIST_DIR%" mkdir "%DIST_DIR%"
if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"

:: -----------------------------------------------------------------------
::  THE FORGE -- PyInstaller Build
:: -----------------------------------------------------------------------
echo  =======================================================================
echo   ANSUZ RAIDO KENAZ -- FORGE IS LIT -- BUILDING NOW...
echo  =======================================================================
echo.

python -m PyInstaller ^
    --onefile ^
    --windowed ^
    --name "RavenMinerHQ" ^
    --distpath "%DIST_DIR%" ^
    --workpath "%WORK_DIR%" ^
    --specpath "%WORK_DIR%" ^
    --hidden-import=PIL._tkinter_finder ^
    --hidden-import=pystray ^
    --hidden-import=pystray._win32 ^
    --hidden-import=requests ^
    --collect-all=PIL ^
    "%SRC%"

if errorlevel 1 (
    echo.
    echo  =======================================================================
    echo   [FAIL]  LOKI INTERFERED -- BUILD FAILED
    echo           Review PyInstaller output above for the error.
    echo           Build temp files: %WORK_DIR%
    echo  =======================================================================
    echo.
    pause
    exit /b 1
)

:: -----------------------------------------------------------------------
::  SUCCESS
:: -----------------------------------------------------------------------
echo.
echo  =======================================================================
echo   ** VALHALLA AWAITS **   BUILD SUCCEEDED   ** VALHALLA AWAITS **
echo.
echo   FEHU TIWAZ ODINN -- The EXE has been forged in Asgard
echo   WUNJO INGWAZ DAGAZ OTHALA -- May the Vegvisir point true
echo.
echo   Output: %DIST_DIR%\RavenMinerHQ.exe
echo.
echo   NOTE: Copy these files next to the .exe when distributing:
echo     ravenminer_config.json   (auto-created on first run)
echo     ravenminer_alerts.json   (auto-created on first run)
echo  =======================================================================
echo.

if exist "%DIST_DIR%\" start "" "%DIST_DIR%"

pause
exit /b 0
