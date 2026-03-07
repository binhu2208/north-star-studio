#!/bin/bash
# North Star Studio - Smart File Watcher & Agent Dispatcher
# Monitors tasks/ folder and triggers specific agents via webhook

STUDIO_DIR="/Users/binhu2208/.openclaw/workspace/studio"
TASKS_DIR="$STUDIO_DIR/tasks"
WEBHOOK_BASE="http://localhost:18789/hooks"
WEBHOOK_TOKEN="north-star-studio-webhook-2026"
LOG_FILE="$STUDIO_DIR/logs/smart-watcher.log"

# Create logs directory
mkdir -p "$(dirname "$LOG_FILE")"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Function to trigger agent webhook
trigger_agent() {
    local AGENT=$1
    local TASK_FILE=$2
    local WEBHOOK_URL="${WEBHOOK_BASE}/agent-${AGENT}"
    
    log "Triggering $AGENT for task: $(basename "$TASK_FILE")"
    
    RESPONSE=$(curl -s -w "%{http_code}" -X POST "$WEBHOOK_URL" \
        -H "Authorization: Bearer $WEBHOOK_TOKEN" \
        -H "Content-Type: application/json" \
        -d "{\"agent\": \"$AGENT\", \"task\": \"$(basename "$TASK_FILE")\", \"timestamp\": \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"}" 2>&1)
    
    HTTP_CODE="${RESPONSE: -3}"
    
    if [ "$HTTP_CODE" = "200" ]; then
        log "✓ $AGENT triggered successfully"
        return 0
    else
        log "✗ $AGENT trigger failed (HTTP $HTTP_CODE)"
        return 1
    fi
}

# Function to check tasks and dispatch
check_and_dispatch() {
    local FOLDER=$1
    local PATTERN=$2
    local AGENT=$3
    
    # Find unclaimed tasks (not in in-progress or done)
    for task in "$FOLDER"/$PATTERN; do
        [ -e "$task" ] || continue
        
        TASK_NAME=$(basename "$task")
        
        # Check if already claimed
        if [ ! -e "$TASKS_DIR/in-progress/${AGENT}-${TASK_NAME}" ] && \
           [ ! -e "$TASKS_DIR/done/${AGENT}-${TASK_NAME}" ]; then
            
            log "New $AGENT task detected: $TASK_NAME"
            
            # Trigger the agent
            if trigger_agent "$AGENT" "$task"; then
                # Move to in-progress
                mv "$task" "$TASKS_DIR/in-progress/${AGENT}-${TASK_NAME}"
                log "→ Moved to in-progress/${AGENT}-${TASK_NAME}"
            fi
        fi
    done
}

log "=== NORTH STAR STUDIO SMART WATCHER STARTED ==="
log "Monitoring tasks for: john, yoshi, hideo, gabe, sakura, shig"

# Main loop
while true; do
    sleep 30  # Check every 30 seconds
    
    # Check todo folder for new tasks
    if [ -d "$TASKS_DIR/todo" ]; then
        
        # John - Dev tasks
        check_and_dispatch "$TASKS_DIR/todo" "P*-[john]-*.md" "john"
        check_and_dispatch "$TASKS_DIR/todo" "*[john]*.md" "john"
        
        # Yoshi - Art tasks
        check_and_dispatch "$TASKS_DIR/todo" "P*-[yoshi]-*.md" "yoshi"
        check_and_dispatch "$TASKS_DIR/todo" "*[yoshi]*.md" "yoshi"
        
        # Hideo - Design tasks
        check_and_dispatch "$TASKS_DIR/todo" "P*-[hideo]-*.md" "hideo"
        check_and_dispatch "$TASKS_DIR/todo" "*[hideo]*.md" "hideo"
        
        # Gabe - Market tasks
        check_and_dispatch "$TASKS_DIR/todo" "P*-[gabe]-*.md" "gabe"
        check_and_dispatch "$TASKS_DIR/todo" "*[gabe]*.md" "gabe"
        check_and_dispatch "$TASKS_DIR/todo" "*market*.md" "gabe"
        
        # Sakura - QA tasks (usually from done folder)
        check_and_dispatch "$TASKS_DIR/todo" "P*-[sakura]-*.md" "sakura"
        check_and_dispatch "$TASKS_DIR/todo" "*[sakura]*.md" "sakura"
        
        # Shig - Management tasks
        check_and_dispatch "$TASKS_DIR/todo" "P*-[shig]-*.md" "shig"
        check_and_dispatch "$TASKS_DIR/todo" "*[shig]*.md" "shig"
        
    fi
    
    # Check if any tasks moved to ready-for-qa (trigger Sakura)
    if [ -d "$TASKS_DIR/ready-for-qa" ]; then
        for task in "$TASKS_DIR/ready-for-qa"/*.md; do
            [ -e "$task" ] || continue
            TASK_NAME=$(basename "$task")
            log "QA task ready: $TASK_NAME"
            trigger_agent "sakura" "$task"
        done
    fi
done