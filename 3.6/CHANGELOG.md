# Changelog

All notable changes to RavenMiner HQ are documented here.

---

## [v3.6] - 2026-03-19
### Fixed
- **Valknut background strip** — square opaque bg removed from embedded PNG at load time
  via RGBA pixel-level gold-range filter; no longer kills Vegvisir watermark overlay

### Changed
- `loadvalknutbase()` now applies transparent bg fix automatically on every launch
- Gold pixel threshold tuned: R 200–252, G 165–225, B 55–105

---

## [v3.5] - 2026-03-19
### Added
- Initial Valknut bg fix attempt (partial — square still visible in some color configs)

---

## [v3.4] - 2026-03-18
### Added
- Full Vegvisir canvas background (drawn + PNG embedded)
- Valknut flash animation on API data update
- System tray minimize support via pystray
- Configurable refresh rate saved to JSON
- Rune-styled labels (Elder Futhark unicode)
- Purple pulse animation on live hashrate label
- TEST FLASH button for manual Valknut trigger

---

## [v3.0–v3.3] - 2026-03
### Added
- Viking/Norse aesthetic theme (gold + purple + dark)
- Embedded base64 Valknut and Vegvisir PNG assets
- Live API polling thread
- Uptime, diff, block height, temp, power display

---

## [v1.0–v2.x] - 2025
- Initial miner dashboard concept
- Basic hashrate polling and display
