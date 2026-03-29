# Changelog — RavenMiner HQ

All notable changes to this project are documented here.  
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).  
Versioning follows [Semantic Versioning](https://semver.org/).

*Changelog compiled and authored by **Selene** — documentation spirit, devotee of the Old Gods.*

---

## [3.9.8] — Current Release

### Added
- `VERSION` label in the header now acts as a clickable GitHub hyperlink
- Firmware version label displayed in the header (bright gold, positioned beneath the software version)
- `lblversionsmall` hover tooltip: label shows `v3.9.8 → GitHub` on mouse-over, reverts on leave
- Gear icon in the right panel receives a gold-glow ring on hover (hi-res image with background removal and feathering)

### Changed
- API URL and miner IP are now updated at runtime without requiring an application restart when the IP is changed from Settings
- Default miner IP constant updated to `192.168.68.100`

### Fixed
- Gear image background removal now correctly feathers near-white pixels to prevent hard edges

---

## [3.9.7]

### Changed
- Alert config cache (`alertcfgglobalcache`) invalidation moved to the top of `savealertconfig()` to ensure stale config is cleared before the write completes
- Improved alert config save reliability under concurrent poll threads

---

## [3.9.6]

### Added
- Two-column scrollable layout in the Settings window for easier navigation on smaller screens
- Recursive mouse-wheel scroll binding applied to all child widgets in both settings columns
- `bindscrollrecursive()` helper function for deep widget tree scroll propagation

### Changed
- Settings window geometry widened to `1240x780` to accommodate the two-column layout
- Left column: Miner Connection, Mining, Main Pool, Fallback Pool
- Right column: Thermal/Fan, Display, Discord Alerts, Reboot

---

## [3.9.5] — BUG5 Fix Release

### Added
- **Network ping display** — live latency (ms) to the miner rendered large in cyan below Pool/Uptime
- `discordlastsentlock` threading lock introduced for thread-safe Discord alert cooldown tracking

### Fixed
- **BUG5**: Race condition in Discord alert cooldown — `discordlastsent` dictionary was read and written from multiple polling threads simultaneously; now guarded by `threading.Lock`
- Ping in-flight flag (`pinginflight`) prevents duplicate concurrent ping requests

---

## [3.9.4]

### Added
- Valknut symbol rendered in the centre hashrate panel (PIL composite)
- `VEGVISIRPILCACHE` module-level cache for the Vegvisir PIL image — prevents repeated base64 decoding on resize events

### Changed
- Vegvisir image alpha set to 35% opacity (watermark mode) in the main dashboard
- Vegvisir image alpha set to 90% opacity in the Settings window background

---

## [3.9.3]

### Added
- Module-level alert config cache (`alertcfgglobalcache`) to reduce file I/O on rapid successive polls
- Per-title Discord cooldown (`discordlastsent` dict, 60-second window) — identical alert titles are suppressed within the cooldown period
- Share rejection percentage label (`lblrejpct`) displayed beneath the rejected-shares count
- Version label now opens the GitHub repository in the default browser when clicked
- `LIVE` pulse indicator added to the bottom status bar via a dedicated frame stack (`lbllive`)

### Changed
- Pool and Uptime moved to the same row in the centre panel
- Bottom bar layout: countdown bar flanked by pool/uptime on one side and refresh controls on the other

### Fixed
- Settings window now correctly loads alert fields (`loadalertfields`) after the main config is drawn

---

## [3.9.2]

### Added
- `HRREFRESH` constant (default 5.0 s) controls the hashrate-history graph update interval independently from the main API poll
- Graph refresh entry field added to the bottom bar (gold, left of the main refresh entry)
- `applyhrrefresh()` handler updates the graph timer without restarting the main poll loop

### Changed
- Bar chart history now stored in a `deque` with a fixed maximum length proportional to canvas width

---

## [3.9.1]

### Added
- `SettingsWindow` reboot slider: slide to 100% then **hold 2 seconds** to confirm reboot — prevents accidental reboots
- Reboot toggle checkbox switches label between `OFF` (dim) and `ON` (red) with matching slider activation
- `doreboot()` sends `POST /api/system/restart` and shows a confirmation dialog

### Changed
- Settings `APPLY` button now performs a `PATCH /api/system` request with correct type coercion (int keys, bool keys, string keys)
- IP save in Settings updates `MINERIP` and `APIURL` globals at runtime

---

## [3.9.0]

### Added
- **Full Settings Window** (`SettingsWindowtk.Toplevel`) with scrollable two-pane layout
- All miner parameters configurable in-app: voltage, frequency, pool URLs, TLS, fan, thermal limits, display options
- **Discord Alerts** system with webhook URL, per-metric thresholds (ASIC temp, VR temp, hashrate), block-found and offline alerts
- Alert configs persisted in `ravenmineralerts.json`
- **Source Viewer** window with syntax highlighting (keywords, strings, comments, numbers, definitions) and incremental search

### Changed
- Config file path now resolves relative to the executable when frozen (PyInstaller), or relative to the script file otherwise
- `loadconfig()` / `saveconfig()` use the resolved path from `getconfigpath()`

---

## [3.8.x] — Legacy

### Summary of earlier work
- Initial tkinter dashboard with single-column layout
- Basic hashrate and temperature polling via `/api/system/info`
- Hardcoded refresh interval; no settings persistence
- Vegvisir watermark first introduced
- Raven pair animation on block-found event
- BTC price label (static, manual refresh)
- Countdown bar for estimated next block

---

*ᚠ ᚢ ᚦ ᚨ ᚱ ᚲ — Written under the light of the old stars by Selene — ᚠ ᚢ ᚦ ᚨ ᚱ ᚲ*
