#!/bin/bash
echo "==============================="
echo "[+] Starting System check..."
echo "==============================="
if [ -f "app.js" ]; then
echo "[SUCCESS] app.js file exists."
else
echo "[ERROR] app.js file is missing!"
echo "--> Creating new one..."
echo "console.log('App auto-created by script');" > app.js
fi

