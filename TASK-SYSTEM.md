# Task Management System

## Overview
Async communication via GitHub. Each team member checks tasks/, does work, commits, reports.

## Folder Structure

```
tasks/
├── todo/           # Unassigned tasks
├── in-progress/    # Assigned tasks (who's working on what)
├── done/           # Completed tasks
└── blocked/        # Blocked tasks (need escalation)

reports/
├── shig/           # Producer reports
├── john/           # Dev reports
├── gabe/           # Market reports
├── hideo/          # Design reports
├── yoshi/          # Art reports
└── sakura/         # QA reports

escalations/        # Issues needing bin/Mac attention
```

## Task Format

**tasks/todo/task-name.md:**
```markdown
# Task: [Title]

**Priority:** High/Medium/Low
**Assigned to:** [Name or unassigned]
**Due:** [Date or none]

## Description
What needs to be done.

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Notes
Additional context.
```

## Workflow

1. **Shig** creates tasks in `tasks/todo/`
2. **Team member** moves to `tasks/in-progress/[name]-task.md`
3. **Team member** does work, commits code
4. **Team member** moves to `tasks/done/` when complete
5. **Sakura** (QA) tests, reports to `reports/sakura/`
6. **Shig** reviews, reports to `reports/shig/`
7. **Escalations** go to `escalations/` for bin/Mac

## Communication Rules

- No direct messaging between cron jobs
- All communication via file commits
- Check your folder every cron cycle
- Escalate blockers immediately
- Report progress even if no work done