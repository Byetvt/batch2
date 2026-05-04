#!/usr/bin/env python3
# 20260425 added comment lines v1.1
# /home/user01/.local/share/nemo/scripts
import os
import sys
import re
import subprocess
from zipfile import ZipFile, ZIP_DEFLATED

def notify(title, message):
    try:
        subprocess.run(["notify-send", title, message], check=False)
    except FileNotFoundError:
        pass

def add_path(zipf, path):
    path = os.path.abspath(path)
    if os.path.isfile(path):
        arcname = os.path.basename(path)
        # Original: zipf.write(path, arcname)
        zipf.write(path, arcname)
    elif os.path.isdir(path):
        base_dir = os.path.abspath(path)
        for root, dirs, files in os.walk(base_dir):
            for fname in files:
                fpath = os.path.join(root, fname)
                # store paths relative to the directory given
                arcname = os.path.relpath(fpath, os.path.dirname(base_dir))
                # Original: zipf.write(fpath, arcname)
                zipf.write(fpath, arcname)

def main():
    if len(sys.argv) < 2:
        notify("Smart Zip", "Error: No files/directories specified")
        print("Usage: smart_zip.py <file_or_dir1> [file_or_dir2 ...]")
        sys.exit(1)

    first_file = sys.argv[1]
    base = os.path.splitext(os.path.basename(first_file.rstrip("/")))[0]
    dir_path = os.path.dirname(os.path.abspath(first_file))
    os.chdir(dir_path)

    base_zip = f"{base}.zip"

    # ALWAYS scan existing zip files and pick the next free number
    max_num = 0
    pattern = re.compile(rf"^{re.escape(base)}_(\d{{3}})\.zip$")
    for filename in os.listdir(dir_path):
        if filename == base_zip:
            # Treat the plain base.zip as "001" already taken
            if max_num < 1:
                max_num = 1
        match = pattern.match(filename)
        if match:
            num = int(match.group(1))
            if num > max_num:
                max_num = num

    if max_num == 0:
        # No base.zip and no numbered zips: create base.zip
        new_zip_name = base_zip
    else:
        new_num = max_num + 1
        if new_num > 999:
            notify("Smart Zip", "Error: Maximum of 999 zip files reached")
            print("Error: Maximum of 999 zip files reached.")
            sys.exit(1)
        new_zip_name = f"{base}_{new_num:03d}.zip"

    print(f"Creating {new_zip_name} from selected files and folders...")
    notify("Smart Zip", f"v1.1 Started: {new_zip_name}")

    try:
        # Explicit DEFLATE with max level
        with ZipFile(new_zip_name, 'w', compression=ZIP_DEFLATED, compresslevel=9) as zipf:
            for path in sys.argv[1:]:
                add_path(zipf, path)
        notify("Smart Zip", f"Success: Created {new_zip_name}")
    except Exception as e:
        error_msg = f"Failed: {str(e)}"
        notify("Smart Zip", error_msg)
        print(error_msg)
        sys.exit(1)

if __name__ == "__main__":
    main()

