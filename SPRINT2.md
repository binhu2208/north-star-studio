# Flicker - Sprint 2 Complete

## Changes Made

### Bug Fixes ✅
- **BUG-002 (Level Display):** Now properly shows current depth (1-3) and increments between levels
- **BUG-003 (FPS-Dependent Torch):** Torch now uses delta time for consistent burn rate across all frame rates
- **BUG-004 (No Keyboard Restart):** Added 'R' key binding to restart after game over/victory

### New Features ✅
- **3-Level Progression:** Complete 3 levels to win
  - Level 1: Base difficulty
  - Level 2: Faster torch drain, faster enemy, larger map
  - Level 3: Maximum difficulty
- **Upgrade System:** Choose one upgrade between levels:
  - ⚡ Speed Boost: Move faster (extra tiles per move)
  - 🕯️ Efficient Torch: Burns 30% slower
  - 🔆 Bright Torch: See 1 tile further
- **Exit Visibility:** Pulsing green glow ring around exit door
- **Run Timer:** Shows elapsed time in UI
- **Fuel Feedback:** Floating "+25%" text on pickup
- **Victory Screen:** Final stats (time + total fuel collected)

### Technical Improvements
- Single-file HTML structure maintained
- ~25KB total size
- Zero dependencies
- Runs in any modern browser

## How to Test

1. Open `index.html` in a browser
2. Play through all 3 levels
3. Test 'R' key restart
4. Verify torch burns at same speed regardless of frame rate
5. Check that exit pulses with green glow

## Known Limitations
- No audio yet
- Still emoji-based graphics
- No persistent high scores

## Next Steps
Ready for Review Cycle 2.
