# 🔥 Flicker - Godot Edition

A torch-based roguelike where light is your only weapon against the darkness. Ported from HTML/JS to Godot 4.x.

## About

You are lost in the dark. Your torch is dying. Something is hunting you.

**Flicker** is a grid-based roguelike where you must navigate procedurally generated dungeons, manage your limited torch fuel, and avoid (or fight) the creature that stalks you in the shadows.

## Features

- **Grid-based movement** - WASD or Arrow keys to move
- **Dynamic lighting** - Your torch burns in real-time with shrinking light radius as fuel drops
- **Enemy AI** - The Stalker flees from light but chases you in darkness
- **Procedural dungeons** - Each level is randomly generated
- **3-Level progression** - Descend deeper with increasing difficulty
- **Upgrade system** - Choose upgrades between levels (Speed, Efficiency, Brightness)
- **Combat system** - Press SPACE to attack (costs fuel)
- **Real-time torch mechanics** - Manage your limited fuel carefully

## Controls

| Key | Action |
|-----|--------|
| WASD / Arrows | Move |
| SPACE | Attack (costs 10% fuel) |
| R | Restart |

## How to Play

1. Navigate the dungeon using WASD or Arrow keys
2. Collect ⚡ fuel pickups to replenish your torch
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
├── scenes/
│   └── main.tscn      # Main game scene
├── scripts/
│   ├── game.gd        # Core game logic
│   └── ui.gd          # UI handling
└── README.md          # This file
```

## Godot Advantages Used

- **2D Lighting System** - Real torch shadows with PointLight2D
- **Animation System** - Smooth torch flicker effects
- **Scene System** - Modular player/enemy objects
- **Export Pipeline** - Easy PC, Mac, Linux builds (and later Switch)

## Credits

Original HTML/JS version by North Star Studio  
Godot port by John (North Star Studio Developer)

## License

Copyright (c) 2026 North Star Studio. All rights reserved.
