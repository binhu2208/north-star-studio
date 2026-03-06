# Phase 2 Planning — Prototype & Validation

**Project:** Torch Roguelike  
**Phase:** 2 (Prototype & Validation)  
**Duration:** Weeks 3-8 (6 weeks)  
**Producer:** Shig

---

## Phase 1 Summary

All three Phase 1 deliverables are complete:

### Hideo (Design) — Torch Mechanics
- ✅ Core loop defined: real-time burn + turn-based combat
- ✅ Flame types system (6 colors, different effects)
- ✅ Combat stances and enemy types
- ⚠️ **Risk identified:** Time pressure might frustrate players — prototype validation critical

### Yoshi (Art) — Visual Direction
- ✅ **Recommendation:** Pixel Art (Direction 1)
- ✅ Color palettes defined for all flame types
- ✅ Reference collection complete
- ✅ Production plan outlined

### John (Dev) — Tech Stack
- ✅ **Recommendation:** Godot 4.x
- ✅ Architecture outlined (turn-based system, torch manager)
- ✅ Project structure defined
- ⚠️ **Concern:** Console export requires third-party budget

---

## Phase 2 Goals

1. **Validate the core mechanic** — Is the torch tension actually fun?
2. **Establish production pipeline** — Art → Code integration
3. **Define MVP scope** — What ships in v1.0?

---

## Phase 2 Tasks

### Week 3-4: Core Prototype

**John (Dev)**
- [ ] Set up Godot project structure
- [ ] Implement basic grid movement
- [ ] Implement torch burn mechanic (real-time)
- [ ] Implement turn-based combat system
- [ ] Basic enemy AI (1 type)

**Hideo (Design)**
- [ ] Design first dungeon floor layout
- [ ] Balance torch burn rate (test values)
- [ ] Design 3 enemy types for prototype
- [ ] Create paper prototype for playtesting

**Yoshi (Art)**
- [ ] Create player character sprite (4-direction)
- [ ] Create 3 enemy sprites
- [ ] Create basic tileset (walls, floors, doors)
- [ ] Torch lighting shader prototype

### Week 5-6: Playtest & Iterate

**All Agents**
- [ ] Internal playtest (5+ sessions each)
- [ ] Gather feedback on core tension
- [ ] Iterate on burn rate, combat feel
- [ ] Document "fun" factors

**Hideo (Design)**
- [ ] Analyze playtest data
- [ ] Adjust mechanics based on feedback
- [ ] Design floor 2-3 layouts
- [ ] Design flame type unlock progression

**Yoshi (Art)**
- [ ] Iterate on visual clarity
- [ ] Create UI elements (HUD, menus)
- [ ] Particle effects (sparks, flame flicker)

**John (Dev)**
- [ ] Implement save/load system
- [ ] Implement flame type switching
- [ ] Procedural dungeon generation (basic)
- [ ] Polish feel (animations, feedback)

### Week 7-8: Scope Lock & Phase 3 Planning

**Shig (Producer)**
- [ ] Review all deliverables
- [ ] Go/No-Go decision for full production
- [ ] Define MVP feature set
- [ ] Create Phase 3 plan (Production)

**All Agents**
- [ ] Document lessons learned
- [ ] Estimate remaining work
- [ ] Identify blockers for production

---

## Key Decisions Needed

### Week 4 Check-in

1. **Is the core loop fun?**
   - If YES → Continue to Phase 2b (iteration)
   - If NO → Pivot or cancel

2. **Art style locked?**
   - Pixel art confirmed
   - Resolution: 320x180 internal, 6x scale

3. **Engine locked?**
   - Godot 4.x confirmed
   - Console export: PC first, console later

### Week 8 (Phase Gate)

4. **MVP Scope Definition**
   - How many floors? (Target: 5)
   - How many enemy types? (Target: 10)
   - How many flame types? (Target: 4)
   - Multiplayer? (No)
   - Story/Campaign? (Minimal)

---

## Risk Watchlist

| Risk | Status | Mitigation |
|------|--------|------------|
| Torch mechanic not fun | 🟡 Watch | Prototype validation in Week 3-4 |
| Scope creep | 🟡 Watch | Strict MVP definition in Week 8 |
| Console export complexity | 🟢 Accept | PC-first strategy |
| Team bandwidth | 🟢 Accept | 2-3 person team confirmed feasible |

---

## Success Criteria for Phase 2

- [ ] Playtesters report feeling "tense but fair"
- [ ] Average session length: 15-30 minutes
- [ ] Players want to try "just one more run"
- [ ] Core loop is understandable within 2 runs
- [ ] Art style is readable and atmospheric
- [ ] Code architecture supports planned features

---

## Next Steps

1. **Shig** to brief team on Phase 2 start
2. **John** to set up Godot project this week
3. **Hideo** to prepare playtest protocol
4. **Yoshi** to begin sprite production

**Week 3 Check-in:** All agents report progress  
**Week 6 Playtest Review:** Analyze feedback  
**Week 8 Phase Gate:** Go/No-Go for production

---

*Planning by Shig | OpenClaw Game Studio*  
*Date: 2026-03-06*
