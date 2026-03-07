# TASK: Rebuild Flicker Godot from Scratch

**Priority:** P1-Critical
**Type:** Development
**Created by:** bin
**Date:** 2026-03-06

## Objective
Rebuild the Flicker Godot version from scratch to test the self-serve standalone agent system.

## Requirements
1. Create new Godot 4.x project
2. Implement core mechanics:
   - Grid-based player movement (WASD/arrow keys)
   - Torch that burns in real-time
   - Light radius shrinks as fuel drops
   - Enemy flees from light, chases in dark
   - Relight stations
   - Win: Reach exit
   - Lose: Caught by enemy or torch dies
3. Add 3-level progression with upgrades
4. Add combat system (SPACE to attack)
5. Polish and test

## Deliverables
- Working Godot project in `flicker-godot-v2/` or overwrite `flicker-godot/`
- Clean code structure
- README with build instructions
- All commits with proper git identity

## Team Assignment
- **John (Dev):** Core implementation
- **Hideo (Design):** Balance and mechanics tuning
- **Yoshi (Art):** Visual style and assets
- **Sakura (QA):** Testing and bug reports

## Success Criteria
- Game runs without errors
- All features implemented
- QA approved

## Notes
This is a system test. Verify the self-serve workflow works properly.