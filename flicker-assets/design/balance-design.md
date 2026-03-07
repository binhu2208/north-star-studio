# Flicker - Game Balance & Progression Design

**Document Owner:** Hideo (Design)  
**Last Updated:** 2026-03-06  
**Status:** Complete  
**Target Session:** 5-10 minutes

---

## 1. Torch Balance

### Base Mechanics
| Parameter | Value | Notes |
|-----------|-------|-------|
| Base burn rate | 5% per second | Passive drain |
| Movement multiplier | 2.0x | Running burns 10% per second |
| Attack fuel cost | 15% per swing | Discourages spam |
| Idle recovery | None | No free regen |

### Fuel Pickups
| Type | Amount | Spawn Rate | Visual |
|------|--------|------------|--------|
| Small Ember | +10% | Common (60%) | Tiny glow |
| Medium Coal | +25% | Uncommon (30%) | Medium flame |
| Large Log | +50% | Rare (10%) | Big bonfire |

### Critical Threshold
- **Danger Zone:** < 20% fuel remaining
- **Enemy Behavior:** Aggression increases 2x
- **Visual Cue:** Torch flickers red, screen darkens at edges
- **Audio Cue:** Heartbeat intensifies

---

## 2. Enemy Balance

### Core Stats
| Parameter | Value |
|-----------|-------|
| Base speed (player with torch) | 0.7x player speed |
| Base speed (player without torch) | 1.3x player speed |
| Detection radius (torch lit) | 8 tiles |
| Detection radius (torch out) | 12 tiles |
| Flee distance from torch | 4 tiles |

### AI Behavior States

#### State: FLEE (torch in range)
- Move directly away from player
- Speed: 1.0x base
- Duration: Until 6+ tiles away

#### State: STALK (torch visible, out of range)
- Circle at edge of light
- Speed: 0.5x base
- Telegraphed by red eye glow

#### State: HUNT (torch out OR player < 20% fuel)
- Direct pursuit
- Speed: 1.3x base
- No flee behavior

#### State: PATROL (no player detected)
- Random waypoint movement
- Speed: 0.3x base

### Spawn Rates by Level
| Level | Max Active | Spawn Delay | Aggression |
|-------|------------|-------------|------------|
| 1 | 2 enemies | 8 seconds | Low |
| 2 | 4 enemies | 5 seconds | Medium |
| 3 | 6 enemies | 3 seconds | High |

---

## 3. Level Progression

### Level 1: The Tutorial
**Theme:** Learning the fear

| Element | Design |
|---------|--------|
| Layout | Linear with one branch |
| Fuel abundance | High (pickups every 15s) |
| Enemy encounters | 1-2 scripted, avoidable |
| Exit distance | ~60 seconds of play |
| Teaching focus | Torch = safety, dark = danger |

**Key Moment:** First enemy encounter at 30s mark — player must learn to hold torch up.

### Level 2: The Test
**Theme:** Resource management

| Element | Design |
|---------|--------|
| Layout | Looping maze, multiple paths |
| Fuel abundance | Medium (pickups every 25s) |
| Enemy encounters | Constant threat, 3-4 active |
| Exit distance | ~90 seconds of play |
| Teaching focus | Choose: fight or flee |

**Key Moment:** First upgrade station — player feels progression.

### Level 3: The Gauntlet
**Theme:** Survival at all costs

| Element | Design |
|---------|--------|
| Layout | Dense, claustrophobic corridors |
| Fuel abundance | Low (pickups every 40s) |
| Enemy encounters | Maximum pressure, 5-6 active |
| Exit distance | ~120 seconds of play |
| Teaching focus:** Everything learned, tested |

**Key Moment:** Final corridor — torch nearly out, sprint to exit.

---

## 4. Upgrade System

### Between-Level Shop

| Upgrade | Cost | Effect | Stackable |
|---------|------|--------|-----------|
| Swift Stride | 100 pts | +20% movement speed | Yes (max 3) |
| Efficient Burn | 150 pts | -20% fuel consumption | Yes (max 2) |
| Bright Flame | 200 pts | +30% light radius | No |
| Quick Strike | 120 pts | -30% attack cooldown | Yes (max 2) |

### Scoring System
| Action | Points |
|--------|--------|
| Level completion | 50 base + time bonus |
| Fuel conserved | 1 pt per % remaining |
| No damage taken | 100 pts bonus |
| Enemy repelled | 10 pts each |
| Speed run bonus | 2x multiplier if < target time |

---

## 5. Win/Lose Conditions

### Victory
- Reach exit on Level 3
- Cutscene: Escape into moonlight
- Score tallied, unlocks new game+

### Defeat Conditions
1. **Caught by enemy** — Instant death, restart level
2. **Torch extinguished** — 5-second blackout, then death if not relit

### Checkpoint System
- Start of each level
- No mid-level saves (tension preservation)

---

## 6. Playtest Targets

### Session Goals
- **First-time player:** 8-12 minutes, 3-5 deaths
- **Experienced player:** 5-7 minutes, 0-1 deaths
- **Speed runner:** < 4 minutes possible with optimal routing

### Difficulty Checkpoints
| Checkpoint | Expected Fuel | Expected Health |
|------------|---------------|-----------------|
| End Level 1 | 40-60% | Full |
| End Level 2 | 20-40% | May have taken hit |
| End Level 3 | 0-20% | Barely made it |

---

## 7. Implementation Notes for John

### Key Variables to Expose
```gdscript
# torch_balance.gd
const BASE_BURN_RATE = 5.0  # percent per second
const MOVE_BURN_MULTIPLIER = 2.0
const ATTACK_FUEL_COST = 15.0
const CRITICAL_THRESHOLD = 20.0

# enemy_balance.gd  
const SPEED_WITH_TORCH = 0.7
const SPEED_WITHOUT_TORCH = 1.3
const FLEE_DISTANCE = 4.0
const DETECTION_TORCH = 8.0
const DETECTION_DARK = 12.0
```

### Balance Tuning Flags
All values should be editable in a `balance_config.json` for rapid iteration.

---

**Next Step:** Hand off to John for implementation. Coordinate on feel tests.
