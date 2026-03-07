# 🔥 Flicker - Godot Edition (Integrated v1.0)

A torch-based roguelike where light is your only weapon against the darkness. **Fully integrated build** with art, balance, and code.

## About

You are lost in the dark. Your torch is dying. Something is hunting you.

**Flicker** is a grid-based roguelike where you must navigate procedurally generated dungeons, manage your limited torch fuel, and avoid (or fight) the creature that stalks you in the shadows.

## Team

- **John (Dev):** Core systems, integration, Godot implementation
- **Yoshi (Art):** All pixel art assets, sprites, VFX
- **Hideo (Design):** Game balance, difficulty curve, progression systems

## Features

- **Grid-based movement** - WASD or Arrow keys to move
- **Dynamic lighting** - Your torch burns in real-time with shrinking light radius as fuel drops
- **Enemy AI** - The Stalker flees from torch light but chases you in darkness
- **Procedural dungeons** - Each level is randomly generated
- **3-Level progression** - Descend deeper with increasing difficulty
- **Upgrade system** - Choose upgrades between levels (Speed, Efficiency, Brightness)
- **Combat system** - Press SPACE to attack (costs 15% fuel)
- **Real-time torch mechanics** - Manage your limited fuel carefully

## Controls

| Key | Action |
|-----|--------|
| WASD / Arrows | Move |
| SPACE | Attack (costs 15% fuel) |
| R | Restart |

## How to Play

1. Navigate the dungeon using WASD or Arrow keys
2. Collect fuel pickups to replenish your torch:
   - 🔶 Small Ember: +10%
   - 🔴 Medium Coal: +25%
   - 🟥 Large Log: +50%
3. Avoid or fight 👁️ The Stalker (it flees from light!)
4. Find 🚪 the exit to descend deeper
5. Survive all 3 levels to win!

**Win Condition:** Reach the exit on level 3  
**Lose Conditions:** Get caught by the enemy OR let your torch die

## Balance (Hideo's Design)

### Torch Economy
- **Base burn rate:** 5% per second (idle)
- **Movement burn:** 10% per second (2x when moving)
- **Attack cost:** 15% per swing
- **Critical threshold:** < 20% (red warning zone)

### Enemy AI States
- **FLEE:** When in torch light, runs away from player
- **STALK:** At edge of light, circles menacingly
- **HUNT:** When torch out or critical, chases aggressively (1.3x speed)
- **PATROL:** Random movement when player not detected

### Level Scaling
| Level | Fuel Pickups | Enemy Speed | Difficulty |
|-------|--------------|-------------|------------|
| 1 | 4 (abundant) | 0.85x | Tutorial |
| 2 | 3 (moderate) | 1.0x | Test |
| 3 | 2 (scarce) | 1.15x | Gauntlet |

### Upgrades (Between Levels)
- **Swift Stride:** +20% movement speed (max 3 stacks)
- **Efficient Burn:** -20% fuel consumption (max 2 stacks)
- **Bright Flame:** +30% light radius (once only)

## Art Assets (Yoshi's Work)

All pixel art located in `assets/`:
- `player/` - Player sprites, animations, torch
- `enemy/` - Enemy sprites (idle, chase, flee, death)
- `environment/` - Wall tiles, floor tiles, exit, fuel pickups
- `ui/` - UI elements, buttons, screens
- `vfx/` - Particle effects, attack swipes, sparks

## Building and Running

### Requirements

- Godot 4.x (4.2 or later recommended)

### Running from Godot Editor

1. Open Godot
2. Import the project folder (`flicker-godot/`)
3. Press F5 or click the Play button

### Exporting

1. Open the project in Godot
2. Go to **Project > Export**
3. Add your target platform (Windows, macOS, Linux)
4. Click **Export Project**

### Command Line

```bash
# Run the game
godot --path /path/to/flicker-godot

# Export (example for Linux)
godot --path /path/to/flicker-godot --export-release "Linux/X11" ./flicker
```

## Project Structure

```
flicker-godot/
├── project.godot      # Main project configuration
├── README.md          # This file
├── scenes/
│   └── main.tscn      # Main game scene
├── scripts/
│   ├── game.gd        # Core game logic (integrated balance)
│   └── ui.gd          # UI handling
└── assets/            # All art assets (Yoshi)
    ├── player/
    ├── enemy/
    ├── environment/
    ├── ui/
    └── vfx/
```

## Integration Notes

This is the **integrated build** combining:
1. ✅ John's core Godot systems
2. ✅ Yoshi's pixel art assets (imported to assets/)
3. ✅ Hideo's balance numbers (implemented in game.gd)

### Key Balance Implementations
- All torch burn rates match Hideo's specifications
- Fuel pickup types and spawn weights per level
- Enemy AI states (FLEE, STALK, HUNT, PATROL)
- Level difficulty scaling (enemy speed, fuel scarcity)
- Upgrade system with proper caps

## Godot Advantages Used

- **2D Lighting System** - Real torch shadows with PointLight2D
- **Animation System** - Smooth torch flicker effects
- **Scene System** - Modular player/enemy objects
- **Export Pipeline** - Easy PC, Mac, Linux builds (and later Switch)

## Credits

**North Star Studio**
- Design & Direction: Shig
- Code: John
- Art: Yoshi
- Balance: Hideo

## License

Copyright (c) 2026 North Star Studio. All rights reserved.
