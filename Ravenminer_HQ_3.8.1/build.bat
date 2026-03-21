@echo off
chcp 65001 >nul 2>&1
title Ravenminer_HQ_3.8.1 -- The Forge
mode con: cols=76 lines=50

:: Check PowerShell is available
where powershell >nul 2>&1
if errorlevel 1 (
    echo [ERROR] PowerShell not found.
    pause
    exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0build.ps1"
