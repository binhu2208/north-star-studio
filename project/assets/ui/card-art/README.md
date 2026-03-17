# Emotion Cards — Card Art Composition Guide

**Task:** ART-002  
**Date:** March 17, 2026  
**Artist:** Yoshi 🎨

---

## Overview

This guide defines the composition standards for Emotion Cards artwork. All card art follows these specifications to ensure visual consistency across the deck.

---

## Standard Art Area Dimensions

| Property | Value |
|----------|-------|
| **Width** | 600px |
| **Height** | 400px |
| **Aspect Ratio** | 3:2 (landscape) |
| **Position** | Centered horizontally, 80px from top of card |
| **Mask** | Rounded top corners (16px radius) |

---

## Composition Rules

### Focal Point Placement
- **Primary focal point:** Positioned along the golden ratio (approximately 1/3 from left or right)
- **Vertical placement:** Slightly above center (40% from top) for dynamic composition
- **Eye level:** If depicting characters, place eyes at 35-40% from top

### Margins & Safe Zone
- **Minimum margin from edge:** 20px
- **Element breathing room:** 30px minimum between distinct elements
- **Text overlay area:** Bottom 60px reserved for gradient overlay (text readability)

### Composition Principles
1. **Rule of Thirds:** Align key elements along thirds grid
2. **Leading Lines:** Use shapes/elements to guide eye toward focal point
3. **Negative Space:** Allow breathing room; don't overcrowd
4. **Depth:** Use overlapping elements for depth (foreground, midground, background)

---

## Style Guidelines by Emotion Family

### 😐 Neutral
- **Mood:** Calm, balanced, introspective
- **Color Palette:** 
  - Primary: `#A8A8A8` (Gray)
  - Secondary: `#E0E0E0` (Light Gray)
  - Accent: `#FFFFFF` (White)
- **Lighting:** Soft, diffused, even
- **Shapes:** Simple geometric forms, clean lines
- **Energy:** Subtle, minimal, still
- **Example imagery:** Abstract circles, soft gradients, minimal figures

### 💛 Warmth
- **Mood:** Comforting, hopeful, nurturing
- **Color Palette:**
  - Primary: `#E8A87C` (Peach)
  - Secondary: `#F4D03F` (Gold)
  - Accent: `#FFF8E7` (Cream)
- **Lighting:** Warm golden hour, soft glow
- **Shapes:** Rounded, organic, flowing
- **Energy:** Gentle expansion, radiating outward
- **Example imagery:** Sunlit scenes, embraces, cozy settings, nature blooms

### 🌑 Shadow
- **Mood:** Melancholic, mysterious, introspective
- **Color Palette:**
  - Primary: `#6C5B7B` (Dusty Purple)
  - Secondary: `#355C7D` (Deep Blue)
  - Accent: `#C8B8DB` (Lavender)
- **Lighting:** Dim, moonlight, single light source
- **Shapes:** Soft edges, flowing drapery, curves
- **Energy:** Inward, contemplative, subtle movement
- **Example imagery:** Night scenes, solitary figures, water reflections, mist

### 🔥 Fire
- **Mood:** Passionate, intense, dynamic
- **Color Palette:**
  - Primary: `#C06C47` (Terracotta)
  - Secondary: `#E74C3C` (Crimson)
  - Accent: `#FAD7A0` (Amber)
- **Lighting:** Strong contrast, dramatic shadows, backlighting
- **Shapes:** Sharp angles, explosive forms, jagged edges
- **Energy:** Outward explosion, upward movement, volatile
- **Example imagery:** Flames, conflicts, intense emotions, dramatic moments

### ⛈️ Storm
- **Mood:** Turbulent, powerful, volatile
- **Color Palette:**
  - Primary: `#5D6D7E` (Slate)
  - Secondary: `#2C3E50` (Navy)
  - Accent: `#AEB6BF` (Silver)
- **Lighting:** Dramatic clouds, lightning flashes, low contrast
- **Shapes:** Angular, sweeping, directional
- **Energy:** Chaotic but organized, directional force, tension
- **Example imagery:** Clouds, lightning, rain, wind, dynamic weather

---

## Technical Requirements

### File Format
- **Format:** PNG with transparency
- **Resolution:** 600×400px @ 300 DPI (print-ready)
- **Color Mode:** RGB

### Naming Convention
```
card-art-{emotion}.png

Examples:
- card-art-neutral.png
- card-art-warmth.png
- card-art-shadow.png
- card-art-fire.png
- card-art-storm.png
```

### Layering (for source files)
1. Background layer
2. Midground elements
3. Focal point
4. Foreground elements
5. Overlay effects (glow, atmosphere)

### Export Settings
- Flatten layers for final PNG
- Remove metadata
- Optimize file size (< 500KB preferred)

---

## Placeholder Templates

Placeholder images are provided in `assets/ui/card-art/` for development:

| File | Description |
|------|-------------|
| `card-art-placeholder-neutral.png` | Gray placeholder with dimensions |
| `card-art-placeholder-warmth.png` | Peach-toned placeholder |
| `card-art-placeholder-shadow.png` | Purple-toned placeholder |
| `card-art-placeholder-fire.png` | Red-toned placeholder |
| `card-art-placeholder-storm.png` | Blue-gray placeholder |

---

## Integration with Card Templates

The art area aligns with the card template structure:

```
┌─────────────────────────┐
│  [EMOTION FAMILY ICON]  │  ← 60px
│                         │
│   ┌─────────────────┐   │
│   │                 │   │  ← Art Area: 600×400px
│   │    CARD ART     │   │    Starts at y=80
│   │    600×400      │   │
│   │                 │   │
│   └─────────────────┘   │
│        ↑ 16px radius    │
├─────────────────────────┤
│  [CARD NAME]            │  ← 80px
├─────────────────────────┤
│  [EMOTION FAMILY]       │  ← 40px
├─────────────────────────┤
│  [EFFECT TEXT]          │  ← 200px
├─────────────────────────┤
│  [CARD TYPE]            │  ← 40px
└─────────────────────────┘
```

---

## Notes

- Art should work both with and without the gradient overlay
- Avoid fine details that won't read at card size
- Test at 50% scale to ensure readability
- Consider colorblind accessibility

---

*Yoshi 🎨 — March 17, 2026*
