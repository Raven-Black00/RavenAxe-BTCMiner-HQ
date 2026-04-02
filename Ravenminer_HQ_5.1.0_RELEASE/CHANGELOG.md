# ᚲᚺᚨᚾᚷᛖᛚᛟᚷ — RAVENMINER HQ

ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ ᚺ ᚾ ᛁ ᛃ ᛇ ᛈ ᛉ ᛊ ᛏ ᛒ ᛖ ᛗ ᛚ ᛜ ᛞ ᛟ

> *Every rune carved here is a wound healed in the codeforge.*
> *HUGINN remembered the bug. MUNINN remembered the fix.*
> *ODIN merged them both.*

---

## [4.0.0] — ᛞ DAGAZ · Dawn of the New Forge

> *The sun rose over Yggdrasil. The old serpent shed its skin.*

### ✦ Added

- **ᛗ MANNAZ — Clickable Email in Header**
  The `sonofodin@outlook.com` label in the title bar is now a living rune —
  `cursor="hand2"`, click opens `mailto:sonofodin@outlook.com` directly in your
  default mail client. Hovering lights it white; releasing the cursor returns it
  to blazing gold.

- **ᛜ INGWAZ — Difficulty Milestone Discord Alerts**
  A new Discord webhook fires on every **50M difficulty milestone** crossed
  during a session (50M, 100M, 150M, …). Each crossing is announced once —
  Odin does not repeat himself.

- **ᛞ DAGAZ — Session Milestone Reset**
  `lastmilestonenotified` now resets to `0` when a new session is detected
  (`bestDiff < lastBestDiff × 0.5`). The ravens begin counting anew when the
  world tree is replanted.

### ✦ Changed

- **ᚱ RAIDHO — `webbrowser` Import Moved Earlier**
  `import webbrowser as wb` is now hoisted to the top of `build()` to support
  the new email hyperlink — no longer conjured late in the version-label block.

### ✦ Fixed

- **ᚲ KENAZ — Version Label GitHub Link Preserved**
  The version label's GitHub click-through and hover effects remain intact
  after the `webbrowser` import restructure.

---

## [3.9.9] — ᛟ OTHALA · The Ancestral Hall Fortified

> *The foundations were deepened. The longhouse will not shake.*

### ✦ Added

- **ᚾ NAUTHIZ — Discord Webhook on New Best Difficulty ≥ 50M**
  When `bestSessionDiff` surpasses 50 million AND exceeds the previous session
  best, a gold `⚡ NEW BEST DIFFICULTY` webhook fires to Discord.

- **ᛏ TIWAZ — TCP-Connect Ping with Adjustable Rolling Average**
  `doping()` now maintains a rolling history of `(timestamp, ms)` pairs pruned
  to a user-adjustable window (`PINGAVGWINDOW`, default 5 s).
  Average is colour-coded: GREEN < 50 ms · ORANGE < 120 ms · RED ≥ 120 ms.

### ✦ Fixed

- **ᛊ SOWILO — Thread-Safe Ping Capture Before Exit**
  Ping text and colour are captured into local variables (`t2, f2`) before the
  thread exits, then dispatched to the UI via `root.after(0, ...)` — eliminating
  a race between thread teardown and widget update.

---

## [3.9.8] — ᛒ BERKANO · The Branch Reaches Further

> *New growth appeared on the world tree. The pool user was finally seen.*

### ✦ Added

- **ᚷ GEBO — Pool User Display on Ping Row**
  `stratumUser` is now shown in bright gold (`#f0c040`) on the far-right of the
  ping row — the miner's name is no longer hidden in the shadows.

### ✦ Fixed

- **ᚹ WUNJO — Firmware Label Placement Stabilised**
  Firmware version label (`Firmware --`) is now reliably anchored beneath the
  software version in the header, south-anchor, padding corrected.

---

## [3.9.7] — ᚺ HAGALAZ · Hail Fell, Was Endured

> *Disruptions came. The ravens noted them and returned unharmed.*

### ✦ Added

- **ᛁ ISA — NEW DIFFICULTY Tray Popup**
  A system tray notification `⚡ NEW DIFFICULTY` fires whenever `bestSessionDiff`
  climbs above 50 million and beats the previous session high.

### ✦ Fixed

- **ᚠ FEHU — Thread Exit Value Capture**
  Ping result text and foreground colour are now captured before `doping()`
  thread exits, preventing a stale-reference crash on rapid reconnects.

---

## [3.9.6] — ᛃ JERA · The Harvest Corrected

> *What was sown wrong was reaped wrong. The field was re-ploughed.*

### ✦ Fixed

- **BUG1 FIX — HR Refresh Var Wrong Reference**
  `applyhrrefresh()` was reading `self.refreshvar` (main refresh) instead of
  `self.hrrefreshvar` (graph refresh). Floor also raised from `0.05` → `0.10`
  to match the minimum sleep used in the refresh loop.

---

## [3.9.5] — ᛜ INGWAZ · The Seed of Stability

> *Roots were buried deep. The serpent stopped thrashing.*

### ✦ Added

- **ᚾ NAUTHIZ — Network Ping Display**
  Large cyan ping readout (`--- ms`) appears below the Pool / Uptime row,
  driven by a non-blocking TCP connect to the miner on port 80.

- **ᚨ ANSUZ — Non-Blocking Ping Thread (`triggerping`)**
  `triggerping()` spawns a daemon thread for each poll cycle; `pinginflight`
  guard prevents thread pile-up on slow networks.

### ✦ Fixed

- **BUG3 FIX — Non-Numeric Alert Field Guard**
  `savealertfields()` now safely casts threshold values with `float(raw) or 0`,
  catching `ValueError` / `TypeError` instead of crashing on empty entries.

- **BUG1 FIX (partial) — Refresh Floor Raised to 0.10 s**
  Minimum allowed refresh interval raised from `0.05` to `0.10` seconds in
  `applyrefresh()` to match the actual `time.sleep()` lower bound.

- **FIX5 — Live Settings IP Fallback**
  Reboot command now reads `self.cfg.get("minerip", MINERIP)` if a settings
  panel config is available, falling back to the global `MINERIP`.

---

## [3.9.4] — ᛟ OTHALA · The Foundation Stone

> *The longhouse was raised from raw timber and rune-carved beams.*

### ✦ Added

- **ᚠ FEHU — Initial Release**
  Core architecture established: three-column layout (Temperatures · Hashrate ·
  Power Hardware), animated hashrate bar graph, Vegvisir watermark, Huginn &
  Muninn raven pair, system tray daemon, Discord alert system.

- **ᚱ RAIDHO — GitHub Version Label Link**
  Clicking the version label in the header opens the GitHub repository in the
  default browser.

- **ᛊ SOWILO — BTC Price Display**
  Live BTC/USD price from CoinGecko API displayed in the right column,
  refreshed every 60 seconds independently of the miner poll interval.

- **ᚲ KENAZ — Rejection Percentage Display**
  Shares BAD panel now shows a `%` rejection rate beneath the raw rejected
  share count, colour-coded GREEN / ORANGE / RED by severity.

- **ᛏ TIWAZ — Cached Alert Config**
  `alertcfgglobalcache` eliminates repeated disk reads on every display tick —
  the rune-scroll is read once and held in memory.

---

ᚠᛖᚺᚢ ᛏᛁᚹᚨᛉ ᛟᛞᛁᚾᚾ
May your difficulty be low and your uptime eternal.
The ravens watch. The allfather approves.
R A V E N M I N E R H Q — ᚲᚺᚨᚾᚷᛖᛚᛟᚷ
ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ — ᛏ ᛒ ᛗ — ᛜ ᛞ ᛟ