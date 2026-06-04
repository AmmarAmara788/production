#!/bin/bash
echo "==============================="
echo "Starting Automated Production Deployment..."
echo "==============================="
echo "Deployer: $USER"
echo "Date: $(date)"

echo "-------------------------------"
echo "Checking System Storage..."
echo "-------------------------------"

DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Current Disk Usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -gt 90 ]; then
echo "CRITICAL ERROR: Disk usage is above 90%! Deployment aborted to save the server!!"
exit 1

else
echo "Storage level is safe. Proceeding with deployment..."
fi

echo "--------------------------------"
echo "Setting Up Backup Directory..."
echo "--------------------------------"

BACKUP_DIR="app_backups"

if [ ! -d "$BACKUP_DIR" ]; then
mkdir "$BACKUP_DIR"
echo "Directory '$BACKUP_DIR' created successfully."
else
echo "Directory '$BACKUP_DIR' already exists. Skipping creation"
fi

echo "--------------------------------"
echo "M2: Deploying Application Files & Backups..."
echo "console.log('App is running on Production!');" > app.js
echo "Created/Updated 'app.js' code file."

BACKUP_FILE="$BACKUP_DIR/app_backup_$(date +%F_%H-%M-%S).js"
cp app.js "$BACKUP_FILE"
echo "Backup saved successfully as: $BACKUP_FILE"

echo "================================"
echo "Application DEployed Successfully" 
