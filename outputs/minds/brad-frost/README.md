# Brad Frost — Design System Architect v5.2.1

> Expert Mind Pack for Design System workflows powered by Brad Frost's Atomic Design methodology.
> Research-grounded DNA from 22 published sources. 9 specialist experts. 52 commands. 48 tasks.

## Quick Start

```
@design-system
```

Aliases: `@brad`, `@brad-frost`

Brad will greet you and await commands. Type `*help` to see all available commands.

> **Nota:** O comando oficial de ativação é `@design-system`. Os aliases `@brad` e `@brad-frost` podem ser usados informalmente mas dependem de configuração no projeto.

## Instalação / Atualização

```bash
# Instalar ou atualizar para a última versão
bash scripts/update-brad.sh

# Instalar num caminho específico
bash scripts/update-brad.sh ./meu-projeto/.claude/agents/brad-frost
```

O script compara a versão local com a remota e só baixa se houver atualização.

## Structure

```
outputs/minds/brad-frost/
├── agent/
│   └── design-system-v5.md    # Complete agent definition (2150+ lines)
├── tasks/                      # 48 executable task files
├── templates/                  # 11 output templates
├── checklists/                 # 7 validation checklists
├── data/                       # 15 reference data files
├── analysis/                   # Source analysis artifacts
├── dna/                        # Extracted DNA files
├── README.md                   # This file
├── CHANGELOG.md                # Version history (v3.0 → v5.2.1)
└── ARCHITECTURE.md             # System architecture
```

## Workflows

| Workflow | Commands | Use Case |
|----------|----------|----------|
| **Brownfield** | `*audit → *consolidate → *tokenize → *migrate → *build` | Audit existing codebase, reduce redundancy |
| **Greenfield** | `*setup → *build → *compose → *document` | Start fresh with tokens |
| **Refactoring** | `*refactor-plan → *refactor-execute` | Decompose monolithic components |
| **Accessibility** | `*a11y-audit → *contrast-matrix → *focus-order → *aria-audit` | WCAG 2.2 compliance |
| **Audit-Only** | `*audit → *shock-report → *calculate-roi` | Executive report + ROI |
| **DS Metrics** | `*ds-health → *bundle-audit → *token-usage → *dead-code` | Health dashboard |
| **Agentic DS** | `*agentic-audit → *agentic-setup` | AI-ready DS infrastructure |
| **W3C Tokens** | `*token-w3c → *token-modes` | DTCG v1.0 stable format |
| **Performance** | `*perf-budget` | Performance budgets por nível atômico |
| **EAA Compliance** | `*eaa-audit` | European Accessibility Act (EN 301 549) |

## Expert Routing (9 Experts)

Consult specialists via `*ask {expert} "{question}"`:

| Expert | Tier | Domain | Triggers |
|--------|------|--------|----------|
| **Nathan Curtis** | Tier 1 | Token systems, documentation, governance | `*tokenize`, `*document`, `*ds-govern` |
| **Dan Mall** | Tier 1 | DS strategy, ROI, adoption | `*calculate-roi`, `*shock-report` |
| **Jina Anne** | Tier 1 | Token architecture, W3C DTCG | `*token-w3c`, `*token-modes`, `*theme-multi` |
| **Kaelig** | Tier 1 | Multi-platform tokens, tooling | `*export-dtcg` |
| **Dave Malouf** | Tier 1 | DesignOps, team operations | `*designops`, `*designops-assess`, `*designops-maturity` |
| **Val Head** | Tier 2 | Motion & animation | `*motion-audit` |
| **Steve Kinney** | Tier 2 | Visual testing, Storybook | `*visual-test` |
| **Dieter Rams** | Tier 2 | Quality reduction (10 Principles) | `*quality-gate`, `*reduce` |
| **Massimo Vignelli** | Tier 2 | Token discipline, constraints | `*constrain`, `*token-discipline` |

## Key Commands

| Command | Description |
|---------|-------------|
| `*audit {path}` | Scan codebase for pattern redundancy |
| `*build {component}` | Build production-ready React component |
| `*compose {molecule}` | Compose molecule from existing atoms |
| `*tokenize` | Extract design tokens to YAML/JSON/CSS |
| `*shock-report` | Visual HTML report for stakeholders |
| `*calculate-roi` | ROI calculation for DS investment |
| `*a11y-audit {path}` | WCAG 2.2 accessibility audit |
| `*contrast-matrix {path}` | Color contrast matrix (WCAG + APCA) |
| `*ds-health` | DS health metrics dashboard |
| `*refactor-plan` | Analyze codebase for refactoring candidates |
| `*agentic-audit {path}` | Evaluate DS machine-readability for AI |
| `*ask {expert} "{q}"` | Consult specialist expert |
| `*yolo` | Toggle parallel execution mode |
| `*perf-budget` | Performance budgets por nível atômico |
| `*eaa-audit` | European Accessibility Act audit (EN 301 549) |
| `*help` | Full command list (52 commands) |

## DNA Architecture

The agent contains research-grounded DNA extracted from Brad Frost's published works:

- **Voice DNA**: identity, vocabulary (15 power words), 12 signature phrases, 4 metaphor categories, 7 tone dimensions, anti-patterns, immune system, voice contradictions
- **Thinking DNA**: Atomic Design (5 stages), 3 secondary frameworks, diagnostic framework (6 red flags, 7 green flags), 6 decision heuristics, 13 veto rules, recognition patterns, objection handling

Sources include bradfrost.com, Smashing Magazine, Design Better Podcast, and conference talks (2019-2025).

## Pattern ID System

All heuristics use the `BF_` prefix:

| Category | IDs | Count |
|----------|-----|-------|
| Red Flags | BF_RF_001 → 006 | 6 |
| Green Flags | BF_GF_001 → 007 | 7 |
| Decision Heuristics | BF_DH_001 → 006 | 6 |
| Veto Rules | BF_VT_001 → 013 | 13 |
| Instant Detection | BF_ID_001 → 005 | 5 |
| Blind Spots | BF_BS_001 → 008 | 8 |

## Version

**v5.2.1** — 52 commands, 48 tasks, 9 expert DNAs, 45+ pattern IDs, 22 research citations, 15 data files.

See [CHANGELOG.md](CHANGELOG.md) for full version history.

## Validation Scores

| Metric | Score |
|--------|-------|
| QA After Creation | 10.0/10 |
| Validate Squad | 8.75/10 (Grade A) |
| Fidelity Score | 100% ELITE (40/40 checkpoints) |
| Smoke Test Routing | PASS (9/9 experts, 19/19 triggers) |
