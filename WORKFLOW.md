# North Star Studio - Complete Team Workflow

## 🎯 Overview
**Agile/Iterative Methodology** with hybrid self-serve execution

---

## 👥 Team Structure

### Reporting Chain
```
bin (You) - Studio Head
    ↓
Macs (Me) - Executive Assistant  
    ↓
Shig (Producer/Strategist/Publisher)
    ├─ Gabe (Market Intelligence)
    ├─ Sakura (QA/Testing)
    └─ Dev Team (John, Yoshi, Hideo)
```

### Roles & Responsibilities

| Member | Role | Schedule | Key Responsibilities |
|--------|------|----------|---------------------|
| **Shig** | Producer/Strategist/Publisher | Every 10 min | Review market & QA reports, prioritize backlog (P1/P2/P3), manage publishing, escalate to Macs |
| **Gabe** | Market Intelligence | Hourly | Research trends, analyze competitors, report market data to Shig, on-demand deep dives |
| **Sakura** | QA/Testing | Every 10 min | Test completed work, create bug tickets (tagged by type), approve or block releases |
| **John** | Developer | Every 10 min | Execute code tasks, fix code/AI bugs (P1 assigned by Shig, P2/P3 self-serve) |
| **Yoshi** | Art Director | Every 10 min | Create art assets, fix visual bugs (P1 assigned, P2/P3 self-serve) |
| **Hideo** | Game Designer | Every 10 min | Design mechanics, fix balance issues (P1 assigned, P2/P3 self-serve) |

---

## 🔄 Complete Workflow

### 1. Intelligence Gathering (Continuous)

**Gabe (Hourly):**
- Monitors Steam, Reddit, Twitter for trends
- Analyzes competitor moves
- Tracks player sentiment
- Submits report to `reports/gabe/YYYY-MM-DD-HH.md`

**Sakura (Every 10 min):**
- Checks `tasks/done/` for completed work
- Tests builds and features
- Creates bug tickets in `tasks/todo/`
- Submits QA reports to `reports/sakura/`

### 2. Strategic Review (Every 10 min)

**Shig:**
- Reads Gabe's market reports
- Reads Sakura's QA reports
- Reviews all tasks in `tasks/todo/`
- **Prioritizes backlog:**
  - P1-Critical: Game-breaking, must fix now
  - P2-Important: Should fix soon  
  - P3-Nice-to-have: Fix if time permits
- Tags tasks: `tasks/todo/P1-[john]-crash-fix.md`
- **P1 Critical:** Shig may assign directly to specific person
- **Publishing:** Manages Steam/Itch.io strategy, pricing, launch timing

### 3. Execution (Every 10 min)

**John, Yoshi, Hideo:**
- Poll `tasks/todo/` for available tasks
- **Filter by:**
  - Priority (P1 first, then P2, then P3)
  - Bug type tag ([john], [yoshi], [hideo])
- **Claim task:** Rename to `tasks/in-progress/[name]-P1-task.md`
- **Execute:** Do the work
- **Commit:** Push to GitHub with proper identity
- **Complete:** Move to `tasks/done/[name]-P1-task.md`
- **Report:** Add notes to `reports/[name]/`

### 4. Bug Creation & Assignment

**Sakura creates bug tickets:**
```
Format: tasks/todo/P[1-3]-[fixer]-brief-description.md

Examples:
- P1-[john]-crash-on-level-3.md          → John fixes
- P2-[yoshi]-player-sprite-missing.md    → Yoshi fixes  
- P3-[hideo]-enemy-damage-too-high.md    → Hideo fixes
```

**P1 Critical:** Shig may assign directly
**P2/P3:** Self-serve by fixer type

### 5. Publishing (When Ready)

**Shig:**
- Reviews QA approval from Sakura
- Manages Steam page setup
- Handles Itch.io publishing
- Sets pricing strategy
- Plans launch timing
- Coordinates marketing

### 6. Reporting & Escalation

**Shig to Macs:**
- Consolidated status reports
- Strategic insights from market data
- Publishing timeline updates
- **Escalate only:** Critical blockers, scope changes, major decisions

**Macs to bin:**
- Filtered updates (no noise)
- Strategic decisions needing approval
- Publishing go/no-go

---

## 📁 GitHub Structure

```
north-star-studio/
├── tasks/
│   ├── todo/           # Backlog (prioritized by Shig)
│   ├── in-progress/    # Active work
│   ├── done/           # Completed, awaiting QA
│   ├── approved/       # QA approved
│   └── blocked/        # Issues needing escalation
├── reports/
│   ├── shig/           # Strategic reports
│   ├── gabe/           # Market intelligence
│   ├── sakura/         # QA reports
│   ├── john/           # Dev updates
│   ├── yoshi/          # Art updates
│   └── hideo/          # Design updates
├── flicker-html/       # HTML version
├── flicker-godot/      # Godot version
├── flicker-assets/     # Shared assets
├── cron/               # Agent job definitions
└── memory/             # Agent memory files
```

---

## 🏷️ Task Priority System

| Priority | Meaning | Who Decides | Who Executes |
|----------|---------|-------------|--------------|
| **P1-Critical** | Game-breaking, crash, softlock | Shig (may assign directly) | Tagged fixer |
| **P2-Important** | Major bug, missing feature | Shig sets priority | Self-serve by type |
| **P3-Nice** | Polish, optimization | Shig sets priority | Self-serve by type |

---

## 🐛 Bug Type Assignment

| Bug Category | Fixer | Examples |
|--------------|-------|----------|
| **Code/Logic/AI** | John | Crashes, AI broken, movement bugs, save issues |
| **Art/Visual** | Yoshi | Missing sprites, wrong colors, animation glitches, UI issues |
| **Design/Balance** | Hideo | Wrong numbers, OP/UP mechanics, level design issues, economy broken |

---

## ⏱️ Cron Schedules

| Agent | Frequency | Primary Activity |
|-------|-----------|------------------|
| Shig | Every 10 min | Review reports, prioritize, manage publishing |
| Gabe | Hourly | Market research, competitor analysis |
| Sakura | Every 10 min | Test work, create bug tickets, QA reports |
| John | Every 10 min | Execute dev tasks, fix code bugs |
| Yoshi | Every 10 min | Create art, fix visual bugs |
| Hideo | Every 10 min | Design mechanics, fix balance issues |

---

## 🚀 Key Principles

1. **Market-Driven:** Gabe's hourly intelligence guides priorities
2. **Quality-First:** Sakura's QA gates all releases
3. **Strategic Direction:** Shig prioritizes, doesn't micromanage
4. **Fast Execution:** Dev team self-serves from prioritized backlog
5. **Clear Ownership:** Bug type determines fixer, no confusion
6. **Publishing Focus:** Shig manages release strategy end-to-end
7. **Escalation Only:** Macs/bin only see critical issues

---

## ✅ Success Metrics

- **Speed:** Tasks move from todo → done in hours, not days
- **Quality:** Sakura approval rate >90%
- **Market Fit:** Gabe's insights reflected in shipped features
- **Autonomy:** Dev team needs <5% Shig intervention
- **Publishing:** Clean launches on Steam/Itch.io

---

*Workflow Version: 2026-03-06*  
*Methodology: Hybrid Agile (Strategic Direction + Self-Serve Execution)*