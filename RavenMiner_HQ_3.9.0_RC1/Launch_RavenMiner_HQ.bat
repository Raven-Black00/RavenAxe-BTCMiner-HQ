@echo off
mode con: cols=72 lines=36
title RavenMiner HQ 3.9.0 RC1 -- Son of Odin

:: ========== GOLD HEADER =================================================
color 0E
cls
echo.
echo   +------------------------------------------------------------------+
echo   |                                                                  |
echo   |        RRRR    A   V   V EEEE N   N M   M I N   N EEEE R  R     |
echo   |        R   R  A A  V   V E    NN  N MM MM I NN  N E    RR       |
echo   |        RRRR  AAAAA V   V EEE  N N N M M M I N N N EEE  RR      |
echo   |        R R   A   A  V V  E    N  NN M   M I N  NN E    R R     |
echo   |        R  RR A   A   V   EEEE N   N M   M I N   N EEEE R  R    |
echo   |                                                                  |
echo   |           H H  QQQ     v3.9.0 RC1  --  Son of Odin              |
echo   |           HHH Q   Q                                              |
echo   |           H H  QQQQ    Bitaxe Miner Dashboard                   |
echo   |                                                                  |
echo   +------------------------------------------------------------------+
echo.
:: ========== CYAN SUBTITLE ===============================================
color 0B
echo   [ * ] Huginn watches your hashrate.
echo   [ * ] Muninn remembers your blocks.
echo   [ * ] Odin guards your uptime.
echo.
:: ========== CHECK PYTHON ================================================
color 0F
echo   ---------------------------------------------------------------
echo   Checking Python...
echo   ---------------------------------------------------------------
python --version >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo.
    echo   [ERROR] Python not found!
    echo   Install Python 3.9+ from https://python.org
    echo   CHECK  Add Python to PATH  during install.
    echo.
    pause
    exit /b 1
)
color 0A
for /f "tokens=*" %%i in ('python --version') do echo   [OK] %%i
echo.
:: ========== INSTALL DEPENDENCIES ========================================
color 0D
echo   ---------------------------------------------------------------
echo   Checking dependencies...
echo   ---------------------------------------------------------------
color 0F
pip install -r requirements.txt --quiet --disable-pip-version-check
if %errorlevel% neq 0 (
    color 0C
    echo.
    echo   [ERROR] Dependency install failed.
    echo   Run manually:  pip install -r requirements.txt
    echo.
    pause
    exit /b 1
)
color 0A
echo   [OK] All dependencies satisfied.
echo.
:: ========== LAUNCH ======================================================
color 0E
echo   ---------------------------------------------------------------
echo   Calling upon the All-Father...
echo   Raising the mead-hall...
echo   ---------------------------------------------------------------
echo.
color 0F
python Ravenminer_HQ_3.9.0_RC1.py

if %errorlevel% neq 0 (
    color 0C
    echo.
    echo   [ERROR] RavenMiner HQ exited with an error. See above.
    echo.
    color 0F
    pause
)
