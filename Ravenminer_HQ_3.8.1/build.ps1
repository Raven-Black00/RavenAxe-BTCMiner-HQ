# Ravenminer_HQ_3.8.1 -- Build Script
# Compatible with PowerShell 5.1+ (Windows 10/11 built-in)

Set-Location $PSScriptRoot
$ErrorActionPreference = "Continue"

try { $Host.UI.RawUI.WindowTitle = "Ravenminer_HQ_3.8.1 -- The Forge" } catch {}

# ── Layout ────────────────────────────────────────────────────────────────────
function Write-Rule {
    Write-Host ("  +" + ("=" * 68) + "+") -ForegroundColor DarkMagenta
}

function Write-Row {
    param([string]$Text = "", [string]$Color = "Yellow")
    $pad = 66 - $Text.Length
    if ($pad -lt 0) { $pad = 0 }
    Write-Host "  | " -ForegroundColor DarkMagenta -NoNewline
    Write-Host $Text -ForegroundColor $Color -NoNewline
    Write-Host ((" " * $pad) + "|") -ForegroundColor DarkMagenta
}

function Write-Banner {
    Clear-Host
    Write-Rule
    Write-Row "" "Yellow"
    Write-Row "   R A V E N M I N E R _ H Q _ 3 . 8 . 1" "Yellow"
    Write-Row "" "Yellow"
    Write-Row "   Son Of Odin  --  S O N O F O D I N" "DarkYellow"
    Write-Row "   sonofodin@outlook.com" "DarkYellow"
    Write-Row "" "Yellow"
    Write-Row "   Huginn and Muninn watch over this build" "Gray"
    Write-Row "" "Yellow"
    Write-Rule
    Write-Host ""
    Write-Host "  The forge awakens. Odin's ravens take flight..." -ForegroundColor Yellow
    Write-Host ""
}

function Write-Step {
    param([string]$Num, [string]$Rune, [string]$Msg)
    Write-Host "  [ " -ForegroundColor DarkMagenta -NoNewline
    Write-Host $Rune    -ForegroundColor Yellow      -NoNewline
    Write-Host " ]  Step $Num  " -ForegroundColor DarkMagenta -NoNewline
    Write-Host $Msg     -ForegroundColor DarkYellow
}

function Write-OK {
    param([string]$Msg)
    Write-Host "      OK  $Msg" -ForegroundColor Green
    Write-Host ""
}

function Write-Skip {
    param([string]$Msg)
    Write-Host "      --  $Msg" -ForegroundColor Cyan
    Write-Host ""
}

function Write-Fail {
    param([string]$Msg)
    Write-Host ""
    Write-Host ("  +" + ("=" * 68) + "+") -ForegroundColor Red
    Write-Host "  |  RAGNAROK -- THE FORGE HAS FAILED" -ForegroundColor Red -NoNewline
    Write-Host (" " * 31 + "|") -ForegroundColor Red
    $short = if ($Msg.Length -gt 64) { $Msg.Substring(0, 64) } else { $Msg }
    $pad   = 64 - $short.Length
    Write-Host "  |  $short$(' ' * $pad)  |" -ForegroundColor Red
    Write-Host ("  +" + ("=" * 68) + "+") -ForegroundColor Red
    Write-Host ""
    Read-Host "  Press Enter to exit"
    exit 1
}

# ─────────────────────────────────────────────────────────────────────────────
Write-Banner

# 1 -- Python
Write-Step "1/4" "Fehu" "Checking for Python..."
$pyver = python --version 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Fail "Python not found. Install Python 3.10+ and add it to PATH."
}
Write-OK "Python found: $pyver"

# 2 -- pip
Write-Step "2/4" "Uruz" "Summoning dependencies..."
python -m pip install -r requirements.txt --quiet
if ($LASTEXITCODE -ne 0) {
    Write-Fail "pip install failed. Check requirements.txt and your internet connection."
}
Write-OK "All dependencies installed."

# 3 -- Alert config
Write-Step "3/4" "Thurisaz" "Inscribing alert runes..."
if (-not (Test-Path "ravenminer_alerts.json")) {
    $cfg = [ordered]@{
        discord_webhook         = ""
        alert_temp_threshold    = 85.0
        alert_vr_temp_threshold = 85.0
        alert_hash_threshold    = 0.5
        alert_on_block          = $true
        alert_on_offline        = $true
    }
    $cfg | ConvertTo-Json | Set-Content -Encoding UTF8 "ravenminer_alerts.json"
    Write-OK "ravenminer_alerts.json created."
} else {
    Write-Skip "Ancient runes already present. Skipping."
}

# 4 -- Clean
Write-Step "4/4" "Othala" "Clearing the old battlefield..."
if (Test-Path "build") { Remove-Item -Recurse -Force "build" }
if (Test-Path "dist")  { Remove-Item -Recurse -Force "dist"  }
Get-ChildItem -Filter "*.spec" | Remove-Item -Force -ErrorAction SilentlyContinue
Write-OK "Old build artifacts removed."

# Forge
Write-Host "  Forging the EXE -- Gungnir strikes the anvil..." -ForegroundColor Yellow
Write-Host ""

pyinstaller `
    --onefile `
    --windowed `
    --name "Ravenminer_HQ_3.8.1" `
    --add-data "ravenminer_alerts.json;." `
    "src\Ravenminer_HQ_3.8.1.py"

if ($LASTEXITCODE -ne 0) {
    Write-Fail "PyInstaller failed. See the output above for details."
}

# Victory
Write-Host ""
Write-Rule
Write-Row "" "Yellow"
Write-Row "   SON OF ODIN  --  THE FORGE IS COMPLETE" "Yellow"
Write-Row "" "Yellow"
Write-Row "   Output:  dist\Ravenminer_HQ_3.8.1.exe" "Green"
Write-Row "" "Yellow"
Write-Row "   FELL FOR THE BLOCK" "DarkYellow"
Write-Row "" "Yellow"
Write-Rule
Write-Host ""
try { Start-Process explorer "dist" } catch {}
Read-Host "  Press Enter to exit"
