# ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚴ — CHANGELOG

---

## [3.9.1] — 2026-03-23  *(Current Release)*

### New Features
- **Dual refresh rates** — telemetry/gauges refresh at **0.25 s** (4×/sec);
  hashrate history graph redraws on its own independent **5 s** timer
  (both values configurable live from the bottom bar).
- **Hashrate Graph refresh entry** — gold `Graph (s)` entry box added to
  the bottom bar to the left of the main `Refresh (s)` box. Enter a value
  and press Enter; minimum 1.0 s enforced.
- **Version label under clock** — small bright-gold `v3.9.1` label sits
  directly below the live clock in the header, driven by the global
  `VERSION` constant (one edit = updates everywhere).
- **`VERSION` global constant** — single source of truth for version string.
  Used by the header mini-label, Discord webhook footers, and window title.

### Bug Fixes
- **Theme toggle crash (`NameError`)** — `THEME_DARK`, `THEME_LIGHT`, and
  `CURRENT_THEME` were referenced but never defined. Clicking ☾ DARK / ☀ LIGHT
  crashed instantly. Fixed by injecting all three globals after `BITCOIN_BLOCK_TIME`.
- **False block-flash on startup** — `self.found_blocks` initialised to `0`
  defeated the `-1` sentinel guard; miner found-blocks on first poll triggered
  a spurious flash, sound, and Discord alert. Fixed: `found_blocks = -1`.
- **History buffer too small** — `max_bars = 20` silently clipped the
  hashrate ring buffer, making the graph nearly flat. Fixed: `max_bars = 200`.
- **`__import__('time').time()` in hot loop** — redundant dynamic import
  called on every refresh tick. Replaced with `time.time()`.
- **Dead `import math as _math` in `_draw_bars`** — imported but never used
  (code used top-level `math`). Removed.
- **Dead arithmetic in `seg_color` blue channel** — `255 + frac * (255-255)`
  always evaluated to `255`. Simplified to literal `255` with comment.
- **Settings mouse-wheel scroll broken** — `<MouseWheel>` was bound only to
  the canvas widget; hovering over any child widget (Entry, Label, Button)
  absorbed the event. Fixed with `_bind_scroll_recursive()` that walks every
  descendant and binds `<MouseWheel>`, `<Button-4>`, `<Button-5>`.
- **`try:` block fused with inserted code** — previous HR-refresh injection
  landed mid-line inside a `try:` block, producing `SyntaxError`. Fixed by
  moving all new widgets to correct scope.

### UI Changes
- **Hashrate graph height capped** — `height=110` added to `bar_canvas`
  creation; graph no longer expands to cover the pool/uptime labels below it.
- **"BM1370 / firmware / ESC to quit" line moved to bottom-right** —
  removed from the purple header; now sits as `lbl_version` on the
  right side of the dark bottom status bar.
- **Status bar layout split** — `lbl_status` (Updated / SSID / Blocks)
  anchored left with `fill="x"` expand; `lbl_version` (model / ESC to quit)
  anchored right.

---

## [3.9.0-RC3] — 2026-03-20

### Added
- Discord webhook alert system (overheat, VR temp, hashrate, block, offline,
  rejected-share spike)
- Dual-gauge animated arc display (ASIC temp + VR temp)
- Vegvisir full-background watermark
- Valknut animated flash on new block found
- Full-screen gold block-flash with multi-tone alert sounds
- Idle pulse-wave animation on hashrate bars (stale data > 3 s)
- Smooth 16-sub-sample bar interpolation with Hermite easing
- Theme toggle (Dark / Light) — ☾ / ☀ header button
- Miner IP setup dialog on first run
- Settings window — miner params, fan, stratum, alert thresholds, safe reboot
- System-tray minimise (pystray, optional)
- BTC price ticker (CoinGecko, ~60 s refresh)
- Next-block countdown bar (10-min Bitcoin block cycle)

### Known Issues (resolved in 3.9.1)
- See Bug Fixes above.

---

## [3.8.x] and earlier
- Initial dashboard releases.
- Single-gauge temperature display.
- Basic hashrate label only (no history graph).
- No Discord alerts, no theme support.
