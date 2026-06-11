#!/bin/bash
echo "==============================================="
echo "[+] Starting Log Managemnt & Rotation..."
echo "==============================================="

LOG_FILE="/home/ammaramara/production/app.log"
BACKUP_DIR="/home/ammaramara/production/app_backups"

MAX_SIZE=10240

CURRENT_SIZE=$(wc -c < "$LOG_FILE")

echo "Current Log Size: $CURRENT_SIZE Bytes"

if [ "$CURRENT_SIZE" -gt "$MAX_SIZE" ]; then
echo "[WARNING] Log file exceeded $MAX_SIZE bytes! Rotating..."

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/app_log_$TIMESTAMP.log"

cp "$LOG_FILE" "$BACKUP_FILE"
> "$LOG_FILE"

echo "[SUCCESS]Old logs backed up to $BACKUP_FILE and app.log cleared!"
else
echo "[OK] log file size is within the safe limit."
fi

