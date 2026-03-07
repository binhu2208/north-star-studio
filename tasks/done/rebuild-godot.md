# Task: Rebuild Flicker Godot from Scratch

**Priority:** High
**Assigned to:** John
**Due:** 2026-03-07
**Type:** System Test

## Description

Rebuild the Flicker Godot project from scratch to verify the standalone agent workflow functions correctly.

This is a **system test task** — the goal is to verify that tasks → assignment → work → commit → report flows properly through the standalone agent architecture.

## Requirements

1. **Rebuild Flicker Godot v1.0.0** from scratch:
   - Core torch mechanic (fuel drain, light radius)
   - Player movement (turn-based on grid)
   - Fuel pickups
   - 3-level progression
   - Combat system (SPACE to attack, 10% fuel cost)
   - Enemy respawn system
   - Upgrade system between levels
   - Win/lose conditions

2. **Output Location:**
   - Option A: Overwrite `flicker-godot/` 
   - Option B: Create `flicker-godot-v2/` (preferred for this test)

3. **Commit Requirements:**
   - Use proper git identity: `John <john@northstar.dev>`
   - Commit incrementally as you build
   - Final commit message: "John: Flicker Godot rebuild complete — system test passed"

4. **Report:**
   - Move this task to `tasks/done/` when complete
   - Create report in `reports/john/YYYY-MM-DD-HH-MM.md`
   - Include: time taken, any issues, confirmation that workflow works

## Acceptance Criteria

- [ ] Game builds and runs in Godot 4
- [ ] All core mechanics functional
- [ ] Code committed with proper identity
- [ ] Report filed
- [ ] Task moved to done/

## Notes

This is a test of the standalone agent system. Document any friction points or issues you encounter so we can improve the workflow.

**Start this task on your next cron run.**
