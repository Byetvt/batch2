#!/bin/bash

# changed filename format 09-10-2026  v1.2

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

# Scan for existing ISO files with the same base and date to find the next 3-digit sequence number
MAX_NUM=0
for file in "$PARENT_DIR/${FOLDER_NAME}_${DATE_SUFFIX}_"*.iso; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        # Extract the 3-digit suffix before .iso
        if [[ "$filename" =~ ^.*_${DATE_SUFFIX}_([0-9]{3})\.iso$ ]]; then
            num=$((10#${BASH_REMATCH[1]}))
            if [ $num -gt $MAX_NUM ]; then
                MAX_NUM=$num
            fi
        fi
    fi
done

NEW_NUM=$((MAX_NUM + 1))
if [ $NEW_NUM -gt 999 ]; then
    notify-send "ISO Creator" "Error: Maximum of 999 ISO files reached for today."
    exit 1
fi

# Format the sequence number as a 3-digit string (e.g., 001)
FORMATTED_NUM=$(printf "%03d" $NEW_NUM)
TARGET_ISO="$PARENT_DIR/${FOLDER_NAME}_${DATE_SUFFIX}_${FORMATTED_NUM}.iso"

notify-send "ISO Creator v1.2" "Started: $(basename "$TARGET_ISO")"

# Create the ISO
# -R: Rock Ridge (Linux permissions)
# -J: Joliet (Windows compatibility)
genisoimage -R -J -o "$TARGET_ISO" "$SOURCE_PATH"

if [ $? -eq 0 ]; then
    notify-send "ISO Creator" "Created: $(basename "$TARGET_ISO")"
else
    notify-send "ISO Creator" "Failed to create ISO."
fi
