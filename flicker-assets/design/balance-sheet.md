# Flicker - Balance Spreadsheet

## Torch Economy

| Parameter | Base Value | Min | Max | Notes |
|-----------|------------|-----|-----|-------|
| Burn Rate (idle) | 5%/s | 3%/s | 8%/s | Passive drain |
| Burn Rate (moving) | 10%/s | 6%/s | 16%/s | 2x idle |
| Attack Cost | 15% | 10% | 25% | Per swing |
| Critical Threshold | 20% | 15% | 25% | Red zone |
| Blackout Duration | 5s | 3s | 8s | Before death |

## Fuel Pickups

| Type | Restore | Spawn Weight | Level 1 | Level 2 | Level 3 |
|------|---------|--------------|---------|---------|---------|
| Small Ember | +10% | 60% | Common | Common | Rare |
| Medium Coal | +25% | 30% | Uncommon | Common | Uncommon |
| Large Log | +50% | 10% | Rare | Uncommon | Common |

## Enemy Scaling

| Level | Max Enemies | Spawn Delay | Speed Mult | Aggression |
|-------|-------------|-------------|------------|------------|
| 1 | 2 | 8.0s | 0.85x | Low |
| 2 | 4 | 5.0s | 1.00x | Medium |
| 3 | 6 | 3.0s | 1.15x | High |

## Speed Reference

| Entity | Speed (tiles/sec) | Relative |
|--------|-------------------|----------|
| Player (walk) | 3.0 | 1.0x |
| Player (run) | 4.5 | 1.5x |
| Enemy (flee) | 2.1 | 0.7x |
| Enemy (hunt) | 3.9 | 1.3x |
| Enemy (patrol) | 0.9 | 0.3x |

## Upgrade Costs & Effects

| Upgrade | Cost | Effect per Stack | Max Stacks |
|---------|------|------------------|------------|
| Swift Stride | 100 | +20% move speed | 3 |
| Efficient Burn | 150 | -20% fuel use | 2 |
| Bright Flame | 200 | +30% light radius | 1 |
| Quick Strike | 120 | -30% attack CD | 2 |

## Level Metrics (Target)

| Metric | Level 1 | Level 2 | Level 3 | Total |
|--------|---------|---------|---------|-------|
| Play Time | 60s | 90s | 120s | 270s (4.5min) |
| Fuel Pickups | 4 | 3 | 2 | 9 |
| Enemy Encounters | 2 | 6 | 10 | 18 |
| Upgrade Points | 150 | 250 | 400 | 800 |

## Scoring Formula

```
Level Score = 50 (base)
          + (Time Bonus: max(0, 100 - seconds_over_target * 2))
          + (Fuel Bonus: fuel_remaining * 1)
          + (No Damage: 100 if true)
          + (Repel Bonus: enemies_repelled * 10)

Total Score = Sum of all levels * Speed Multiplier
Speed Multiplier = 2.0 if total_time < 240s, else 1.0
```
