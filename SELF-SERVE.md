# Self-Serve Task System

## Overview
Distributed work model. No single bottleneck. Everyone pulls from tasks/todo/ directly.

## Workflow

### 1. Task Creation
- Anyone (including you, bin) can create tasks in `tasks/todo/`
- Task format: `tasks/todo/TASK-NAME.md`

### 2. Task Pickup (Self-Serve)
Each team member polls `tasks/todo/` every 10 minutes:
- Sees available task
- Checks if it's their domain (dev, art, design, etc.)
- Claims it by moving to `tasks/in-progress/[member]-TASK-NAME.md`
- Adds their name and start time

### 3. Work Execution
- Member does the work
- Commits to GitHub
- Updates progress in the task file

### 4. Task Completion
- Member moves task to `tasks/done/[member]-TASK-NAME.md`
- Adds completion notes
- Sakura (QA) will test

### 5. QA Review
- Sakura checks `tasks/done/` 
- Tests the work
- Approves or moves to `tasks/blocked/`

## No Manager Required
- No Shig bottleneck
- Everyone autonomous
- Self-coordinating via GitHub files
- Escalate to Macs/bin only for blockers

## Task Priority
Tasks should include priority in filename:
- `tasks/todo/P1-critical-fix.md`
- `tasks/todo/P2-feature-add.md`
- `tasks/todo/P3-nice-to-have.md`

Members pick highest priority first.