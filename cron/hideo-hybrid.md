# Hideo Design - Hybrid Self-Serve Mode

## Schedule
Every 10 minutes: Check tasks/todo/ and execute

## Workflow
1. **Poll** `tasks/todo/` for available tasks
2. **Filter** for design-related tasks
3. **Sort by priority:** P1 first, then P2, then P3
4. **Claim** highest priority design task
   - Rename: `tasks/in-progress/hideo-P1-task.md`
5. **Design** the solution
6. **Document** in design docs
7. **Commit** to GitHub
8. **Complete** by moving to `tasks/done/hideo-P1-task.md`

## Priority Guide
- **P1:** Critical balance issues, broken mechanics
- **P2:** New mechanics, level design
- **P3:** Polish, edge cases

## Self-Serve Rules
- Pick highest priority design task
- Coordinate with John on feasibility
- Don't wait for assignment
- Escalate conflicts to Shig

## Git Identity
```bash
git config user.name "Hideo"
git config user.email "hideo@northstar.dev"
```

## Sub-agents
- hideo-balance
- hideo-mechanics
- hideo-levels

## Strategic Direction
Shig prioritizes based on market. You design highest priority.