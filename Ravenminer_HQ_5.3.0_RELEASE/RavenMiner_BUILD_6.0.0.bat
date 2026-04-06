@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul 2>&1
cls

rem Enable ANSI virtual terminal processing (Win10+)
reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1

rem Build ESC character at runtime (source stays pure ASCII)
for /f %%A in ('echo prompt $E^| cmd') do set "ESC=%%A"

rem -----------------------------------------------------------------------
rem  Colour palette -- matches Ravenminer_HQ colour scheme
rem  GOLD_BRIGHT #f0c040   GOLD #c9a84c     LIGHT_PURP #bf94ff
rem  PURPLE_GLOW #9d5fff   PURPLE #7b2fff   WHITE  #f4f0ff
rem  CYAN #00e5ff           GREEN #00ff88    DIM #444466
rem  RED #ff3030            ORANGE #ff7700
rem -----------------------------------------------------------------------
set "GBRT=%ESC%[38;2;240;192;64m"
set "GOLD=%ESC%[38;2;201;168;76m"
set "PGLW=%ESC%[38;2;157;95;255m"
set "PURP=%ESC%[38;2;123;47;255m"
set "LPGL=%ESC%[38;2;191;148;255m"
set "CYAN=%ESC%[38;2;0;229;255m"
set "CGRN=%ESC%[38;2;0;255;136m"
set "CRED=%ESC%[38;2;255;48;48m"
set "CORG=%ESC%[38;2;255;119;0m"
set "WHTB=%ESC%[38;2;244;240;255m"
set "CDIM=%ESC%[38;2;68;68;102m"
set "RST=%ESC%[0m"

echo %ESC%[48;2;8;8;16m%ESC%[2J%ESC%[H
color 00

echo.
echo %PGLW%  ========================================================================%RST%
echo %GBRT%                                                                          %RST%
echo %GBRT%       R A V E N M I N E R   H Q   --   B U I L D   F O R G E           %RST%
echo %GBRT%               v 4 . 0 . 0   t h r o u g h   v 6 . 0 . 0                %RST%
echo %GBRT%                                                                          %RST%
echo %GOLD%       FEHU  URUZ  ANSUZ  RAIDHO  KAUNAN  GEBO  WUNJO  HAGLAZ            %RST%
echo %GOLD%       NAUDIZ  ISAZ  JERA  EIWAZ  TIWAZ  BERKANAN  MANNAZ  OTHALAN       %RST%
echo %PGLW%                                                                          %RST%
echo %LPGL%       FEHU TIWAZ ODINN  --  The hammer of Thor falls upon the forge      %RST%
echo %PGLW%  ========================================================================%RST%
echo.

cd /d "%~dp0"

rem -----------------------------------------------------------------------
rem  BUILD MODE SELECTION
rem -----------------------------------------------------------------------
echo %PGLW%  ANSUZ  %GBRT%ODINN speaks -- choose the vessel for your runes:%RST%
echo.
echo %PGLW%  [%GBRT% 1 %PGLW%]%RST%  %GBRT%ONEFILE%RST%  %CDIM%......  Single rune-stone  (.exe only)%RST%
echo %GOLD%         GEBO  -- Portable as Gungnir, one spear, one file%RST%
echo %CDIM%                Unpacks to %%TEMP%% on each launch.  Cold start: 5 to 15 seconds.%RST%
echo.
echo %PGLW%  [%GBRT% 2 %PGLW%]%RST%  %GBRT%ONEDIR%RST%   %CDIM%......  Longhouse of runes  (folder + .exe)%RST%
echo %GOLD%         WUNJO -- Fast as Sleipnir, instant startup, no unpacking%RST%
echo %CDIM%                Good for personal machines and permanent installs.%RST%
echo.
echo %PURP%  [%LPGL% 0 %PURP%]%RST%  %LPGL%ABANDON%RST%  %CDIM%......  Leave the forge cold%RST%
echo.
set /p BUILD_CHOICE=%GOLD%  NAUDIZ  -- Speak your rune %PGLW%[%GBRT% 1 %PGLW%/%GBRT% 2 %PGLW%/%GBRT% 0 %PGLW%]%GOLD%:  %RST%

if "%BUILD_CHOICE%"=="1" ( set "BUILD_MODE=--onefile" & set "MODE_NAME=ONEFILE" & set "MODE_DESC=Single portable .exe -- slow cold start" & goto :mode_set )
if "%BUILD_CHOICE%"=="2" ( set "BUILD_MODE=--onedir"  & set "MODE_NAME=ONEDIR"  & set "MODE_DESC=Folder build -- instant startup"          & goto :mode_set )
if "%BUILD_CHOICE%"=="0" goto :abandon

echo.
echo %CRED%  HAGLAZ  [FAIL]%RST%  %GOLD%The Norns do not recognise that rune.  Speak 1, 2, or 0.%RST%
echo.

:loop_choice
set /p BUILD_CHOICE=%GOLD%  NAUDIZ  -- Speak your rune %PGLW%[%GBRT% 1 %PGLW%/%GBRT% 2 %PGLW%/%GBRT% 0 %PGLW%]%GOLD%:  %RST%
if "%BUILD_CHOICE%"=="1" ( set "BUILD_MODE=--onefile" & set "MODE_NAME=ONEFILE" & set "MODE_DESC=Single portable .exe" & goto :mode_set )
if "%BUILD_CHOICE%"=="2" ( set "BUILD_MODE=--onedir"  & set "MODE_NAME=ONEDIR"  & set "MODE_DESC=Folder build"          & goto :mode_set )
if "%BUILD_CHOICE%"=="0" goto :abandon
echo  %CRED%[FAIL]%RST%  %CDIM%Try again.%RST%
goto :loop_choice

:mode_set
echo.
echo %PGLW%  ------------------------------------------------------------------------%RST%
echo %CGRN%  WUNJO  [OK]%RST%  %GBRT%Mode  :  %MODE_NAME%%RST%  %PGLW%-- %LPGL%%MODE_DESC%%RST%
echo %PGLW%  ------------------------------------------------------------------------%RST%
echo.

rem -----------------------------------------------------------------------
rem  AUTO-LOCATE source .py  (v4.0.0 through v6.0.0)
rem -----------------------------------------------------------------------
set "SRC="
set "DETECTED_VER=unknown"

rem -- 1. Explicit checks for known releases (newest first) ---------------
for %%V in (
    6.0.0
    5.9.9 5.9.0 5.8.0 5.7.0 5.6.0 5.5.0
    5.4.0 5.3.0 5.2.0 5.1.0
    5.0.9 5.0.8 5.0.7 5.0.6 5.0.5 5.0.4 5.0.3 5.0.2 5.0.1 5.0.0
    4.9.9 4.9.0 4.8.0 4.7.0 4.6.0 4.5.0
    4.4.0 4.3.0 4.2.0 4.1.0
    4.0.9 4.0.8 4.0.7 4.0.6 4.0.5 4.0.4 4.0.3 4.0.2 4.0.1 4.0.0
) do (
    if not defined SRC (
        if exist "%~dp0Ravenminer_HQ_%%V.py"         set "SRC=%~dp0Ravenminer_HQ_%%V.py"         & set "DETECTED_VER=%%V"
        if exist "%~dp0Ravenminer_HQ_%%V_patched.py" set "SRC=%~dp0Ravenminer_HQ_%%V_patched.py" & set "DETECTED_VER=%%V (patched)"
        if exist "%~dp0src\Ravenminer_HQ_%%V.py"    set "SRC=%~dp0src\Ravenminer_HQ_%%V.py"    & set "DETECTED_VER=%%V"
        if exist "%~dp0..\Ravenminer_HQ_%%V.py"     set "SRC=%~dp0..\Ravenminer_HQ_%%V.py"     & set "DETECTED_VER=%%V"
    )
)

rem -- 2. Glob fallback: picks whatever Ravenminer_HQ_*.py exists ----------
if not defined SRC (
    for %%F in ("%~dp0Ravenminer_HQ_*.py") do (
        set "SRC=%%F"
        for %%N in ("%%F") do (
            set "_TMP=%%~nN"
            set "DETECTED_VER=!_TMP:Ravenminer_HQ_=!"
        )
    )
)

rem -- 3. Also try src\ sub-folder ----------------------------------------
if not defined SRC (
    for %%F in ("%~dp0src\Ravenminer_HQ_*.py") do (
        set "SRC=%%F"
        for %%N in ("%%F") do (
            set "_TMP=%%~nN"
            set "DETECTED_VER=!_TMP:Ravenminer_HQ_=!"
        )
    )
)

if defined SRC goto :found_src

:ask_path
echo.
echo %CORG%  HAGLAZ  [WARN]%RST%  %GOLD%HUGINN could not find Ravenminer_HQ_*.py nearby.%RST%
echo %CDIM%                 Supported range: v4.0.0 -- v6.0.0%RST%
echo %CDIM%                 Drag the .py onto this window and press Enter, or type full path.%RST%
echo %CDIM%                 (blank + Enter = abandon)%RST%
echo.
set "SRC="
set /p SRC=%GOLD%  RAIDHO  -- Path to source: %RST%
if "!SRC!"=="" goto :abandon
set SRC=!SRC:"=!
if not exist "!SRC!" ( echo. & echo %CRED%  HAGLAZ  [FAIL]%RST%  File not found: %CORG%!SRC!%RST% & goto :ask_path )
for %%N in ("!SRC!") do ( set "_TMP=%%~nN" & set "DETECTED_VER=!_TMP:Ravenminer_HQ_=!" )

:found_src
echo %CGRN%  SOWILO  [OK]%RST%  %GOLD%Source  :%RST%  %WHTB%%SRC%%RST%
echo %CGRN%  SOWILO  [OK]%RST%  %GOLD%Version :%RST%  %GBRT%v%DETECTED_VER%%RST%
echo.
for %%F in ("%SRC%") do set "SRC_DIR=%%~dpF"
set "DIST_DIR=%SRC_DIR%dist"
set "WORK_DIR=%SRC_DIR%_build_temp"
echo %CDIM%  RAIDHO  -- Output  :  %DIST_DIR%%RST%
echo %CDIM%  RAIDHO  -- Temp    :  %WORK_DIR%%RST%
echo.

rem -----------------------------------------------------------------------
rem  STEP 1 -- Python
rem -----------------------------------------------------------------------
echo %PGLW%  ========================================================================%RST%
echo %GBRT%  ANSUZ  [ 1 / 5 ]  PYTHON  %GOLD%--  Summoning the serpent of Midgard...%RST%
echo %PGLW%  ========================================================================%RST%
python --version
if errorlevel 1 (
    echo.
    echo %CRED%  HAGLAZ  [FAIL]%RST%  %GOLD%Python not found in PATH.%RST%
    echo %CDIM%                 Download from https://python.org -- tick "Add to PATH"%RST%
    goto :fail
)
echo %CGRN%  ANSUZ  [OK]%RST%  %GOLD%Python stands ready.%RST%
echo.

rem -----------------------------------------------------------------------
rem  STEP 2 -- requirements.txt
rem -----------------------------------------------------------------------
echo %PGLW%  ========================================================================%RST%
echo %GBRT%  FEHU   [ 2 / 5 ]  REQUIREMENTS  %GOLD%--  Installing rune-dependencies...%RST%
echo %PGLW%  ========================================================================%RST%
set "REQ_FILE="
if exist "%~dp0requirements.txt"     set "REQ_FILE=%~dp0requirements.txt"     & goto :found_req
if exist "%~dp0src\requirements.txt" set "REQ_FILE=%~dp0src\requirements.txt" & goto :found_req
if exist "%SRC_DIR%requirements.txt" set "REQ_FILE=%SRC_DIR%requirements.txt" & goto :found_req
if exist "%~dp0..\requirements.txt" set "REQ_FILE=%~dp0..\requirements.txt" & goto :found_req

echo %CORG%  HAGLAZ  [WARN]%RST%  %GOLD%requirements.txt not found -- falling back to individual installs.%RST%
echo.
goto :install_individual

:found_req
echo %CGRN%  SOWILO  [OK]%RST%  %CDIM%Found  :  %REQ_FILE%%RST%
echo %CYAN%  JERA   [...]%RST%  %CDIM%Running:  pip install -r requirements.txt%RST%
pip install -r "%REQ_FILE%"
if errorlevel 1 (
    echo.
    echo %CORG%  HAGLAZ  [WARN]%RST%  %GOLD%requirements.txt install had errors -- trying individual fallback...%RST%
    echo.
    goto :install_individual
)
echo.
echo %CGRN%  FEHU   [OK]%RST%  %GOLD%All requirements satisfied.%RST%
echo.
goto :install_pyinstaller

:install_individual
echo %CDIM%  NAUDIZ  -- Installing: requests  Pillow  pystray  numpy  ...%RST%
pip install "requests>=2.32.3" "Pillow>=10.4.0" "pystray>=0.19.5" "numpy>=1.26.0"
echo.
echo %CGRN%  FEHU   [OK]%RST%  %GOLD%Individual installs complete.%RST%
echo.

:install_pyinstaller
rem -----------------------------------------------------------------------
rem  STEP 3 -- PyInstaller (build-time only, not in requirements.txt)
rem -----------------------------------------------------------------------
echo %PGLW%  ========================================================================%RST%
echo %GBRT%  TIWAZ  [ 3 / 5 ]  PYINSTALLER  %GOLD%--  Heating the forge hammer...%RST%
echo %PGLW%  ========================================================================%RST%
python -m PyInstaller --version >nul 2>&1
if errorlevel 1 (
    echo %CYAN%  JERA   [...]%RST%  %CDIM%Not found -- installing PyInstaller...%RST%
    pip install pyinstaller
    if errorlevel 1 ( echo %CRED%  HAGLAZ  [FAIL]%RST%  pip install pyinstaller failed. & goto :fail )
) else (
    echo %CGRN%  TIWAZ  [OK]%RST%  %GOLD%PyInstaller already forged.%RST%
)
echo.

rem -----------------------------------------------------------------------
rem  STEP 4 -- Verify Pillow + NumPy
rem -----------------------------------------------------------------------
echo %PGLW%  ========================================================================%RST%
echo %GBRT%  ISAZ   [ 4 / 5 ]  PILLOW + NUMPY  %GOLD%--  Verifying image runes...%RST%
echo %PGLW%  ========================================================================%RST%
python -c "from PIL import Image" >nul 2>&1
if errorlevel 1 (
    echo %CYAN%  JERA   [...]%RST%  %CDIM%Pillow missing -- installing...%RST%
    pip install "Pillow>=10.4.0"
    if errorlevel 1 ( echo %CRED%  HAGLAZ  [FAIL]%RST%  Pillow install failed. & goto :fail )
) else (
    echo %CGRN%  ISAZ   [OK]%RST%  %GOLD%Pillow stands watch.%RST%
)
python -c "import numpy" >nul 2>&1
if errorlevel 1 (
    echo %CYAN%  JERA   [...]%RST%  %CDIM%NumPy missing -- installing...%RST%
    pip install "numpy>=1.26.0"
    if errorlevel 1 ( echo %CRED%  HAGLAZ  [FAIL]%RST%  NumPy install failed. & goto :fail )
) else (
    echo %CGRN%  ISAZ   [OK]%RST%  %GOLD%NumPy stands watch.%RST%
)
echo.

rem -----------------------------------------------------------------------
rem  STEP 5 -- BUILD
rem -----------------------------------------------------------------------
echo %PGLW%  ========================================================================%RST%
echo %GBRT%  KAUNAN [ 5 / 5 ]  BUILD  %GOLD%--  Invoking PyInstaller rune...%RST%
echo %PGLW%  ========================================================================%RST%
echo.

rem -- Optional icon: ravenminer.ico next to source or script --------------
set "ICON_FLAG="
if exist "%SRC_DIR%ravenminer.ico"    set "ICON_FLAG=--icon=%SRC_DIR%ravenminer.ico"
if exist "%~dp0ravenminer.ico"        set "ICON_FLAG=--icon=%~dp0ravenminer.ico"
if exist "%~dp0assets\ravenminer.ico" set "ICON_FLAG=--icon=%~dp0assets\ravenminer.ico"
if defined ICON_FLAG (
    echo %CGRN%  SOWILO  [OK]%RST%  %CDIM%Icon  :  %ICON_FLAG%%RST%
) else (
    echo %CORG%  HAGLAZ  [WARN]%RST%  %CDIM%No ravenminer.ico found -- building without custom icon.%RST%
)
echo.

rem -- Inject version module so the frozen exe knows its own version --------
(echo VERSION = "v%DETECTED_VER%") > "%SRC_DIR%_build_version.py"
echo %CGRN%  GEBO   [OK]%RST%  %GOLD%Version injected :%RST%  %GBRT%v%DETECTED_VER%  %PGLW%(bundled as _build_version.py)%RST%
echo.

rem -- PyInstaller flags ---------------------------------------------------
set "PYI_COMMON=--windowed --name RavenMinerHQ_%DETECTED_VER% --hidden-import=PIL._tkinter_finder --hidden-import=pystray --hidden-import=pystray._win32 --hidden-import=requests --hidden-import=numpy --collect-all=PIL"

echo %CDIM%  RAIDHO  -- Mode    :  [%BUILD_MODE%]%RST%
echo %CDIM%  RAIDHO  -- Version :  [v%DETECTED_VER%]%RST%
echo.
echo %PGLW%  ========================================================================%RST%
echo %GBRT%  ANSUZ  RAIDHO  KAUNAN  --  FORGE IS LIT  --  BUILDING [%MODE_NAME%]...%RST%
echo %GOLD%  TIWAZ  BERKANAN  MANNAZ  --  May the Allfather guide the compiler%RST%
echo %PGLW%  ========================================================================%RST%
echo.

color 0D
python -m PyInstaller %BUILD_MODE% %PYI_COMMON% --distpath "%DIST_DIR%" --workpath "%WORK_DIR%" --specpath "%WORK_DIR%" %ICON_FLAG% "%SRC%"
if errorlevel 1 ( set "BUILD_FAILED=1" )

rem -- Clean up injected version module (already bundled inside the exe) ----
if exist "%SRC_DIR%_build_version.py" del /f /q "%SRC_DIR%_build_version.py"

:check_result
color 08
if defined BUILD_FAILED (
    echo.
    echo %CRED%  ========================================================================%RST%
    echo %CRED%  HAGLAZ  [FAIL]  LOKI INTERFERED  --  BUILD FAILED%RST%
    echo %GOLD%           The trickster has broken the forge.  See output above.%RST%
    echo %CDIM%           Temp files :  %WORK_DIR%%RST%
    echo %CRED%  ========================================================================%RST%
    goto :fail
)

rem -----------------------------------------------------------------------
rem  SUCCESS
rem -----------------------------------------------------------------------
echo.
echo %PGLW%  ========================================================================%RST%
echo %GBRT%                                                                          %RST%
echo %GBRT%    WUNJO  --  V A L H A L L A   A W A I T S                             %RST%
echo %GBRT%             BUILD SUCCEEDED  [%MODE_NAME%]  --  v%DETECTED_VER%                    %RST%
echo %GBRT%                                                                          %RST%
echo %GOLD%    FEHU   TIWAZ   ODINN   --  The EXE has been forged in Asgard          %RST%
echo %GOLD%    WUNJO  INGWAZ  DAGAZ  OTHALAN  --  Vegvisir points true               %RST%
echo %GBRT%                                                                          %RST%
echo %PGLW%  ========================================================================%RST%
echo.
if "%BUILD_MODE%"=="--onefile" (
    echo %CGRN%  SOWILO  Output :%RST%  %WHTB%%DIST_DIR%\RavenMinerHQ_%DETECTED_VER%.exe%RST%
    echo.
    echo %CDIM%  NAUDIZ  -- Cold start: 5 to 15 seconds on first launch.%RST%
    echo %CDIM%             Windows Defender may scan on the very first run.%RST%
)
if "%BUILD_MODE%"=="--onedir" (
    echo %CGRN%  SOWILO  Output :%RST%  %WHTB%%DIST_DIR%\RavenMinerHQ_%DETECTED_VER%\RavenMinerHQ_%DETECTED_VER%.exe%RST%
    echo.
    echo %CDIM%  NAUDIZ  -- Run the .exe from inside the RavenMinerHQ_%DETECTED_VER%\ folder.%RST%
    echo %CDIM%             Do NOT move the .exe out -- it needs its sibling files.%RST%
)
echo.
echo %GOLD%  KAUNAN  -- Place these config files next to the .exe:%RST%
echo %CDIM%             ravenminer_config.json   (auto-created on first run)%RST%
echo %CDIM%             ravenminer_alerts.json   (auto-created on first run)%RST%
echo.
echo %LPGL%  OTHALAN -- May your difficulty be low and your uptime eternal.%RST%
echo %GBRT%  RAIDHO  ANSUZ  WUNJO  EHWAZ  NAUDIZ  MANNAZ  ISAZ  NAUDIZ  EHWAZ  RAIDHO%RST%
echo %PGLW%  ========================================================================%RST%
echo.

set /p OPEN_DIST=%GOLD%  FEHU  -- Open the dist\ folder now? %PGLW%[%GBRT% Y %PGLW%/%GBRT% N %PGLW%]%GOLD%:  %RST%
if /i "!OPEN_DIST!"=="Y" start "" "%DIST_DIR%"
goto :end

:abandon
echo.
echo %PURP%  ========================================================================%RST%
echo %LPGL%  NAUDIZ  -- The ravens circle but do not land.%RST%
echo %PGLW%  ABANDONED  --  Forge left cold.  No files were changed.%RST%
echo %PURP%  ========================================================================%RST%
goto :end

:fail
echo.
pause
goto :end

:end
endlocal
pause
exit /b 0
