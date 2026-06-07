#!/bin/bash

echo "=========================================="
echo "--> Starting Deployment Version 2..."
echo "=========================================="

echo "[-] Deployer User: $USER"
echo "[-] Execution Date: $(date)"

echo "=========================================="
echo "Checking System Storage..."
echo "=========================================="

DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Current Disk Usage: $DISK_USAGE%"
if [ "$DISK_USAGE" -gt 90 ]; then
echo "[!] CRITICAL ERROR: Disk usage is above 90%! Deployment aborted."
exit 1

else
echo "[+] Storage level is safe. Proceeding with Deployment..."
fi


echo "=========================================="
echo "Starting Up Backup Directory.."
echo "=========================================="

BACKUP_DIR="app_backups"
if [ ! -d "$BACKUP_DIR" ]; then
mkdir "$BACKUP_DIR"
echo "[+] Directory '$BACKUP_DIR' created successfully."
else
echo "[+] Directory '$BACKUP_DIR' already exists. Skipping creation."
fi

echo "========================================="
echo "--> Deploying Application files and Backups..."
echo " console.log('App is running Perfectly Version 2');" > app.js
echo "[+] Created/Updated 'app.js' code file ."

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/app_backup_$TIMESTAMP.js"
cp app.js "$BACKUP_FILE"
echo "[+] Backup saved successfully as: $BACKUP_FILE"
echo "========================================="
echo "Application Deployed Successfully!"

