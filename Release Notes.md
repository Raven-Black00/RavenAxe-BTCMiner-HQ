# RAVENMINER HQ Release Notes — 5.5.1 GEBO — The Horn of Odin

**April 10, 2026**

The longhouse has always watched in silence.  
Now it speaks.

---

## What Is 5.5.1 GEBO?

**GEBO** — the gift rune. The exchange between warrior and god.  
This release gives the forge a voice: a Viking war-horn that rings on startup and again every time a block is found. The audio is not a file you can lose or forget to copy — it is embedded directly inside the script as a Base64-encoded PCM WAV. The horn is part of the forge now.

---

## What's New in 5.5.1

### Embedded Viking War-Horn (`STARTUP_WAV_B64`)

A PCM WAV of a Viking war-horn is encoded in Base64 and stored as a constant in the script. No `.mp3`, no `.wav` file beside the `.exe`. The sound ships with the code.

### Startup Horn

`playstartupsound()` is called at the top of `__main__` before the Tk window is created. It launches a daemon thread, decodes the WAV bytes, and calls `winsound.PlaySound()` with `SND_MEMORY`. The UI initialises in parallel — you hear the horn as the longhouse opens.

### Block-Found Horn

Every time `foundBlocks` increases by at least one (and the initial load guard `old_blocks >= 0` passes), the horn fires alongside the existing `_trigger_block_flash()` visual. Block found = flash + horn, simultaneously.

### Windows-Only, Fail-Silent

`winsound` is a Windows standard-library module. The import is wrapped in a `try/except`; `WINSOUND_OK` tracks availability. On Linux or macOS the function returns immediately and the app continues without error or log spam.

---

## The Fix: Why It Was Silent Before

The first build used `winsound.SND_MEMORY | winsound.SND_ASYNC`.  
`SND_ASYNC` tells Windows to return immediately and play in the background.  
Python's garbage collector then freed `wav_bytes` — the buffer Windows was still reading.  
Result: silence, or a truncated pop.

The fix: `SND_MEMORY` only. The call blocks inside the daemon thread until playback completes. The buffer stays alive. The horn rings true.

---

## Technical Summary

| Item | Detail |
|------|--------|
| Audio format | PCM WAV, 44100 Hz, mono, 16-bit |
| Delivery | Base64-encoded constant embedded in script |
| Playback | `winsound.PlaySound(wav_bytes, winsound.SND_MEMORY)` |
| Threading | Daemon thread — UI never blocks |
| Trigger 1 | `__main__` startup |
| Trigger 2 | `new_blocks > old_blocks and old_blocks >= 0` |
| Non-Windows | Silent no-op via `WINSOUND_OK` guard |

---

## File Renamed

| Old | New |
|-----|-----|
| `RavenminerHQ549.py` | `RavenminerHQ551.py` |

---

## Previous Release — 5.4.9 PERTHO — The Pulse Made Visible

**April 10, 2026**

A new `tk.Canvas` ECG-style waveform graph sits directly below the ping value and updates on every ping cycle. Three-pass glow rendering (haze / bloom / core), latency colour bands (cyan / orange / red), data-point dots every 3rd sample, filled area polygon for depth. Ping label now shows numeric value only — the waveform speaks for itself.

---

```
R A V E N M I N E R   H Q   v 5 . 5 . 1
May your difficulty be low. May your uptime be eternal.
The ravens watch. The Allfather approves.
```
