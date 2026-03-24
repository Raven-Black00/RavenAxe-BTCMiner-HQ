
import zipfile, os

base    = "output/RavenMiner_HQ_v3.9.3_RELEASE"
zipname = "output/RavenMiner_HQ_v3.9.3_RELEASE.zip"

with zipfile.ZipFile(zipname, "w", zipfile.ZIP_DEFLATED) as zf:
    for root, dirs, files in os.walk(base):
        for file in files:
            full = os.path.join(root, file)
            arcname = os.path.relpath(full, "output")
            zf.write(full, arcname)

size = os.path.getsize(zipname)
print(f"✅ ZIP created: RavenMiner_HQ_v3.9.3_RELEASE.zip")
print(f"   Size: {size:,} bytes  ({size/1024/1024:.2f} MB)")
print(f"\nContents:")
with zipfile.ZipFile(zipname, "r") as zf:
    for info in zf.infolist():
        print(f"  {info.filename}  ({info.file_size:,} bytes → {info.compress_size:,} compressed)")
