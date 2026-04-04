# RAVENMINER HQ — Release Notes

---

## [5.2.1] — ᚱ RAIDHO · Dead Weight Cast Into the Void
*April 3, 2026*

> *The forge does not carry dead weight.*
> *What serves no purpose is cast into the void.*
> *What remains is stronger for the absence.*

---

### 🗑️ Dead Code Purged

`_upd_pool_info()` — a 12-line function that was **never called** anywhere in
the codebase — has been removed. It carried the wrong API key (`stratum_User`
instead of `stratumUser`), silently double-wrote `lbl_uptime` and
`lbl_pool_user` on every poll cycle, and returned nothing of value.
The World Tree is lighter. The ravens fly faster.

---

### 🔇 Debug Prints Removed

| Location | Print statement | Why removed |
|---|---|---|
| Settings watermark draw | `[WM] watermark drawn on canvas successfully` | Fired every time Settings opened — console noise |
| Settings apply handler | `[APPLY] Sending: {data}` | **Leaked miner IP, pool credentials, voltage settings in plain text** |
| Settings apply handler | `[APPLY] PATCH {url} -> {status_code}` | Internal HTTP debug — not for production |

The credentials leak (`[APPLY] Sending:`) is the most important removal —
your miner IP and pool settings were printed to the console on every Save.

---

## [5.2.0] — ᚨ ANSUZ · The Voice That Needs No Platform
*April 3, 2026*

> *The war-horn was reborn. Discord was cast into the ash.*
> *Now a single HTTP whisper reaches any phone in any realm — no account, no platform, no middleman.*

---

### ⚡ The Big Change — Discord → ntfy.sh

Discord has been **fully removed** from RavenMiner HQ.

In its place: **[ntfy.sh](https://ntfy.sh)** — a free, open-source push notification service.
A single HTTP POST is all it takes. No account required on the public server.
Self-hosting is a single binary if you want nothing leaving your network.

**Setup takes 30 seconds:**
1. Install the **ntfy** app on your phone (Android / iOS)
2. Open Settings in RavenMiner HQ
3. Paste your topic URL: `https://ntfy.sh/your-secret-topic-name`
4. Hit **▶  TEST NOTIFY  (ntfy.sh)**
5. Your phone buzzes. The war-horn is armed.

> *Make your topic name long and random — it is your password on the public server.*

---

### 🐦‍⬛ Raven Position Fix

Huginn and Muninn no longer clip the top bar. Both ravens lowered 24 px —
normal frame and flash animation kept in sync.

---

### 🐛 Bugs Slain

| Bug | Description | Fix |
|---|---|---|
| `lbl_refresh_stat` spam | Attribute accessed before widget created — every poll tick logged an error | `getattr` guard applied |
| `color=` kwarg on ntfy calls | Stale Discord kwarg survived migration in milestone and test calls | Removed; replaced with `priority`/`tags` |
| `IndentationError` line 2159 | Patch collision duplicated `if _wh_ms:` guard, dropped closing `)` | Block rebuilt cleanly |
| Latin-1 header encoding | Emoji in `Title` header caused `UnicodeEncodeError` | Non-ASCII stripped from header; emoji carried by `Tags` field |

---

## [3.9.9] — ᛟ OTHALA · The Ancestral Hall Fortified

Two gifts nailed to the World Tree: alert on new best difficulty ≥ 50M,
and a rolling TCP ping with colour-coded tide.
A thread-death race condition hunted down and fed to the wolves.

---

## [3.9.8] — ᛒ BERKANO · The Branch Reaches Further

The miner's true name — `stratumUser` — burns gold on the ping row.
The firmware label was anchored south, where it belongs.

---

## [3.9.7] — ᚺ HAGALAZ · Hail Fell, Was Endured

The tray speaks: `⚡ NEW DIFFICULTY` when `bestSessionDiff` climbs past 50M.
The ping thread-exit ghost was exorcised.

---

## [3.9.6] — ᛃ JERA · The Harvest Corrected

`applyhrrefresh()` read the wrong rune. The graph floor was raised to `0.10 s`.

---

## [3.9.5] — ᛜ INGWAZ · The Seed of Stability

The cyan ping eye opened — TCP-born, non-blocking, daemon-threaded.
Alert fields no longer crack on empty input. IP fallback rune carved.

---

## [3.9.4] — ᛟ OTHALA · The Foundation Stone

*In the beginning there was nothing. Then Alan carved the first rune.*

| Pillar | Purpose |
|---|---|
| Three-column layout | Temperatures · Hashrate · Power |
| Vegvisir watermark | The wayfinding sigil, always present |
| Huginn & Muninn | Thought and memory, watching always |
| System tray daemon | The unseen watcher |
| Alert system | The war-horn to any realm |
| BTC price (CoinGecko) | The gold-weight, refreshed in silence |
| Rejection % display | Shame, colour-coded green to red |
| Alert config cache | The scroll read once, held in memory |

---

```
    M       M
   /H\     /M\
  / U \   / U \
 / G   \ /  N  \
/ I     I    I  \
        N        N
/_____RAVENMINER HQ_____\
  ᚠᛖᚺᚢ  ᛏᛁᚹᚨᛉ  ᛟᛞᛁᚾᚾ
```

*May your difficulty be low.*
*May your uptime be eternal.*
*The ravens watch. The Allfather approves.*

**R A V E N M I N E R H Q**
ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ — ᛏ ᛒ ᛗ — ᛜ ᛞ ᛟ
