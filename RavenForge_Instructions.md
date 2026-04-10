# RavenForge — The Viking Forge GUI

RavenForge is the animated GUI build assistant for RavenMiner HQ. It wraps PyInstaller in a Viking-themed interface complete with animated Vegvisir compass, rune particles, and gold pulsing title.

---

## Starting RavenForge

**Option A — Pre-built .exe (Windows)**

Double-click `RavenForge.exe` in the repo root. No Python needed.

**Option B — From source**

```bash
pip install -r requirements.txt
python RavenForge.py
```

---

## Build Steps

1. **Select Script** — Browse to `RavenminerHQ551.py`
2. **Select Icon** (optional) — Browse to a `.ico` file
3. **Set Output Name** — Default: `RavenminerHQ551`
4. **Click FORGE** — Vegvisir spins, rune particles fly, build log scrolls
5. **Collect .exe** — Find it in `dist/RavenminerHQ551.exe`

---

## Build Flags Used

| Flag | Effect |
|------|--------|
| `--onefile` | Single `.exe` (no `_internal/` folder) |
| `--windowed` | No console window on launch |
| `--icon` | Custom icon (if provided) |
| `--name` | Output executable name |

---

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| RavenForge.exe blocked by Defender | Allow once — false positive |
| PyInstaller not found | `pip install pyinstaller` |
| Build fails with missing module | `pip install <module>` then retry |
| Icon not applied | Must be `.ico` format, not `.png` |
| .exe crashes on launch | Run from terminal to see traceback |

---

## Notes

- The forge bundles `RavenminerHQ551.py` and all dependencies into one file
- The embedded Viking war-horn WAV travels inside the `.exe` — no separate audio file needed
- First run after build may trigger Windows Defender — this is normal for PyInstaller builds
- Build time: approximately 60–120 seconds depending on PC speed

---

```
R A V E N F O R G E
May the forge fires burn hot. May the runes hold true.
```
