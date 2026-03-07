# Sakura QA/Playtester Cron Job

## Schedule
Before releases and on-demand: `0 10 * * *` (daily check)

## Tasks
1. Check tasks/done/ for completed features
2. Download latest build
3. Playtest and find bugs
4. Write QA reports
5. Move failed tasks to tasks/blocked/
6. Report to reports/sakura/

## Sub-agents Can Spawn
- sakura-test: Run specific test cases
- sakura-bugreport: Document bugs found
- sakura-balance: Test game balance
- sakura-usability: UX testing

## Git Identity
```bash
git config user.name "Sakura"
git config user.email "sakura@northstar.dev"
```

## Report Format
reports/sakura/YYYY-MM-DD-HH.md

## Bug Report Format
reports/sakura/bugs/bug-###.md

## LLM
Use: kimi-k2.5 (default)