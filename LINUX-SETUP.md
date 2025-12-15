# Linux Setup Guide

## Prerequisites

This Multi-Agent Workflow (MAW) project has been adapted from macOS to work on Linux. Follow these steps to set up the environment.

## Required Dependencies

### 1. Install espeak-ng (Text-to-Speech)
```bash
sudo apt-get update
sudo apt-get install espeak-ng
```

**Verify installation:**
```bash
espeak-ng --voices
espeak-ng -v en-us+f3 "Hello from Linux"
```

### 2. Install notify-send (Desktop Notifications)
Most Linux distributions have this pre-installed with libnotify:
```bash
sudo apt-get install libnotify-bin
```

**Verify installation:**
```bash
notify-send "Test" "Notification working" -i dialog-information
```

### 3. Install tmux (Terminal Multiplexer)
```bash
sudo apt-get install tmux
```

### 4. Install jq (JSON Parser)
```bash
sudo apt-get install jq
```

### 5. Install yq (TOML/YAML Parser) - Optional but recommended
```bash
# Using snap
sudo snap install yq

# Or download binary from: https://github.com/mikefarah/yq/releases
```

## Quick Start

Once dependencies are installed:

```bash
cd /home/deachawat/dev/projects/MAW

# Setup MAW agents
.agents/setup.sh

# Launch tmux session with agents
.agents/start-agents.sh profile0

# Smart sync all agents
scripts/smart-sync.sh
```

## Voice Configuration

The project uses espeak-ng voices configured in `scripts/agent-voices.toml`:

- **Main**: `en-us+f3` (US English Female)
- **Agent 1**: `en-gb+m3` (British Male)
- **Agent 2**: `en-au+f2` (Australian Female)  
- **Agent 3**: `en-in+m2` (Indian Male)
- **Subagent**: `en-gb+m3` (British Male)

**List available voices:**
```bash
espeak-ng --voices
```

**Customize voices** by editing `/home/deachawat/dev/projects/MAW/scripts/agent-voices.toml`

## Changes from macOS Version

### Voice Notifications
- **macOS**: `say -v "Samantha"` → **Linux**: `espeak-ng -v "en-us+f3"`
- Voice names updated to espeak-ng format (e.g., `en-us+f3`, `en-gb+m3`)
- Speech rate parameter changed from `-r` to `-s` (both use WPM)

### Desktop Notifications
- **macOS**: `osascript` → **Linux**: `notify-send`
- Notification icons added via `-i dialog-information`

### Other Components
- tmux, jq, bash scripts remain compatible
- Lock mechanism using `mkdir` (atomic operation) works on both systems

## Troubleshooting

### No voice output
```bash
# Test espeak-ng directly
espeak-ng -v en-us+f3 "Testing voice"

# Check if espeak-ng is in PATH
which espeak-ng
```

### No desktop notifications
```bash
# Ensure you're in a graphical session
echo $DISPLAY

# Test notify-send
notify-send "Test" "Message"
```

### TOML parsing errors
```bash
# Install yq for better TOML support
sudo snap install yq

# Or fallback to default voices (hardcoded)
```

## Project Structure

```
/home/deachawat/dev/projects/MAW/
├── .claude/agents/        # 9 custom subagents
├── .claude/commands/      # 17+ slash commands
├── .agents/               # MAW toolkit
│   ├── agents.yaml       # Agent registry
│   ├── profiles/         # Tmux layouts (0-5)
│   └── scripts/          # Setup, start, sync
├── scripts/               # Voice & notification hooks
│   ├── agent-voices.toml          # Voice configuration
│   ├── agent-start-notify.sh      # Start notifications
│   └── agent-complete-notify.sh   # Completion notifications
├── ψ-docs/               # Technical documentation
├── ψ-learnings/          # Distilled wisdom
└── ψ-retrospectives/     # Session retrospectives
```

## Next Steps

1. ✅ Install all dependencies listed above
2. ✅ Run `scripts/agent-voices.toml` to verify voice configuration
3. ✅ Test notification scripts manually
4. ✅ Run setup script: `.agents/setup.sh`
5. ✅ Launch agents: `.agents/start-agents.sh profile0`

## Documentation

- [DEVELOPMENT-REPORT.md](ψ-docs/DEVELOPMENT-REPORT.md) - Full project documentation
- [CLAUDE-CODE-EXTENSIBILITY.md](ψ-docs/maw/CLAUDE-CODE-EXTENSIBILITY.md) - Claude Code hooks
- [SMART-SYNC.md](ψ-docs/maw/SMART-SYNC.md) - Intelligent synchronization
- [AI-SELF-LEARNING.md](ψ-docs/AI-SELF-LEARNING.md) - Self-improvement patterns
