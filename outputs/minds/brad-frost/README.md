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
├── agents/
│   └── design-system-v5.md    # Agent definition completo (2150+ lines)
├── tasks/                      # 48 executable task files
├── templates/                  # 11 output templates
├── checklists/                 # 7 validation checklists
├── data/                       # 15 reference data files
├── analysis/                   # Source analysis artifacts
├── dna/                        # Extracted DNA files
├── config.yaml                 # Squad metadata e registry de dependências
├── README.md                   # This file
├── CHANGELOG.md                # Version history (v3.0 → v5.2.1)
└── ARCHITECTURE.md             # System architecture
```

---

## Workflows

| Workflow | Commands | Use Case |
|----------|----------|----------|
| **Brownfield** | `*audit → *consolidate → *tokenize → *migrate → *build` | Audit existing codebase, reduce redundancy |
| **Greenfield** | `*setup → *build → *compose → *document` | Start fresh with tokens |
| **Refactoring** | `*refactor-plan → *refactor-execute` | Decompose monolithic components |
| **Accessibility** | `*a11y-audit → *contrast-matrix → *focus-order → *aria-audit` | WCAG 2.2 compliance |
| **EAA Compliance** | `*eaa-audit` | European Accessibility Act (EN 301 549) |
| **Audit-Only** | `*audit → *shock-report → *calculate-roi` | Executive report + ROI |
| **DS Metrics** | `*ds-health → *bundle-audit → *token-usage → *dead-code` | Health dashboard |
| **Performance** | `*perf-budget` | Performance budgets por nível atômico |
| **Agentic DS** | `*agentic-audit → *agentic-setup` | AI-ready DS infrastructure |
| **W3C Tokens** | `*token-w3c → *token-modes → *export-dtcg` | DTCG v1.0 stable format + Display P3 |
| **Theming** | `*theme-multi` | Multi-brand token layer architecture |
| **Fluent 2** | `*fluent-audit → *fluent-build` | Microsoft Fluent 2 design system |
| **Motion** | `*motion-audit` | Animation tokens + reduced-motion |
| **Visual Testing** | `*visual-test` | Automated visual regression testing |
| **Multi-framework** | `*multi-framework` | Web Components strategy |
| **Figma Pipeline** | `*figma-pipeline` | Figma-to-code via MCP Server |
| **Governance** | `*ds-govern` | DS governance model setup |
| **DesignOps** | `*designops` | Team operations workflow |
| **Reading UX** | `*reading-audit` | Typography + reading experience audit |

---

## All 48 Tasks

### Audit & Analysis

| Task | File | Description |
|------|------|-------------|
| `*audit` | `ds-audit-codebase.md` | Scan codebase for pattern redundancy and duplication |
| `*scan` | `ds-scan-artifact.md` | Quick artifact scan for DS compliance |
| `*shock-report` | `ds-generate-shock-report.md` | Visual HTML report for stakeholders |
| `*calculate-roi` | `ds-calculate-roi.md` | ROI calculation for DS investment |
| `*ds-health` | `ds-health-metrics.md` | DS health metrics dashboard |
| `*bundle-audit` | `bundle-audit.md` | Bundle size analysis per component |
| `*dead-code` | `dead-code-detection.md` | Find unused components and tokens |
| `*token-usage` | `token-usage-analytics.md` | Token adoption analytics |
| `*design-compare` | `design-compare.md` | Compare design reference vs code |
| `*validate-tokens` | `validate-design-fidelity.md` | Validate token fidelity against spec |

### Build & Compose

| Task | File | Description |
|------|------|-------------|
| `*build` | `ds-build-component.md` | Build production-ready React component (with MCP Discovery) |
| `*compose` | `ds-compose-molecule.md` | Compose molecule from existing atoms |
| `*extend` | `ds-extend-pattern.md` | Extend existing pattern with variants |
| `*rebuild` | `ds-rebuild-artifact.md` | Rebuild artifact from scratch |
| `*setup` | `ds-setup-design-system.md` | Bootstrap new design system |
| `*bootstrap-shadcn` | `bootstrap-shadcn-library.md` | Setup shadcn/ui component library |

### Tokens & Theming

| Task | File | Description |
|------|------|-------------|
| `*tokenize` | `ds-extract-tokens.md` | Extract design tokens to YAML/JSON/CSS |
| `*token-w3c` | `ds-token-w3c-extract.md` | W3C DTCG v1.0 token extraction (Display P3) |
| `*token-modes` | `ds-token-modes.md` | Token modes (light/dark/compact) |
| `*export-dtcg` | `export-design-tokens-dtcg.md` | Export tokens in DTCG format |
| `*theme-multi` | `ds-theme-multi-brand.md` | Multi-brand theming architecture |
| `*contrast-matrix` | `contrast-matrix.md` | Color contrast matrix (WCAG + APCA + Display P3) |

### Accessibility

| Task | File | Description |
|------|------|-------------|
| `*a11y-audit` | `a11y-audit.md` | WCAG 2.2 accessibility audit |
| `*aria-audit` | `aria-audit.md` | ARIA patterns and roles audit |
| `*focus-order` | `focus-order-audit.md` | Focus order and keyboard navigation |
| `*eaa-audit` | `ds-eaa-audit.md` | European Accessibility Act (EN 301 549) |

### Refactoring

| Task | File | Description |
|------|------|-------------|
| `*refactor-plan` | `atomic-refactor-plan.md` | Analyze codebase for refactoring candidates |
| `*refactor-execute` | `atomic-refactor-execute.md` | Execute atomic decomposition |
| `*consolidate` | `ds-consolidate-patterns.md` | Consolidate duplicate patterns |
| `*migrate` | `ds-generate-migration-strategy.md` | Generate migration strategy |
| `*tailwind-upgrade` | `tailwind-upgrade.md` | Tailwind CSS version upgrade |
| `*audit-tailwind` | `audit-tailwind-config.md` | Audit Tailwind config for DS alignment |

### Documentation & Reports

| Task | File | Description |
|------|------|-------------|
| `*document` | `ds-generate-documentation.md` | Generate DS documentation |
| `*create-doc` | `create-doc.md` | Create specific doc page |

### Advanced Workflows

| Task | File | Description |
|------|------|-------------|
| `*agentic-audit` | `ds-agentic-audit.md` | Evaluate DS machine-readability for AI agents |
| `*agentic-setup` | `ds-agentic-setup.md` | Setup agentic DS infrastructure |
| `*fluent-audit` | `ds-fluent-audit.md` | Audit against Microsoft Fluent 2 |
| `*fluent-build` | `ds-fluent-build.md` | Build Fluent 2 components |
| `*motion-audit` | `ds-motion-audit.md` | Animation tokens + prefers-reduced-motion |
| `*visual-test` | `ds-visual-regression.md` | Visual regression testing setup |
| `*multi-framework` | `ds-multi-framework.md` | Web Components cross-framework strategy |
| `*figma-pipeline` | `ds-figma-pipeline.md` | Figma-to-code pipeline via MCP |
| `*ds-govern` | `ds-governance.md` | DS governance model |
| `*designops` | `ds-designops.md` | DesignOps team operations |
| `*perf-budget` | `ds-perf-budget.md` | Performance budgets por nível atômico |
| `*reading-audit` | `audit-reading-experience.md` | Typography and reading experience |
| `*integrate` | `ds-integrate-squad.md` | Integrate DS into existing project |
| `*execute-checklist` | `execute-checklist.md` | Execute validation checklist |

---

## 11 Templates

Output templates used by tasks to generate standardized reports and artifacts:

| Template | Purpose |
|----------|---------|
| `ds-tokens-schema-tmpl.yaml` | Token schema definition |
| `tokens-schema-tmpl.yaml` | Token output format |
| `ds-state-persistence-tmpl.yaml` | Agent state persistence |
| `state-persistence-tmpl.yaml` | State tracking |
| `ds-health-report-tmpl.md` | Health metrics report |
| `ds-migration-strategy-tmpl.md` | Migration strategy document |
| `migration-strategy-tmpl.md` | Migration plan output |
| `ds-artifact-analysis.md` | Artifact scan results |
| `component-visual-spec-tmpl.md` | Visual spec for components |
| `design-fidelity-report-tmpl.md` | Fidelity comparison report |
| `reading-design-tokens.css` | Reading-optimized CSS tokens |

## 7 Checklists

Validation checklists used during audits and quality gates:

| Checklist | Purpose |
|-----------|---------|
| `ds-pattern-audit-checklist.md` | Pattern redundancy audit |
| `ds-component-quality-checklist.md` | Component quality gate |
| `ds-accessibility-wcag-checklist.md` | WCAG 2.2 compliance (updated) |
| `ds-migration-readiness-checklist.md` | Migration readiness |
| `atomic-refactor-checklist.md` | Atomic decomposition validation |
| `design-fidelity-checklist.md` | Design-to-code fidelity |
| `reading-accessibility-checklist.md` | Reading UX accessibility |

## 15 Data Files

Reference knowledge embedded in the agent:

| Data File | Domain |
|-----------|--------|
| `atomic-design-principles.md` | Atomic Design methodology (5 stages) |
| `design-token-best-practices.md` | Token naming, structure, governance |
| `design-tokens-spec.yaml` | Token specification schema |
| `w3c-dtcg-spec-reference.md` | W3C Design Tokens Community Group spec |
| `wcag-compliance-guide.md` | WCAG 2.2 requirements |
| `eaa-en301549-checklist.md` | European Accessibility Act (EN 301 549) |
| `consolidation-algorithms.md` | Pattern consolidation algorithms |
| `atomic-refactor-rules.md` | Refactoring rules and constraints |
| `integration-patterns.md` | DS integration patterns |
| `ds-reference-architectures.md` | Reference architectures for DS |
| `agentic-ds-principles.md` | AI-ready design system principles |
| `fluent2-design-principles.md` | Microsoft Fluent 2 design language |
| `motion-tokens-guide.md` | Motion/animation token guide |
| `roi-calculation-guide.md` | ROI formulas and benchmarks |
| `high-retention-reading-guide.md` | Typography for readability (18 rules) |

---

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

---

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

---

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
