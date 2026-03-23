# ᚢ Changelog — RavenMiner HQ

---

## [v3.9.2] — 2026-03-23

### Fixed — Threading
- **`self.btc` race condition** — added `self._btc_lock` (`threading.Lock`).  
  All writes in `fetch_btc()` and reads in `update_display()` are now locked.  
  Eliminates the intermittent crash when the BTC-price thread updated  
  `self.btc` while the main thread was reading it.

### Fixed — Performance
- **`hr_history` list → `collections.deque(maxlen=200)`** — removed the  
  O(n) manual `pop(0)` + length-check that ran every display cycle.  
  The deque drops the oldest sample automatically at O(1).
- **Vegvisir PIL cache (`_VEGVISIR_PIL_CACHE`)** — the base64 decode and  
  `Image.open()` call previously ran on every canvas resize event.  
  Now the PIL image is decoded once at module level and `.copy()`-ed  
  on each render. Applies to both the main dashboard and Settings window.

### Fixed — Robustness
- **`(d.get("field") or 0)` pattern** — replaced all `d.get("field", 0)`  
  calls with `(d.get("field") or 0)` for 8 numeric API fields:  
  `hashRate`, `hashRate_1m`, `hashRate_10m`, `hashRate_1h`, `vrTemp`,  
  `power`, `currentA`, `voltage`, `fanspeed`, `wifiRSSI`, `uptimeSeconds`.  
  Guards against `None` values in partial API responses that previously  
  caused a silent `TypeError`.

### Fixed — HR Graph Refresh Rate
- **Stat label always showing 5.0 s** — `lbl_hr_refresh_stat` was set once  
  at widget-build time and never updated afterwards. Now synced in both  
  `_apply_hr_refresh()` and every `update_display()` cycle.
- **New interval had no visible effect** — `_apply_hr_refresh` set  
  `HR_REFRESH` but never reset `_last_hr_draw`, so the graph silently  
  waited out the full old interval before honouring the change.  
  Fix: `_last_hr_draw = 0` is now set on every valid entry.
- **Minimum rate lowered 1.0 s → 0.25 s** — the old `if val < 1.0` guard  
  silently rejected sub-second values. New minimum matches the base  
  poll interval (`REFRESH = 0.25 s`). Values are stored via `round(val, 2)`  
  to prevent floating-point drift.

### Fixed — Theme Persistence
- **Selected theme reset to Dark on every restart** — `_toggle_theme()`  
  now calls `save_config()` with `"theme": CURRENT_THEME` after every  
  switch. On startup, `__init__` reads `load_config().get("theme", "dark")`  
  and auto-applies Light mode via `root.after(200, self._toggle_theme)`  
  if `"light"` was saved.

---

## [v3.9.1] — 2026-03-22

- Discord alert system (webhook, per-event toggles, embed formatting)
- Dual-refresh architecture: fast API poll (0.25 s) + slower HR graph draw
- LIVE / OFFLINE pulse label with animated colour
- Gold pulse on POOL and UPTIME labels while connected
- HR graph refresh rate field in bottom bar
- VR temperature gauge added to left panel
- `ravenminer_alerts.json` config file for alert settings
- `--windowed` PyInstaller build flag (no console window)
- Runes title bar `ᚱᚨᚠᛖᚾᛗᛖᚾᛖᚱ ᚺᛟᛃ`

---

## [v3.9.0 RC3] — 2026-03-20

- Initial public release candidate
- Tkinter three-column layout (Temps | Hashrate | Pool/Power)
- Vegvisir watermark, Valknut block-found flash
- System tray (pystray) with restore / quit
- Settings window: IP, refresh rate, Discord alerts
- Light / Dark theme toggle
- BTC price via CoinGecko (no API key)
