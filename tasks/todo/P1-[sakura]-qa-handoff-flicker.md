# TASK: QA Handoff - Flicker Godot

**Priority:** P1-Critical  
**Type:** QA  
**Parent Task:** Build Flicker Godot  
**Status:** Ready for pickup  
**Created by:** Shig  
**Date:** 2026-03-06

## Objective
Perform comprehensive QA testing on the integrated Flicker Godot build.

## Prerequisites
- [ ] P1-[john]-integrate-flicker-components.md → Integration complete

## QA Checklist

### Core Mechanics
- [ ] Player moves smoothly with WASD/arrow keys
- [ ] Torch burns down at correct rate
- [ ] Light radius shrinks visually as fuel drops
- [ ] Fuel pickups restore correct amount
- [ ] Torch death triggers game over

### Enemy Behavior
- [ ] Enemies flee from torch light
- [ ] Enemies chase when torch is out/dim
- [ ] Enemy speed feels balanced
- [ ] Combat (SPACE attack) works and costs fuel
- [ ] Enemy respawn works after 5 seconds

### Level System
- [ ] Procedural generation creates playable levels
- [ ] Level 1: Tutorial feel, forgiving
- [ ] Level 2: Moderate challenge
- [ ] Level 3: Hard, tense
- [ ] Exit portal works to advance
- [ ] Win screen shows on level 3 completion

### Upgrade System
- [ ] Speed boost upgrade applies correctly
- [ ] Fuel efficiency upgrade works
- [ ] Torch brightness upgrade visible
- [ ] Upgrade costs feel fair

### UI/UX
- [ ] Torch fuel bar is clear and accurate
- [ ] Level indicator visible
- [ ] Game over screen functional
- [ ] Win screen functional
- [ ] Restart option works

### Visual Polish
- [ ] No missing sprites or placeholders
- [ ] Animations play correctly
- [ ] Lighting effects look good
- [ ] No visual glitches

### Stability
- [ ] No crashes during 30-minute play session
- [ ] No error messages in console
- [ ] Consistent frame rate

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
- QA report with pass/fail status
- Bug reports (if any)
- Sign-off or request for fixes

## Assignment
**[sakura]** — Full QA pass

## Success Criteria
- All checklist items pass
- No blocker bugs
- "Just one more run" feeling achieved
