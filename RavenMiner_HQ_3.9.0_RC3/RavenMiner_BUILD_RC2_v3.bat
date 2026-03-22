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

:: -----------------------------------------------------------------------
::  BUILD MODE SELECTION
:: -----------------------------------------------------------------------
echo  Choose your build mode:
echo.
echo    [1]  ONEFILE  -- Single .exe  (portable, but 5-15s cold start)
echo                     Every launch extracts to %%TEMP%% before running.
echo                     Good for: sharing a single file with someone.
echo.
echo    [2]  ONEDIR   -- Folder of files  (instant startup, recommended)
echo                     Files stay unpacked -- no extraction on launch.
echo                     Good for: personal use, best performance.
echo.
set /p BUILD_CHOICE=  Enter 1 or 2 then press Enter: 

if "%BUILD_CHOICE%"=="1" (
    set BUILD_MODE=--onefile
    set MODE_NAME=ONEFILE
    set MODE_DESC=Single portable .exe  [slow cold start]
    goto :mode_set
)
if "%BUILD_CHOICE%"=="2" (
    set BUILD_MODE=--onedir
    set MODE_NAME=ONEDIR
    set MODE_DESC=Folder build  [instant startup]
    goto :mode_set
)

echo.
echo  [FAIL]  Invalid choice. Please enter 1 or 2.
pause
exit /b 1

:mode_set
echo.
echo  [OK]   Mode selected: %MODE_NAME% -- %MODE_DESC%
echo.

:: -----------------------------------------------------------------------
::  AUTO-LOCATE the source .py file
::  Checks 5 common locations relative to where the bat was placed
:: -----------------------------------------------------------------------
set SRC=

if exist "%~dp0Ravenminer_HQ_3.9.0_RC2.py" (
    set SRC=%~dp0Ravenminer_HQ_3.9.0_RC2.py
    goto :found_src
)
if exist "%~dp0src\Ravenminer_HQ_3.9.0_RC2.py" (
    set SRC=%~dp0src\Ravenminer_HQ_3.9.0_RC2.py
    goto :found_src
)
if exist "%~dp0..\Ravenminer_HQ_3.9.0_RC2.py" (
    set SRC=%~dp0..\Ravenminer_HQ_3.9.0_RC2.py
    goto :found_src
)
if exist "%~dp0..\src\Ravenminer_HQ_3.9.0_RC2.py" (
    set SRC=%~dp0..\src\Ravenminer_HQ_3.9.0_RC2.py
    goto :found_src
)
if exist "%~dp0..\..\Ravenminer_HQ_3.9.0_RC2.py" (
    set SRC=%~dp0..\..\Ravenminer_HQ_3.9.0_RC2.py
    goto :found_src
)

:: Still not found -- ask user
echo  [WARN]  Could not auto-locate Ravenminer_HQ_3.9.0_RC2.py
echo.
echo          Drag the .py file onto this window and press Enter,
echo          OR type the full path manually and press Enter:
echo.
set /p SRC=  Path: 
set SRC=%SRC:"=%

if not exist "%SRC%" (
    echo.
    echo  [FAIL]  File not found: %SRC%
    pause
    exit /b 1
)

:found_src
echo  [OK]   Source: %SRC%
echo.

:: -----------------------------------------------------------------------
::  Set output paths next to the .py file
:: -----------------------------------------------------------------------
for %%F in ("%SRC%") do set SRC_DIR=%%~dpF
set DIST_DIR=%SRC_DIR%dist
set WORK_DIR=%SRC_DIR%_build_temp

echo  [PATH]  Output : %DIST_DIR%
echo  [PATH]  Temp   : %WORK_DIR%
echo.

:: -----------------------------------------------------------------------
::  STEP 1 -- Python
:: -----------------------------------------------------------------------
echo  [1/4]  Checking Python...
python --version
if errorlevel 1 (
    echo  [FAIL]  Python not found in PATH.
    echo          Download from https://python.org
    pause
    exit /b 1
)
echo  [OK]   Python found.
echo.

:: -----------------------------------------------------------------------
::  STEP 2 -- PyInstaller
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
::  STEP 3 -- Pillow
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
::  STEP 4 -- pystray
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
::  THE FORGE
:: -----------------------------------------------------------------------
echo  =======================================================================
echo   ANSUZ RAIDO KENAZ -- FORGE IS LIT -- BUILDING [%MODE_NAME%]...
echo  =======================================================================
echo.

:: ONEFILE build
if "%BUILD_MODE%"=="--onefile" (
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
    goto :check_result
)

:: ONEDIR build
if "%BUILD_MODE%"=="--onedir" (
    python -m PyInstaller ^
        --onedir ^
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
    goto :check_result
)

:check_result
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
echo   ** VALHALLA AWAITS **   BUILD SUCCEEDED [%MODE_NAME%]
echo.
echo   FEHU TIWAZ ODINN -- The EXE has been forged in Asgard
echo   WUNJO INGWAZ DAGAZ OTHALA -- May the Vegvisir point true
echo.

if "%BUILD_MODE%"=="--onefile" (
    echo   Output : %DIST_DIR%\RavenMinerHQ.exe
    echo.
    echo   NOTE: Single file -- expect 5-15s cold start on first launch.
    echo         Windows Defender may add extra delay on very first run.
)
if "%BUILD_MODE%"=="--onedir" (
    echo   Output : %DIST_DIR%\RavenMinerHQ\RavenMinerHQ.exe
    echo.
    echo   NOTE: Run RavenMinerHQ.exe from inside the RavenMinerHQ\ folder.
    echo         Do not move the .exe out of its folder -- it needs the
    echo         files alongside it to run correctly.
)

echo.
echo   Copy these config files next to the .exe when distributing:
echo     ravenminer_config.json   (auto-created on first run)
echo     ravenminer_alerts.json   (auto-created on first run)
echo  =======================================================================
echo.

if exist "%DIST_DIR%\" start "" "%DIST_DIR%"

pause
exit /b 0
