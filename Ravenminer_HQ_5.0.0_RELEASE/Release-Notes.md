# RAVENMINER HQ — Release Notes

```
ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ ᚺ ᚾ ᛁ ᛃ ᛇ ᛈ ᛉ ᛊ ᛏ ᛒ ᛖ ᛗ ᛚ ᛜ ᛞ ᛟ
```

> *The herald stands at the longhouse gate and calls the news to all who pass.*  
> *She reads from the scroll. She leaves nothing out.*

---

## [5.0.5] — ᛗ MANNAZ · The Milestone Reborn
*The war-horn learned restraint. It now speaks only when truly earned.*

**Forged by Alan Klusacek. Refined by Perplexity AI.**

Three truths were rewritten on the stone:

**🏆 NEW MILESTONE** — The webhook title is now `🏆 NEW MILESTONE — X` instead
of the former `🏆 DIFFICULTY MILESTONE — X`. Cleaner. More honest. The herald
names what it is.

**⚡ NEW BEST DIFFICULTY removed** — The old webhook that screamed on every
single personal-best above 50M has been struck from the record. It fired too
often. Milestones — every 50M rung — replace it entirely.  
*Odin does not cheer for every step. Only for the mountaintop.*

**One rune-read, not two** — The alert config was loaded twice in succession.
Now it is loaded once. The scroll is read; it is not re-read for the same answer.

**The milestone loop now only runs when a new personal best is set** — previously
it evaluated on every poll tick (every quarter-second). It was quiet but wasteful.
Now it wakes only when the difficulty rises. The sleeping wolf need not be stirred.

---

## [5.0.4] — ᛉ ALGIZ · The Shield Raised
*Two wolves stalked the milestone system. Both were slain before they could bite.*

**Forged by Alan Klusacek.**

**BUG#11 — The Missed Rungs** — A large difficulty jump (e.g. 40M straight to
175M) previously fired only the 150M milestone and silently skipped 50M and 100M
**forever**. The `while` loop now marches every uncrossed rung in order:
50M → 100M → 150M. No milestone is left behind.

**BUG#12 — The Ghost Reset** — A momentary API hiccup returning
`bestSessionDiff = 0` would wipe `last_milestone_notified` back to zero and
re-fire already-announced milestones on recovery. The reset now demands
**both** a diff collapse below 50% of the previous high **and** an uptime below
60 seconds. A zero without an uptime drop is ignored. The memory of the ravens
is no longer stolen by bad packets.

---

## [4.0.4] — ᚾ NAUTHIZ · The Rolling Numbers
*The gauges stopped twitching. They learned to breathe.*

**Forged by Alan Klusacek.**

**Rolling Average for INPUT CURRENT and CORE VOLT** — Both readings now
accumulate a configurable rolling window (default 10 seconds, range 1–10 s)
before displaying. Single-poll jitter is absorbed. The numbers you see reflect
reality, not noise. The window is adjustable live from the Settings panel.

---

## [4.0.2] — ᚹ WUNJO · The Honest Graph
*When the miner went silent, the graph admitted it.*

**Forged by Alan Klusacek.**

**CONNECTION LOST overlay** — When polling fails, the hashrate canvas no longer
shows a frozen last-known bar graph. A dark backing rectangle and a crimson
`MINER OFFLINE / reconnecting…` message fills the chart area. If a reboot was
commanded, a separate `LOST CONNECTION` overlay fires — visually distinct,
unmistakeable.

---

## [4.0.1] — ᚨ ANSUZ · The Restored Longhouse
*The longhouse was summoned back from the tray. Its proportions obeyed.*

**Forged by Alan Klusacek.**

Three ghosts were expelled:
- Stale animation IDs no longer accumulate across tray hide/show cycles
- `update_idletasks()` called before animation restarts — geometry is valid
- Restore delay extended to 400 ms — the window has time to breathe before
  the bars begin to dance

---

## [4.0.0] — ᛞ DAGAZ · Dawn of the New Forge
*The sun rose over Yggdrasil. The old serpent shed its skin.*

**Forged by Alan Klusacek.**

Three gifts were brought from the forge:

**ᛗ Clickable Email** — `sonofodin@outlook.com` in the title bar is now a
living rune. Click it; your mail client wakes.

**ᛜ Difficulty Milestones** — The war-horn fires on every 50M crossing during
a session. 50M. 100M. 150M. Each announced once. *(Refined in v5.0.5)*

**ᛞ Session Reset** — When the miner restarts and the diff collapses below
half the previous session high, the milestone ladder resets. The ravens begin
their count anew.

---

## [3.9.9] — ᛟ OTHALA · The Ancestral Hall Fortified
*The bones of the longhouse were buried deeper.*

**Forged by Alan Klusacek.**

Two gifts were nailed to the World Tree:

**⚡ Discord War-Horn** — Screamed into the void when a new best difficulty
≥ 50M was achieved. Odin does not whisper. Neither did this webhook.  
*(Retired in v5.0.5 — replaced by NEW MILESTONE)*

**🌊 Rolling Tide Ping** — `PINGAVGWINDOW` seconds of rolling memory,
colour-blooded by speed:
- GREEN · below 50 ms · swift as Sleipnir
- ORANGE · below 120 ms · Bifrost at dusk
- RED · 120 ms+ · Ragnarök approaches

A thread-death race condition was hunted down and fed to the wolves.
`t2, f2` captured before exit. `root.after(0,…)` dispatched. The UI no
longer reads the bones of dead threads.

---

## [3.9.8] — ᛒ BERKANO · The Branch Reaches Further
*New growth on the World Tree. The miner was named.*

**Forged by Alan Klusacek.**

The `stratumUser` — the miner's true name — was hidden in shadow. No longer.
It burns gold (`#f0c040`) on the ping row for all ravens to read. The firmware
label stopped wandering the ash fields and was anchored south, where it belongs.

---

## [3.9.7] — ᚺ HAGALAZ · Hail Fell, Was Endured
*The storm came. The ravens flew through it.*

**Forged by Alan Klusacek.**

The tray now speaks: `⚡ NEW DIFFICULTY` rises like smoke when `bestSessionDiff`
climbs above any previous high. The thread-exit ghost was exorcised — ping values
captured before the thread dies. No more stale shades haunting the widget layer.

---

## [3.9.6] — ᛃ JERA · The Harvest Corrected
*What was sown crooked was reaped crooked. The field was harrowed and re-seeded.*

**Forged by Alan Klusacek.**

`apply_hrrefresh()` read the wrong rune — `self.refreshvar` where
`self.hrrefreshvar` was written. The graph refresh floor was raised to `0.10`.
The harvest is now true.

---

## [3.9.5] — ᛜ INGWAZ · The Seed of Stability
*Before Dagaz, there must be darkness endured.*

**Forged by Alan Klusacek.**

The great cyan ping eye opened — TCP-born, non-blocking, daemon-threaded.
`ping_inflight` stands guard so threads do not pile like corpses on a
slow-network battlefield. Alert fields no longer crack on empty runes.
The IP fallback rune was carved: the miner is found, even when settings wander.

---

## [3.9.4] — ᛟ OTHALA · The Foundation Stone
*In the beginning there was nothing. Then Alan carved the first rune.*

**Forged by Alan Klusacek.**

The longhouse was raised. Three columns. Gauges for everything that matters.
Huginn and Muninn watching always. The world tree began to grow.

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

*May your difficulty be low.*  
*May your uptime be eternal.*  
*The ravens watch. The Allfather approves.*

**R A V E N M I N E R  H Q**  
`ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ — ᛏ ᛒ ᛗ — ᛜ ᛞ ᛟ`
