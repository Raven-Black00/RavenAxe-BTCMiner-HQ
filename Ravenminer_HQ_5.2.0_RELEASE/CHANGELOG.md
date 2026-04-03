# ᚲᚺᚨᚾᚷᛖᛚᛟᚷ — RAVENMINER HQ

ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ ᚺ ᚾ ᛁ ᛃ ᛇ ᛈ ᛉ ᛊ ᛏ ᛒ ᛖ ᛗ ᛚ ᛜ ᛞ ᛟ

> *Every rune carved here is a wound healed in the codeforge.*
> *HUGINN remembered the bug. MUNINN remembered the fix.*
> *ODIN merged them both.*

---

## [5.2.1] — ᚱ RAIDHO · Dead Weight Cast Into the Void

> *What was never called should never have remained.*
> *The codeforge is lean. The ravens fly true.*

### ✦ Removed

- **ᚱ RAIDHO — Dead Function `_upd_pool_info()` Purged**
  This 12-line method was defined but never called anywhere in the
  codebase. It also held the wrong API key (`stratum_User` vs
  `stratumUser`), causing a phantom double-write to `lbl_uptime` and
  `lbl_pool_user` on every poll cycle had it ever been wired up.
  Removed entirely. 15 lines of dead runes returned to the void.

### ✦ Fixed

- **BUG-B — `[WM]` Debug Print Removed**
  `print("[WM] watermark drawn on canvas successfully")` fired every
  time the Settings panel opened. Console noise eliminated.

- **BUG-C — Credentials Leak Sealed**
  `print("[APPLY] Sending:", data)` was printing the user's miner IP,
  pool credentials, voltage and frequency settings in plain text to the
  console on every settings save. Removed.

- **BUG-D — HTTP Debug Print Removed**
  `print(f"[APPLY] PATCH {url} -> {resp.status_code}")` removed.
  Internal HTTP calls are not production console output.

---

## [5.2.0] — ᚨ ANSUZ · The Voice That Needs No Platform

> *The war-horn was reborn. It no longer needs Discord to scream.*
> *A single HTTP whisper reaches any phone in any realm.*

### ✦ Added

- **ᚨ ANSUZ — ntfy.sh Push Notification System**
  Discord webhooks have been fully replaced with `ntfy.sh` — a lightweight,
  open-source push notification service requiring no account on the public
  server. A single HTTP POST to `https://ntfy.sh/your-secret-topic` delivers
  native push alerts to iOS and Android. Self-hosting on your own machine is
  supported — change the URL and nothing leaves your network.

- **ᛜ INGWAZ — Per-Alert Priority & Emoji Tags**
  Every alert now carries a `priority` level and `tags` field, which ntfy
  converts to emoji on the phone notification:

  | Alert | Priority | Tags |
  |---|---|---|
  | 🔥 MINER OVERHEAT | `high` | `fire,rotating_light` |
  | 🟠 VR OVERHEAT | `high` | `fire,orange_circle` |
  | ⚠️ MINER OFFLINE | `high` | `warning,red_circle` |
  | ⛏️ BLOCK FOUND | `high` | `trophy,tada` |
  | ❌ REJECTED SPIKE | `default` | `x,warning` |
  | 📉 LOW HASHRATE | `default` | `chart_with_downwards_trend` |
  | 🏆 NEW MILESTONE | `default` | `trophy,sparkles` |
  | ✅ TEST ALERT | `default` | `white_check_mark` |

- **ᛏ TIWAZ — TEST NOTIFY Button in Settings**
  Settings panel now shows **▶  TEST NOTIFY  (ntfy.sh)** — fires a live test
  push to confirm your topic URL is correct before relying on it.

### ✦ Changed

- **ᚱ RAIDHO — Config Key Renamed**
  `discord_webhook` → `ntfy_topic` in `ravenminer_alerts.json`.
  On first run after upgrade, re-enter your ntfy topic URL in Settings.

- **ᛒ BERKANO — Settings Section Relabelled**
  "DISCORD ALERTS" section in Settings is now "NTFY.SH ALERTS".
  Field label reads `ntfy Topic URL  (e.g. https://ntfy.sh/my-secret-topic)`.

- **ᛟ OTHALA — Raven Pair Repositioned**
  Both Huginn and Muninn lowered by 24 px — they no longer clip the top bar.
  Normal draw and flash animation frames kept in sync.

### ✦ Fixed

- **BUG-FIX — `send_ntfy_alert()` Latin-1 Header Encoding**
  Python's `requests` library encodes HTTP header values as latin-1. Emoji
  characters in the `Title` header caused `UnicodeEncodeError`. Fix: non-ASCII
  characters are stripped from the Title header only; emoji are preserved on
  the phone notification via the `Tags` field. `Content-Type: text/plain;
  charset=utf-8` header added so the message body is always decoded correctly.

- **BUG-FIX — Milestone Call Retained `color=0xFFD700` Kwarg**
  The 50M-milestone `send_ntfy_alert` call still carried the legacy Discord
  `color=` keyword argument. Removed; replaced with `priority`/`tags`.

- **BUG-FIX — `_test_ntfy` Call Retained `color=0x9966ff` Kwarg**
  Same stale kwarg survived in the Test button handler. Removed.

- **BUG-FIX — `IndentationError` in Milestone Block**
  Patch collision duplicated the `if _wh_ms:` guard and dropped the closing
  `)` of the `send_ntfy_alert` call. Block rebuilt cleanly; `py_compile`
  confirms zero syntax errors.

- **BUG-FIX — `lbl_refresh_stat` AttributeError Spam**
  `self.lbl_refresh_stat` was referenced in `updated_display()` but the
  widget was never created. Every poll tick logged `[RavenMiner] ignored error`.
  Fixed by applying the same `getattr(self, "lbl_refresh_stat", None)` guard
  already used on the sibling `lbl_hr_refresh_stat` label.

---

## [4.0.0] — ᛞ DAGAZ · Dawn of the New Forge

> *The sun rose over Yggdrasil. The old serpent shed its skin.*

### ✦ Added

- **ᛗ MANNAZ — Clickable Email in Header**
  The `sonofodin@outlook.com` label in the title bar is now a living rune —
  `cursor="hand2"`, click opens `mailto:sonofodin@outlook.com` directly in your
  default mail client. Hovering lights it white; releasing the cursor returns it
  to blazing gold.

- **ᛜ INGWAZ — Difficulty Milestone Alerts**
  A new alert fires on every **50M difficulty milestone** crossed during a
  session (50M, 100M, 150M, …). Each crossing is announced once —
  Odin does not repeat himself.

- **ᛞ DAGAZ — Session Milestone Reset**
  `last_milestone_notified` now resets to `0` when a new session is detected
  (`bestDiff < lastBestDiff × 0.5`). The ravens begin counting anew when the
  world tree is replanted.

### ✦ Changed

- **ᚱ RAIDHO — `webbrowser` Import Moved Earlier**
  `import webbrowser as wb` is now hoisted to the top of `build()` to support
  the new email hyperlink.

### ✦ Fixed

- **ᚲ KENAZ — Version Label GitHub Link Preserved**
  The version label's GitHub click-through and hover effects remain intact
  after the `webbrowser` import restructure.

---

## [3.9.9] — ᛟ OTHALA · The Ancestral Hall Fortified

> *The foundations were deepened. The longhouse will not shake.*

### ✦ Added

- **ᚾ NAUTHIZ — Alert on New Best Difficulty ≥ 50M**
- **ᛏ TIWAZ — TCP-Connect Ping with Adjustable Rolling Average**

### ✦ Fixed

- **ᛊ SOWILO — Thread-Safe Ping Capture Before Exit**

---

## [3.9.8] — ᛒ BERKANO · The Branch Reaches Further

### ✦ Added

- **ᚷ GEBO — Pool User Display on Ping Row**

### ✦ Fixed

- **ᚹ WUNJO — Firmware Label Placement Stabilised**

---

## [3.9.7] — ᚺ HAGALAZ · Hail Fell, Was Endured

### ✦ Added

- **ᛁ ISA — NEW DIFFICULTY Tray Popup**

### ✦ Fixed

- **ᚠ FEHU — Thread Exit Value Capture**

---

## [3.9.6] — ᛃ JERA · The Harvest Corrected

### ✦ Fixed

- **BUG1 FIX — HR Refresh Var Wrong Reference**

---

## [3.9.5] — ᛜ INGWAZ · The Seed of Stability

### ✦ Added

- **ᚾ NAUTHIZ — Network Ping Display**
- **ᚨ ANSUZ — Non-Blocking Ping Thread**

### ✦ Fixed

- **BUG3 FIX — Non-Numeric Alert Field Guard**
- **FIX5 — Live Settings IP Fallback**

---

## [3.9.4] — ᛟ OTHALA · The Foundation Stone

> *The longhouse was raised from raw timber and rune-carved beams.*

### ✦ Added

- **ᚠ FEHU — Initial Release**
  Core architecture: three-column layout, animated hashrate bar graph,
  Vegvisir watermark, Huginn & Muninn raven pair, system tray daemon,
  alert system, BTC price, rejection % display, cached alert config.

---

ᚠᛖᚺᚢ ᛏᛁᚹᚨᛉ ᛟᛞᛁᚾᚾ
May your difficulty be low and your uptime eternal.
The ravens watch. The allfather approves.
R A V E N M I N E R H Q — ᚲᚺᚨᚾᚷᛖᛚᛟᚷ
ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ — ᛏ ᛒ ᛗ — ᛜ ᛞ ᛟ
