# RavenMiner HQ v5.5.1 — GEBO — Patch Log

All patches applied to `RavenminerHQ549.py` (base) to produce `RavenminerHQ551.py`.

---

## PATCH 1 — Winsound Import Guard

**Location:** After `from datetime import timedelta`

```python
try:
    import winsound
    WINSOUND_OK = True
except ImportError:
    WINSOUND_OK = False
    # winsound is Windows stdlib — no install needed
```

**Why:** Safe import — on Linux/macOS the import fails. `WINSOUND_OK` flag disables playback gracefully.

---

## PATCH 2 — Embedded WAV Constant + `playstartupsound()` Function

**Location:** After `VERSION = f"v{_APP_VER}"`

```python
STARTUP_WAV_B64 = (
    "...base64 encoded PCM WAV (44100 Hz, mono, 16-bit)..."
)

def playstartupsound():
    """Play embedded PCM WAV Viking war-horn.
    Blocking call inside daemon thread.
    SND_MEMORY only (no SND_ASYNC) — keeps wav_bytes alive.
    Silent no-op on non-Windows via WINSOUND_OK guard.
    """
    def _play():
        try:
            if not WINSOUND_OK or not sys.platform.startswith("win"):
                return
            wav_bytes = base64.b64decode(STARTUP_WAV_B64)
            winsound.PlaySound(wav_bytes, winsound.SND_MEMORY)
        except Exception as e:
            print("Startup sound error:", e)
    import threading as _th
    _th.Thread(target=_play, daemon=True).start()
```

**SND_ASYNC silence bug fix:**  
`SND_MEMORY | SND_ASYNC` = Windows returns immediately → GC frees `wav_bytes` → silence.  
Fix: `SND_MEMORY` only, blocking inside daemon thread = buffer stays alive for full playback.

---

## PATCH 3 — Version Bump

**Location:** `_APP_VER` constant

```python
# Before
_APP_VER = "5.4.9"

# After
_APP_VER = "5.5.1"
```

---

## PATCH 4 — Startup Horn Call

**Location:** `if __name__ == "__main__":` block

```python
# Before
    root = tk.Tk()
    root.withdraw()

# After
    playstartupsound()  # Viking horn on startup
    root = tk.Tk()
    root.withdraw()
```

---

## PATCH 5 — Block-Found Horn Call

**Location:** Block detection inside data polling method

```python
# Before
        if new_blocks>old_blocks and old_blocks>=0: self.root.after(0,self._trigger_block_flash)

# After
        if new_blocks>old_blocks and old_blocks>=0:
            self.root.after(0,self._trigger_block_flash)
            playstartupsound()  # Viking horn on every new block found
```

**Guard:** `old_blocks >= 0` prevents false trigger on first data load (init value is `-1`).

---

## PATCH 6 — FREQ. OC Gauge Range 0 → 900 MHz

**Location:** `_draw_gauge()` calls for `freq_gauge_canvas`

```python
# Before
self._draw_gauge(self.freq_gauge_canvas, 0, GREEN, lo=400, hi=1000, freq_mode=True)
self._draw_gauge(self.freq_gauge_canvas, _freq_val, GREEN, lo=400, hi=1000, freq_mode=True)

# After
self._draw_gauge(self.freq_gauge_canvas, 0, GREEN, lo=0, hi=900, freq_mode=True)
self._draw_gauge(self.freq_gauge_canvas, _freq_val, GREEN, lo=0, hi=900, freq_mode=True)
```

**Colour bands updated:**

| Zone | Before | After |
|------|--------|-------|
| 🟢 Green | 0 – 750 MHz | 0 – 700 MHz |
| 🟠 Orange | 750 – 800 MHz | 700 – 850 MHz |
| 🔴 Red | 800+ MHz | 850 – 900 MHz |

All colour thresholds updated in: arc bands, tick label colours, centre readout, `freqocpulse`, live `foccol`.

---

## PATCH 7 — Email Address Update

**Location:** `lbl_email` widget text + `<Button-1>` mailto binding

```python
# Before
self.lbl_email = tk.Label(_inner, text="sonofodin@outlook.com", ...)
self.lbl_email.bind("<Button-1>", lambda e: _wb.open_new_tab("mailto:sonofodin@outlook.com"))

# After
self.lbl_email = tk.Label(_inner, text="sonofgrimnir@outlook.com", ...)
self.lbl_email.bind("<Button-1>", lambda e: _wb.open_new_tab("mailto:sonofgrimnir@outlook.com"))
```

---


---

## PATCH 8 — Valknut Overbright Flash on Share

**Location:** `_init_valknut()`, `_trigger_valknut_flash()`, `_valknut_next_frame()`

```python
# _init_valknut() — added after normal valk_frames build:
self.valk_flash_frames = []
FLASH_STEPS = 10
from PIL import ImageEnhance as _IE
for _fi in range(FLASH_STEPS):
    _t     = _fi / max(FLASH_STEPS - 1, 1)
    _peak  = 0.45
    _boost = 1.0 + 0.85 * (1.0 - abs((_t - _peak) / max(_peak, 1 - _peak)))
    _frm   = base.copy()
    _frm   = _IE.Brightness(_frm).enhance(_boost)
    _frm   = _IE.Color(_frm).enhance(1.0 + 0.5 * (1.0 - abs((_t - _peak) / max(_peak, 1 - _peak))))
    self.valk_flash_frames.append(_frm)

# _trigger_valknut_flash() — added flag:
self._use_flash_seq = True   # v5.5.2: overbright sequence on share

# _valknut_next_frame() — routes by flag:
_seq = (self.valk_flash_frames
        if getattr(self, '_use_flash_seq', False)
           and getattr(self, 'valk_flash_frames', None)
        else self.valk_frames)
```

**Effect:** On share the Valknut drives through 10 PIL-enhanced overbright frames (peak ×1.85 brightness, +50% saturation) instead of the normal 16-frame dim-to-bright idle sequence. Normal idle state is completely unchanged.

---

## PATCH 9 — Ravens Full-Blaze on Share

**Location:** `_flash_ravens()`

```python
# Before
PEAK_BRIGHTNESS = 0.675  # halfway between rest(0.35) and full(1.0)
glow = int((brightness - 0.35) / (PEAK_BRIGHTNESS - 0.35) * 90)

# After
PEAK_BRIGHTNESS = 1.0    # v5.5.2: full blaze on share (was 0.675)
glow = int((brightness - 0.35) / (PEAK_BRIGHTNESS - 0.35) * 160)  # v5.5.2: brighter glow on share
```

**Effect:** Ravens blaze at true full pixel intensity during a share event (was capped at 67.5%). Gold glow headroom raised 78% — blazing gold-white is substantially more dramatic.

---

## PATCH 10 — Hashrate Graph Y-Axis Label Clipping Fix

**Location:** `_draw_bars()` — grid label loop

```python
# Before
gy = int(h - 2 - frac * (h - 4))

# After
gy = int((h - 8) - frac * (h - 16))  # v5.5.2: 8 px top/bottom margin
```

**Effect:** Top and bottom Y-axis scale labels (gold Courier 10 bold) were clipped by the canvas edge. 2 px was insufficient for the ~12 px tall font. 8 px margin on both ends — all labels fully visible.

---

## PATCH 11 — Hashrate Graph Bar Overlap Fix

**Location:** `_draw_bars()` — `sub_w` calculation

```python
# Before
sub_w = max(1.0, (w - 72) / max(1, n * 8))  # hardcoded 72 didn't match scale_w=50

# After
sub_w = max(1.0, (w - 100) / max(1, n * 8))  # v5.5.2: 100 = 2 × scale_w(50)
```

**Effect:** Bar columns were bleeding 28 px into the right-side label column. `sub_w` now uses 100 px total horizontal margin (50 px each side, matching `scale_w`). Bars end flush at the label boundary.


## Summary

| # | Location | Effect |
|---|----------|--------|
| 1 | Imports | Safe `winsound` import, `WINSOUND_OK` flag |
| 2 | After VERSION | `STARTUP_WAV_B64` constant + `playstartupsound()` |
| 3 | `_APP_VER` | Version `5.4.9` → `5.5.1` |
| 4 | `__main__` | Horn fires on startup |
| 5 | Block detection | Horn fires on every new block found |
| 6 | `_draw_gauge` freq calls | Freq gauge range `400–1000` → `0–900 MHz` |
| 7 | `lbl_email` + mailto binding | Email updated to `sonofgrimnir@outlook.com` |
| 8 | `_init_valknut`, `_trigger_valknut_flash`, `_valknut_next_frame` | Valknut overbright 10-frame flash sequence on share |
| 9 | `_flash_ravens` | Ravens full-blaze on share — `PEAK_BRIGHTNESS` 0.675→1.0, glow 90→160 |
| 10 | `_draw_bars` grid loop | Y-axis label vertical margin 2 px → 8 px |
| 11 | `_draw_bars` `sub_w` | Bar width margin corrected 72 → 100 (= 2 × scale_w) |

All patches verified — Python syntax clean ✓

---

```
R A V E N M I N E R   H Q   v 5 . 5 . 1
May your difficulty be low. May your uptime be eternal.
The ravens watch. The Allfather approves.
```
