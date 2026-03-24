
import os, shutil

# Read the bat file
with open("RavenMiner_BUILD_3.9.2.bat", "r", encoding="utf-8") as f:
    bat = f.read()

# Update bat to v3.9.3
bat_updated = bat.replace("v3.9.2", "v3.9.3").replace("3.9.2", "3.9.3")

# ── Create release folder structure ──
base = "output/RavenMiner_HQ_v3.9.3_RELEASE"
os.makedirs(f"{base}/src",    exist_ok=True)

# Write updated bat
with open(f"{base}/RavenMiner_BUILD_3.9.3.bat", "w", encoding="utf-8") as f:
    f.write(bat_updated)

# Copy source py
shutil.copy("output/Ravenminer_HQ_3.9.3_COMPLETE.py", f"{base}/src/Ravenminer_HQ_3.9.3.py")
shutil.copy("output/Ravenminer_HQ_3.9.3_COMPLETE.py", f"{base}/Ravenminer_HQ_3.9.3.py")

print("✅ Folder structure + bat + src created")
