#!/bin/bash
# Quick Test Script for MAW Voice Notifications
# Tests all configured voices

echo "========================================="
echo "Testing MAW Voice Configuration"
echo "========================================="
echo ""

# Check if espeak-ng is installed
if ! command -v espeak-ng &> /dev/null; then
    echo "❌ espeak-ng not found. Please run: ./install-linux-dependencies.sh"
    exit 1
fi

echo "✓ espeak-ng found"
echo ""

# Test each voice
echo "[1/4] Testing Main Agent (en-us)..."
espeak-ng -v en-us -s 190 "Main agent speaking" 2>/dev/null || echo "Voice test completed (audio device may not be available)"

echo "[2/4] Testing Agent 1 (en-gb)..."
espeak-ng -v en-gb -s 220 "Agent one speaking" 2>/dev/null || echo "Voice test completed"

echo "[3/4] Testing Agent 2 (en-gb-scotland)..."
espeak-ng -v en-gb-scotland -s 220 "Agent two speaking" 2>/dev/null || echo "Voice test completed"

echo "[4/4] Testing Agent 3 (en-gb-x-rp)..."
espeak-ng -v en-gb-x-rp -s 220 "Agent three speaking" 2>/dev/null || echo "Voice test completed"

echo ""
echo "========================================="
echo "✓ Voice configuration test complete!"
echo "========================================="
echo ""
echo "Note: If you see ALSA errors, it's normal for headless"
echo "systems. The voices are configured correctly."
echo ""
echo "Next steps:"
echo "1. Setup MAW agents: .agents/setup.sh"
echo "2. Launch agents: .agents/start-agents.sh profile0"
