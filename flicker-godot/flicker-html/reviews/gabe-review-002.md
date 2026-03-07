# Flicker Market Analysis — Review #002
**Reviewer:** Gabe (Market Analyst, North Star Studio)  
**Date:** 2026-03-06  
**Build:** Cycle 2 - Sprint 2 (3-Level Prototype)  
**Verdict:** NEEDS_WORK

---

## Executive Summary

Sprint 2 delivers **meaningful progression** but Flicker remains **early in development**. The 3-level structure and upgrade system address core feedback from Review #001, yet the game still lacks the combat depth and content variety required for market viability.

**Bottom line:** Good iteration, but we're still in prototype territory.

---

## 1. What's Improved Since Review #001

### ✅ Addressed Issues

| Feature | Review #001 Feedback | Sprint 2 Status |
|---------|---------------------|-----------------|
| **Multi-floor structure** | "Only one level/depth" | ✅ 3-level progression with escalating difficulty |
| **Upgrade system** | "No items, no build variety" | ✅ 3 upgrade choices between levels |
| **Session length** | "~2-3 minutes, target 15-45" | ✅ ~8-12 minute runs (closer to target) |
| **FPS-independent torch** | Not mentioned (technical debt) | ✅ Fixed with deltaTime implementation |
| **Restart functionality** | Missing keyboard restart | ✅ 'R' key restart implemented |
| **Victory feedback** | Instant restart on win | ✅ Victory screen with stats (time + fuel) |
| **Exit visibility** | Easy to miss exit | ✅ Pulsing green glow + door emoji |

### 🎯 New Systems Analysis

#### 3-Level Progression
The escalating difficulty works:
- **Level 1:** Base settings, tutorial feel
- **Level 2:** 30% faster torch drain, faster enemy, larger map
- **Level 3:** Maximum difficulty spike

This creates a **sense of journey** missing in the first build. Players feel progression.

#### Upgrade System (Between Levels)
Three choices offered:
1. **⚡ Speed Boost** — Extra tiles per move
2. **🕯️ Efficient Torch** — 30% slower burn rate
3. **🔆 Bright Torch** — +1 tile vision radius

**Analysis:** These are **meaningful but shallow**. They stack (you get 2 upgrades per full run), but:
- No synergies between upgrades
- No "build" feels distinct
- Choices are statistically obvious (Efficiency > Speed > Vision in most cases)

**Verdict:** Good foundation, needs **item variety and combos**.

#### Run Timer
Simple addition that pays dividends:
- Creates **speedrun potential**
- Gives completionists a metric to optimize
- Makes victory feel earned

---

## 2. Current Market Readiness Score

| Category | Score | Change | Notes |
|----------|-------|--------|-------|
| Core Loop | 5/10 | ↑+1 | Still no combat; movement-only gameplay |
| Content | 4/10 | ↑+2 | 3 levels, 3 upgrades, 1 enemy type |
| Progression | 5/10 | ↑+3 | Upgrade system exists but lacks depth |
| Visuals | 4/10 | ↑+1 | Exit pulse effect adds polish; still emoji-based |
| Audio | 0/10 | — | Still completely absent |
| Replayability | 4/10 | ↑+2 | Upgrades add variety, but runs feel similar |
| **Overall Readiness** | **3.5/10** | ↑+1.5 | **Not sellable** |

### Score Trajectory
```
Review #001:  2/10  ████░░░░░░░░░░░░░░░░
Review #002:  3.5/10 ███████░░░░░░░░░░░░░
Target EA:    7/10   ███████████████░░░░░
```

We're moving in the right direction but **slower than ideal**.

---

## 3. Is It Sellable Now? What's Still Missing?

### ❌ NOT SELLABLE — Critical Gaps Remain

#### 🔴 Still Missing: Combat System
This was my #1 concern in Review #001 and it **remains unaddressed**.

Current gameplay:
- Walk around enemies
- Collect fuel
- Reach exit

**This is not a roguelike.** It's a resource management maze game.

Successful roguelikes require:
- **Combat choices** (fight vs flee)
- **Build expression** (items that change how you fight)
- **Skill expression** (mastering mechanics)

Right now, Flicker has none of these. The "avoid the eye emoji" mechanic is tension without agency.

#### 🔴 Still Missing: Enemy Variety
One enemy type across 3 levels. The "Stalker" (👁️) gets faster but doesn't behave differently.

**Roguelike benchmark:** Minimum 5-6 enemy types for EA, 10+ for 1.0.

#### 🔴 Still Missing: Item/Build Depth
Three upgrades that stack linearly isn't a build system. Players need:
- Items that change *how* they play (not just stat boosts)
- Synergies ("If I have X and Y, Z happens")
- Risk/reward choices (cursed items, powerful but dangerous effects)

Compare to Binding of Isaac: 600+ items with emergent combinations.

#### 🟡 Still Missing: Art Direction
Emoji graphics are fine for prototyping but **unacceptable for shipping**. Yoshi's pixel art style guide exists — it needs to be implemented.

#### 🟡 Still Missing: Audio
Completely silent. Torch sounds, ambient horror audio, and music are essential for atmosphere.

---

## 4. Competitive Position Update

### How Flicker Compares Now

| Game | Flicker Gap |
|------|-------------|
| **Binding of Isaac** | 600+ items vs 3 upgrades; full combat vs avoidance |
| **Darkwood** | Crafting, combat, story vs maze walking |
| **Enter the Gungeon** | 200+ guns, boss fights, tight combat |
| **Roguelight** (free) | Similar concept, also simple — but it's **free** |

**Reality check:** Flicker currently offers **less depth than free browser roguelights**.

### The Concern
If we released this on Steam tomorrow at $9.99:
- Refund rate would be **>70%**
- Review score: **"Mixed"** at best
- Word of mouth: **Negative** ("boring, no combat")

---

## 5. Strategic Recommendations

### Immediate (Sprint 3 — Must-Have)

1. **Implement Combat System**
   - Torch swing attack (melee, burns fuel)
   - Or: Torch projectile (ranged, costs fuel)
   - Or: Flame traps (environmental combat)
   
   *Without this, Flicker isn't a roguelike.*

2. **Add 2 More Enemy Types**
   - Ranged enemy (forces positioning)
   - Charger enemy (predictable but dangerous)
   - Current Stalker becomes "basic" type

3. **Expand Items to 10+**
   - Include at least 3 that change gameplay (not just stats)
   - Example: "Flame Dash" — spend fuel to teleport
   - Example: "Oil Slick" — enemies slip, you don't

### Short Term (Cycle 3)

4. **Boss Encounter**
   - One boss that tests torch management under pressure
   - Creates "set piece" moments for trailers/streamers

5. **Art Implementation**
   - Replace emojis with Yoshi's pixel art
   - Even placeholder sprites improve perception

6. **Audio Pass**
   - Torch flicker sound
   - Ambient dungeon audio
   - Enemy audio cues

### Medium Term (Before EA)

7. **Meta-Progression**
   - Unlock new starting items
   - Permanent upgrades between runs
   - Character selection

8. **Content Expansion**
   - 5+ enemy types
   - 20+ items
   - 5 floors minimum

---

## 6. Verdict: NEEDS_WORK

**Flicker is improving but remains unready for any form of publishing.**

### What Works
- ✅ Torch tension mechanic validated (still the golden ticket)
- ✅ 3-level structure creates sense of progression
- ✅ Upgrade system is a step toward build variety
- ✅ Technical foundation is solid (FPS independence, clean code)

### What Breaks Market Viability
- ❌ **No combat system** (this is disqualifying)
- ❌ Shallow content (1 enemy, 3 linear upgrades)
- ❌ Emoji graphics cannot ship
- ❌ Silent audio experience

### Updated Checklist

#### Must-Have Before Further Review
- [x] Multi-floor dungeon (3 floors — DONE)
- [ ] **Combat system** (torch as weapon)
- [ ] **Enemy variety** (minimum 3 types)
- [ ] **Item depth** (minimum 10 items with synergies)

#### Must-Have Before Early Access
- [ ] Full art implementation (pixel art)
- [ ] Audio design
- [ ] Boss encounters
- [ ] Meta-progression system
- [ ] Balance passes

---

## 7. Final Word

Sprint 2 shows the team is **listening and iterating**. The 3-level structure and upgrade system are genuine improvements that move Flicker toward being a real game.

But we're at a **critical inflection point**.

The torch mechanic has carried the project so far, but it **cannot carry it to market alone**. Without combat, Flicker will always be a walking simulator with a timer — not a roguelike.

**My recommendation:** 
- Sprint 3 should focus **exclusively** on combat implementation
- Once combat is in, re-evaluate the core loop
- If combat + torch = fun, double down on content
- If combat doesn't mesh with torch mechanic, consider pivot

**Next review requested after:** Combat system implemented + 3 enemy types + 10 items.

The potential is still there. But potential doesn't sell games.

---

*Reviewed by Gabe*  
*Market Analyst, North Star Studio*
