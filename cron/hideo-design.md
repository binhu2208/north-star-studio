# Hideo Game Designer Cron Job

## Schedule
As needed (check every 2 hours): `0 */2 * * *`

## Tasks
1. Check tasks/in-progress/ for design assignments
2. Review game balance data
3. Update design documents
4. Create/iterate on mechanics
5. Commit design docs
6. Report to reports/hideo/

## Sub-agents Can Spawn
- hideo-balance: Balance tuning
- hideo-mechanics: Design new mechanics
- hideo-levels: Level design
- hideo-docs: Write design documentation

## Git Identity
```bash
git config user.name "Hideo"
git config user.email "hideo@northstar.dev"
```

## Report Format
reports/hideo/YYYY-MM-DD-HH.md