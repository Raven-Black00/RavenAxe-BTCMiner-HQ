@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul 2>&1
cls

rem Enable ANSI virtual terminal processing (Win10+)
reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1

rem Build ESC character at runtime (source stays pure ASCII)
for /f %%A in ('echo prompt $E^| cmd') do set "ESC=%%A"

rem -----------------------------------------------------------------------
rem Colour palette -- matches Ravenminer_HQ_4.0.0.py
rem GOLD_BRIGHT #f0c040  GOLD #c9a84c  PURPLE_GLOW #9d5fff
rem PURPLE #7b2fff  CYAN #00e5ff  GREEN #00ff88
rem RED #ff3030  ORANGE #ff7700  DIM #444466
rem -----------------------------------------------------------------------
set "GBRT=%ESC%[38;2;240;192;64m"
set "GOLD=%ESC%[38;2;201;168;76m"
set "PGLW=%ESC%[38;2;157;95;255m"
set "PURP=%ESC%[38;2;123;47;255m"
set "CYAN=%ESC%[38;2;0;229;255m"
set "CGRN=%ESC%[38;2;0;255;136m"
set "CRED=%ESC%[38;2;255;48;48m"
set "CORG=%ESC%[38;2;255;119;0m"
set "CDIM=%ESC%[38;2;68;68;102m"
set "RST=%ESC%[0m"

echo %ESC%[48;2;8;8;16m%ESC%[2J%ESC%[H
color 00

echo.
echo %PGLW% ========================================================================%RST%
echo %GBRT%   RAVENMINER HQ -- BUILD FORGE -- v4.0.0%RST%
echo %GOLD%   FEHU URUZ ANSUZ RAIDO KENAZ GEBO WUNJO%RST%
echo %CDIM%   FEO TIR ODINN -- The hammer of Thor falls upon the forge%RST%
echo %PGLW% ========================================================================%RST%
echo.

cd /d "%~dp0"

rem -----------------------------------------------------------------------
rem BUILD MODE SELECTION
rem -----------------------------------------------------------------------
echo %GOLD%ODINN speaks -- choose the vessel for your runes:%RST%
echo.
echo %PGLW% [1]%RST% %GBRT%ONEFILE%RST% %CDIM%-- Single rune-stone (.exe only)%RST%
echo %GOLD%Portable as Gungnir -- one spear, one file.%RST%
echo %CDIM%Unpacks to %%TEMP%% on each launch. 5-15s cold start.%RST%
echo.
echo %PGLW% [2]%RST% %GBRT%ONEDIR%RST%  %CDIM%-- Longhouse of runes (folder + .exe)%RST%
echo %GOLD%Fast as Sleipnir -- instant startup, no unpacking.%RST%
echo %CDIM%Good for: personal machines, permanent installs.%RST%
echo.
echo %PURP% [0]%RST% %CDIM%ABANDON -- Leave the forge cold%RST%
echo.
set /p BUILD_CHOICE=%GOLD% Speak your rune [1 / 2 / 0]: %RST%

if "%BUILD_CHOICE%"=="1" ( set "BUILD_MODE=--onefile" & set "MODE_NAME=ONEFILE" & set "MODE_DESC=Single portable .exe -- slow cold start" & goto :mode_set )
if "%BUILD_CHOICE%"=="2" ( set "BUILD_MODE=--onedir"  & set "MODE_NAME=ONEDIR"  & set "MODE_DESC=Folder build -- instant startup"          & goto :mode_set )
if "%BUILD_CHOICE%"=="0" goto :abandon

echo.
echo %CRED%[FAIL]%RST% %GOLD%The Norns do not recognise that rune. Speak 1, 2, or 0.%RST%
echo.

:loop_choice
set /p BUILD_CHOICE=%GOLD% Speak your rune [1 / 2 / 0]: %RST%
if "%BUILD_CHOICE%"=="1" ( set "BUILD_MODE=--onefile" & set "MODE_NAME=ONEFILE" & set "MODE_DESC=Single portable .exe" & goto :mode_set )
if "%BUILD_CHOICE%"=="2" ( set "BUILD_MODE=--onedir"  & set "MODE_NAME=ONEDIR"  & set "MODE_DESC=Folder build"          & goto :mode_set )
if "%BUILD_CHOICE%"=="0" goto :abandon
echo %CRED%[FAIL]%RST% Try again.
goto :loop_choice

:mode_set
echo.
echo %PGLW% ------------------------------------------------------------------------%RST%
echo %CGRN% [OK]%RST% %GBRT%Mode: %MODE_NAME%%RST% %CDIM%-- %MODE_DESC%%RST%
echo %PGLW% ------------------------------------------------------------------------%RST%
echo.

rem -----------------------------------------------------------------------
rem AUTO-LOCATE source .py
rem -----------------------------------------------------------------------
set SRC=
if exist "%~dp0Ravenminer_HQ_4.0.0.py"      set "SRC=%~dp0Ravenminer_HQ_4.0.0.py"      & goto :found_src
if exist "%~dp0Ravenminer_HQ_3.9.5.py"      set "SRC=%~dp0Ravenminer_HQ_3.9.5.py"      & goto :found_src
if exist "%~dp0Ravenminer_HQ_3.9.4.py"      set "SRC=%~dp0Ravenminer_HQ_3.9.4.py"      & goto :found_src
if exist "%~dp0src\Ravenminer_HQ_4.0.0.py"  set "SRC=%~dp0src\Ravenminer_HQ_4.0.0.py"  & goto :found_src
if exist "%~dp0..\Ravenminer_HQ_4.0.0.py"   set "SRC=%~dp0..\Ravenminer_HQ_4.0.0.py"   & goto :found_src
for %%F in ("%~dp0Ravenminer_HQ_*.py") do ( set "SRC=%%F" & goto :found_src )

:ask_path
echo.
echo %CORG%[WARN]%RST% %GOLD%HUGINN could not find Ravenminer_HQ_*.py nearby.%RST%
echo %CDIM%  Drag the .py onto this window and press Enter, or type full path.%RST%
echo %CDIM%  (blank + Enter = abandon)%RST%
echo.
set "SRC="
set /p SRC=%GOLD% Path to source: %RST%
if "!SRC!"=="" goto :abandon
set SRC=!SRC:"=!
if not exist "!SRC!" ( echo. & echo %CRED%[FAIL]%RST% File not found: %CORG%!SRC!%RST% & goto :ask_path )

:found_src
echo %CGRN%[OK]%RST% %GOLD%Source: %GBRT%%SRC%%RST%
echo.
for %%F in ("%SRC%") do set SRC_DIR=%%~dpF
set DIST_DIR=%SRC_DIR%dist
set WORK_DIR=%SRC_DIR%_build_temp
echo %CDIM%[PATH] Output : %DIST_DIR%%RST%
echo %CDIM%[PATH] Temp   : %WORK_DIR%%RST%
echo.

rem -----------------------------------------------------------------------
rem STEP 1 -- Python
rem -----------------------------------------------------------------------
echo %PGLW% ========================================================================%RST%
echo %GBRT%  [1/5] PYTHON -- Summoning the serpent of Midgard...%RST%
echo %PGLW% ========================================================================%RST%
python --version
if errorlevel 1 (
  echo.
  echo %CRED%[FAIL]%RST% %GOLD%Python not found in PATH.%RST%
  echo %CDIM%  Download from https://python.org -- tick "Add to PATH"%RST%
  goto :fail
)
echo %CGRN%[OK]%RST% %GOLD%Python stands ready.%RST%
echo.

rem -----------------------------------------------------------------------
rem STEP 2 -- requirements.txt
rem -----------------------------------------------------------------------
echo %PGLW% ========================================================================%RST%
echo %GBRT%  [2/5] REQUIREMENTS -- Installing rune-dependencies...%RST%
echo %PGLW% ========================================================================%RST%
set "REQ_FILE="
if exist "%~dp0requirements.txt"      set "REQ_FILE=%~dp0requirements.txt"      & goto :found_req
if exist "%~dp0src\requirements.txt"  set "REQ_FILE=%~dp0src\requirements.txt"  & goto :found_req
if exist "%SRC_DIR%requirements.txt"  set "REQ_FILE=%SRC_DIR%requirements.txt"  & goto :found_req
if exist "%~dp0..\requirements.txt"   set "REQ_FILE=%~dp0..\requirements.txt"   & goto :found_req

echo %CORG%[WARN]%RST% %GOLD%requirements.txt not found -- falling back to individual installs.%RST%
echo.
goto :install_individual

:found_req
echo %CGRN%[OK]%RST% %CDIM%Found: %REQ_FILE%%RST%
echo %CYAN%[...]%RST% %CDIM%Running: pip install -r requirements.txt%RST%
pip install -r "%REQ_FILE%"
if errorlevel 1 (
  echo.
  echo %CORG%[WARN]%RST% %GOLD%requirements.txt install had errors -- trying individual fallback...%RST%
  echo.
  goto :install_individual
)
echo.
echo %CGRN%[OK]%RST% %GOLD%All requirements satisfied.%RST%
echo.
goto :install_pyinstaller

:install_individual
echo %CDIM%Installing: requests  Pillow  pystray  individually...%RST%
pip install requests
pip install Pillow
pip install pystray
echo.
echo %CGRN%[OK]%RST% %GOLD%Individual installs complete.%RST%
echo.

:install_pyinstaller
rem -----------------------------------------------------------------------
rem STEP 3 -- PyInstaller  (build-time only, not in requirements.txt)
rem -----------------------------------------------------------------------
echo %PGLW% ========================================================================%RST%
echo %GBRT%  [3/5] PYINSTALLER -- Heating the forge hammer...%RST%
echo %PGLW% ========================================================================%RST%
python -m PyInstaller --version >nul 2>&1
if errorlevel 1 (
  echo %CYAN%[...]%RST% %CDIM%Not found -- installing PyInstaller...%RST%
  pip install pyinstaller
  if errorlevel 1 ( echo %CRED%[FAIL]%RST% pip install pyinstaller failed. & goto :fail )
) else (
  echo %CGRN%[OK]%RST% %GOLD%PyInstaller already forged.%RST%
)
echo.

rem -----------------------------------------------------------------------
rem STEP 4 -- Verify Pillow
rem -----------------------------------------------------------------------
echo %PGLW% ========================================================================%RST%
echo %GBRT%  [4/5] PILLOW -- Verifying Vegvisir image rune...%RST%
echo %PGLW% ========================================================================%RST%
python -c "from PIL import Image" >nul 2>&1
if errorlevel 1 (
  echo %CRED%[FAIL]%RST% Pillow not importable after install. Check pip output above.
  goto :fail
)
echo %CGRN%[OK]%RST% %GOLD%Pillow stands ready.%RST%
echo.

rem -----------------------------------------------------------------------
rem STEP 5 -- Verify pystray
rem -----------------------------------------------------------------------
echo %PGLW% ========================================================================%RST%
echo %GBRT%  [5/5] PYSTRAY -- Verifying tray-spirit rune...%RST%
echo %PGLW% ========================================================================%RST%
python -c "import pystray" >nul 2>&1
if errorlevel 1 (
  echo %CORG%[WARN]%RST% %GOLD%pystray not importable -- tray icon disabled. Forge continues.%RST%
) else (
  echo %CGRN%[OK]%RST% %GOLD%pystray bound.%RST%
)
echo.

if not exist "%DIST_DIR%" mkdir "%DIST_DIR%"
if not exist "%WORK_DIR%" mkdir "%WORK_DIR%"

set "ICON_FLAG="
if exist "%~dp0ravenminer.ico"  set "ICON_FLAG=--icon=%~dp0ravenminer.ico"
if exist "%~dp0RavenMiner.ico"  set "ICON_FLAG=--icon=%~dp0RavenMiner.ico"

rem -----------------------------------------------------------------------
rem THE FORGE
rem -----------------------------------------------------------------------
echo %CDIM%[DBG] BUILD_MODE is: [%BUILD_MODE%]%RST%
echo %PGLW% ========================================================================%RST%
echo %GBRT%   ANSUZ RAIDO KENAZ -- FORGE IS LIT -- BUILDING [%MODE_NAME%]...%RST%
echo %GOLD%   TIWAZ BERKANO MANNAZ -- May the Allfather guide the compiler%RST%
echo %PGLW% ========================================================================%RST%
echo.

if "%BUILD_MODE%"=="--onefile" (
  color 0D
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
    %ICON_FLAG% ^
    "%SRC%"
  if errorlevel 1 set "BUILD_FAILED=1"
  goto :check_result
)

if "%BUILD_MODE%"=="--onedir" (
  color 0D
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
    %ICON_FLAG% ^
    "%SRC%"
  if errorlevel 1 set "BUILD_FAILED=1"
  goto :check_result
)

:check_result
color 08
if defined BUILD_FAILED (
  echo.
  echo %CRED% ========================================================================%RST%
  echo %CRED%  [FAIL] LOKI INTERFERED -- BUILD FAILED%RST%
  echo %GOLD%  The trickster has broken the forge. See output above.%RST%
  echo %CDIM%  Temp files: %WORK_DIR%%RST%
  echo %CRED% ========================================================================%RST%
  goto :fail
)

rem -----------------------------------------------------------------------
rem SUCCESS
rem -----------------------------------------------------------------------
echo.
echo %PGLW% ========================================================================%RST%
echo.
echo %GBRT%   ** VALHALLA AWAITS **  BUILD SUCCEEDED  [%MODE_NAME%]%RST%
echo.
echo %GOLD%   FEHU TIWAZ ODINN -- The EXE has been forged in Asgard%RST%
echo %GOLD%   WUNJO INGWAZ DAGAZ OTHALA -- Vegvisir points true%RST%
echo.
if "%BUILD_MODE%"=="--onefile" (
  echo %CGRN%   Output : %DIST_DIR%\RavenMinerHQ.exe%RST%
  echo.
  echo %CDIM%   NOTE: 5-15s cold start on first launch.%RST%
  echo %CDIM%   Windows Defender may scan on the very first run.%RST%
)
if "%BUILD_MODE%"=="--onedir" (
  echo %CGRN%   Output : %DIST_DIR%\RavenMinerHQ\RavenMinerHQ.exe%RST%
  echo.
  echo %CDIM%   NOTE: Run the .exe from inside the RavenMinerHQ\ folder.%RST%
  echo %CDIM%   Do NOT move the .exe out -- it needs its sibling files.%RST%
)
echo.
echo %GOLD%   Place these config files next to the .exe:%RST%
echo %CDIM%     ravenminer_config.json   (auto-created on first run)%RST%
echo %CDIM%     ravenminer_alerts.json   (auto-created on first run)%RST%
echo.
echo %PGLW%   May your difficulty be low and your uptime eternal.%RST%
echo %GBRT%   R A V E N M I N E R  H Q   v 4 . 0 . 0%RST%
echo %PGLW% ========================================================================%RST%
echo.

set /p OPEN_DIST=%GOLD% Open the dist\ folder now? [Y/N]: %RST%
if /i "!OPEN_DIST!"=="Y" start "" "%DIST_DIR%"
goto :end

:abandon
echo.
echo %PURP% ========================================================================%RST%
echo %CDIM%   The ravens circle but do not land.%RST%
echo %PURP%   ABANDONED -- Forge left cold. No files were changed.%RST%
echo %PURP% ========================================================================%RST%
goto :end

:fail
echo.
pause
goto :end

:end
endlocal
pause
exit /b 0
