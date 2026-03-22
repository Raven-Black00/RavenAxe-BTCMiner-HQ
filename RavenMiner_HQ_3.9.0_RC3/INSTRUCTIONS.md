# ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚴ — Setup & Usage Instructions

---

## 1 · Installation

### 1.1  Install Python
Download Python **3.9 or newer** from https://python.org  
During install on Windows, tick **"Add Python to PATH"**.

Verify in a terminal:
```
python --version
```

### 1.2  Install Dependencies

Open a Command Prompt / Terminal in the folder containing the `.py` file and run:

```
pip install requests Pillow pystray pyinstaller
```

| Package | Why it's needed |
|---|---|
| `requests` | Polls the miner REST API and sends Discord webhooks |
| `Pillow` | Renders the Vegvisir watermark and Valknut animation |
| `pystray` | System-tray icon (minimise-to-tray) — **optional** |
| `pyinstaller` | Build to .exe — **optional, build-time only** |

> **Linux:** install Tkinter separately: `sudo apt install python3-tk`  
> **macOS:** Tkinter is bundled with the python.org installer.

---

## 2 · First Run

```
python Ravenminer_HQ_3.9.0_fixed.py
```

On first launch the **Miner Setup Dialog** appears:

```
┌─────────────────────────────────────┐
│  ᚱᚨᚡᛖᚱᚷᛖᚱᛖᚱ ᚺᛟᛃ                  │
│  Enter Miner IP Address             │
│  ┌─────────────────────────────┐    │
│  │  192.168.68.100             │    │
│  └─────────────────────────────┘    │
│        [ ✔  CONNECT ]               │
└─────────────────────────────────────┘
```

1. Enter your miner's local IP (check your router's DHCP table if unsure).
2. Click **✔ CONNECT** or press **Enter**.
3. The IP is written to `ravenminer_config.json` next to the script.
   You will **not** be prompted again unless that file is deleted or  
   you change the IP inside Settings.

> **Tip:** Give your miner a static/reserved DHCP lease so the IP never changes.

---

## 3 · Main Dashboard

```
┌─────────────────────────────────────────────────────────────────┐
│  ᚱᚨᚡᛖᚱᚷᛖᚱᛖᚱ ᚺᛟᛃ                  ◉ LIVE   ☾ DARK   ⚙ Settings │
├────────────────────┬───────────────────────┬────────────────────┤
│  LEFT PANEL        │   CENTRE PANEL        │  RIGHT PANEL       │
│  • ASIC temp gauge │   Vegvisir watermark  │  • VR temp gauge   │
│  • ASIC °C label   │   Valknut animation   │  • VR °C label     │
│  • Overheat target │   Hashrate TH/s       │  • Power / Current │
│  • Fan speed / RPM │   History bar graph   │  • Voltage / Freq  │
│  • Shares Acc/Rej  │   Uptime / Pool       │  • Core Voltage    │
│  • Best session    │   Block count         │  • Wi-Fi RSSI      │
│  • BTC price       │   Bitcoin countdown   │                    │
├────────────────────┴───────────────────────┴────────────────────┤
│  Status bar: Updated HH:MM:SS | SSID | Blocks: N        ESC=quit│
└─────────────────────────────────────────────────────────────────┘
```

### Status Indicators

| Indicator | Meaning |
|---|---|
| ◉ **LIVE** (pulsing green) | Miner API responding normally |
| ◉ **OFFLINE** (solid red) | 1+ failed API polls |
| Gold pulsing POOL / UPTIME labels | Connected and data is fresh |

### Colour Coding
- 🟢 Green — value is in the safe zone
- 🟠 Orange — value approaching warning threshold
- 🔴 Red — value at or above critical threshold

---

## 4 · Settings Panel

Click **⚙ Settings** (top-right) to open the settings window.

### 4.1  Miner IP
Enter a new IP and click **Save IP** to switch miners on the fly.  
No restart needed — the next poll uses the new address.

### 4.2  Mining Parameters
Writable fields are sent to the miner via its REST API when you click **Apply**.

| Field | Description |
|---|---|
| Target Temp (°C) | PID controller set-point on the miner |
| Fan Speed (%) | Manual fan override |
| Frequency (MHz) | ASIC clock frequency |
| Core Voltage (mV) | ASIC core voltage |
| Stratum URL | Pool address (e.g. `public-pool.io:21496`) |
| Worker Name | Stratum worker identifier |

### 4.3  Discord Alerts

| Setting | Description |
|---|---|
| Webhook URL | Paste your Discord channel webhook URL |
| Temp Threshold (°C) | ASIC overheat alert trigger |
| VR Temp Threshold (°C) | VR overheat alert trigger |
| Hash Threshold (TH/s) | Alert when hashrate drops below this value |
| Alert on Block Found | Toggle Discord message on new block |
| Alert on Offline | Toggle Discord message when miner goes offline |

Click **Save Alerts** to persist.  
Click **Test Webhook** to send a test ping to Discord immediately.

### 4.4  Reboot Miner
Slide the slider to the right end and hold for **2 seconds** to reboot.  
Releasing early cancels the reboot — this prevents accidental restarts.

---

## 5 · Building a Standalone .exe  (Windows)

You do **not** need Python installed on the target machine once built.

1. Make sure `pyinstaller` is installed:
   ```
   pip install pyinstaller
   ```
2. Double-click **`build_ravenminer.bat`**
3. When prompted, type:
   - `1` → **ONEFILE** — single portable `.exe` (~15–25 MB)  
     Best for USB drives, sharing, or machines where you don't want a folder.
   - `2` → **ONEDIR** — folder with `.exe` + support files  
     Launches faster because it doesn't need to unpack to a temp folder first.

4. The build output lands in the `dist\` sub-folder.
5. Copy **`dist\RavenMinerHQ.exe`** (ONEFILE) or **`dist\RavenMinerHQ\`** (ONEDIR)
   to wherever you want to run it from.

> **Important:** `ravenminer_config.json` and `ravenminer_alerts.json` are
> saved next to the `.exe`, not inside it. Keep them together when moving  
> files around.

---

## 6 · Refresh Rate

The default refresh rate is **0.5 seconds**.  
To change it, find the **"Refresh (s)"** field at the bottom of the main window,  
type a new value (minimum `0.5`), and press **Enter**.

A faster rate gives smoother graphs but increases load on the miner's web server.

---

## 7 · Troubleshooting

### "Error: ..." in the status bar
The miner is unreachable. Check:
- Miner is powered on and connected to Wi-Fi
- IP address in `ravenminer_config.json` is correct
- No firewall blocking port 80 on your PC

### No gauges / bars on startup
The Vegvisir/Valknut images require **Pillow**. Verify with:
```
python -c "from PIL import Image; print('Pillow OK')"
```

### No system-tray icon
`pystray` is not installed or not supported on your platform.  
The app still runs normally — the window just doesn't minimise to tray.

### Discord alerts not arriving
- Check the webhook URL is correct (starts with `https://discord.com/api/webhooks/`)
- Use **Test Webhook** in Settings to confirm connectivity
- Ensure your Discord server hasn't deleted or regenerated the webhook

### High CPU on macOS / Linux
Tkinter's `after()` loop timing can be less precise on non-Windows platforms.  
Try increasing the refresh rate to `1.0` or `2.0` seconds.

---

## 8 · Uninstall

Delete the `.py` / `.exe` file (or the ONEDIR folder) and the two JSON  
config files. No registry entries, no AppData folders, no traces left behind.

---

*ᚠᛖᚱᛞ ᚠᚱᛟᛗ ᛏᚺᛖ ᚱᚨᚡᛖᚾᛊ.  — Feed from the ravens.*
