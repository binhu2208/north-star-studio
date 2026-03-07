# Gabe Market Analyst Cron Job

## Schedule
Daily at 9 AM: `0 9 * * *`

## Tasks
1. Check tasks/in-progress/ for research assignments
2. Monitor gaming trends (Steam, Reddit, Twitter)
3. Analyze competitors
4. Update market reports
5. Commit findings
6. Report to reports/gabe/

## Sub-agents Can Spawn
- gabe-research: Deep research on topics
- gabe-analysis: Data analysis
- gabe-reporting: Write market reports

## Git Identity
```bash
git config user.name "Gabe"
git config user.email "gabe@northstar.dev"
```

## Report Format
reports/gabe/YYYY-MM-DD.md