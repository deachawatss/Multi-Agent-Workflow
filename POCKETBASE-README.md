# PocketBase Setup for MAW

PocketBase is now installed and ready to use for multi-agent coordination.

## Quick Start

```bash
# Start PocketBase server
./start-pocketbase.sh
```

## First Time Setup

1. **Start the server:**
   ```bash
   ./start-pocketbase.sh
   ```

2. **Open Admin UI in browser:**
   - URL: http://0.0.0.0:8090/_/
   - Or: http://localhost:8090/_/

3. **Create admin account:**
   - Email: `deachawat@gmail.com`
   - Password: `Wind@password9937`

## Usage

**Server URLs:**
- API: `http://0.0.0.0:8090`
- Admin UI: `http://0.0.0.0:8090/_/`
- From other machines: `http://YOUR_IP:8090`

**Features:**
- Agent-to-agent messaging via inbox collection
- Real-time data synchronization
- RESTful API with JWT authentication
- SQLite database (stored in `pb_data/`)

## Inbox Collection

The inbox collection for agent coordination has these fields:
- `from_agent` - Sender agent ID
- `to_agent` - Receiver agent ID  
- `message` - Message content
- `status` - unread | processing | done | failed
- `priority` - Priority number
- `metadata` - JSON metadata

## Documentation

See `docs/POCKETBASE-INBOX.md` for complete API reference and usage examples.

## Stopping

Press `Ctrl+C` in the terminal where PocketBase is running.

## Data Location

- **Database**: `pb_data/data.db`
- **Logs**: `pb_data/logs.db`
- **Backups**: `pb_data/backups/`

All data is ignored by git (see `.gitignore`).
