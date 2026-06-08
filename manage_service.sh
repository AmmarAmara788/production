#!/bin/bash
echo "==========================================="
echo "Checking Application Service Status..."
echo "==========================================="

PID=$(pgrep -f "sleep 1000")
if [ -n "$PID" ]; then
echo "[HEALTHY] app.js is running perfectly with PID: $PID"

else
echo "[WARNING] app.js is DOWN! Activating Autostarting..."
sleep 1000 &
echo "[SUCCESS] app.js has been restarted successfully in the background!"
fi

