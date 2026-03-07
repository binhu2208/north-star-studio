#!/bin/bash
# North Star Studio - Daily Sync Trigger
# Runs at 6 PM daily to trigger Shig's summary and GitHub commit

STUDIO_DIR="/Users/binhu2208/.openclaw/workspace/studio"
WEBHOOK_URL="http://localhost:18789/hooks/studio-daily-sync"
WEBHOOK_TOKEN="north-star-studio-webhook-2026"
LOG_FILE="/Users/binhu2208/.openclaw/workspace/studio/logs/daily-sync.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "=== DAILY SYNC TRIGGERED ==="

# Trigger Shig's daily summary webhook
RESPONSE=$(curl -s -w "%{http_code}" -X POST "$WEBHOOK_URL" \
    -H "Authorization: Bearer $WEBHOOK_TOKEN" \
    -H "Content-Type: application/json" \
    -d "{\"sync_type\": \"daily\", \"timestamp\": \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"}" 2>&1)

HTTP_CODE="${RESPONSE: -3}"

if [ "$HTTP_CODE" = "200" ]; then
    log "Daily sync webhook triggered successfully (HTTP $HTTP_CODE)"
else
    log "Daily sync webhook failed (HTTP $HTTP_CODE): ${RESPONSE%???}"
fi

# Also commit all local work to GitHub
cd "$STUDIO_DIR"
if [ -n "$(git status --porcelain)" ]; then
    git add -A
    git commit -m "Daily sync: $(date '+%Y-%m-%d %H:%M')"
    git push origin main
    log "Changes committed and pushed to GitHub"
else
    log "No changes to commit"
fi

log "=== DAILY SYNC COMPLETE ==="