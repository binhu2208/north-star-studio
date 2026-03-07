# Flicker Assets

Shared art assets for the Flicker game project.

## Folder Structure

```
flicker-assets/
├── source/       # Source files (Aseprite, Photoshop, etc.)
├── exported/     # Exported sprites, tiles, animations
└── design/       # Style guides, references, documentation
```

## Usage

- **Source files** — Keep editable originals here
- **Exported files** — Optimized assets ready for engine import
- **Design docs** — Art direction, palettes, references

## Pipeline

1. Create/edit in `source/`
2. Export to `exported/`
3. Engine-specific folders (`flicker-godot/`, `flicker-html/`) import from `exported/`
