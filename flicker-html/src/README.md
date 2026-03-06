# Flicker 🔥

**A Torch Roguelike by North Star Studio**

You are the last light in a dungeon of darkness. Your torch is dying. Find the exit before it's too late.

---

## How to Run

### Option 1: Open Directly
Simply double-click `index.html` or open it in any web browser.

### Option 2: Local Server (Recommended)
```bash
cd /Users/binhu2208/.openclaw/workspace/studio/projects/flicker/src
python3 -m http.server 8080
# Then visit http://localhost:8080
```

Or use any static file server of your choice.

---

## Controls

| Key | Action |
|-----|--------|
| **W / ↑** | Move Up |
| **S / ↓** | Move Down |
| **A / ←** | Move Left |
| **D / →** | Move Right |

---

## Game Mechanics

### 🔥 Torch System
- Your torch burns down continuously (watch the bar!)
- Light radius shrinks as torch dims
- When torch hits 0, game over

### ⚡ Fuel Canisters
- Collect to restore 25% torch fuel
- Glow with yellow light
- Plan your route to grab them

### 🚪 Exit
- Green door somewhere in the dungeon
- Reach it before darkness consumes you

### 👁️ The Stalker
- Hunts you through the dark
- Moves slower than you (moves every ~800ms)
- **Only visible in torchlight** — listen for it
- Touch = instant torch death

---

## Known Issues / Limitations

1. **Single Level** — No procedural progression yet; restart generates new layout
2. **No Audio** — Silent tension; could use ambient sounds + heartbeat as torch fades
3. **Simple AI** — Enemy uses basic pathfinding; doesn't wall-hug or flank
4. **No Save/Load** — Fresh start every time
5. **Fixed Canvas** — 800x600 only; not responsive to mobile

---

## What I'm Proud Of

1. **The Atmosphere** — The flickering torch effect with radial gradient darkness creates genuine tension. The vignette overlay makes the light feel precious.

2. **Torch-Enemy Visibility Link** — The enemy only rendering when in torchlight creates perfect horror moments: you catch a glimpse of red eyes in the dark edge, then it's gone.

3. **Visual Polish** — Emoji sprites give character without asset dependencies; torch bar color shifts from gold to red as panic sets in.

4. **Clean Core Loop** — Move → Burn → Scavenge → Escape. The timer creates constant pressure without being unfair.

5. **Single File Architecture** — Entire game in one HTML file, no build step, runs anywhere.

---

## Future Ideas

- [ ] Multiple enemy types (fast lurker, slow tank)
- [ ] Level progression with carry-over torch
- [ ] Audio: torch crackle, footsteps, distant breathing
- [ ] Permadeath high scores
- [ ] Mobile touch controls

---

*Built in one session by John, Game Developer at North Star Studio*
