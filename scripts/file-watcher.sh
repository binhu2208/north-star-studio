#!/bin/bash
# North Star Studio - File Watcher & Webhook Trigger
# Monitors tasks/todo/ and triggers OpenClaw webhook when new tasks appear

STUDIO_DIR="/Users/binhu2208/.openclaw/workspace/studio"
TASKS_TODO="$STUDIO_DIR/tasks/todo"
WEBHOOK_URL="http://localhost:18789/hooks/studio-task-trigger"
WEBHOOK_TOKEN="north-star-studio-webhook-2026"
LOG_FILE="/Users/binhu2208/.openclaw/workspace/studio/logs/file-watcher.log"

# Create logs directory if not exists
mkdir -p "$(dirname "$LOG_FILE")"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "Starting North Star Studio file watcher..."
log "Monitoring: $TASKS_TODO"

# Get initial file count
LAST_COUNT=$(ls -1 "$TASKS_TODO"/*.md 2>/dev/null | wc -l)
log "Initial task count: $LAST_COUNT"

# Main loop - check every 60 seconds
while true; do
    sleep 60
    
    # Count current files
    CURRENT_COUNT=$(ls -1 "$TASKS_TODO"/*.md 2>/dev/null | wc -l)
    
    # If new files detected
    if [ "$CURRENT_COUNT" -gt "$LAST_COUNT" ]; then
        NEW_FILES=$((CURRENT_COUNT - LAST_COUNT))
        log "New task(s) detected: $NEW_FILES new file(s)"
        
        # Trigger OpenClaw webhook
        RESPONSE=$(curl -s -w "%{http_code}" -X POST "$WEBHOOK_URL" \
            -H "Authorization: Bearer $WEBHOOK_TOKEN" \
            -H "Content-Type: application/json" \
            -d "{\"new_tasks\": $NEW_FILES, \"timestamp\": \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"}" 2>&1)
        
        HTTP_CODE="${RESPONSE: -3}"
        
        if [ "$HTTP_CODE" = "200" ]; then
            log "Webhook triggered successfully (HTTP $HTTP_CODE)"
        else
            log "Webhook failed (HTTP $HTTP_CODE): ${RESPONSE%???}"
        fi
        
        # Update last count
        LAST_COUNT=$CURRENT_COUNT
    fi
done