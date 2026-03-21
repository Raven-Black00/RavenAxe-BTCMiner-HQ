# RavenMiner HQ 3.9.0 RC1 -- Installation & Usage Guide

---

## 1. System Requirements

- Windows 10 / 11  (primary target)
- Python 3.9 or newer  (https://python.org)
  >> During install: CHECK "Add Python to PATH"
- Network access to your Bitaxe miner (same LAN)

---

## 2. Install Python Dependencies

Open a terminal / PowerShell in the project folder and run:

    pip install -r requirements.txt

This installs:
  - requests  -- HTTP calls to the miner API and CoinGecko
  - Pillow    -- Renders the embedded Vegvisir and Valknut artwork
  - pystray   -- System-tray icon when minimised (optional but recommended)

---

## 3. Running the Dashboard

### Option A -- Double-click launcher (easiest)
  Double-click:  Launch_RavenMiner_HQ.bat
  The launcher will check Python, install dependencies, and start the app.

### Option B -- Command line
  python Ravenminer_HQ_3.9.0_RC1.py

### Option C -- Compiled EXE (no Python needed after build)
  Run build_exe.bat  OR  run manually:
    pip install pyinstaller
    pyinstaller --onefile --windowed --name RavenMiner_HQ_3.9.0_RC1 Ravenminer_HQ_3.9.0_RC1.py
  Find the output in the dist\ folder.

---

## 4. First-Run Setup

On first launch a setup dialog appears asking for your miner IP address.
  Default: 192.168.68.100
  Change it to match your network.

Your IP is saved to ravenminer_config.json in the same folder as the .exe / .py.

---

## 5. Settings Window

Open Settings from the main window (gear icon or menu).
The window is split into two columns:

  LEFT COLUMN                    RIGHT COLUMN
  ───────────────────────────    ───────────────────────────────────
  Miner Connection (IP)          Thermal & Fan (target temp, fan)
  Mining (voltage, frequency)    Display (flip/invert/auto-off)
  Main Pool (URL, port, user)    Discord Alerts (webhook + thresholds)
  Fallback Pool                  Load from Miner / Apply Settings
                                 Reboot slider

Click "LOAD FROM MINER" to auto-fill current miner values.
Click "APPLY SETTINGS"  to push changes to the miner (miner will reboot).

---

## 6. Discord Alerts

1. Create a Discord webhook in your server:
   Server Settings > Integrations > Webhooks > New Webhook > Copy URL

2. Paste the URL into the Discord Webhook URL field in Settings.

3. Configure thresholds:
   - ASIC Overheat Alert (C) -- fires when ASIC temp exceeds this value
   - VR Overheat Alert (C)   -- fires when VR temp exceeds this value
   - Low Hashrate (TH/s)     -- fires when hashrate drops below this value

4. Enable/disable Block Found and Miner Offline alerts via checkboxes.

5. Click TEST WEBHOOK to verify the connection before saving.

---

## 7. Temperature Gauge Colour Zones

  ASIC Gauge   Green < 55 C  |  Orange 55-69 C  |  Red 70+ C
  VR Gauge     Green < 50 C  |  Orange 50-64 C  |  Red 65+ C

Both the gauge arc, the tick numbers, and the temperature label
all use the same colour at all times.

---

## 8. Keyboard Shortcuts

  ESC      --  Quit the application
  Minimise --  Sends to system tray (if pystray is installed)
  Tray icon click  --  Restore the window

---

## 9. Configuration Files

  ravenminer_config.json  -- Stores miner IP address
  ravenminer_alerts.json  -- Stores Discord webhook and alert thresholds

Both are plain JSON and can be edited in any text editor.
They are created automatically on first run.

---

## 10. Troubleshooting

  "Python not found"
    >> Re-install Python and check "Add Python to PATH"

  "Connecting..." never updates
    >> Check miner IP in Settings
    >> Make sure miner is powered on and on the same network
    >> Try http://<miner_ip>/api/system/info in a browser

  Tray icon missing
    >> Run: pip install pystray
    >> Restart the app

  BTC price shows "--"
    >> CoinGecko API may be temporarily unavailable
    >> Price refreshes automatically every ~60 seconds

---

*RavenMiner HQ 3.9.0 RC1 -- Son of Odin -- github.com/Raven-Black00*
