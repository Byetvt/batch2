#!/bin/bash
# Ensure a file was passed
if [ -z "$1" ]; then
    zenity --error --text="No file selected."
    exit 1
fi

# Calculate SHA256 hash
HASH=$(sha256sum "$1" | awk '{print $1}')
FILENAME=$(basename "$1")

# Show result in a copy-friendly dialog box
zenity --info --title="SHA256 Checksum" \
       --text="File: $FILENAME\n\nSHA256 Hash:\n$HASH" \
       --width=500
