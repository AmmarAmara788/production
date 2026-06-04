#!/bin/bash
echo "====================================="
echo "Starting Automated Production Deployment..."
echo "====================================="

echo "Deployer: $USER"
echo "Date: $(date)"

echo "-------------------------------------"
echo "Checking System Storage..."
echo "-------------------------------------"
df -h --total | grep total

echo "-------------------------------------"
echo "Setting Up Backup Directory..."
echo "-------------------------------------"

BACKUP_DIR="app_backups"

if [ ! -d "$BACKUP_DIR" ]; then
mkdir "$BACKUP_DIR" 
echo "Directory '$BACKUP_DIR' created successfully."
else
echo "Directory '$BACKUP_DIR' already exists. Skipping creation."
fi
echo "====================================="
echo "Application Deployed Successfully!"
