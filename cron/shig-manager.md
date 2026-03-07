# Shig Manager Cron Job

## Schedule
Every hour: `0 * * * *`

## Tasks
1. Check GitHub for all team commits
2. Review tasks/todo/ and assign
3. Check tasks/in-progress/ for stalled work (>24h)
4. Review tasks/done/ for QA handoff
5. Read all reports/
6. Consolidate status
7. Escalate blockers to bin/Mac
8. Create summary report

## Sub-agents Can Spawn
- shig-assigner: Assign tasks to team
- shig-reviewer: Review completed work
- shig-reporter: Create status reports
- shig-escalator: Handle blockers

## Report Format
reports/shig/YYYY-MM-DD-HH-MM.md

## Escalation Trigger
- Task blocked >24h
- Team member no commits >48h
- Critical bug found
- Scope change needed