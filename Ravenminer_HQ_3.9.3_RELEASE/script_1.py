
base = "output/RavenMiner_HQ_v3.9.3_RELEASE"

# ══════════════════════════════════════════════════════
# requirements.txt
# ══════════════════════════════════════════════════════
req = """# ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚲ — RavenMiner HQ v3.9.3
# ── Runtime Dependencies ──────────────────────────────
# Install with: pip install -r requirements.txt

requests>=2.28.0
Pillow>=9.0.0
pystray>=0.19.0

# ── Notes ─────────────────────────────────────────────
# tkinter  — built into Python standard library (no pip needed)
# pyinstaller — build-time only, install separately if building .exe:
#               pip install pyinstaller
"""

with open(f"{base}/requirements.txt", "w", encoding="utf-8") as f:
    f.write(req)

print("✅ requirements.txt written")
