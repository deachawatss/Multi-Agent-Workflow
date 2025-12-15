#!/bin/bash
# PocketBase Startup Script for MAW
# Starts PocketBase server on 0.0.0.0:8090

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
POCKETBASE_DIR="$SCRIPT_DIR"

echo "========================================="
echo "Starting PocketBase for MAW"
echo "========================================="
echo ""

cd "$POCKETBASE_DIR"

# Check if pocketbase binary exists
if [ ! -f "./pocketbase" ]; then
    echo "❌ Error: pocketbase binary not found!"
    echo "Run: wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.23/pocketbase_0.22.23_linux_amd64.zip"
    exit 1
fi

echo "Starting PocketBase server..."
echo "- Server: http://0.0.0.0:8090"
echo "- Admin UI: http://0.0.0.0:8090/_/"
echo ""
echo "First time setup:"
echo "1. Open http://0.0.0.0:8090/_/ in browser"
echo "2. Create admin account:"
echo "   - Email: deachawat@gmail.com"
echo "   - Password: Wind@password9937"
echo ""
echo "Press Ctrl+C to stop the server"
echo "========================================="
echo ""

# Start PocketBase on 0.0.0.0:8090
./pocketbase serve --http="0.0.0.0:8090"
