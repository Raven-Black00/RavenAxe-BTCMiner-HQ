# Ravenminer_HQ — Changelog

---

## [3.8.1] — 2026-03-21
### Fixed
- `NameError: _math.sin not defined` in `_draw_bars` — corrected to `math.sin`

### Changed
- Project renamed: `RavenMinerHQ` → `Ravenminer_HQ_3.8.1`
- ASIC gauge zones: green 0–55 °C, orange 55–70 °C, red > 70 °C
- VR gauge zones: green 0–50 °C, orange 50–65 °C, red > 65 °C
- Gauge radius reduced (54 px) for better label clearance
- Gauge centre shifted down (cy = 92) for top headroom
- Arc thickness increased to 16 px (thicker colour band)
- Temperature tick labels every 10 °C (was every 20 °C)
- Label font reduced to size 7 to fit all 13 tick values
- Needle shortened to clear thicker arc

---

## [3.8.0] — 2026-03-19
### Added
- `Son Of Odin  ᛋᛟᚾ ᛟᚠ ᛟᛞᛁᚾ` centred header (GOLD_BRIGHT, Segoe UI 20)
- `sonofodin@outlook.com` subtitle in soft gold Courier

### Changed
- Default refresh rate 3 s → 0.5 s
- Hashrate bar width reduced 50 % (`bw = slot//2`)
- Live hashrate always 4 digits: `f"{hr:.3f}"`
- 1 m / 10 m / 1 h AVG label headers in GOLD
- AVG boxes fully transparent (no frames)
- Pool/Uptime row: bare text, no background frames
- Gauge redesign: 0–120 °C scale, height = 210

---

## [3.7.5] — 2026-03-19
### Added
- VR Overheat Discord alert (orange embed, 0xff6600)
- `alert_vr_temp_threshold` in config (default 85.0 °C)
- `_alerted_vr_temp` state flag

---

## [3.7.0] — 2026-03-19
### Added
- Full Discord webhook alert system
- ASIC Overheat, Low Hashrate, Block Found, Rejected Shares, Miner Offline alerts
- Settings Discord section: URL, thresholds, checkboxes, TEST WEBHOOK button
- Alert state auto-resets on recovery (no spam)
- `ravenminer_alerts.json` for persistent alert config

### Fixed
- Alert functions moved to module scope (line 59) — was causing `NameError`

---

## [3.6.0] — 2026-03-18
### Added
- Vegvisir watermark, Valknut block-found flash, gold pulse effect
- Pool/Uptime row, hashrate bar chart, BTC price display
- WiFi RSSI, system tray, settings panel with full miner config
- Reboot slider, auto/manual fan, display settings

---

## [3.0.0] — Initial Release
- Three-column Norse dashboard
- ASIC & VR temperature gauges
- Live / 1 m / 10 m / 1 h hashrate averages
- Shares accepted/rejected, fan, voltage, frequency
- Dark purple/gold/cyan colour palette
