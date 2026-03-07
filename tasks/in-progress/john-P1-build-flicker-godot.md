# TASK: Build Flicker Godot from Scratch

**Priority:** P1-Critical  
**Type:** Development  
**Status:** Approved by Shig (Market analysis complete)  
**Created by:** bin  
**Date:** 2026-03-06

## Background
- **Gabe:** Market analysis complete — Torch Roguelike viable, $1.5B market
- **Shig:** Approved for production — Prioritize Godot version for Steam/Switch
- **Target:** PC (Steam) → Nintendo Switch

## Objective
Build Flicker (Torch Roguelike) in Godot 4.x from scratch.

## Core Requirements

### 1. Player System
- [ ] Grid-based movement (WASD/arrow keys)
- [ ] Player sprite with animations
- [ ] Collision detection with walls

### 2. Torch Mechanic (Core Innovation)
- [ ] Torch burns in real-time
- [ ] Light radius shrinks as fuel drops (0-100%)
- [ ] Visual feedback: Bright → Normal → Dim → Critical
- [ ] Fuel pickups to replenish
- [ ] Torch dies = game over

### 3. Enemy System
- [ ] Enemy AI: Flees from torch light
- [ ] Enemy AI: Chases player when torch is out
- [ ] Enemy sprite with animations
- [ ] Combat: SPACE to attack (costs fuel)
- [ ] Enemy respawn after 5 seconds

### 4. Level System
- [ ] Procedural dungeon generation
- [ ] 3 levels with increasing difficulty
- [ ] Exit to reach next level
- [ ] Win: Complete level 3

### 5. Upgrade System (Between Levels)
- [ ] Speed boost
- [ ] Fuel efficiency
- [ ] Torch brightness

### 6. UI/UX
- [ ] Torch fuel bar
- [ ] Level indicator
- [ ] Game over screen
- [ ] Win screen
- [ ] Restart option

### 7. Godot Features
- [ ] 2D lighting with PointLight2D
- [ ] Real-time shadows
- [ ] Smooth animations
- [ ] Clean scene structure

## Deliverables
- Godot project in `flicker-godot/` (overwrite existing)
- Clean, documented code
- README with build instructions
- All commits with proper git identity

## Team Assignment
- **[john]:** Core systems (player, torch, enemy AI)
- **[yoshi]:** Art assets (player, enemy, tiles, UI)
- **[hideo]:** Balance tuning (fuel rates, difficulty curve)

## Success Criteria
- Game runs without errors
- All core mechanics implemented
- 5-minute play session feels complete
- "Just one more run" feeling

## Notes
This is a production build, not a prototype. Quality matters for Steam release.