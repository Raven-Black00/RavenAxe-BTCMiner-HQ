@echo off
chcp 65001 >nul 2>&1
mode con: cols=74 lines=50
title  RavenMiner HQ -- EXE Forge
cls

for /f %%a in ('powershell -NoProfile -Command "[char]27"') do set "E=%%a"

echo.
echo %E%[38;5;220m  +=======================================================================+%E%[0m
echo %E%[38;5;220m  ^|        RavenMiner HQ  v3.9.0 RC1  --  EXE Forge                     ^|%E%[0m
echo %E%[38;5;220m  ^|        Son of Odin  --  PyInstaller Build Script                     ^|%E%[0m
echo %E%[38;5;99m  ^|  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ^|%E%[0m
echo %E%[38;5;214m  ^|   Forges Ravenminer_HQ_3.9.0_RC1.py into a standalone .exe          ^|%E%[0m
echo %E%[38;5;214m  ^|   No Python required to run the output .exe                          ^|%E%[0m
echo %E%[38;5;220m  +=======================================================================+%E%[0m
echo.
pause
echo.

:: STEP 1 -- CHECK PYTHON ------------------------------------------------
echo %E%[38;5;99m  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~%E%[0m
echo %E%[38;5;141m  [ STEP 1 / 4 ]  Checking Python...%E%[0m
echo %E%[38;5;99m  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~%E%[0m
echo.
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo %E%[38;5;196m  [ FAIL ]  Python not found!%E%[0m
    echo %E%[38;5;196m            Install Python 3.9+ from https://python.org%E%[0m
    echo %E%[38;5;196m            CHECK  Add Python to PATH  during install.%E%[0m
    echo.
    pause & exit /b 1
)
for /f "tokens=*" %%i in ('python --version') do echo %E%[38;5;82m  [  OK  ]  %%i%E%[0m
echo.

:: STEP 2 -- INSTALL REQUIREMENTS ----------------------------------------
echo %E%[38;5;99m  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~%E%[0m
echo %E%[38;5;141m  [ STEP 2 / 4 ]  Installing dependencies...%E%[0m
echo %E%[38;5;99m  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~%E%[0m
echo.
pip install -r requirements.txt --quiet --disable-pip-version-check
if %errorlevel% neq 0 (
    echo %E%[38;5;196m  [ FAIL ]  Dependency install failed.%E%[0m
    echo.
    pause & exit /b 1
)
echo %E%[38;5;82m  [  OK  ]  requests, Pillow, pystray ready.%E%[0m
echo.

:: STEP 3 -- INSTALL PYINSTALLER -----------------------------------------
echo %E%[38;5;99m  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~%E%[0m
echo %E%[38;5;141m  [ STEP 3 / 4 ]  Installing PyInstaller...%E%[0m
echo %E%[38;5;99m  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~%E%[0m
echo.
pip install pyinstaller --quiet --disable-pip-version-check
if %errorlevel% neq 0 (
    echo %E%[38;5;196m  [ FAIL ]  PyInstaller install failed.%E%[0m
    echo.
    pause & exit /b 1
)
echo %E%[38;5;82m  [  OK  ]  PyInstaller ready.%E%[0m
echo.

:: STEP 4 -- FORGE THE EXE (single line -- no continuation chars) --------
echo %E%[38;5;99m  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~%E%[0m
echo %E%[38;5;141m  [ STEP 4 / 4 ]  Forging the EXE -- please wait...%E%[0m
echo %E%[38;5;99m  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~  ~^|~%E%[0m
echo.
pyinstaller --onefile --windowed --name RavenMiner_HQ_3.9.0_RC1 --hidden-import PIL --hidden-import PIL._imagingtk --hidden-import PIL.ImageTk --hidden-import pystray --hidden-import requests --hidden-import tkinter --hidden-import tkinter.ttk Ravenminer_HQ_3.9.0_RC1.py

if %errorlevel% neq 0 (
    echo.
    echo %E%[38;5;196m  [ FAIL ]  Build failed. See output above.%E%[0m
    echo.
    pause & exit /b 1
)

:: SUCCESS ----------------------------------------------------------------
echo.
echo %E%[38;5;82m  +=======================================================================+%E%[0m
echo %E%[38;5;82m  ^|                                                                       ^|%E%[0m
echo %E%[38;5;82m  ^|   [ FORGED ]  RavenMiner_HQ_3.9.0_RC1.exe is ready!                ^|%E%[0m
echo %E%[38;5;82m  ^|   Location:   dist\RavenMiner_HQ_3.9.0_RC1.exe                      ^|%E%[0m
echo %E%[38;5;82m  ^|   Copy the .exe anywhere -- no Python required.                      ^|%E%[0m
echo %E%[38;5;220m  ^|   The All-Father smiles upon your forge.                             ^|%E%[0m
echo %E%[38;5;82m  +=======================================================================+%E%[0m
echo.
pause
