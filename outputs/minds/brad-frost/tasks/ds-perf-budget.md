# Component Performance Budgets

> Task ID: brad-perf-budget
> Agent: Brad (Design System Architect)
> Version: 1.0.0
> **Execution Type:** `Worker`
> **Dependencies:** depends_on: `[]` · enables: `[ds-build-component]` · workflow: `quality`

## Description

Define, enforce, and monitor performance budgets for design system components. Prevents performance regression by setting maximum thresholds for JS bundle size, CSS size, DOM node count, and render time per component.

## Output Schema
- **produces:** `outputs/design-system/{project}/perf/perf-budgets.json`
- **format:** JSON data (component performance budgets + audit results)
- **consumed_by:** ds-build-component

## Prerequisites

- Design system with built components
- Node.js ≥ 18 (for bundler analysis)
- Optional: Lighthouse CI or bundlesize CLI

## Workflow

### Interactive Elicitation

1. **Gather Parameters**
   - Component library path
   - Budget strictness level (strict, moderate, relaxed)
   - Custom thresholds (or use defaults)
   - Output format (json, markdown, both)

### Steps

1. **Define Budget Thresholds**
   - Set defaults per atomic level:
     - **Atom:** max JS 5KB gzip, max CSS 2KB, max DOM nodes 5, max render <16ms
     - **Molecule:** max JS 15KB gzip, max CSS 5KB, max DOM nodes 20, max render <33ms
     - **Organism:** max JS 40KB gzip, max CSS 10KB, max DOM nodes 50, max render <50ms
   - Allow user overrides per component
   - Check: budget file created with thresholds for each atomic level — abort if thresholds are zero or negative

2. **Audit Existing Components**
   - For each component, measure:
     - JS bundle size (gzip): use `esbuild --bundle --minify` + gzip estimate
     - CSS size: measure CSS Module file size after minification
     - DOM node count: render component with default props, count nodes
     - Render time: measure React.createElement → commit time (dev mode profiler)
   - Check: all components measured — warn for components that fail measurement (e.g., missing dependencies)

3. **Compare Against Budgets**
   - Flag components exceeding thresholds:
     - **OVER:** exceeds budget (hard fail)
     - **WARNING:** >80% of budget (approaching limit)
     - **OK:** within budget
   - Check: comparison complete for all components — abort if any OVER in strict mode

4. **Generate Performance Report**
   - Output `perf-budgets.json` with thresholds and current measurements
   - Output `perf-report.md` with table showing all components vs budgets
   - Include trend data if previous reports exist (size going up/down)
   - Check: report files written and non-empty

5. **Update State**
   - Update `.state.yaml` with perf audit timestamp and summary
   - Record components over budget for tracking
   - Check: `.state.yaml` updated with perf_audit section

## Output

- `perf-budgets.json` — Budget definitions + current measurements per component
- `perf-report.md` — Human-readable performance report with pass/fail indicators
- `.state.yaml` updated with performance audit results

### Output Format

```json
{
  "version": "1.0.0",
  "generated": "2026-02-16T10:00:00Z",
  "defaults": {
    "atom": { "js_gzip_kb": 5, "css_kb": 2, "dom_nodes": 5, "render_ms": 16 },
    "molecule": { "js_gzip_kb": 15, "css_kb": 5, "dom_nodes": 20, "render_ms": 33 },
    "organism": { "js_gzip_kb": 40, "css_kb": 10, "dom_nodes": 50, "render_ms": 50 }
  },
  "components": {
    "Button": {
      "level": "atom",
      "budget": { "js_gzip_kb": 5, "css_kb": 2, "dom_nodes": 5, "render_ms": 16 },
      "actual": { "js_gzip_kb": 2.1, "css_kb": 1.3, "dom_nodes": 1, "render_ms": 4 },
      "status": "OK"
    },
    "DataTable": {
      "level": "organism",
      "budget": { "js_gzip_kb": 40, "css_kb": 10, "dom_nodes": 50, "render_ms": 50 },
      "actual": { "js_gzip_kb": 45.2, "css_kb": 8.1, "dom_nodes": 38, "render_ms": 42 },
      "status": "OVER",
      "violations": ["js_gzip_kb: 45.2 > 40 (+13%)"]
    }
  }
}
```

```markdown
# Performance Budget Report

| Component | Level | JS (gzip) | CSS | DOM Nodes | Render | Status |
|-----------|-------|-----------|-----|-----------|--------|--------|
| Button | atom | 2.1/5 KB | 1.3/2 KB | 1/5 | 4/16ms | ✅ OK |
| Card | molecule | 8.2/15 KB | 3.1/5 KB | 12/20 | 18/33ms | ✅ OK |
| DataTable | organism | **45.2/40 KB** | 8.1/10 KB | 38/50 | 42/50ms | ❌ OVER |
| Modal | organism | 32.0/40 KB | 9.2/10 KB | 44/50 | 48/50ms | ⚠️ WARNING |
```

## Failure Handling

- **Component fails to bundle for measurement:** Skip component, log "Cannot measure {Component}: {error}. Check for missing dependencies or circular imports." Include in report as UNMEASURED.
- **All components exceed budgets:** Do not abort — generate report showing all violations, suggest budget adjustment if defaults are unrealistic for the project's complexity level.
- **No previous baseline for trend comparison:** Generate first baseline, log "First performance baseline created. Future runs will show trends."
- **Bundler tool unavailable:** Fallback to raw file size measurement (no gzip estimate), log "esbuild not found — using raw file sizes. Install esbuild for accurate gzip estimates."

## Success Criteria

- [ ] Budget thresholds defined for all atomic levels
- [ ] Every component measured against its budget
- [ ] Report generated with clear pass/fail indicators
- [ ] Components over budget clearly identified with violation details
- [ ] `.state.yaml` updated with audit results

**Brad says:** "Performance isn't an afterthought — it's a design constraint. Budget it like you budget spacing."
