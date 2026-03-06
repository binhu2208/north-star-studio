# Torch Mechanic Design Document

**Agent:** Hideo (Design)  
**Project:** Torch Roguelike  
**Date:** 2026-03-06  
**Status:** Phase 1 Deliverable

---

## 1. Core Gameplay Loop

### The Tension Engine
The player navigates a dark dungeon with a torch that burns in **real-time**, while combat and movement are **turn-based**. This creates constant tension:

1. **Explore** — Move through the dungeon, reveal tiles, find loot
2. **Decide** — Every action consumes a turn, but the torch keeps burning
3. **Combat** — Engage enemies using flame as a resource
4. **Manage** — Balance torch fuel vs. combat power vs. vision radius
5. **Escape** — Find the exit before the light dies

### The Core Tension
> "Every second counts — even in turn-based combat"

Players must make decisions quickly. Hesitation costs fuel. Rushing leads to mistakes.

---

## 2. Torch Mechanics

### 2.1 Burn Rate

| Torch State | Burn Speed | Vision Radius | Combat Modifier |
|-------------|------------|---------------|-----------------|
| **Bright** (80-100%) | 1x | 6 tiles | +10% damage |
| **Normal** (40-79%) | 1x | 4 tiles | Normal |
| **Dim** (15-39%) | 1.5x | 2 tiles | -20% damage |
| **Critical** (1-14%) | 2x | 1 tile | -50% damage |
| **Dead** (0%) | — | 0 tiles (blind) | Cannot attack |

**Base burn rate:** 1% per 3 seconds of real time

### 2.2 Fuel Types

| Fuel Source | Fuel Amount | Special Properties |
|-------------|-------------|-------------------|
| **Wood Scrap** | +10% | Common, no special effect |
| **Tallow Candle** | +25% | Slows burn rate by 0.5x for 30s |
| **Oil Flask** | +50% | Can be thrown as fire bomb |
| **Phosphor Moss** | +15% | Reveals hidden enemies in radius |
| **Soul Ember** | +30% | Heals player for 10 HP |
| **Dragon Scale** | +75% | Grants fire immunity for 60s |

### 2.3 Relighting

- **Dead torch:** Cannot relight without a flame source (rare)
- **Ember state:** At 0%, torch enters "ember" — 10 seconds to find fuel or it dies permanently
- **Permanent death:** If torch dies, run ends (roguelike consequence)

---

## 3. Flame Types

Different colored flames unlock different abilities and interact with the environment:

### 3.1 Base Flames

| Flame Color | Source | Combat Effect | Environmental Effect |
|-------------|--------|---------------|---------------------|
| **Orange** (Default) | Starting torch | Balanced damage | Reveals normal paths |
| **Blue** | Ghost enemies, ice rooms | Freezes enemies | Melts ice barriers |
| **Green** | Poison swamps, toxic enemies | Poison damage over time | Burns through organic barriers |
| **Purple** | Void crystals, magic rooms | Life steal (heal on hit) | Reveals hidden doors |
| **White** | Rare shrines | High damage, fast burn | Purifies cursed areas |
| **Black** | Cursed items, risk/reward | Massive damage, drains player HP | Opens forbidden paths |

### 3.2 Flame Switching

- Players can carry **up to 2 flame types** at once
- Switching takes 1 turn (costs time)
- Some enemies are immune to certain flame types
- Puzzle rooms require specific flames to solve

---

## 4. Combat System

### 4.1 Basic Combat

- **Turn-based:** Player moves/act, then enemies
- **Torch as weapon:** Melee flame attacks consume 2% fuel per hit
- **Torch as shield:** Blocking consumes 1% fuel per blocked hit
- **Ranged option:** Throw fuel items as bombs (consumes item)

### 4.2 Combat Stances

| Stance | Fuel Cost | Effect |
|--------|-----------|--------|
| **Aggressive** | 3% per attack | +25% damage, -10% defense |
| **Defensive** | 1% per block | +25% defense, cannot attack |
| **Efficient** | 0% (no torch) | Normal damage, no fuel cost, 0 vision bonus |

### 4.3 Enemy Types

| Enemy | Behavior | Weakness |
|-------|----------|----------|
| **Shadow Stalker** | Hides in darkness, ambushes | Any light reveals them |
| **Moth Swarm** | Attracted to torch, drains fuel | Blue flame repels |
| **Ash Knight** | Heavy armor, slow | Green flame corrodes armor |
| **Void Wisp** | Phases through walls | Purple flame anchors them |
| **Light Eater** | Steals torch fuel on hit | White flame blinds them |

---

## 5. Progression & Unlock System

### 5.1 Meta-Progression (Between Runs)

- **Flame Knowledge:** Each flame type discovered unlocks its entry
- **Fuel Recipes:** Combine fuels for advanced effects
- **Torch Handles:** Cosmetic + minor bonuses (longer ember time, etc.)
- **Starting Blessings:** Choose 1 buff at start of run (unlocked via achievements)

### 5.2 In-Run Progression

- **Flame Absorption:** Defeating certain enemies adds their flame type to your torch
- **Fuel Stacking:** Carry up to 5 fuel items
- **Dungeon Depth:** Deeper levels = better loot, harder enemies, faster burn rates

### 5.3 Unlock Milestones

| Achievement | Unlock |
|-------------|--------|
| Complete floor 3 | Blue flame knowledge |
| Defeat 50 enemies | Aggressive stance mastery |
| Survive with <5% fuel for 10 turns | Ember mastery (longer ember time) |
| Find 10 secret doors | Purple flame knowledge |
| Complete a run | New game+ with harder modifiers |

---

## 6. Risk Assessment: "What If It's Not Fun?"

### 6.1 Identified Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| **Time pressure frustrates players** | Medium | High | Adjustable difficulty (slower burn rates) |
| **Torch management feels tedious** | Medium | High | Auto-pickup fuel, clear UI feedback |
| **Combat feels shallow** | Low | Medium | Depth through flame types, enemy variety |
| **Runs feel samey** | Medium | Medium | Procedural dungeons, random flame spawns |
| **Permadeath too punishing** | Low | Medium | Meta-progression softens blow |

### 6.2 Prototype Validation Plan

**Week 1-2:** Paper prototype the core loop
- Does the time pressure create tension or frustration?
- Is the fuel vs. combat decision interesting?

**Week 3-4:** Digital prototype
- Basic grid movement, one enemy type, torch mechanic
- Test with 5+ players, gather feedback

**Go/No-Go Criteria:**
- [ ] Players report feeling "tense but fair"
- [ ] Players understand fuel vs. combat tradeoff within 2 runs
- [ ] Average session length: 15-30 minutes
- [ ] Players want to try "just one more run"

### 6.3 Fallback Mechanics

If core tension doesn't work:
1. **Option A:** Remove real-time burn, make fuel a strict turn limit
2. **Option B:** Torch only affects vision, not combat (simpler)
3. **Option C:** Add "pause fuel burn" mode for accessibility

---

## 7. Open Questions for Team

1. **Art:** How visible should darkness be? Total black or dim visibility?
2. **Tech:** Can we support real-time burn + turn-based cleanly?
3. **Design:** Should we show exact fuel percentage or abstract it (flame size)?
4. **Audio:** Sound cues for low fuel? Heartbeat effect?

---

*Document by Hideo | OpenClaw Game Studio*
