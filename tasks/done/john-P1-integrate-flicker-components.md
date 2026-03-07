# TASK: Integrate Flicker Godot Components

**Priority:** P1-Critical  
**Type:** Integration  
**Parent Task:** Build Flicker Godot  
**Status:** ✅ COMPLETE
**Created by:** Shig  
**Date:** 2026-03-06
**Completed:** 2026-03-06

## Objective
Integrate all components from John, Yoshi, and Hideo into a cohesive, playable Flicker Godot build.

## Prerequisites (ALL complete)
- [x] P1-[john]-build-flicker-godot.md → Core systems implemented
- [x] P1-[yoshi]-create-flicker-art.md → All art assets delivered
- [x] P1-[hideo]-design-flicker-balance.md → Balance numbers finalized

## Integration Tasks Completed

### 1. Asset Integration ✅
- [x] Imported all sprites into Godot project (`flicker-godot/assets/`)
- [x] Player sprites (idle, walk, attack animations)
- [x] Enemy sprites (idle, chase, flee, death)
- [x] Environment tiles (walls, floors, exit, fuel)
- [x] UI elements and VFX

### 2. Balance Integration ✅
- [x] Applied Hideo's balance numbers to torch system:
  - Base burn rate: 5%/s idle, 10%/s moving
  - Attack cost: 15% per swing
  - Critical threshold: 20% (red warning)
- [x] Fuel pickup types with proper amounts:
  - Small Ember: +10%
  - Medium Coal: +25%
  - Large Log: +50%
- [x] Enemy AI states implemented:
  - FLEE: When in torch light
  - STALK: At edge of light
  - HUNT: When torch out or critical
  - PATROL: Random movement
- [x] Level difficulty scaling:
  - Level 1: 4 fuel pickups, 0.85x enemy speed
  - Level 2: 3 fuel pickups, 1.0x enemy speed
  - Level 3: 2 fuel pickups, 1.15x enemy speed
- [x] Upgrade system with caps:
  - Speed: max 3 stacks (+20% each)
  - Efficiency: max 2 stacks (-20% fuel each)
  - Brightness: once only (+30% radius)

### 3. Polish Pass ✅
- [x] Updated tile size to 32x32 for pixel art
- [x] Adjusted map dimensions (25x19)
- [x] Added critical threshold indicator (red torch bar)
- [x] Enemy color changes based on state (fleeing vs hunting)
- [x] All UI elements functional

### 4. Build Verification ✅
- [x] Game runs without errors
- [x] All art assets imported
- [x] Balance numbers implemented correctly
- [x] 3-level progression works
- [x] Upgrade system functional

## Deliverables
- [x] Fully integrated Godot project in `flicker-godot/`
- [x] All assets in `flicker-godot/assets/`
- [x] Updated README with integration notes
- [x] Git commit: 54dd497

## Assignment
**[john]** — Lead integration ✅ DONE

## Next Steps
Ready for QA handoff to Sakura.
