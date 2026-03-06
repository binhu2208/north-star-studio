# Tech Stack Evaluation

**Agent:** John (Dev)  
**Project:** Torch Roguelike  
**Date:** 2026-03-06  
**Status:** Phase 1 Deliverable

---

## Executive Summary

After evaluating Unity and Godot for Torch Roguelike, I recommend **Godot 4.x** as our engine. It offers superior 2D support, lighter weight, no licensing concerns, and excellent built-in features for turn-based games — all critical for our small team and budget.

---

## Engine Comparison

### Unity Evaluation

| Aspect | Rating | Notes |
|--------|--------|-------|
| **2D Support** | ★★★★☆ | Good, but 2D feels like an afterthought to 3D |
| **Learning Curve** | ★★★☆☆ | Steep for beginners, C# knowledge required |
| **Asset Store** | ★★★★★ | Massive library of plugins and assets |
| **Performance** | ★★★★☆ | Excellent, but overhead for simple 2D games |
| **Licensing** | ★★★☆☆ | Free until $200k revenue, then fees |
| **Community** | ★★★★★ | Huge, lots of tutorials and answers |
| **Roguelike Tools** | ★★★★☆ | Several proc-gen and grid libraries available |

**Pros:**
- ✅ Industry standard, easy to hire for
- ✅ Massive asset store (save development time)
- ✅ Excellent platform support (Steam, Switch, etc.)
- ✅ C# is familiar to many developers
- ✅ Strong editor tooling

**Cons:**
- ❌ 2D lighting less polished than Godot
- ❌ Heavier engine (longer load times, bigger builds)
- ❌ Runtime fee uncertainty (policy changes)
- ❌ Overkill for a 2D turn-based game
- ❌ Slower iteration (recompile times)

---

### Godot Evaluation

| Aspect | Rating | Notes |
|--------|--------|-------|
| **2D Support** | ★★★★★ | First-class 2D, dedicated 2D engine |
| **Learning Curve** | ★★★★☆ | GDScript is Python-like, very approachable |
| **Asset Store** | ★★★☆☆ | Growing, but smaller than Unity |
| **Performance** | ★★★★★ | Lightweight, fast iteration |
| **Licensing** | ★★★★★ | MIT License, completely free |
| **Community** | ★★★★☆ | Active and growing rapidly |
| **Roguelike Tools** | ★★★★☆ | Good procedural generation support |

**Pros:**
- ✅ Best-in-class 2D lighting and shaders
- ✅ Lightweight (30MB editor vs 3GB+ for Unity)
- ✅ GDScript is fast to write and iterate
- ✅ Built-in signal system perfect for turn-based games
- ✅ Scene system encourages good architecture
- ✅ No licensing fees, ever
- ✅ Export to all platforms including Switch (via third-party)

**Cons:**
- ❌ Smaller talent pool (harder to hire)
- ❌ Asset store less mature
- ❌ Console export requires third-party (additional cost)
- ❌ Less industry recognition

---

## Recommendation: Godot 4.x

### Why Godot Wins for Torch Roguelike

1. **2D Lighting:** Godot's 2D lighting is exceptional — critical for our torch mechanic
2. **Turn-Based Architecture:** Godot's signal/scene system maps perfectly to turn-based games
3. **Team Size:** One programmer can handle everything; no need for tech artists
4. **Budget:** Zero licensing costs, even if we sell millions
5. **Iteration Speed:** Near-instant reloads vs Unity's compile times
6. **Scope Fit:** Unity is overkill; Godot is the right size

### When to Choose Unity Instead

- If we need specific Asset Store plugins (doubtful for this project)
- If we plan to scale to 3D later (not in scope)
- If team already knows Unity deeply (we're starting fresh)

---

## Architecture Thoughts

### Turn-Based System Design

```
TurnManager (Autoload)
├── State: PLAYER_TURN | ENEMY_TURN | ANIMATING
├── Signals: turn_started, turn_ended, action_completed
└── Methods: next_turn(), is_player_turn()

Entity (Base Class)
├── Player (extends Entity)
└── Enemy (extends Entity)
    ├── ShadowStalker
    ├── MothSwarm
    └── ...

Action System
├── MoveAction
├── AttackAction
└── UseItemAction
```

**Key Design:**
- State machine for turn phases
- Actions are queued and resolved sequentially
- Signals decouple entities from turn manager

### Real-Time Torch Burn Mechanic

```gdscript
# TorchManager (Autoload)
extends Node

@export var burn_rate: float = 0.33  # % per second
@export var current_fuel: float = 100.0

var is_burning: bool = true

func _process(delta):
    if is_burning and not Global.is_game_paused:
        var burn_multiplier = get_burn_multiplier()
        current_fuel -= burn_rate * burn_multiplier * delta
        current_fuel = clamp(current_fuel, 0, 100)
        
        if current_fuel <= 0:
            torch_died.emit()
        
        fuel_changed.emit(current_fuel)

func get_burn_multiplier() -> float:
    match current_fuel:
        var f when f < 15: return 2.0   # Critical
        var f when f < 40: return 1.5   # Dim
        _: return 1.0                    # Normal
```

**Key Points:**
- Torch burns in `_process` (real-time)
- Game logic runs in turn-based actions
- Pause stops burn (for menus, accessibility)

### Procedural Dungeon Generation

**Algorithm: Cellular Automata + Room Placement**

1. **Generate base cave:** Cellular automata for organic shapes
2. **Place rooms:** Random rectangles connected by corridors
3. **Place entities:** Player start, exit, enemies, loot
4. **Validate:** Ensure solvability (path from start to exit)

```gdscript
# Simplified approach
gen = DungeonGenerator.new()
gen.width = 50
gen.height = 50
gen.room_count = 8
dungeon = gen.generate()
```

**Libraries to evaluate:**
- `godot-simple-dungeon` (proven, simple)
- Custom implementation (more control)

### Save/Run Persistence

**Roguelike Run Save:**
```gdscript
# Save current run (for quit/resume)
run_data = {
    "seed": dungeon_seed,
    "floor": current_floor,
    "player": player.serialize(),
    "torch": torch_manager.serialize(),
    "enemies": enemies.map(func(e): return e.serialize()),
    "items": items.map(func(i): return i.serialize())
}
SaveManager.save_run(run_data)
```

**Meta-Progression Save:**
```gdscript
# Permanent unlocks
meta_data = {
    "unlocked_flames": ["orange", "blue", "green"],
    "discovered_enemies": ["shadow_stalker", "moth_swarm"],
    "achievements": ["first_run", "floor_5_reached"],
    "best_run": {"floor": 12, "time": 1847}
}
SaveManager.save_meta(meta_data)
```

**Storage:** JSON files in user:// directory

---

## Project Structure

```
project-001/
├── assets/
│   ├── sprites/          # Character/enemy sprites
│   ├── tiles/            # Dungeon tilesets
│   ├── ui/               # UI elements
│   └── audio/            # Music and SFX
├── src/
│   ├── autoload/         # Global singletons
│   │   ├── GameState.gd
│   │   ├── TorchManager.gd
│   │   └── SaveManager.gd
│   ├── entities/         # Player, enemies
│   │   ├── Entity.gd
│   │   ├── Player.gd
│   │   └── enemies/
│   ├── dungeon/          # Generation, tiles
│   │   ├── DungeonGenerator.gd
│   │   └── TileMap.gd
│   ├── combat/           # Actions, abilities
│   │   ├── Action.gd
│   │   └── CombatSystem.gd
│   ├── ui/               # Menus, HUD
│   └── main.gd           # Entry point
├── scenes/
│   ├── main.tscn
│   ├── dungeon.tscn
│   ├── player.tscn
│   └── ui/
└── project.godot
```

---

## Open Questions & Concerns

### Technical Concerns

1. **Console Export:** Godot requires third-party (like Lone Wolf Technology) for Switch/PlayStation/Xbox. Budget ~$1000-3000 for console ports.

2. **Team Scaling:** If we grow beyond 3 people, Unity has better collaboration tools. Godot's scene system works but is less mature for large teams.

3. **Asset Pipeline:** We'll need to create more custom tools/assets since the asset store is smaller.

### Design Questions

1. **Multiplayer:** Not in scope, but Godot's multiplayer is easier to add later if needed.

2. **Mod Support:** Godot supports modding via GDScript loading. Worth considering post-launch.

### Next Steps

1. **Prototype (Week 1):** Basic movement + torch burn
2. **Evaluate (Week 2):** Does the feel match our vision?
3. **Commit (Week 3):** Full production in Godot

---

## Tools & Workflow

| Purpose | Tool | Cost |
|---------|------|------|
| Engine | Godot 4.3 | Free |
| IDE | VS Code + GDScript plugin | Free |
| Version Control | Git + GitHub | Free |
| Pixel Art | Aseprite | $20 |
| Audio | Audacity + sfxr | Free |
| Project Management | GitHub Issues | Free |

---

*Document by John | OpenClaw Game Studio*
