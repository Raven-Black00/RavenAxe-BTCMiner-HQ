@echo off
chcp 65001 >nul
color 0C

echo.
echo  ╔══════════════════════════════════════════════════════════════════════╗
echo  ║                                                                      ║
echo  ║   ᚱ ᚨ ᚡ ᛖ ᚾ ᛗ ᛁ ᚾ ᛖ ᚱ   ᚺ ᛟ ᛃ  —  BUILD FORGE                      ║
echo  ║   ᚠᛖᛟ ᛏᛁᚱ ᛟᛞᛁᚾᚾ  —  Version 3.9.0 RC2                              ║
echo  ║                                                                      ║
echo  ║   ᚦᚢᚱᛊ ᚺᚨᛗᛗᛖᚱ ᚠᚨᛚᛚᛊ — The hammer of Thor shall fall upon          ║
echo  ║   the forge of PyInstaller and a great .exe shall be born            ║
echo  ║                                                                      ║
echo  ╚══════════════════════════════════════════════════════════════════════╝
echo.

:: ── ᚱᚢᚾᛖ ᚲᚺᛖᚲᚲᛊ — Rune Checks ──────────────────────────────────────────────

echo  ᚠ  Checking Python installation...
python --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo  ✖  ERROR: Python not found in PATH.
    echo     Download from https://python.org and re-run this script.
    echo.
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('python --version 2^>^&1') do set PY_VER=%%i
echo  ✔  Found: %PY_VER%
echo.

:: ── ᛈᚤᛁᚾᛊᛏᚨᛚᛚᛖᚱ ᚲᚺᛖᚲᚲ — PyInstaller Check ───────────────────────────────

echo  ᚺ  Checking PyInstaller...
python -m PyInstaller --version >nul 2>&1
if errorlevel 1 (
    echo  ᛊ  PyInstaller not found. Summoning it from the void...
    echo.
    pip install pyinstaller
    if errorlevel 1 (
        echo.
        echo  ✖  ERROR: pip install pyinstaller failed.
        echo     Ensure pip is available and you have internet access.
        echo.
        pause
        exit /b 1
    )
    echo.
)
for /f "tokens=*" %%i in ('python -m PyInstaller --version 2^>^&1') do set PI_VER=%%i
echo  ✔  PyInstaller: %PI_VER%
echo.

:: ── ᛈᛁᛚᛚᛟᚹ ᚲᚺᛖᚲᚲ — Pillow Check ────────────────────────────────────────────

echo  ᛁ  Checking Pillow...
python -c "from PIL import Image" >nul 2>&1
if errorlevel 1 (
    echo  ᛊ  Pillow not found. Installing the sight of Odin...
    pip install Pillow
)
echo  ✔  Pillow ready
echo.

:: ── ᛈᚤᛊᛏᚱᚨᚤ ᚲᚺᛖᚲᚲ — pystray Check ──────────────────────────────────────────

echo  ᛏ  Checking pystray (tray icon)...
python -c "import pystray" >nul 2>&1
if errorlevel 1 (
    echo  ᛊ  pystray not found. Forging the tray rune...
    pip install pystray
)
echo  ✔  pystray ready
echo.

:: ── ᛊᛖᛏ ᛈᚨᛏᚺᛊ — Set Paths ────────────────────────────────────────────────────

:: Navigate to project root (one level up from build_tools)
cd /d "%~dp0.."

set SRC=src\Ravenminer_HQ_3.9.0_RC2.py
set OUT_NAME=RavenMinerHQ
set DIST_DIR=dist
set WORK_DIR=build_tools\_build_temp

echo  ᚷ  Source  : %SRC%
echo  ᚲ  Output  : %DIST_DIR%\%OUT_NAME%.exe
echo  ᚹ  Workdir : %WORK_DIR%
echo.

:: ── ᚡᛖᚱᛁᚠᚤ ᛊᛟᚢᚱᚲᛖ — Verify Source Exists ─────────────────────────────────

if not exist "%SRC%" (
    echo  ✖  ERROR: Source file not found:
    echo     %SRC%
    echo     Make sure you are running this from build_tools^\ inside the
    echo     RavenMiner_HQ_RC2^\ folder.
    echo.
    pause
    exit /b 1
)
echo  ✔  Source file confirmed
echo.

:: ── ᚠᛟᚱᚷᛖ ᛒᛖᚷᛁᚾᛊ — The Forge Begins ─────────────────────────────────────────

echo  ╔══════════════════════════════════════════════════════════════════════╗
echo  ║  ᚦ ᛟ ᚱ ᛊ  ᚺ ᚨ ᛗ ᛗ ᛖ ᚱ  ᚠ ᚨ ᛚ ᛚ ᛊ  —  BUILD STARTING              ║
echo  ╚══════════════════════════════════════════════════════════════════════╝
echo.

python -m PyInstaller ^
    --onefile ^
    --windowed ^
    --name "%OUT_NAME%" ^
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
    echo  ╔══════════════════════════════════════════════════════════════════╗
    echo  ║  ✖  ᚠᛖᚾᚱᛁᚱ — BUILD FAILED                                       ║
    echo  ║     Loki has interfered. Check the output above for errors.      ║
    echo  ║     ᚱᚢᚾᛖᛊ: PyInstaller output is in build_tools\_build_temp\    ║
    echo  ╚══════════════════════════════════════════════════════════════════╝
    echo.
    pause
    exit /b 1
)

:: ── ᚡᛁᚲᛏᛟᚱᚤ ᚱᚢᚾᛖᛊ — Victory Runes ──────────────────────────────────────────

echo.
echo  ╔══════════════════════════════════════════════════════════════════════╗
echo  ║                                                                      ║
echo  ║   ᚡ ᚨ ᛚ ᚺ ᚨ ᛚ ᛚ   !!   VALHALLA AWAITS   !!   ᚡ ᚨ ᛚ ᚺ ᚨ ᛚ ᛚ        ║
echo  ║                                                                      ║
echo  ║   ✔  BUILD SUCCEEDED                                                 ║
echo  ║                                                                      ║
echo  ║   ᛖᛉᛖ ᛚᛟᚲᚨᛏᛁᛟᚾ:                                                     ║
echo  ║   dist\RavenMinerHQ.exe                                              ║
echo  ║                                                                      ║
echo  ║   ᚱᛖᛗᛖᛗᛒᛖᚱ ᛏᛟ ᚲᛟᛈᚤ ᚲᛟᚾᚠᛁᚷ ᚠᛁᛚᛖᛊ ᚾᛖᛉᛏ ᛏᛟ ᛏᚺᛖ .exe:                 ║
echo  ║     ravenminer_config.json   (auto-created on first run)             ║
echo  ║     ravenminer_alerts.json   (auto-created on first run)             ║
echo  ║                                                                      ║
echo  ║   ᚠᛖᛟ ᛏᛁᚱ ᛟᛞᛁᚾᚾ — May Odin guide your hashes                        ║
echo  ║   ᚦᛖ ᚡᛖᚷᚡᛁᛊᛁᚱ ᛈᛟᛁᚾᛏᛊ ᛏᚱᚢᛖ                                            ║
echo  ║                                                                      ║
echo  ╚══════════════════════════════════════════════════════════════════════╝
echo.

:: ── ᛟᛈᛖᚾ ᛞᛁᛊᛏ — Open dist folder in Explorer ────────────────────────────────

start "" "%~dp0..\dist"

pause
exit /b 0
