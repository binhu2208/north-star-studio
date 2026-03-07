# John Developer Cron Job

## Schedule
Every 30 minutes: `*/30 * * * *`

## Tasks
1. Check tasks/in-progress/ for assignments
2. Check GitHub issues for bugs
3. Do development work
4. Commit code with proper git identity
5. Move completed tasks to tasks/done/
6. Report status to reports/john/
7. Escalate blockers to tasks/blocked/

## Sub-agents Can Spawn
- john-bugfix: Fix specific bugs
- john-feature: Implement features
- john-refactor: Code cleanup
- john-optimize: Performance work

## Git Identity
```bash
git config user.name "John"
git config user.email "john@northstar.dev"
```

## Report Format
reports/john/YYYY-MM-DD-HH-MM.md