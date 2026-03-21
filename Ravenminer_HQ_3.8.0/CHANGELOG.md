# RavenMiner HQ — Changelog

---

## v3.8.0 — 2026-03-19
### Added
- "Son Of Odin  ᛋᛟᚾ ᛟᚠ ᛟᛞᛁᚾ" title centered across top header in GOLD_BRIGHT size-20 Segoe UI
- Email subtitle "sonofodin@outlook.com" beneath title in softer gold Courier font
- Both stacked in a centered frame using place(relx=0.5, rely=0.5)

### Changed
- Default refresh rate reduced from 3s to 0.5s (twice-per-second polling)
- Hashrate bar graph data point width reduced by 50% for cleaner separated columns
- Large live hashrate display now always shows 4 digits (f"{hr:.3f}" format)
- 1m / 10m / 1h AVG label headers changed to GOLD colour
- 1m / 10m / 1h AVG boxes now use Canvas with gray50 stipple for semi-transparent
  watermark bleed-through effect
- Pool and Uptime row stripped of background frames — bare text on COL_C only

---

## v3.7.5 — 2026-03-19
### Added
- VR Overheat Discord alert (orange embed, 0xff6600)
- alert_vr_temp_threshold field in load_alert_config defaults (85.0 deg C)
- _alerted_vr_temp state flag in RavenMinerDash.__init__
- VR Overheat Alert field in Settings Discord section
- _load_alert_fields and _save_alert_fields updated to include vr_temp key

---

## v3.7.0 — 2026-03-19
### Added
- Full Discord webhook alert system
- ASIC Overheat Alert
- Low Hashrate Alert
- Block Found Alert
- Rejected Shares Spike Alert (5+ per poll)
- Miner Offline Alert (3 consecutive failed polls)
- Discord Alerts section in Settings panel
- Webhook URL, threshold fields, toggle checkboxes, TEST WEBHOOK button
- Alert state auto-resets on recovery to prevent spam
- All settings persisted to ravenminer_alerts.json

### Fixed
- Alert functions now correctly placed at module scope (line 59)
  previously caused NameError: load_alert_config is not defined

---

## v3.6.0 — 2026-03-18
### Added
- Vegvisir watermark background on centre column
- Valknut animated flash on block found
- Gold pulse effect on live hashrate label
- Pool and Uptime row in centre panel
- Hashrate bar chart with animated segment rendering
- BTC price display (right panel)
- WiFi RSSI indicator
- System tray (pystray) minimize support
- Gear icon settings launcher with hover glow
- Miner IP field in Settings with instant SAVE & RECONNECT
- Auto-fan / manual fan speed toggle
- Flip / invert / auto screen-off display settings
- Reboot slider with 2-second hold confirmation

### Changed
- Rune title bar uses Elder Futhark glyphs
- Settings window uses scrollable canvas body

---

## v3.0.0 — Initial Release
- Three-column dashboard (Temps | Hashrate | Power)
- ASIC & VR temperature gauges
- Live / 1m / 10m / 1h hashrate averages
- Shares accepted / rejected counters
- Core voltage, frequency, fan speed, fan RPM
- Auto-refresh polling loop (configurable interval)
- Dark Norse-themed UI (purple / gold / cyan palette)
