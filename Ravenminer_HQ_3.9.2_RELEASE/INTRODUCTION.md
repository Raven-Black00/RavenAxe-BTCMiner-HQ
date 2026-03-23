# ᚱ RavenMiner HQ — Introduction

> *"As Odin's ravens Huginn and Muninn fly across the nine worlds gathering knowledge,  
> so too does RavenMiner HQ watch over your miner — tireless, ever-vigilant."*

---

## What is RavenMiner HQ?

**RavenMiner HQ** is a real-time desktop monitoring dashboard for solo Bitcoin miners
running the [RavenMiner](https://ravenminer.com) pool firmware (or compatible API).

Built entirely in Python with a Tkinter GUI, it connects to your miner's local API
and presents a rich, Norse-themed interface featuring live hash-rate graphs,
temperature gauges, power stats, Discord alerts, and a system tray icon.

It was designed to run 24/7 on any Windows machine on the same network as your miner —
no cloud, no subscription, no data leaving your home.

---

## Features at a Glance

| Category | Details |
|---|---|
| **Hashrate** | Live TH/s + 1m / 10m / 1h rolling averages, scrolling bar graph |
| **Temperatures** | ASIC & VR temp gauges with colour-coded thresholds |
| **Power** | Wattage, voltage, current draw |
| **Pool** | Shares accepted/rejected, best difficulty, uptime, pool URL |
| **BTC Price** | Live USD price via CoinGecko (no key required) |
| **Alerts** | Discord webhook — offline, overheat, low hash, new block found |
| **Themes** | Dark (default) + Light mode, persisted across restarts |
| **System Tray** | Minimises to tray; right-click menu to restore or quit |
| **Rune Aesthetic** | Elder Futhark rune labels, Vegvisir watermark, Valknut flash |

---

## Requirements

- Windows 10 / 11 (64-bit)
- Python 3.9 or newer  **— OR —**  use the pre-built `.exe` (no Python needed)
- Miner accessible on local network (default IP: `192.168.68.100`)
- Internet connection for live BTC price (optional; dashboard still works offline)

---

*Forged with Python · Inspired by Norse myth · Built for miners who demand more.*
