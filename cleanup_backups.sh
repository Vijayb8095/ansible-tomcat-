#!/bin/bash

# Define the backup directory
BACKUP_DIR="/opt/tomcat/webapps/backup"

# Find all backup folders sorted by creation time and keep the last 5
find "$BACKUP_DIR" -mindepth 1 -maxdepth 1 -type d -printf '%T@ %p\n' | \
    sort -n | \
    awk '{print $2}' | \
    head -n -2 | \
    while read OLD_BACKUP; do
        # Delete the old backup directories
        echo "Deleting old backup: $OLD_BACKUP"
        rm -rf "$OLD_BACKUP"
    done

