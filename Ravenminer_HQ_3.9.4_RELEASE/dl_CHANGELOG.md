# ᚦ CHANGELOG — RavenMiner HQ

All notable changes are recorded here in the threads of the Norns.

---

## [v3.9.4] — 2026-03-27

### ✨ Improved
- **Hashrate graph scale labels** — Left and right numeric HR labels upgraded from
  dim `#7878aa` 7pt to **bright gold `#f0c040`** 10pt bold Courier.
  Values are now clearly readable against the dark graph background.
- **Graph horizontal grid lines** — Grid lines now drawn in **two passes**:
  - Pass 1 (before bars): solid `#1e1a3a`, `width=2` — darker/thicker baseline
  - Pass 2 (after bars): dashed `#2a2050`, `width=1`, `dash=(4,3)` — grid
    lines are redrawn on top of bar bodies so they remain **visible through
    the dark bar fill** at all times.
- **Removed faint dash pattern** from primary grid — replaced with solid lines
  that register cleanly on all monitor brightness levels.

### 🔧 Technical
- Grid redraw loop inserted at draw-order position: after bar rectangles,
  before smooth top-curve and glow pass. Correct tkinter Canvas z-order.
- VERSION constant bumped to `v3.9.4`.
- Build script updated: `RavenMiner_BUILD_3.9.4.bat`.

---

## [v3.9.3] — 2026-03 (previous release)

### ✨ Added
- **Discord webhook alert system** — per-title 60s cooldown, embedded messages
  with footer timestamp.
- **Alert config cache** — `_alert_cfg_global_cache` invalidated on save for
  zero-latency threshold changes.
- **Module-level alert config** — avoids repeated disk reads per poll cycle.
- **Rejection %** label added below `SHARES BAD` counter.
- **`lbllive`** LIVE/OFFLINE indicator moved to bottom bar stack.
- **Version label** in top-right and bottom-right links to GitHub on click
  with hover highlight.
- Source code viewer window with syntax highlighting and search.

### 🔧 Technical
- `draw_bars` smooth curve: dropped intermediate drop-lines for performance.
- `_disp_norms` lerp interpolation for smooth animated bar transitions.
- Shimmer wave: brighter `0.92` amplitude (was `0.85`).
- 3× bigger jitter ripple `0.12` on bar colour ramp.

---

## [v3.9.1] — prior

- Vegvisir watermark at 85% panel dimension.
- Raven flash animation on block-found event.
- `_DISCORD_COOLDOWN = 60` seconds between identical alert titles.

---

## [v3.9.0] — prior

- Initial public release with live hashrate, temperature gauges, power stats,
  BTC price, countdown bar, system tray, and settings window.

---

*ᚹᚢᚾᛃᛟ — The Norns weave the version threads.*
