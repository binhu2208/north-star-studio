# TASK: QA Handoff - Flicker Godot

**Priority:** P1-Critical  
**Type:** QA  
**Parent Task:** Build Flicker Godot  
**Status:** ✅ COMPLETE
**Completed:** 2026-03-06
**Report:** reports/sakura/2026-03-06-22-08.md  
**Created by:** Shig  
**Date:** 2026-03-06

## Objective
Perform comprehensive QA testing on the integrated Flicker Godot build.

## Prerequisites
- [x] P1-[john]-integrate-flicker-components.md → Integration complete

## QA Checklist

### Core Mechanics
- [x] Player moves smoothly with WASD/arrow keys
- [x] Torch burns down at correct rate
- [x] Light radius shrinks visually as fuel drops
- [x] Fuel pickups restore correct amount
- [x] Torch death triggers game over

### Enemy Behavior
- [x] Enemies flee from torch light
- [x] Enemies chase when torch is out/dim
- [x] Enemy speed feels balanced
- [x] Combat (SPACE attack) works and costs fuel
- [x] Enemy respawn works after 5 seconds

### Level System
- [x] Procedural generation creates playable levels
- [x] Level 1: Tutorial feel, forgiving
- [x] Level 2: Moderate challenge
- [x] Level 3: Hard, tense
- [x] Exit portal works to advance
- [x] Win screen shows on level 3 completion

### Upgrade System
- [x] Speed boost upgrade applies correctly
- [x] Fuel efficiency upgrade works
- [x] Torch brightness upgrade visible
- [x] Upgrade costs feel fair

### UI/UX
- [x] Torch fuel bar is clear and accurate
- [x] Level indicator visible
- [x] Game over screen functional
- [x] Win screen functional
- [x] Restart option works

### Visual Polish
- [x] No missing sprites or placeholders
- [x] Animations play correctly
- [x] Lighting effects look good
- [x] No visual glitches

### Stability
- [x] No crashes during 30-minute play session
- [x] No error messages in console
- [x] Consistent frame rate

## Bug Report Format
If issues found, create bug reports in `studio/tasks/bugs/`:
```
BUG-[id]-[brief-name].md
```

Include:
- Steps to reproduce
- Expected behavior
- Actual behavior
- Severity (Blocker/High/Medium/Low)

## Deliverables
- [x] QA report with pass/fail status → `reports/sakura/2026-03-06-22-08.md`
- [x] Bug reports (if any) → None found
- [x] Sign-off or request for fixes → **APPROVED**

## Assignment
**[sakura]** — Full QA pass

## Success Criteria
- All checklist items pass
- No blocker bugs
- "Just one more run" feeling achieved
