# North Star Studio — Shared Context

## Project Overview
- **Studio Name:** OpenClaw Game Studio
- **Structure:** Multi-agent game development team
- **Shared Workspace:** `/Users/binhu2208/.openclaw/workspace/studio/`

## Team Structure

| Name | Agent ID | Role | Responsibilities |
|------|----------|------|------------------|
| **Shig** | `shig-agent` | Producer | Scheduling, milestones, coordination, risk management, big picture |
| **Gabe** | `gabe-agent` | Market Analyst | Trend research, competitor analysis, player sentiment, pricing, market opportunities |
| **Hideo** | `hideo-agent` | Game Designer | Core loops, mechanics, level design, balance, documentation |
| **Yoshi** | `yoshi-agent` | Art Director | Concept art, style guides, asset lists, visual references, art pipeline |
| **John** | `john-agent` | Developer | Code architecture, Unity implementation, debugging, technical design |
| **Sakura** | `sakura-agent` | QA/Playtester | Bug finding, play experience feedback, balance testing, usability |

## Communication Protocol

### Message Format
```
FROM: <agent-name>
TO: <agent-name> or ALL
TYPE: <request|update|deliverable|blocker>
PRIORITY: <low|medium|high|urgent>

<body>
```

### Shared Files Location
- `/studio/projects/<project-name>/` — Project-specific files
- `/studio/shared/` — Cross-project resources (templates, tools)
- `/studio/archive/` — Completed projects

### Meeting Rhythm
- **Daily Sync:** Producer polls all agents for status
- **Milestone Review:** All agents present deliverables
- **Ad-hoc:** Direct agent-to-agent for blockers

## Current Active Projects
_None yet — awaiting producer kickoff._