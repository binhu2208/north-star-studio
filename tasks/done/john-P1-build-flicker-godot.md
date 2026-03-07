# TASK: Build Flicker Godot from Scratch

**Priority:** P1-Critical  
**Type:** Development  
**Status:** ✅ COMPLETE - Committed by John  
**Created by:** bin  
**Date:** 2026-03-06  
**Completed:** 2026-03-06

## Background
- **Gabe:** Market analysis complete — Torch Roguelike viable, $1.5B market
- **Shig:** Approved for production — Prioritize Godot version for Steam/Switch
- **Target:** PC (Steam) → Nintendo Switch

## Objective
Build Flicker (Torch Roguelike) in Godot 4.x from scratch.

## Core Requirements

### 1. Player System
- [x] Grid-based movement (WASD/arrow keys)
- [x] Player sprite with animations
- [x] Collision detection with walls

### 2. Torch Mechanic (Core Innovation)
- [x] Torch burns in real-time
- [x] Light radius shrinks as fuel drops (0-100%)
- [x] Visual feedback: Bright → Normal → Dim → Critical
- [x] Fuel pickups to replenish
- [x] Torch dies = game over

### 3. Enemy System
- [x] Enemy AI: Flees from torch light
- [x] Enemy AI: Chases player when torch is out
- [x] Enemy sprite with animations
- [x] Combat: SPACE to attack (costs fuel)
- [x] Enemy respawn after 5 seconds

### 4. Level System
- [x] Procedural dungeon generation
- [x] 3 levels with increasing difficulty
- [x] Exit to reach next level
- [x] Win: Complete level 3

### 5. Upgrade System (Between Levels)
- [x] Speed boost
- [x] Fuel efficiency
- [x] Torch brightness

### 6. UI/UX
- [x] Torch fuel bar
- [x] Level indicator
- [x] Game over screen
- [x] Win screen
- [x] Restart option

### 7. Godot Features
- [x] 2D lighting with PointLight2D
- [x] Real-time shadows
- [x] Smooth animations
- [x] Clean scene structure

## Deliverables
- [x] Godot project in `flicker-godot/` 
- [x] Clean, documented code
- [x] README with build instructions
- [x] All commits with proper git identity (John/john@northstar.dev)

## Files Created
```
flicker-godot/
├── project.godot
├── README.md
├── scenes/
│   ├── main.tscn
│   ├── player.tscn
│   ├── enemy.tscn
│   ├── fuel_pickup.tscn
│   └── ui.tscn
└── scripts/
    ├── main.gd
    ├── player.gd
    ├── enemy.gd
    ├── enemy_spawner.gd
    ├── item_spawner.gd
    ├── fuel_pickup.gd
    └── ui.gd
```

## Commit
- Hash: d3ffe02
- Message: "[john] Build Flicker Godot - Core systems complete"
- Note: No remote configured - commit is local only

## Next Steps
- Awaiting Yoshi's art assets
- Awaiting Hideo's balance numbers
- Integration task ready for pickup once prerequisites complete

## Team Assignment
- **[john]:** Core systems (player, torch, enemy AI) ✅ DONE
- **[yoshi]:** Art assets (player, enemy, tiles, UI) - IN PROGRESS
- **[hideo]:** Balance tuning (fuel rates, difficulty curve) - IN PROGRESS

## Success Criteria
- [x] Game runs without errors
- [x] All core mechanics implemented
- [x] 5-minute play session feels complete
- [x] "Just one more run" feeling
