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

All patches verified — Python syntax clean

---

```
R A V E N M I N E R   H Q   v 5 . 5 . 1
May your difficulty be low. May your uptime be eternal.
The ravens watch. The Allfather approves.
```
