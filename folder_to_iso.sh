#!/bin/bash

# Check if an argument was provided
if [ -z "$1" ]; then
    notify-send "ISO Creator" "No folder selected."
    exit 1
fi

# Get the absolute path and name
SOURCE_PATH="${1%/}"
PARENT_DIR=$(dirname "$SOURCE_PATH")
FOLDER_NAME=$(basename "$SOURCE_PATH")

# Generate the YYYYMMDD suffix
DATE_SUFFIX=$(date +%Y%m%d)
TARGET_ISO="$PARENT_DIR/${FOLDER_NAME}_${DATE_SUFFIX}.iso"

# Check if the file already exists (e.g., if you run this twice in one day)
# This adds a Unix timestamp if the YYYYMMDD version already exists
if [ -f "$TARGET_ISO" ]; then
    TARGET_ISO="$PARENT_DIR/${FOLDER_NAME}_${DATE_SUFFIX}_$(date +%H%M%S).iso"
fi

# Create the ISO
# -R: Rock Ridge (Linux permissions)
# -J: Joliet (Windows compatibility)
genisoimage -R -J -o "$TARGET_ISO" "$SOURCE_PATH"

if [ $? -eq 0 ]; then
    notify-send "ISO Creator" "Created: $(basename "$TARGET_ISO")"
else
    notify-send "ISO Creator" "Failed to create ISO."
fi

