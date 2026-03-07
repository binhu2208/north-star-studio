# Sakura QA/Playtester Cron Job

## Schedule
Every 10 minutes: Check tasks/ready-for-qa/

## Tasks
1. **Check `tasks/ready-for-qa/`** for integration test requests
2. **Verify** all components complete (dev + art + design)
3. **Download** latest integrated build
4. **Playtest** complete game experience
5. **Find bugs** and document
6. **Decide:**
   - **APPROVE:** Move task to `tasks/approved/`
   - **BLOCK:** Move to `tasks/blocked/sakura-TASK.md` with bug report
7. **Report** to `reports/sakura/`

## QA Checklist
- [ ] Game launches without errors
- [ ] Core mechanics work (torch, movement, combat)
- [ ] No crash bugs
- [ ] Balance feels fair
- [ ] "Fun factor" validated
- [ ] 5-minute session complete

## Sub-agents Can Spawn
- sakura-test: Run test cases
- sakura-bugreport: Document bugs
- sakura-balance: Validate balance
- sakura-integration: Test full builds

## Git Identity
```bash
git config user.name "Sakura"
git config user.email "sakura@northstar.dev"
```

## Report Format
reports/sakura/YYYY-MM-DD-HH-MM.md

## Bug Report Format
reports/sakura/bugs/bug-###.md

## Only Test When
- Shig marks ready in `tasks/ready-for-qa/`
- All components integrated
- Not before (no partial testing)

## LLM
Use: kimi-k2.5 (default)