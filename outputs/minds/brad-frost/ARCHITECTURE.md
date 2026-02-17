# Architecture — Brad Frost Design System Agent

## Overview

Single-agent Expert Mind with embedded Voice DNA + Thinking DNA, research-grounded from 22 published sources. The agent operates as a self-contained design system consultant with 9 specialist expert routing capabilities.

## Component Architecture

```
┌─────────────────────────────────────────────────────┐
│                  AGENT LAYER                         │
│  design-system-v5.md (2150+ lines)                  │
│  ┌──────────────┐  ┌──────────────┐                 │
│  │  Voice DNA   │  │ Thinking DNA │                 │
│  │  - identity  │  │ - Atomic     │                 │
│  │  - vocabulary│  │   Design     │                 │
│  │  - tone      │  │ - heuristics │                 │
│  │  - metaphors │  │ - vetos      │                 │
│  │  - anti-pat  │  │ - diagnostics│                 │
│  └──────────────┘  └──────────────┘                 │
│  ┌──────────────────────────────────┐               │
│  │       Expert Routing (9)         │               │
│  │  Tier 1: NC, DM, JA, KDP, DMa   │               │
│  │  Tier 2: VH, SK, DR, MV         │               │
│  └──────────────────────────────────┘               │
│  ┌──────────────────────────────────┐               │
│  │       Commands (52)              │               │
│  │  Mapped to tasks via deps        │               │
│  └──────────────────────────────────┘               │
└─────────────────────────────────────────────────────┘
         │              │              │
    ┌────┴────┐   ┌────┴────┐   ┌────┴────┐
    │  tasks/ │   │templates│   │  data/  │
    │  (46)   │   │  (11)   │   │  (14)   │
    └─────────┘   └─────────┘   └─────────┘
         │
    ┌────┴────┐
    │checklists│
    │   (7)    │
    └──────────┘
```

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

### Expert Routing Flow

```
User: *ask {expert} "{question}"
        ↓
  ROUTING RULES (7 rules):
    1. Match command triggers → auto-route
    2. Match *ask alias → load DNA
    3. Preserve Brad context
    4. Load external DNA file (if non-null dna_path)
    5. Respond in expert voice
    6. Return to Brad context
    7. Cross-expert queries → Brad synthesizes
        ↓
  Expert responds using their DNA
```

## State Management

```yaml
# .state.yaml — persisted after every command
workflow_phase: "audit_complete | tokenize_complete | building_components | complete"
inventory_results: {...}
consolidation_decisions: {...}
token_locations: {...}
migration_plan: {...}
components_built: [...]
agent_history: [{command, timestamp}, ...]
```

## Dependency Resolution

The agent references files via relative paths within the pack:

```
dependencies.tasks     → tasks/{filename}.md
dependencies.templates → templates/{filename}
dependencies.checklists → checklists/{filename}.md
dependencies.data      → data/{filename}
```

IDE-FILE-RESOLUTION maps `{type}/{name}` to the correct directory at execution time.

## Decision Architecture

The agent uses a 5-stage decision pipeline with weighted factors:

| Factor | Weight | Description |
|--------|--------|-------------|
| Real product need | 0.30 | Does a real product need this? |
| Reusability | 0.25 | Will 3+ products use it? |
| Single Responsibility | 0.20 | Does it do one thing well? |
| Governance clarity | 0.15 | Is ownership clear? |
| Accessibility | GATE | Binary pass/fail (WCAG AA) |

### Veto System

13 veto rules (BF_VT_001 → 013) can block decisions regardless of scores:
- BF_VT_001-004: Core design system integrity
- BF_VT_005-006: Accessibility and deprecation
- BF_VT_007-011: Rams quality principles
- BF_VT_012-013: Vignelli token discipline

## Security Model

- Read-only codebase access during audit
- No code execution during pattern detection
- Input sanitization (paths, thresholds, color formats)
- .state.yaml schema validation on write
- Backup before overwriting state
