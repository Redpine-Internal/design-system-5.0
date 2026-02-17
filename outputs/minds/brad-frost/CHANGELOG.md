# Changelog — Brad Frost Design System Agent

## v5.2.1
- Added Display P3 wide-gamut color support in token files (P3 in `$extensions.p3_value` with sRGB fallback via `@supports`)
- Added MCP Component Discovery step in `ds-build-component` (query Storybook before build)
- NEW task: `ds-perf-budget` — performance budgets per atomic level (Atom 5KB, Molecule 15KB, Organism 40KB)
- NEW task: `ds-eaa-audit` — European Accessibility Act audit (EN 301 549 Sections 9-13)
- NEW data: `eaa-en301549-checklist.md` — EAA compliance checklist beyond WCAG
- Fixed `vocabulary.never_use` in voice_dna (5 terms Brad would avoid)
- Updated W3C DTCG token files with Display P3 extensions
- 48 tasks (was 46), 15 data files (was 14), validation score maintained at 10.0/10

## v5.2.0
- Added Dave Malouf as Tier 1 expert (TIER1_DMa) — DesignOps Pioneer
- 3 new triggers: *designops, *designops-assess, *designops-maturity auto-route to Dave Malouf
- Dave provides operational lens for DS adoption, governance, team scaling
- Expert routing now 9 experts (was 8): val-head, steve-kinney, nathan-curtis, dan-mall, jina-anne, kaelig, dieter-rams, vignelli, dave-malouf
- DNA source: outputs/minds/dave-malouf/agent/design-operations-v1.md (678 lines, 15 heuristics, 9 vetos)

## v5.1.0
- MAJOR: Rams Quality Reduction lens — 5 new vetos (BF_VT_007-011) from Dieter Rams 10 Principles
- MAJOR: Vignelli Token Discipline — constraint thresholds (BF_DH_006), 2 vetos (BF_VT_012-013)
- Added 2 Tier 2 experts: Dieter Rams (quality-gate, reduce) + Massimo Vignelli (constrain, token-discipline)
- Added 4 new commands: *quality-gate, *reduce, *constrain, *token-discipline (Phase 21)
- Added 6 token_discipline diagnostic questions
- Expert routing now 8 experts (was 6)
- 54 commands (was 50), 45 Pattern IDs (was 37)

## v5.0.2
- FIXED: Accessibility contradiction — a11y weight changed from 0.10 to GATE (binary pass/fail)
- Added 5 blind spots from extract-implicit analysis (BF_BS_004 to BF_BS_008)
- Added 2 veto conditions (BF_VT_005 a11y gate, BF_VT_006 deprecation plan)
- Added Example 5: Expert routing + accessibility workflow session
- Fixed Kaelig activation text to reference correct DNA filename

## v5.0.1
- Added Pattern IDs (BF_RF_*, BF_GF_*, BF_DH_*, BF_VT_*, BF_ID_*, BF_BS_*) — 30 total
- Added Expert Routing System with 6 invocable experts via *ask command
- Added *experts command to list available specialists
- Expert auto-routing: commands like *motion-audit auto-delegate to Val Head DNA
- Fidelity score: 40/40 checkpoints (100%) ELITE

## v5.0.0
- MAJOR: DNA Fusion — replaced synthesized expert summary with full research-grounded Voice DNA + Thinking DNA extracted from Brad Frost's published works (22 citations)
- The customization field now contains the complete voice_dna (identity, vocabulary, signature phrases, metaphors, tone dimensions, anti-patterns, immune system, voice contradictions) and thinking_dna (Atomic Design framework with 5 stages, secondary frameworks, diagnostic framework, heuristics, decision architecture, recognition patterns, objection handling, handoff triggers) — all source-cited
- Retained Tier 2 DNA: Val Head (motion/animation) + Steve Kinney (visual testing)
- Retained Brad's Philosophy and Personality sections for operational continuity
- All operational sections (commands, workflows, dependencies, etc.) unchanged
- DNA metadata: confidence voice=0.95, thinking=0.90, validation=research-grounded

## v4.1.0
- Added Tier 2 DNA: Val Head (motion/animation) + Steve Kinney (visual testing)
- Synthesized DNA now covers 7 elite minds (5 Tier 1 + 2 Tier 2)
- Updated existing tasks (phases 1-10) with v4.0 cross-references and DTCG v1.0
- Version bumped all tasks from 1.0.0 → 1.1.0

## v4.0.0
- MAJOR: Synthesized DNA from 5 elite minds (Brad Frost, Nathan Curtis, Dan Mall, Jina Anne, Kaelig Deloumeau-Prigent)
- Added Phase 11: Agentic DS (*agentic-audit, *agentic-setup) — DS+AI paradigm
- Added Phase 12: W3C Design Tokens (*token-w3c, *token-modes) — DTCG v1.0 stable
- Added Phase 13: Fluent 2 (*fluent-audit, *fluent-build) — Microsoft design system
- Added Phase 14: Multi-brand Theming (*theme-multi) — token layer architecture
- Added Phase 15: Motion (*motion-audit) — animation tokens and accessibility
- Added Phase 16: Visual Regression (*visual-test) — automated visual testing
- Added Phase 17: Multi-framework (*multi-framework) — Web Components strategy
- Added Phase 18: Figma-to-code (*figma-pipeline) — Figma MCP Server integration
- Added Phase 19: DS Governance (*ds-govern) — governance model setup
- Added Phase 20: DesignOps (*designops) — team operations workflow
- Added 5 new data files (agentic-ds, w3c-dtcg, fluent2, reference architectures, motion tokens)
- 50 commands, 39 tasks, 12 templates, 7 checklists, 14 data files

## v3.5.0
- Added *design-compare command for comparing design references vs code
- Semantic token extraction (not pixel-perfect) for accurate comparison
- Tolerance-based matching (5% HSL for colors, +/-4px for spacing)
- Fidelity score with actionable fixes and file:line references

## v3.4.0
- Added Phase 10: Accessibility Automation (*a11y-audit, *contrast-matrix, *focus-order, *aria-audit)
- Updated accessibility-wcag-checklist.md to WCAG 2.2 (9 new criteria)

## v3.3.0
- Added Phase 9: Reading Experience (*reading-audit, *reading-guide, *reading-tokens, *reading-checklist)
- Added high-retention-reading-guide.md with 18 evidence-based rules

## v3.2.0
- Added Phase 8: DS Metrics (*ds-health, *bundle-audit, *token-usage, *dead-code)

## v3.1.0
- Added Phase 7: Design Fidelity (*validate-tokens, *contrast-check, *visual-spec)

## v3.0.0
- Added Phase 6: Atomic Refactoring (*refactor-plan, *refactor-execute)
- Added YOLO mode (*yolo toggle) for parallel execution
