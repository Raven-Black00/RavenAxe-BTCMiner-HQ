# RAVENMINER HQ Release Notes — 5.5.2 SOWILO — The Blaze Runs True

**April 11, 2026**

SOWILO — ᛋ — the sun rune. Victory. Life-force. Illumination without limit.

This release tears away the ceiling that was holding back the fire.

---

## What Is 5.5.2 SOWILO?

When a share is accepted, the longhouse should *know it*. The Valknut — knot of the chosen — should blaze. Huginn and Muninn should scream gold across the sky. Previously they glowed. Now they **burn**.

Three visual corrections shipped alongside the sacred fire:

---

## What's New

### Valknut Overbright Flash on Share
A dedicated 10-frame `valk_flash_frames` sequence is pre-rendered at startup using PIL `ImageEnhance`. The brightness curve peaks at **×1.85** (85% above normal) with a matching saturation spike — then eases back. This sequence fires **exclusively on a confirmed share event**, driven by the `_use_flash_seq` flag set in `_trigger_valknut_flash()`. The normal 16-frame idle fade-in is completely untouched.

### Ravens Full-Blaze on Share
`PEAK_BRIGHTNESS` in `_flash_ravens()` raised from **0.675 → 1.0** — ravens now reach true full pixel intensity (previously capped at 67.5%). Gold glow headroom raised **90 → 160** — the blazing gold-white channel math (red full, green ×0.78, blue ×0.30) now produces a dramatically brighter torch effect.

---

## What's Fixed

### GRAPH-01 — Y-Axis Labels No Longer Clipped
The top and bottom hashrate scale values were being cut off by the canvas edge. Root cause: only 2 px vertical margin — insufficient for Courier 10 bold (~12 px tall). Fixed: **8 px margin** on both top and bottom ends. Middle labels are unaffected.

### GRAPH-02 — Bars No Longer Overlap Right Labels
Bar columns were bleeding ~28 px into the right-side gold value column. Root cause: `sub_w` was calculated using a hardcoded `(w - 72)` that didn't match the actual `scale_w = 50` (50 px × 2 sides = 100 px). Fixed: `(w - 72)` → `(w - 100)`. Bars now end flush with the label boundary.

---

## Technical Summary

| Item | Detail |
|------|--------|
| Valknut flash frames | 10 PIL-enhanced overbright frames, peak brightness ×1.85 |
| Raven peak brightness | 0.675 → 1.0 (full blaze) |
| Raven glow headroom | 90 → 160 (+78%) |
| Y-axis label margin | 2 px → 8 px top & bottom |
| Bar width margin | 72 → 100 px (= 2 × scale_w) |
| Syntax verified | ✓ |

---

```
R A V E N M I N E R   H Q   v 5 . 5 . 2
May your difficulty be low. May your uptime be eternal.
The ravens watch. The Allfather approves.
```
