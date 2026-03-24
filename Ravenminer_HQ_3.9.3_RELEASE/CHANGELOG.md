# ᚦ CHANGELOG — RavenMiner HQ ᚦ
> *The Norns weave the record of all changes past and present.*

---

## [v3.9.3] — 2026-03-24  ⚡ The Allfather's Forge

### 🐛 Bug Fixes
- **Discord alert flooding** — Added 60-second per-title cooldown (`_DISCORD_COOLDOWN`). Rapid error conditions no longer spawn unbounded alert threads
- **Disk I/O per tick** — `load_alert_config()` now cached at module level (`_alert_cfg_global_cache`). Eliminates 4×/sec file reads during normal operation
- **SyntaxError in `update_display()`** — `global _alert_cfg_global_cache` declaration moved to top of function, resolving Python scoping error
- **Uninitialised attributes** — `_is_online`, `_live_alpha`, `_live_dir`, `_gold_pulse_id` now explicitly initialised in `__init__()` — removes `getattr` fallback races
- **Bare `except:` clauses (×14)** — All changed to `except Exception:` — no longer silently swallows `KeyboardInterrupt` / `SystemExit`
- **TclError on LIVE label** — `lbl_live` now created as a direct child of `_live_stack` in `build()` — removes Tkinter cross-frame re-parent error
- **Current label** had no colour — now properly colour-coded

### ✨ New Features
- **Source Code Viewer** — `</> CODE` button opens a full `Toplevel` window with syntax-highlighted, searchable source code (live match count, FIND/CLEAR, scrollbars)
- **Hi-res Settings Gear** — Replaced drawn polygon gear with embedded 3D rendered image; white background removed algorithmically with feathered edge blending
- **Golden glow ring on gear hover** — Triple-layer gold halo animates on mouse-over

### 🎨 UI Improvements
- **`◉ LIVE` indicator** moved from centre column to bottom status bar, stacked above `TEST FLASH` button
- **Hashrate value** pulse changed to deep electric blue → blazing cyan-white (faster: 35ms/22-step)
- **Shares row** — Values enlarged to `Courier 22 bold`; labels brightened to `GOLD_BRIGHT 12 bold`
- **Rejection %** label added below SHARES BAD count (colour-coded: green / orange / red)
- **Power colour thresholds** — Green 0–119W · Orange 120–129W · Red 130W+
- **Input Current colour** — Green 0–9.9A · Orange 10–11.9A · Red 12A+
- **Voltage colour** — Red <12V · Orange 11.99–12V · Green 12–12.8V · Orange 12.8–13.1V · Red 13.1V+
- **Hashrate graph** — Bars below 6.4 TH/s render in red spectrum instead of purple-blue

---

## [v3.9.2] — Previous Release

- Vegvisir & Valknut animated watermark backgrounds
- Gold raven pair flanking the Vegvisir
- Discord webhook alert system (temp / hashrate / block / offline)
- System tray support (pystray)
- Block found flash animation with Norse rune overlay
- BTC price ticker (CoinGecko API)
- Light/Dark theme toggle
- Gear canvas settings button
- HR graph with 40×16 sub-bar animation
- Countdown bar to next estimated Bitcoin block
- Pool uptime gold pulse
- Settings window with miner IP, thermal/fan/frequency tuning, Discord alerts
- Reboot slider guard
