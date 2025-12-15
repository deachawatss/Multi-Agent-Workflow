#!/bin/bash
# Install dependencies for MAW on Linux
# Auto-generated Linux compatibility script

set -e

echo "========================================="
echo "MAW Linux Dependencies Installer"
echo "========================================="
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
   echo -e "${RED}Please do not run this script as root or with sudo${NC}"
   echo "The script will ask for sudo when needed"
   exit 1
fi

# Function to check if command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Update package lists
echo -e "${YELLOW}[1/5]${NC} Updating package lists..."
sudo apt-get update -qq

# Install espeak-ng (Text-to-Speech)
echo -e "${YELLOW}[2/5]${NC} Installing espeak-ng (Text-to-Speech)..."
if command_exists espeak-ng; then
    echo -e "${GREEN}✓${NC} espeak-ng already installed"
else
    sudo apt-get install -y espeak-ng
    echo -e "${GREEN}✓${NC} espeak-ng installed"
fi

# Install libnotify-bin (Desktop Notifications)
echo -e "${YELLOW}[3/5]${NC} Installing notify-send (Desktop Notifications)..."
if command_exists notify-send; then
    echo -e "${GREEN}✓${NC} notify-send already installed"
else
    sudo apt-get install -y libnotify-bin
    echo -e "${GREEN}✓${NC} notify-send installed"
fi

# Install tmux (Terminal Multiplexer)
echo -e "${YELLOW}[4/5]${NC} Installing tmux (Terminal Multiplexer)..."
if command_exists tmux; then
    echo -e "${GREEN}✓${NC} tmux already installed"
else
    sudo apt-get install -y tmux
    echo -e "${GREEN}✓${NC} tmux installed"
fi

# Install jq (JSON Parser)
echo -e "${YELLOW}[5/5]${NC} Installing jq (JSON Parser)..."
if command_exists jq; then
    echo -e "${GREEN}✓${NC} jq already installed"
else
    sudo apt-get install -y jq
    echo -e "${GREEN}✓${NC} jq installed"
fi

# Optional: Install yq (TOML/YAML Parser)
echo ""
echo -e "${YELLOW}[Optional]${NC} Installing yq (TOML/YAML Parser)..."
if command_exists yq; then
    echo -e "${GREEN}✓${NC} yq already installed"
else
    if command_exists snap; then
        echo "Installing yq via snap..."
        sudo snap install yq
        echo -e "${GREEN}✓${NC} yq installed via snap"
    else
        echo -e "${YELLOW}⚠${NC} snap not found, skipping yq installation"
        echo "   You can install yq manually from: https://github.com/mikefarah/yq/releases"
    fi
fi

echo ""
echo "========================================="
echo -e "${GREEN}Installation Complete!${NC}"
echo "========================================="
echo ""

# Test installations
echo "Testing installations..."
echo ""

# Test espeak-ng
if espeak-ng --version &> /dev/null; then
    echo -e "${GREEN}✓${NC} espeak-ng: Working"
    espeak-ng -v en-us+f3 "Voice test successful" &
else
    echo -e "${RED}✗${NC} espeak-ng: Failed"
fi

# Test notify-send
if notify-send "MAW Setup" "Dependencies installed successfully" -i dialog-information 2>/dev/null; then
    echo -e "${GREEN}✓${NC} notify-send: Working"
else
    echo -e "${YELLOW}⚠${NC} notify-send: May require graphical session (DISPLAY not set)"
fi

# Test tmux
if tmux -V &> /dev/null; then
    echo -e "${GREEN}✓${NC} tmux: $(tmux -V)"
else
    echo -e "${RED}✗${NC} tmux: Failed"
fi

# Test jq
if jq --version &> /dev/null; then
    echo -e "${GREEN}✓${NC} jq: $(jq --version)"
else
    echo -e "${RED}✗${NC} jq: Failed"
fi

# Test yq (optional)
if yq --version &> /dev/null; then
    echo -e "${GREEN}✓${NC} yq: Installed"
else
    echo -e "${YELLOW}⚠${NC} yq: Not installed (optional, will use defaults)"
fi

echo ""
echo "========================================="
echo "Next steps:"
echo "========================================="
echo "1. Review the setup documentation:"
echo "   cat LINUX-SETUP.md"
echo ""
echo "2. Setup MAW agents:"
echo "   .agents/setup.sh"
echo ""
echo "3. Launch agents:"
echo "   .agents/start-agents.sh profile0"
echo ""
echo "4. Customize voices (optional):"
echo "   nano scripts/agent-voices.toml"
echo "========================================="
