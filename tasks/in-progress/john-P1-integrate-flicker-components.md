# TASK: Integrate Flicker Godot Components

**Priority:** P1-Critical  
**Type:** Integration  
**Parent Task:** Build Flicker Godot  
**Status:** 🔄 IN PROGRESS - Claimed by John
**Created by:** Shig  
**Date:** 2026-03-06

## Objective
Integrate all components from John, Yoshi, and Hideo into a cohesive, playable Flicker Godot build.

## Prerequisites (ALL must be complete)
- [x] P1-[john]-build-flicker-godot.md → Core systems implemented
- [x] P1-[yoshi]-create-flicker-art.md → All art assets delivered
- [x] P1-[hideo]-design-flicker-balance.md → Balance numbers finalized

## Integration Tasks

### 1. Asset Integration
- [ ] Import all sprites into Godot project
- [ ] Set up animation players for player/enemy
- [ ] Configure tilesets with wall/floor tiles
- [ ] Apply VFX (particles, lighting)

### 2. Balance Integration
- [ ] Apply Hideo's balance numbers to torch system
- [ ] Configure enemy spawn rates per level
- [ ] Set upgrade costs and effects
- [ ] Tune level difficulty scaling

### 3. Polish Pass
- [ ] Ensure all animations sync with gameplay
- [ ] Verify lighting effects match torch state
- [ ] Test all three levels flow correctly
- [ ] Confirm upgrade system works between levels

### 4. Build Verification
- [ ] Game runs without errors
- [ ] No missing assets or placeholder sprites
- [ ] All UI elements functional
- [ ] 5-minute playtest feels complete

## Deliverables
- Fully integrated Godot project in `flicker-godot/`
- Integration notes (any issues found)
- Ready for QA handoff

## Assignment
**[john]** — Lead integration (you know the codebase best)

## Blockers
None - all prerequisites complete.
