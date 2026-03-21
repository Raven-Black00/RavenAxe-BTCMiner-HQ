# Changelog -- RavenMiner HQ

> *"Huginn and Muninn fly each day over the wide world."*  -- Prose Edda

---

## [3.9.0 RC1] -- 2026-03-21  (Release Candidate 1)

### Visual
- All static descriptor/section labels changed from dim purple-grey to **Gold** for
  clarity and Norse aesthetic cohesion
- ASIC & VR temperature numbers now dynamically match their gauge arc colour
  (Green > Orange > Red) at every poll cycle
- Gauge tick numbers (0-120 C) now colour-zoned using each gauge's own
  warn/crit thresholds instead of hardcoded values
    ASIC:  Green < 55 C  |  Orange 55-69 C  |  Red 70+ C
    VR:    Green < 50 C  |  Orange 50-64 C  |  Red 65+ C

### Settings Window -- 2-Column Layout
- Redesigned from a single tall scroll column to a **side-by-side 2-column layout**
- Window resized from 660x1100 to 1240x780 -- much closer to square
- Window is now resizable
- Left column:  Miner Connection, Mining, Main Pool, Fallback Pool
- Right column: Thermal & Fan, Display, Discord Alerts, Load/Apply, Reboot slider
- Each column has its own independent scrollbar
- Section headers cleaned up (removed ASCII dash padding that caused encoding issues)

### Stability & Thread Safety
- Added threading.Lock (self._data_lock) to guard self.data against race
  conditions between the polling thread and the GUI update thread
- fetch_miner() now writes self.data inside the lock
- update_display() snapshots dict(self.data) inside the lock before rendering

### Performance
- CoinGecko BTC price fetch throttled from every REFRESH interval to every ~60s,
  preventing API rate-limit bans
- Initial BTC fetch fires immediately on startup
- Throttle interval auto-scales if the user changes the refresh rate

### Code Quality
- load_config() bare except narrowed to except (json.JSONDecodeError, OSError)
- _runes_pulse() bare except changed to except Exception

---

## [3.8.2] -- 2026-03-20  (Baseline)

- Initial public release
- Embedded Vegvisir & Valknut PNG assets (base64)
- Discord webhook alert system (temp, hash-drop, block-found, offline)
- Live BTC price display via CoinGecko
- Hashrate history bar chart (segmented, colour-graded)
- Next-block countdown bar (Bitcoin 10-min average)
- System-tray minimise support (pystray)
- Settings window: IP, Discord webhook, alert thresholds, reboot slider
- Norse runic title animations (Futhorc glyphs)
