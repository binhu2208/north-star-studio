# 🔥 Flicker v2 - Godot Edition

A torch-based roguelike rebuilt from scratch to test the self-serve standalone agent system.

## About

You are lost in the dark. Your torch is dying. Something is hunting you.

**Flicker** is a grid-based roguelike where you must navigate procedurally generated dungeons, manage your limited torch fuel, and avoid (or fight) the creature that stalks you in the shadows.

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

## Building and Running

### Requirements

- Godot 4.x (4.2 or later recommended)

### Running from Godot Editor

1. Open Godot
2. Import the project folder (`flicker-godot-v2/`)
3. Press F5 or click the Play button

### Command Line

```bash
# Run the game
godot --path /path/to/flicker-godot-v2
```

## Project Structure

```
flicker-godot-v2/
├── project.godot      # Main project configuration
├── README.md          # This file
├── scenes/
│   └── main.tscn      # Main game scene
└── scripts/
    ├── game.gd        # Core game logic
    └── ui.gd          # UI handling
```

## Self-Serve System Test

This project was built as a test of the self-serve standalone agent workflow:
- Task claimed from `tasks/todo/`
- Work executed autonomously
- Committed with proper git identity
- Completed and moved to `tasks/done/`

## Credits

**North Star Studio**
- Rebuild: John (Dev)

## License

Copyright (c) 2026 North Star Studio. All rights reserved.
