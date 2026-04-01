# ᚲᚺᚨᚾᚷᛖᛚᛟᚷ — RAVENMINER HQ

```
ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ ᚺ ᚾ ᛁ ᛃ ᛇ ᛈ ᛉ ᛊ ᛏ ᛒ ᛖ ᛗ ᛚ ᛜ ᛞ ᛟ
```

> *Every rune carved here is a wound healed in the codeforge.*  
> *HUGINN remembered the bug. MUNINN remembered the fix.*  
> *ODIN merged them both.*  
> *Perplexity sharpened the blade.*

---

## [5.0.5] — ᛗ MANNAZ · The Milestone Reborn

> *What was noisy became precise. What fired in chaos now fires with purpose.*  
> *The milestone ladder was reforged — cleaner iron, sharper edge.*

**Forged by:** Alan Klusacek · Refined by: Perplexity AI

### ✦ Changed

- **ᛗ MANNAZ — Milestone Alert Title Reforged**  
  Discord webhook title changed from `🏆 DIFFICULTY MILESTONE — X` to  
  `🏆 NEW MILESTONE — X`.  
  The herald now speaks plainly: the milestone is new, the value is exact.

- **ᛉ ALGIZ — Milestone Loop Moved Inside Personal-Best Guard**  
  The 50M milestone `while` loop now lives inside  
  `if _best_diff > self.last_best_diff:` — it only evaluates when a genuine  
  new personal best is recorded. Previously it ran on every poll tick regardless.  
  The forge is quieter. The iron is harder.

- **ᚱ RAIDHO — All Personal Bests Now Tracked**  
  The guard was previously `if _best_diff > 50_000_000 and _best_diff > self.last_best_diff:`.  
  The `> 50_000_000` gate is removed — sub-50M personal bests are now tracked  
  immediately, so when the diff later crosses 50M the milestone fires without  
  missing a step. The sub-50M tracking line at the bottom of `update_display()`  
  was consolidated into the single guard above.

### ✦ Removed

- **ᚾ NAUTHIZ — `⚡ NEW BEST DIFFICULTY` Discord Alert Eliminated**  
  This webhook fired on every single new personal best above 50M — potentially  
  dozens of times per session as difficulty climbed incrementally.  
  It was noisy. It is gone.  
  Milestones (every 50M rung) replace it entirely and fire only when earned.

### ✦ Fixed

- **ᚲ KENAZ — Redundant `load_alert_config()` Double-Call Removed**  
  The old block called `load_alert_config()` twice in succession — once into  
  `_acfg_bd` (now deleted) and again into `_acfg_ms`. Unified to a single  
  `_acfg_ms` call. One rune-read. No redundancy.

---

## [5.0.4] — ᛉ ALGIZ · The Shield Raised

> *Two hunters stalked the milestone system. Both were slain.*

**Forged by:** Alan Klusacek

### ✦ Fixed

- **BUG#11 — Milestone Gaps on Large Difficulty Jumps**  
  A single large jump (e.g. 40M → 175M) previously announced only the floor  
  milestone (150M) and silently skipped 50M and 100M forever.  
  The `while` loop now marches through every uncrossed 50M rung in one sweep —  
  all three milestones fire in order: 50M → 100M → 150M.

- **BUG#12 — Session Reset Wipes Milestone History on Transient API Zero**  
  A momentary API response returning `bestSessionDiff = 0` (network hiccup,  
  race condition) was triggering a full milestone reset — causing already-sent  
  50M alerts to re-fire on the next recovery.  
  The reset guard now requires **both** conditions simultaneously:  
  `_best_diff < self.last_best_diff × 0.5` **AND** `uptimeSeconds < 60`.  
  A transient zero without an uptime drop is ignored.

---

## [4.0.4] — ᚾ NAUTHIZ · The Rolling Average

> *The numbers no longer twitch. They breathe.*

**Forged by:** Alan Klusacek

### ✦ Added

- **ᚾ NAUTHIZ — 10-Second Rolling Average for INPUT CURRENT**  
  `self.curr_history` accumulates `(timestamp, amperes)` pairs, pruned to  
  `AVGWINDOW` seconds (default 10 s). Displayed value is the rolling mean —  
  no more single-poll voltage jitter.

- **ᚾ NAUTHIZ — 10-Second Rolling Average for CORE VOLT**  
  `self.vcore_history` mirrors the pattern for `coreVoltageActual` —  
  smooth, stable, trustworthy.

- **ᚾ NAUTHIZ — Rolling Average Window Adjustable in Settings**  
  `AVGWINDOW` is user-configurable (1.0–10.0 s, step 0.1) via a live entry  
  field in the Settings panel. Trimming to shorter windows is immediate.

---

## [4.0.2] — ᚹ WUNJO · The Overlay

> *When the miner fell silent, the graph did not pretend otherwise.*

**Forged by:** Alan Klusacek

### ✦ Added

- **ᚹ WUNJO — CONNECTION LOST Graph Overlay (v4.0.2)**  
  When `self.data_loss` is `True`, the hashrate bar canvas renders a  
  dark backing rectangle and a blazing red `MINER OFFLINE / reconnecting…`  
  text centred over the graph. No silent empty bars — only honest signal.

- **ᚹ WUNJO — LOST CONNECTION Reboot-Pending Overlay**  
  A separate `LOST CONNECTION` overlay (crimson, 26 pt) fires when  
  `self.reboot_pending` is set — visually distinct from normal offline state.

---

## [4.0.1] — ᚨ ANSUZ · The Restoration

> *The longhouse was recalled from the shadows. Its geometry obeyed.*

**Forged by:** Alan Klusacek

### ✦ Fixed

- **FIX7 — Animation ID Stale-ID Leak on Tray Restore**  
  `bar_anim_id` and `gold_pulse_id` are now always cleared to `None` inside  
  `finally:` blocks regardless of whether `after_cancel()` succeeds.  
  Stale IDs no longer accumulate across tray hide/show cycles.

- **FIX — Tray Restore Geometry Flush**  
  `resumeloops()` now calls `self.root.update_idletasks()` before restarting  
  bar animation and gold pulse — ensuring `winfo_width()` / `winfo_height()`  
  are valid when the canvases first paint. The graph no longer collapses to a  
  sliver on restore.

- **FIX — Restore Delay Extended to 400 ms**  
  `resume_loops` is now deferred 400 ms after `deiconify` (was 150 ms) to  
  give Tkinter time to re-layout the zoomed window before animation begins.

---

## [4.0.0] — ᛞ DAGAZ · Dawn of the New Forge

> *The sun rose over Yggdrasil. The old serpent shed its skin.*

**Forged by:** Alan Klusacek

### ✦ Added

- **ᛗ MANNAZ — Clickable Email in Header**  
  `sonofodin@outlook.com` in the title bar is a living rune —  
  `cursor="hand2"`, click opens `mailto:sonofodin@outlook.com` in your mail  
  client. Hover lights it white; release returns it to blazing gold.

- **ᛜ INGWAZ — Difficulty Milestone Discord Alerts (initial)**  
  Discord webhook fires on every 50M difficulty milestone crossed during a  
  session (50M, 100M, 150M, …). Each crossing announced once.

- **ᛞ DAGAZ — Session Milestone Reset**  
  `last_milestone_notified` resets to `0` when a new session is detected  
  (`bestDiff < lastBestDiff × 0.5`). The ravens begin counting anew.

### ✦ Changed

- **ᚱ RAIDHO — `webbrowser` Import Hoisted**  
  `import webbrowser as wb` moved to top of `build()` to support the email  
  hyperlink — no longer conjured late in the version-label block.

### ✦ Fixed

- **ᚲ KENAZ — Version Label GitHub Link Preserved**  
  Click-through and hover effects on the version label remain intact after the  
  `webbrowser` import restructure.

---

## [3.9.9] — ᛟ OTHALA · The Ancestral Hall Fortified

> *The foundations were deepened. The longhouse will not shake.*

**Forged by:** Alan Klusacek

### ✦ Added

- **ᚾ NAUTHIZ — Discord Webhook on New Best Difficulty ≥ 50M**  
  `⚡ NEW BEST DIFFICULTY` fires when `bestSessionDiff` surpasses 50 million  
  and exceeds the previous session best.  
  *(Superseded by 🏆 NEW MILESTONE in v5.0.5)*

- **ᛏ TIWAZ — TCP-Connect Ping with Adjustable Rolling Average**  
  `do_ping()` maintains a rolling `(timestamp, ms)` history pruned to  
  `PINGAVGWINDOW` seconds. Colour-coded: GREEN < 50 ms · ORANGE < 120 ms · RED ≥ 120 ms.

### ✦ Fixed

- **ᛊ SOWILO — Thread-Safe Ping Capture Before Exit**  
  `t2, f2` captured before the thread exits; dispatched via `root.after(0, …)`.  
  No more UI reading the bones of dead threads.

---

## [3.9.8] — ᛒ BERKANO · The Branch Reaches Further

> *New growth on the World Tree. The miner was finally named.*

**Forged by:** Alan Klusacek

### ✦ Added

- **ᚷ GEBO — Pool User Display on Ping Row**  
  `stratumUser` burns gold (`#f0c040`) on the far-right of the ping row.

### ✦ Fixed

- **ᚹ WUNJO — Firmware Label Placement Stabilised**  
  Firmware version label reliably anchored south, padding corrected.

---

## [3.9.7] — ᚺ HAGALAZ · Hail Fell, Was Endured

> *Disruptions came. The ravens flew through them.*

**Forged by:** Alan Klusacek

### ✦ Added

- **ᛁ ISA — NEW DIFFICULTY Tray Popup**  
  `⚡ NEW DIFFICULTY` tray notification fires when `bestSessionDiff` sets a  
  new personal high.

### ✦ Fixed

- **ᚠ FEHU — Thread Exit Value Capture**  
  Ping text and colour captured before `do_ping()` thread exits.

---

## [3.9.6] — ᛃ JERA · The Harvest Corrected

> *What was sown crooked was reaped crooked. The field was re-ploughed.*

**Forged by:** Alan Klusacek

### ✦ Fixed

- **BUG1 — HR Refresh Var Wrong Reference**  
  `apply_hrrefresh()` read `self.refreshvar` instead of `self.hrrefreshvar`.  
  Floor raised from `0.05` → `0.10` s.

---

## [3.9.5] — ᛜ INGWAZ · The Seed of Stability

> *Roots were buried deep. The serpent stopped thrashing.*

**Forged by:** Alan Klusacek

### ✦ Added

- **ᚾ NAUTHIZ — Network Ping Display**  
  Large cyan ping readout; non-blocking TCP connect, daemon-threaded.

- **ᚨ ANSUZ — Non-Blocking Ping Thread (`trigger_ping`)**  
  `ping_inflight` guard prevents thread pile-up on slow networks.

### ✦ Fixed

- **BUG3 — Non-Numeric Alert Field Guard**  
  `float(raw) or 0` catches `ValueError` / `TypeError` on empty threshold fields.

- **FIX5 — Live Settings IP Fallback**  
  Reboot reads `self.cfg.get("minerip", MINERIP)` rather than the stale global.

---

## [3.9.4] — ᛟ OTHALA · The Foundation Stone

> *The longhouse was raised from raw timber and rune-carved beams.*

**Forged by:** Alan Klusacek

### ✦ Added

- **ᚠ FEHU — Initial Release**  
  Three-column layout · animated hashrate graph · Vegvisir watermark ·  
  Huginn & Muninn · tray daemon · Discord alerts · BTC/USD price · rejection % ·  
  alert config cache.

---

```
      H       M
     / \     / \
    / U \   / U \
   / G   \ / N   \
  / I     V    I  \
  ______RAVENMINER HQ______
  ᚠᛖᚺᚢ  ᛏᛁᚹᚨᛉ  ᛟᛞᛁᚾᚾ
```

*ᚠᛖᚺᚢ ᛏᛁᚹᚨᛉ ᛟᛞᛁᚾᚾ*  
May your difficulty be low and your uptime eternal.  
The ravens watch. The Allfather approves.

**R A V E N M I N E R  H Q — ᚲᚺᚨᚾᚷᛖᛚᛟᚷ**  
`ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ — ᛏ ᛒ ᛗ — ᛜ ᛞ ᛟ`
