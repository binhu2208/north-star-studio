# Visual Style Guide

**Agent:** Yoshi (Art)  
**Project:** Torch Roguelike  
**Date:** 2026-03-06  
**Status:** Phase 1 Deliverable

---

## Executive Summary

After exploring three distinct art directions, I recommend **Pixel Art (Direction 1)** for Torch Roguelike. It offers the best balance of development feasibility, genre alignment, and visual clarity for the torch/light mechanics.

---

## Direction 1: Pixel Art (RECOMMENDED)

### Visual Description

A moody, detailed pixel art style reminiscent of modern retro roguelikes. Dark, atmospheric dungeons with high-contrast lighting. Characters and enemies are readable at small sizes. The torch light creates dynamic, flickering illumination that feels alive.

**Mood:** Tense, claustrophobic, mysterious  
**Resolution:** 320x180 base (upscaled), 16x16 or 32x32 tiles  
**Animation:** Frame-based, 4-8 frames per action

### Color Palette

**Dungeon Base:**
- Walls: `#2A2520` (dark brown), `#3E362F` (mid brown)
- Floors: `#1A1714` (near black), `#25201C` (dark grey)
- Shadows: `#0D0B0A` (pure shadow)

**Flame Colors:**
- Orange: `#FF6B35`, `#F7C59F`, `#FFE4D6`
- Blue: `#4ECDC4`, `#7FDBDA`, `#C7F9F0`
- Green: `#95E1D3`, `#6BCB77`, `#D4F1E0`
- Purple: `#A8E6CF`, `#C7CEEA`, `#E0E5FF`
- White: `#F8F9FA`, `#E9ECEF`, `#FFFFFF`
- Black: `#212529`, `#343A40`, `#495057`

**UI Accents:**
- Health: `#E63946`
- Fuel: `#FFB703`
- Mana/Magic: `#4361EE`

### Reference Games

| Game | Why It Works | What We Borrow |
|------|--------------|----------------|
| **Into the Breach** | Clean readability, tactical clarity | Grid visibility, UI design |
| **Dead Cells** | Atmospheric pixel art, lighting | Particle effects, animation quality |
| **Darkest Dungeon** | Mood, darkness, torch mechanics | Lighting atmosphere, UI framing |
| **Caves of Qud** | Retro roguelike aesthetic | Tile-based clarity, color coding |
| **Noita** | Pixel physics, lighting | Dynamic lighting techniques |

### Pros

- ✅ **Genre Fit:** Roguelike players expect/love pixel art
- ✅ **Torch Lighting:** Easy to implement dynamic lighting with sprites
- ✅ **Development Speed:** Faster asset creation than 3D
- ✅ **Readability:** Clear grid-based movement
- ✅ **Mod Support:** Pixel art is easier for community mods
- ✅ **Performance:** Runs on low-end hardware (important for Steam Deck)

### Cons

- ❌ **Market Saturation:** Many pixel art roguelikes exist
- ❌ **Art Skill Required:** Good pixel art is harder than it looks
- ❌ **Animation Limits:** Frame-based animation has constraints

### Implementation Notes

- Use **normal maps** on sprites for dynamic lighting
- **Particle system** for flame flicker and sparks
- **Shader-based** darkness with torch cutout
- Tileset: 32x32 base, with 16x16 detail variants

---

## Direction 2: Stylized 3D (Low Poly)

### Visual Description

Low-poly 3D with atmospheric lighting and bold colors. Think "Into the Breach meets Monument Valley." Clean geometric shapes, strong silhouettes, and dramatic shadows. The torch casts real-time shadows that create tension.

**Mood:** Stylized, mysterious, modern  
**Poly Count:** 500-2000 per character, 100-500 per prop  
**Lighting:** Real-time with baked ambient

### Color Palette

**Dungeon:**
- Walls: `#2C3E50`, `#34495E` (slate blues)
- Floors: `#1A1A2E`, `#16213E` (deep purples)
- Accents: `#E94560` (coral highlights)

**Flames:**
- Use emissive materials with bloom
- Same base colors as pixel art, but with gradients

### Reference Games

| Game | Why It Works |
|------|--------------|
| **Monument Valley** | Clean geometric beauty |
| **Ashen** | Atmospheric low-poly |
| **Below** | Dark exploration mood |
| **Tunic** | Isometric 3D readability |

### Pros

- ✅ **Unique Look:** Stands out from pixel art crowd
- ✅ **Real Lighting:** Authentic torch shadows
- ✅ **Camera Control:** Can rotate/zoom for clarity
- ✅ **Modern Appeal:** Attracts non-roguelike players

### Cons

- ❌ **Scope Risk:** 3D is harder to iterate, more bugs
- ❌ **Team Size:** Needs dedicated 3D artist + tech artist
- ❌ **Performance:** Real-time lighting is expensive
- ❌ **Development Time:** 2-3x longer than pixel art

### Verdict

Beautiful but risky for a small team. Save for sequel or expansion.

---

## Direction 3: Hand-Drawn (Illustrated)

### Visual Description

Painterly, hand-drawn art with ink outlines and watercolor fills. Dark, sketchy dungeon backgrounds with detailed character illustrations. The torch reveals hand-drawn details in the darkness.

**Mood:** Artistic, storybook, gothic  
**Style:** Ink outlines + watercolor fills  
**Animation:** Spine-based or frame-by-frame

### Color Palette

**Dungeon:**
- Backgrounds: Desaturated greys and browns
- Details: Subtle ink washes
- Torch Light: Warm oranges cutting through cool shadows

### Reference Games

| Game | Why It Works |
|------|--------------|
| **Don't Starve** | Hand-drawn gothic style |
| **Cuphead** (less intense) | Hand-crafted animation |
| **Ori and the Blind Forest** | Painterly beauty |

### Pros

- ✅ **Distinctive:** No other roguelike looks like this
- ✅ **Artistic Appeal:** Attracts art-focused players
- ✅ **Streamable:** Very watchable on Twitch/YouTube

### Cons

- ❌ **Asset Pipeline:** Every sprite needs hand-drawing
- ❌ **Animation Burden:** Frame-by-frame is slow
- ❌ **Consistency:** Hard to maintain style across many assets
- ❌ **Revision Cost:** Changing a design means redrawing

### Verdict

Too expensive for initial scope. Consider for premium edition.

---

## Recommendation: Pixel Art

### Why Pixel Art Wins

1. **Feasibility:** We can produce a full game's worth of assets
2. **Genre Expectations:** Roguelike players love good pixel art
3. **Torch Mechanic:** Pixel-based lighting is proven and effective
4. **Team Fit:** Works with 1-2 artists vs. 3-4 for 3D
5. **Iteration Speed:** Can change designs quickly

### Art Production Plan

**Phase 1 (Weeks 1-4):**
- [ ] Finalize tileset (walls, floors, doors)
- [ ] Player character sprite + animations
- [ ] 3 basic enemy sprites
- [ ] Torch lighting shader prototype

**Phase 2 (Weeks 5-12):**
- [ ] Full dungeon tileset (variants, decorations)
- [ ] All enemy types (15-20 total)
- [ ] UI elements (menus, HUD)
- [ ] Particle effects (sparks, flame flicker)

**Phase 3 (Weeks 13-18):**
- [ ] Boss sprites
- [ ] Special room art (shrines, treasure)
- [ ] Polish pass (animation, effects)
- [ ] Trailer/screenshot assets

### Technical Requirements

- **Engine:** Godot (excellent 2D lighting) or Unity (2D URP)
- **Tools:** Aseprite (pixel art), Photoshop (textures)
- **Shaders:** Custom lighting shader for torch effect
- **Resolution:** 1920x1080 display, 320x180 internal (6x scale)

### Open Questions

1. Should we support 4K displays? (Requires higher-res assets)
2. Do we want pixel-perfect camera or smooth scrolling?
3. Accessibility: Colorblind mode for flame types?

---

*Document by Yoshi | OpenClaw Game Studio*
