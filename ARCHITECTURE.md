# Architecture — Brad Frost Design System Squad

## Overview

Multi-agent Design System Squad (v5.6.0) with 6 agents across 3 tiers, orchestrated by design-chief. Research-grounded from 22+ published sources. Covers design system architecture, DesignOps, stakeholder adoption, and AI-ready component metadata.

## Squad Architecture (v5.6.0)

```
                    User Request
                         │
                         ▼
              ┌─────────────────────┐
              │    DESIGN-CHIEF     │  ← Orchestrator
              │  Routing + Triage   │
              │  *triage *route     │
              └────┬────┬────┬─────┘
                   │    │    │
        ┌──────────┘    │    └──────────┐
        ▼               ▼               ▼
┌───────────────┐ ┌───────────┐ ┌───────────────┐
│  BRAD FROST   │ │   DAVE    │ │   DAN MALL    │
│  (Tier 1)     │ │  MALOUF   │ │   (Tier 0)    │
│  Architecture │ │ (Tier 0)  │ │   Adoption    │
│  Components   │ │ DesignOps │ │   Buy-in      │
│  Tokens       │ │ Scaling   │ │   Stakeholder │
│  Audit        │ │ Metrics   │ │   Pitch       │
└───────┬───────┘ └───────────┘ └───────────────┘
        │
        ▼
┌───────────────┐     ┌─────────────────┐
│   BRAD-OPS    │     │  NANO-BANANA    │
│   Executor    │     │  Visual Utility  │
│   YOLO mode   │     │  AI Image Gen   │
│   Subagents   │     └─────────────────┘
└───────────────┘

         │              │              │             │
    ┌────┴────┐   ┌────┴────┐   ┌────┴────┐  ┌─────┴─────┐
    │ tasks/  │   │templates│   │  data/  │  │ workflows/│
    │  (67)   │   │  (13)   │   │  (19)   │  │    (7)    │
    └─────────┘   └─────────┘   └─────────┘  └───────────┘
         │              │
    ┌────┴────┐   ┌────┴──────┐
    │checklists│  │ protocols/│
    │  (11)    │  │    (3)    │
    └──────────┘  └───────────┘
```

## Agent Roster

| Agent | File | Tier | Role |
|-------|------|------|------|
| design-chief | agents/design-chief.md | Orchestrator | Routing, triage, coordination |
| design-system-v5 (Brad Frost) | agents/design-system-v5.md | Tier 1 | Architecture, tokens, audit, components |
| brad-ops | agents/brad-ops.md | Tier 1 | Execution engine, YOLO mode, subagent delegation |
| dave-malouf | agents/dave-malouf.md | Tier 0 | DesignOps, maturity, metrics, team scaling |
| dan-mall | agents/dan-mall.md | Tier 0 | Adoption, buy-in, stakeholder pitch |
| nano-banana-generator | agents/nano-banana-generator.md | Tier 1 | AI image generation for DS assets |

## Ecosystem-Aware Delegation (v5.6.0)

Brad delegates following a 6-level priority hierarchy before falling back to generic agents:

```
┌─────────────────────────────────────────────────────┐
│  1. SKILLS        commit, review, tdd, explore,     │
│                   debug, refactor, fix, build        │
├─────────────────────────────────────────────────────┤
│  2. MCP TOOLS     Context7 (library docs)           │
│                   Playwright (visual/a11y testing)   │
├─────────────────────────────────────────────────────┤
│  3. BRADOPS       DS executor (refactor, build,     │
│                   validate, YOLO mode)               │
├─────────────────────────────────────────────────────┤
│  4. AIOS AGENTS   @dev, @architect, @qa, @analyst,  │
│                   @data-engineer, @ux, @devops,      │
│                   @pm, @sm, @po                      │
├─────────────────────────────────────────────────────┤
│  5. PROJECT SQUADS  Discovered from aios-core/squads/│
│                     Cached in .state.yaml            │
├─────────────────────────────────────────────────────┤
│  6. CLAUDE CODE   scout, kraken, spark, oracle      │
│                   (generic fallback — last resort)   │
└─────────────────────────────────────────────────────┘

Routing: receive → check veto → classify → walk 1→6 → delegate or execute directly
Veto: audit/consolidate/tokenize/governance/voice → Brad executes directly (never delegated)
```

## Governance Layer

3 protocols enforce rules across the squad:

| Protocol | Purpose |
|----------|---------|
| ai-first-governance.md | Source hierarchy, evidence contracts, governance_check blocks |
| governance-execution-boundary.md | Ownership matrix — governance agents CREATE rules, execution agents USE rules |
| handoff.md | Standard handoff YAML format, 5 intra-squad + 2 cross-squad flows |

## Workflows (7)

| Workflow | Type | Description |
|----------|------|-------------|
| brownfield-complete.yaml | Sequential (10 steps) | Full audit → build pipeline |
| greenfield-new.yaml | Sequential (6 steps) | New DS from scratch |
| self-healing-workflow.yaml | Trigger-based | Auto-fix lint, a11y, token drift |
| agentic-readiness.yaml | Sequential | Validate DS for AI consumption |
| audit-only.yaml | Sequential | Standalone audit |
| dtcg-tokens-governance.yaml | Sequential | Token governance pipeline |
| motion-quality.yaml | Sequential | Motion/animation audit |

## Data Flow

### Brownfield Pipeline (Primary)

```
User codebase → *audit → Pattern Inventory (.state.yaml)
                          ↓
                   *consolidate → Reduction Map
                          ↓
                   *tokenize → tokens.yaml (SSOT)
                          ↓
                   *migrate → 4-Phase Migration Plan
                          ↓
                   *build → Production Components
                          ↓
                   *compose → Molecules/Organisms
```

## Decision Architecture

5-stage decision pipeline with weighted factors:

| Factor | Weight | Description |
|--------|--------|-------------|
| Real product need | 0.30 | Does a real product need this? |
| Reusability | 0.25 | Will 3+ products use it? |
| Single Responsibility | 0.20 | Does it do one thing well? |
| Governance clarity | 0.15 | Is ownership clear? |
| Accessibility | GATE | Binary pass/fail (WCAG AA) |

### Veto System

13 veto rules (BF_VT_001 → 013) can block decisions regardless of scores.

## Dependency Resolution

```
dependencies.tasks      → tasks/{filename}.md
dependencies.templates  → templates/{filename}
dependencies.checklists → checklists/{filename}.md
dependencies.data       → data/{filename}
dependencies.workflows  → workflows/{filename}
dependencies.protocols  → protocols/{filename}
```

## Metrics

| Metric | Value |
|--------|-------|
| Agents | 6 |
| Tasks | 67 |
| Checklists | 11 |
| Templates | 13 |
| Data files | 19 |
| Workflows | 7 |
| Protocols | 3 |
| Total lines | ~35,000 |
