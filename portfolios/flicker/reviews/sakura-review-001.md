# Flicker QA Review Report
**Reviewer:** Sakura (North Star Studio QA)  
**Date:** 2026-03-06  
**Build:** First Build  
**Platform:** Web (HTML5/Canvas)  
**Test Runs:** Code analysis + 10+ simulated scenarios  

---

## Executive Summary

**Verdict: NEEDS_WORK** 🟡

The core gameplay loop is compelling and the torch mechanic creates genuine tension. However, critical bugs and missing progression systems prevent this from being publish-ready in its current state. With fixes, this could be an excellent minimalist roguelike.

---

## 1. Bugs Found

### 🔴 P0 - Critical

**BUG-001: Enemy Collision Doesn't Immediately Trigger Game Over**
- **Location:** `updateEnemy()` method
- **Issue:** When enemy collides with player, `this.torch = 0` is set but `this.gameOver` is not set to `true`. The game relies on the next `update()` frame to catch `torch <= 0` and set game over.
- **Impact:** Visual inconsistency - player shows torch at 0% but death screen may delay by 1 frame. Minor but sloppy.
- **Fix:** Add `this.gameOver = true;` after `this.torch = 0;` in enemy collision check.

**BUG-002: Level Display Always Shows "1"**
- **Location:** UI and game state
- **Issue:** The `this.level` variable is initialized to 1 and never incremented. The "DEPTH" display in UI suggests progression but none exists.
- **Impact:** Confuses players expecting a multi-level experience. Appears unfinished.
- **Fix:** Either implement level progression or remove the level display until ready.

### 🟡 P1 - Major

**BUG-003: Torch Burn Rate Assumes 60fps (Not Guaranteed)**
- **Location:** `update()` method
- **Issue:** `TORCH_BURN_RATE = 0.08` per frame means ~20 seconds at 60fps, but on 30fps displays or throttled browsers, torch lasts ~40 seconds. Inconsistent experience.
- **Impact:** Game balance varies wildly by hardware/browser.
- **Fix:** Use delta time: `this.torch -= TORCH_BURN_RATE * deltaTime / (1000/60);`

**BUG-004: No Keyboard Restart Binding**
- **Location:** Input handling
- **Issue:** Game can only be restarted via mouse click on the button. No "R" key binding for quick restart after death.
- **Impact:** Poor UX for a game where players die frequently and want to restart quickly.
- **Fix:** Add `if (key === 'r' || key === 'R') this.restart();` to input handler.

### 🟢 P2 - Minor

**BUG-005: Torch Bar Red State Uses Solid Color Instead of Gradient**
- **Location:** `updateUI()` method  
- **Issue:** When torch < 20%, `fill.style.background = '#ff0000'` (solid red) instead of maintaining the gradient style used for other states.
- **Impact:** Visual inconsistency in the torch bar.
- **Fix:** Change to gradient: `linear-gradient(90deg, #ff0000, #ff4400)`

**BUG-006: Fuel Spawn Can Theoretically Stack**
- **Location:** `generateLevel()` fuel placement
- **Issue:** `findEmptySpot()` doesn't track used spots, so rare chance of placing multiple fuel on same tile (last one wins, wasting spawns).
- **Impact:** Slightly fewer fuel pickups than intended in rare cases.
- **Fix:** Check against existing fuel positions before placing new one.

**BUG-007: Room Generation Can Fail Silently**
- **Location:** `generateRooms()`
- **Issue:** Each room gets max 50 attempts to place, but if it fails, the loop just continues. Could end up with fewer rooms than intended.
- **Impact:** Map variety reduced in edge cases.
- **Fix:** Consider this acceptable fallback, but log warning in debug mode.

---

## 2. Balance Assessment

### Torch Mechanics: ✅ WELL TUNED

| Metric | Value | Assessment |
|--------|-------|------------|
| Base torch duration | ~20 seconds @ 60fps | Good tension without being punishing |
| Fuel extension | +25% per canister | Meaningful but not game-breaking |
| Fuel count per level | 3-5 canisters | Forces decisions about routing |
| Max possible torch | ~45 seconds @ 60fps | Reward for thorough exploration |

The balance is **surprisingly tight and engaging**:
- Speedrun to exit: Risky but possible
- Grab nearby fuel: Safe but slow
- Collect all fuel: Comfortable but enemy catches up

### Enemy (The Stalker): ✅ APPROPRIATE THREAT

- Moves every 800ms (slower than player)
- Simple pathfinding toward player
- 30% chance to not move (unpredictable)
- Contact = instant torch death

The enemy creates genuine pressure without being unfair. The unpredictability (30% skip chance) prevents players from exploiting simple patterns.

### Difficulty Curve: ⚠️ FLAT

No difficulty scaling - every run is identical in terms of torch rate, enemy speed, map complexity. Would benefit from:
- Slightly faster torch drain per level
- Faster enemy movement per level  
- Larger maps per level

### Overall Balance Verdict: **GOOD** with room for depth

---

## 3. Fun Factor

### What Works ✅

1. **The Light/Darkness Loop** - The shrinking light radius creates genuine anxiety. You can *feel* the torch dying. This is the core hook and it's excellent.

2. **The Stalker Reveals** - Seeing the enemy only when it's in your torchlight ("👁️") is creepy and effective. The moment you spot it at the edge of your light is genuinely tense.

3. **Fuel Tension** - Deciding whether to detour for fuel vs. rush for exit creates interesting decisions. The risk/reward feels fair.

4. **Procedural Layouts** - Room generation creates varied paths. Each run feels different enough.

5. **Flicker Effect** - The subtle random brightness variation on the torch adds atmosphere.

### What Falls Flat ❌

1. **No Progression System** - Roguelikes thrive on unlocks, upgrades, or meta-progression. This has none. After 5-10 runs, motivation drops.

2. **Single Level** - "DEPTH: 1" teases more but delivers nothing. The exit just... wins. No sense of descent or journey.

3. **No Score/Time Tracking** - No way to measure improvement run-to-run. Feels aimless after mastering the basics.

4. **Enemy Not Scary Enough** - The 👁️ emoji is too cute to be terrifying. Needs more threatening presentation (red glow, sound, screen shake on contact).

5. **No Audio** - Silence kills atmosphere. Even simple torch crackling and ambient dungeon sounds would help massively.

### Fun Verdict: **SOLID FOUNDATION** (6/10)
- First 10 runs: Engaging and tense
- After 10 runs: Repetitive, lacks depth
- **Recommendation:** Add progression systems before full release

---

## 4. UX Issues

### 🟡 P1 - Important

**UX-001: No Tutorial/First-Time Experience**
- Players are thrown in with just "WASD to move" in the footer
- The 👁️ enemy isn't explained (what happens if it touches me?)
- Fuel value isn't clear (how much does it give?)
- **Fix:** Add a brief intro overlay or first-run tooltips

**UX-002: Exit Not Visually Distinct Enough**
- The 🚪 emoji blends in with walls
- No glow/pulse to indicate "this is your goal"
- Players may wander aimlessly not knowing what they're looking for
- **Fix:** Add pulsing green glow around exit

**UX-003: Fuel Pickup Feedback Weak**
- Torch bar updates but no visual/audio confirmation
- Hard to tell if you actually picked it up vs. walked over it
- **Fix:** Add floating "+25%" text or brief screen flash

**UX-004: Enemy Contact Feedback Missing**
- Torch just hits 0 - no hit reaction, no screen shake, no feedback
- Feels like a bug rather than a game event
- **Fix:** Red flash, sound effect, screen shake

### 🟢 P2 - Nice to Have

**UX-005: No Pause Function**
- Pressing Escape or P should pause
- Currently game continues in background

**UX-006: Torch Bar Hard to Read at Glance**
- The percentage isn't shown numerically
- Color coding helps but precise value would aid decision-making

**UX-007: No Run Statistics**
- Time taken, fuel collected, enemy encounters would add replay value

---

## 5. Suggestions

### P0 - Blockers (Fix Before Release)

| # | Suggestion | Effort |
|---|------------|--------|
| P0-1 | Fix BUG-002 (level never increments) - either implement multi-level or remove display | Low |
| P0-2 | Fix BUG-003 (fps-dependent torch drain) - use delta time | Medium |
| P0-3 | Fix BUG-004 (no keyboard restart) - bind R key | Low |

### P1 - Important (Strongly Recommended)

| # | Suggestion | Effort | Impact |
|---|------------|--------|--------|
| P1-1 | Add progression system (3-5 levels with increasing difficulty) | High | Major |
| P1-2 | Add "R" quick restart | Low | Medium |
| P1-3 | Improve enemy feedback (contact = red flash + sound) | Medium | High |
| P1-4 | Add fuel pickup feedback (floating text) | Low | Medium |
| P1-5 | Make exit more visible (pulsing glow) | Low | Medium |
| P1-6 | Add basic sound effects (torch crackle, footstep, pickup, death) | Medium | High |
| P1-7 | Add run timer/score for replayability | Low | Medium |

### P2 - Polish (Nice to Have)

| # | Suggestion | Effort |
|---|------------|--------|
| P2-1 | Add pause functionality (P key) | Low |
| P2-2 | Show torch percentage numerically | Low |
| P2-3 | Add high score persistence (localStorage) | Low |
| P2-4 | Add variety to enemy (different speeds/types per level) | Medium |
| P2-5 | Add environmental hazards (traps, dead ends) | Medium |
| P2-6 | Add optional upgrades between levels (speed, torch efficiency) | High |

---

## 6. Final Verdict

### Status: **NEEDS_WORK** 🟡

Flicker has a **genuinely compelling core mechanic** - the torch tension is excellent and the minimalist roguelike structure works. However, it currently feels like a polished prototype rather than a complete game.

### Blockers for Release:
1. Level progression is non-existent (display lies to player)
2. Balance varies by hardware (fps-dependent mechanics)
3. No keyboard restart (friction in core loop)

### What Would Make This Great:
1. **3-5 level descent** with increasing difficulty
2. **Simple upgrade system** (choose one upgrade per level: speed, torch duration, vision range)
3. **Audio design** (atmospheric + feedback)
4. **Score/leaderboards** for replayability

### Current State Estimate:
- **Prototype Quality:** 8/10 (excellent proof of concept)
- **Feature Completeness:** 4/10 (missing progression, audio, polish)
- **Overall:** 6/10 (solid foundation, needs content)

### Recommendation:
**Do not publish yet.** Budget 1-2 weeks to add progression, fix bugs, and implement audio. Then this could be a standout minimalist roguelike.

---

## Test Notes

**Runs Simulated:** 10+ via code analysis  
**Completion Rate (estimated):** ~40% (skilled) / ~15% (new player)  
**Average Run Time:** ~30-45 seconds  
**Most Common Death:** Torch depletion (enemy contact rare with careful play)

---

*Report compiled by Sakura - North Star Studio QA*  
*Ready for dev review*
