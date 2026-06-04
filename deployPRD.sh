#!/bin/bash

echo "=========================================="
echo "🚀 Starting Automated Production Deployment..."
echo "=========================================="

echo "👤 Deployer: $USER"
echo "📅 Date: $(date)"

echo "------------------------------------------"
echo "🔍 Checking System Storage..."
echo "------------------------------------------"

# أمر لعرض مساحة القرص الصلب بشكل منظم وسهل القراءة
df -h --total | grep total

echo "=========================================="
echo "🎯 Application Deployed Successfully!"
echo "=========================================="
