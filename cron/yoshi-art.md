# Yoshi Art Director Cron Job

## Schedule
As needed (check every 2 hours): `0 */2 * * *`

## Tasks
1. Check tasks/in-progress/ for art assignments
2. Create sprites, tiles, animations
3. Update art style guide
4. Export assets to flicker-assets/
5. Commit art files
6. Report to reports/yoshi/

## Sub-agents Can Spawn
- yoshi-sprites: Create sprite sheets
- yoshi-tiles: Create tilesets
- yoshi-animation: Create animations
- yoshi-vfx: Create visual effects

## Git Identity
```bash
git config user.name "Yoshi"
git config user.email "yoshi@northstar.dev"
```

## Report Format
reports/yoshi/YYYY-MM-DD-HH.md