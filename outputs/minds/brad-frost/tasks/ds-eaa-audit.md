# European Accessibility Act (EAA) Audit

> Task ID: brad-eaa-audit
> Agent: Brad (Design System Architect)
> Version: 1.0.0
> **Execution Type:** `Worker`
> **Dependencies:** depends_on: `[contrast-matrix]` · enables: `[]` · workflow: `accessibility`

## Description

Audit design system components and documentation against the European Accessibility Act (EAA) requirements, specifically the harmonized standard EN 301 549 v4.1.1 (2024). This goes beyond WCAG compliance to cover EAA-specific requirements for digital products and services sold or operated within the EU.

## Output Schema
- **produces:** `outputs/design-system/{project}/accessibility/eaa-audit-report.md`
- **format:** Markdown report with compliance matrix
- **consumed_by:** (standalone audit output)

## Prerequisites

- Design system with built components
- Contrast matrix results (run `*contrast-matrix` first)
- Read data/eaa-en301549-checklist.md for full requirements reference

## Workflow

### Interactive Elicitation

1. **Gather Parameters**
   - Component library path
   - Target market (EU-wide or specific member states)
   - Product type (website, mobile app, e-commerce, self-service terminal)
   - Existing WCAG audit results (if any)
   - Output format (markdown, json, both)

### Steps

1. **WCAG 2.1 AA Baseline Check**
   - Verify all components pass WCAG 2.1 Level AA (EAA minimum requirement)
   - Cross-reference with existing contrast-matrix results
   - Check keyboard navigation for all interactive components
   - Verify screen reader compatibility (ARIA landmarks, roles, live regions)
   - Check: WCAG 2.1 AA compliance >= 95% — log violations for remediation

2. **EN 301 549 Extended Requirements**
   - **Section 9 (Web):** Verify all WCAG 2.1 AA success criteria
   - **Section 10 (Non-web documents):** Check generated documentation is accessible (PDF/HTML structure, reading order)
   - **Section 11 (Software):** Verify component APIs support assistive technology integration
   - **Section 12 (Documentation & Support):** Check that component documentation is itself accessible
   - **Section 13 (ICT providing relay or emergency services):** Flag if applicable
   - Check: all applicable EN 301 549 sections audited — log N/A sections with justification

3. **EAA-Specific Requirements Beyond WCAG**
   - **Real-time text (RTT):** Flag if design system includes chat/messaging components
   - **Captions & audio description:** Check media components for caption support
   - **Consistent identification:** Verify same UI elements are identified consistently across components
   - **Error prevention:** Check form components provide error prevention for legal/financial data
   - **Authentication accessibility:** Verify login/auth components don't rely solely on cognitive tests
   - **Dragging movements:** Check that drag-and-drop components have non-dragging alternatives
   - Check: all EAA-specific checks completed — flag missing implementations

4. **Documentation Accessibility Audit**
   - Verify component documentation has proper heading hierarchy
   - Check code examples have syntax highlighting accessible to screen readers
   - Verify prop tables are real HTML tables (not div grids)
   - Check that usage examples include accessibility guidance
   - Check: documentation passes automated accessibility scan

5. **Generate Compliance Report**
   - Produce EAA compliance matrix (requirement → status → evidence)
   - Calculate overall compliance score
   - List remediation actions ordered by legal risk (high → low)
   - Include deadline awareness (EAA enforcement date: June 28, 2025)
   - Check: report file written with all sections populated

6. **Update State**
   - Update `.state.yaml` with EAA audit timestamp and compliance score
   - Record critical non-compliances for tracking
   - Check: `.state.yaml` updated with eaa_audit section

## Output

- `eaa-audit-report.md` — Full compliance report with matrix and remediation plan
- `.state.yaml` updated with EAA audit results

### Output Format

```markdown
# EAA Compliance Audit Report

**Date:** 2026-02-16
**Standard:** EN 301 549 v4.1.1 (2024)
**Scope:** Design System Components

## Compliance Summary

| Category | Requirements | Pass | Fail | N/A | Score |
|----------|-------------|------|------|-----|-------|
| WCAG 2.1 AA (Section 9) | 50 | 48 | 2 | 0 | 96% |
| Non-web docs (Section 10) | 8 | 7 | 1 | 0 | 87.5% |
| Software (Section 11) | 12 | 12 | 0 | 0 | 100% |
| Documentation (Section 12) | 6 | 5 | 1 | 0 | 83.3% |
| **Overall** | **76** | **72** | **4** | **0** | **94.7%** |

## Critical Non-Compliances

### ❌ 9.2.4.7 — Focus Visible
**Component:** Dropdown menu items lack visible focus indicator in dark mode
**Risk:** HIGH (core WCAG requirement)
**Remediation:** Add `outline: 2px solid var(--color-focus)` to `.menu-item:focus-visible`

### ❌ 12.1.1 — Accessibility Documentation
**Issue:** Component prop tables use CSS Grid layout, not `<table>` elements
**Risk:** MEDIUM (documentation requirement)
**Remediation:** Convert prop documentation to semantic HTML tables

## Remediation Priority

1. [HIGH] Fix focus indicators in dark mode (affects 3 components)
2. [MEDIUM] Convert prop tables to semantic HTML
3. [MEDIUM] Add caption support to VideoPlayer component
4. [LOW] Add RTT guidance to Chat component documentation
```

## Failure Handling

- **WCAG baseline audit reveals >20% failure rate:** Generate critical alert, prioritize top 10 failures by user impact, create phased remediation plan (30/60/90 day), do not proceed to EAA-specific checks until baseline improves
- **EN 301 549 section not applicable to product type:** Mark as N/A with documented justification, do not count against compliance score, log rationale in report
- **No screen reader available for testing:** Document as limitation, rely on automated ARIA validation, recommend manual screen reader testing as follow-up action item
- **Component documentation not in auditable format:** Flag documentation format issue, audit what is available, recommend documentation migration to accessible format (HTML over PDF)

## Success Criteria

- [ ] WCAG 2.1 AA baseline verified for all components
- [ ] All applicable EN 301 549 sections audited
- [ ] EAA-specific requirements checked beyond WCAG
- [ ] Component documentation accessibility verified
- [ ] Compliance report generated with remediation priorities
- [ ] `.state.yaml` updated with audit results

**Brad says:** "Accessibility isn't a feature — it's a right. The EAA makes it law. Build for everyone or don't ship."
