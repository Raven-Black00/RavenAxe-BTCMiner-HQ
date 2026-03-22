# ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚴ — CHANGELOG

---

## [3.9.0] — 2026-03-22  *(Current Release)*

### Bug Fixes
- **CRITICAL — Theme Toggle Crash (`NameError`)**
  `THEME_DARK`, `THEME_LIGHT`, and `CURRENT_THEME` were referenced in
  `_toggle_theme()` and `_apply_theme_to_widgets()` but never defined anywhere
  in the module. Clicking the ☾ DARK / ☀ LIGHT button raised an immediate
  `NameError` and crashed the application.
  → Injected all three global definitions after `BITCOIN_BLOCK_TIME`, using
    the existing colour constants so the dark theme matches the live palette
    exactly and a sensible light theme is available.

- **IMPORTANT — False Block Flash on Startup**
  `self.found_blocks` was initialised to `0`. The guard in `update_display`
  (`old_blocks >= 0`) was deliberately designed around a `-1` sentinel so
  the very first API response doesn't trigger a false block-found flash, alarm
  sound, and Discord alert when the miner already has found blocks logged.
  Initialising to `0` defeated the sentinel check entirely.
  → Changed `self.found_blocks = 0` to `self.found_blocks = -1`.

- **IMPORTANT — Hashrate History Buffer Too Small (`max_bars = 20`)**
  `max_bars` was set to `20`, limiting the hashrate history ring buffer to 20
  data-points. The bar-chart renderer requests `hr_history[-40:]` and the
  idle pulse animator also expects up to 40 smooth points; both were silently
  clipped to 20, producing an almost flat, low-resolution graph.
  → Changed `self.max_bars = 20` to `self.max_bars = 200`, providing a full
    rolling 200-point history (~100 seconds at 0.5 s refresh).

- **MINOR — `__import__('time').time()` Inside Hot Loop**
  `update_display()` called `__import__('time').time()` on every single screen
  refresh to timestamp the last data arrival. `time` is already imported at
  module level; the dynamic import was unnecessary overhead called hundreds of
  times per minute.
  → Replaced with the direct `time.time()` call.

- **MINOR — Dead `import math as _math` Inside `_draw_bars()`**
  `_draw_bars()` performed a redundant local `import math as _math` but then
  exclusively used the module-level `math` name (`math.sin(…)`). The alias
  `_math` was never referenced anywhere.
  → Removed the dead local import; added a clarifying comment.

- **MINOR — No-op Arithmetic in `seg_color()` Blue Channel**
  The blue channel formula inside the bar-segment colour helper was:
  `b = int(min(255, 255 + frac * (255 - 255)))`.
  `255 - 255 = 0`, so `frac * 0 = 0`, making the entire expression identically
  `255` for every segment on every frame. Python still evaluated the full
  expression on every rectangle draw call.
  → Simplified to `b = 255` with an explanatory inline comment.

---

## [3.9.0-RC3] — 2026-03-20  *(Previous Release Candidate)*

### Added
- Discord webhook alert system (temp, VR temp, hashrate, block found,
  offline detection, rejected-share spike)
- Dual-gauge display (ASIC temp + VR temp) with animated arc needles
- Vegvisir full-background watermark rendered dynamically on startup
- Valknut animated flash on new share accepted
- Full-screen gold block-flash with multi-tone alert sounds (Windows / macOS / Linux)
- Idle pulse-wave animation on hashrate bars when miner data is stale > 3 s
- Smooth 16-sub-sample bar interpolation with Hermite easing
- Theme toggle (Dark / Light) — header button ☾ DARK / ☀ LIGHT
- Miner IP setup dialog on first run (no config file)
- In-app Settings window: mining params, fan, stratum, alert thresholds,
  reboot slider with 2 s hold confirmation
- System-tray minimise (pystray, optional)
- Configurable refresh rate (0.5 s minimum, adjustable via footer entry)
- BTC price ticker via CoinGecko (refreshes every ~60 s)
- Next-block countdown bar (10-minute Bitcoin block cycle)

### Known Issues (resolved in 3.9.0)
- See Bug Fixes above.

---

## [3.8.x] and earlier
- Initial public dashboard releases.
- Single-gauge temperature display.
- Basic hashrate label only (no history graph).
- No Discord alerts.
- No theme support.
