# TASK: Design Flicker Balance & Progression

**Priority:** P1-Critical  
**Type:** Design  
**Parent Task:** Build Flicker Godot  
**Created by:** bin  
**Date:** 2026-03-06

## Objective
Design game balance, difficulty curve, and progression systems for Flicker.

## Design Requirements

### Torch Balance
- [ ] Base burn rate (% per second)
- [ ] Movement burns more fuel (multiplier)
- [ ] Attack fuel cost
- [ ] Fuel pickup amounts (+10%, +25%, +50%)
- [ ] Critical threshold (when enemy starts chasing)

### Enemy Balance
- [ ] Enemy speed (slower than player with torch, faster without)
- [ ] Enemy spawn rates per level
- [ ] Enemy AI: flee distance from torch
- [ ] Enemy AI: chase aggression when torch out

### Level Progression
- [ ] Level 1: Tutorial, forgiving
- [ ] Level 2: Moderate challenge
- [ ] Level 3: Hard, tense
- [ ] Difficulty scaling: enemy count, fuel scarcity

### Upgrade System
- [ ] Speed boost: +20% movement
- [ ] Fuel efficiency: -20% burn rate
- [ ] Torch brightness: +30% light radius
- [ ] Upgrade costs (earned between levels)

### Win/Lose Conditions
- [ ] Win: Reach exit on level 3
- [ ] Lose: Caught by enemy OR torch dies
- [ ] Session target: 5-10 minutes

## Deliverables
- Balance spreadsheet in `flicker-assets/design/`
- Design document with all numbers
- Playtest notes

## Assignment
**[hideo]** — Design and balance all systems

## Dependencies
Coordinate with John on implementation feasibility.