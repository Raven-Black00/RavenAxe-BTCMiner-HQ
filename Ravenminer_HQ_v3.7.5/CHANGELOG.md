# RavenMiner HQ — Changelog

---

## v3.7.5 — 2026-03-19
### Added
- Discord webhook alert system (all alerts stored in `ravenminer_alerts.json`)
- **ASIC Overheat Alert** — fires when ASIC temp breaches configurable °C threshold
- **VR Overheat Alert** — fires when VR temp breaches configurable °C threshold (orange embed)
- **Low Hashrate Alert** — fires when live TH/s drops below configurable threshold
- **Block Found Alert** — fires on every new block discovered
- **Rejected Shares Spike Alert** — fires when 5+ shares rejected in a single poll
- **Miner Offline Alert** — fires after 3 consecutive failed API polls
- Discord alerts section in Settings panel with:
  - Webhook URL field
  - ASIC overheat threshold field
  - VR overheat threshold field
  - Low hashrate threshold field
  - Block Found toggle checkbox
  - Miner Offline toggle checkbox
  - Live TEST WEBHOOK button
- Alert state flags prevent repeated spam (auto-reset on recovery)
- All alert settings persist to `ravenminer_alerts.json` alongside the executable

---

## v3.7 — 2026-03-19
### Added
- Initial Discord webhook alert framework (ASIC temp, hashrate, block, offline)
- `load_alert_config` / `save_alert_config` / `send_discord_alert` module-level functions
- Alert state flags in `RavenMinerDash.__init__`
- Offline counter with 3-poll grace period before alerting

### Fixed
- Alert functions now defined at module scope (line 59) — previously injected at wrong location causing `NameError: name 'load_alert_config' is not defined`

---

## v3.6 — 2026-03-18
### Added
- Vegvisir watermark background on centre column
- Valknut animated flash on block found
- Gold pulse effect on live hashrate label
- Pool & Uptime row in centre panel
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

## v3.0 — Initial Release
- Three-column dashboard (Temps | Hashrate | Power)
- ASIC & VR temperature gauges
- Live / 1m / 10m / 1h hashrate averages
- Shares accepted / rejected counters
- Core voltage, frequency, fan speed, fan RPM
- Auto-refresh polling loop (configurable interval)
- Dark Norse-themed UI (purple / gold / cyan palette)
