# Flicker - Producer Review #001
**Reviewer:** Shig (Producer, North Star Studio)  
**Date:** 2026-03-06  
**Build:** First Playable  
**Verdict:** NEEDS_WORK

---

## Team Consensus

| Reviewer | Verdict | Key Concern |
|----------|---------|-------------|
| Gabe (Market) | NEEDS_WORK | No combat/items, not sellable yet |
| Sakura (QA) | NEEDS_WORK | Bugs + missing progression |
| Shig (Producer) | NEEDS_WORK | Scope needs definition |

**Unanimous: Not ready for publishing.**

---

## Production Assessment

### What John Delivered ✅
- Core loop works: movement, torch burn, fuel pickup, enemy stalker
- Atmospheric lighting with flicker effect
- Procedural dungeon generation
- Single-file HTML, zero dependencies
- Tight balance on torch duration (~20-45s per run)

### Critical Issues (Block Next Phase)

1. **BUG-002: Level Display Lies**
   - UI shows "DEPTH: 1" but never changes
   - Sakura flagged as P0 - either implement or remove

2. **BUG-003: FPS-Dependent Torch Drain**
   - Game balance varies by hardware
   - 20s at 60fps vs 40s at 30fps
   - Must use delta time

3. **BUG-004: No Keyboard Restart**
   - Forces mouse click between deaths
   - Friction in core loop

### Scope Decision Needed

Gabe wants:
- Combat system (torch as weapon)
- 3+ enemy types
- 10+ items/upgrades
- 3-floor dungeon minimum

Sakura wants:
- 3-5 level progression
- Simple upgrade system
- Audio design
- Score/leaderboards

**My Call:** Let's hit Sakura's list first (lower scope, higher impact), then evaluate Gabe's combat requirements.

---

## Revised Plan for John

### Sprint 2: "Make It Complete"
**Goal:** Fix bugs + add minimum viable progression

**Must-Have:**
- [ ] Fix BUG-002, BUG-003, BUG-004
- [ ] 3-level descent (increasing difficulty each floor)
- [ ] Simple upgrade choice between levels (3 options: speed↑, torch↓burn, vision↑)
- [ ] Keyboard restart (R key)
- [ ] Exit visibility (pulsing glow)

**Nice-to-Have:**
- [ ] Basic audio (torch crackle, pickup sound, death sound)
- [ ] Fuel pickup feedback (floating text)
- [ ] Run timer display

**Timeline:** 1 week

---

## Next Review Gate

Reconvene when Sprint 2 complete. If all three approve, we call bin for final review.

If Gabe still wants combat after Sprint 2, we'll discuss scope increase then.

---

## Current Status

| Category | Score | Notes |
|----------|-------|-------|
| Core Loop | 7/10 | Torch mechanic is the star |
| Content | 3/10 | Single level, no progression |
| Polish | 5/10 | Good for prototype, needs audio |
| Bugs | 6/10 | 3 P0 bugs to fix |
| **Overall** | **5/10** | Solid foundation, needs 1 more sprint |

---

*Shig*  
*Producer, North Star Studio*
