# Pipeline Coherence Validation Report
**Squad:** brad-frost
**Analysis Date:** 2026-02-16
**Analyst:** Scout Agent

---

## Executive Summary

**Overall Status:** 🟡 PARTIALLY COHERENT - Critical gaps detected in brownfield chain

| Chain | Status | Critical Issues |
|-------|--------|-----------------|
| Brownfield (4 tasks) | 🔴 BROKEN | Output/input mismatches, missing handoff files |
| Refactoring (2 tasks) | 🟢 COHERENT | Clean handoff via documentation files |
| Accessibility (2 tasks) | 🟢 INDEPENDENT | No dependencies between tasks |

---

## Chain Analysis

### 1. Brownfield Chain (BROKEN)

**Flow:** `ds-audit-codebase` → `ds-consolidate-patterns` → `ds-extract-tokens` → `ds-generate-migration-strategy`

#### Transition 1: audit → consolidate

| Field | Audit Output | Consolidate Input | Match? |
|-------|--------------|-------------------|--------|
| Primary file | `pattern-inventory.json` | `.state.yaml` (expects inventory) | ⚠️ PARTIAL |
| State file | `.state.yaml` | `.state.yaml` | ✅ YES |
| Inventory data | JSON structure with patterns | Reads `.state.yaml` for inventory | ⚠️ FORMAT MISMATCH |

**ISSUE #1:** Consolidate expects `.state.yaml` to contain inventory data, but Audit creates separate `pattern-inventory.json`. Consolidate Step 1 says:
> "Read .state.yaml to get inventory data"

But Audit Step 8 creates:
> "pattern-inventory.json with all metrics"

**Fix Required:** Audit must embed inventory data IN `.state.yaml`, OR Consolidate must read `pattern-inventory.json` first.

---

#### Transition 2: consolidate → extract-tokens

| Field | Consolidate Output | Extract Input | Match? |
|-------|-------------------|---------------|--------|
| Primary files | `consolidation-report.md`, cluster files | `color-clusters.txt`, `spacing-consolidation.txt` | ✅ YES |
| State file | `.state.yaml` (consolidation section) | `.state.yaml` | ✅ YES |
| Pattern files | `color-clusters.txt`, `button-consolidation.txt`, `spacing-consolidation.txt`, `typography-consolidation.txt` | Expects same files | ✅ YES |

**Status:** ✅ COHERENT - Clean handoff via consolidation files

---

#### Transition 3: extract-tokens → generate-migration-strategy

| Field | Extract Output | Migration Input | Match? |
|-------|---------------|----------------|--------|
| Primary files | `tokens.yaml`, 5 export formats | `tokens.yaml` | ✅ YES |
| State file | `.state.yaml` (tokens section) | `.state.yaml` | ✅ YES |
| Token locations | Recorded in state | Read from state | ✅ YES |

**Status:** ✅ COHERENT - Clean handoff via tokens files

---

### 2. Refactoring Chain (COHERENT)

**Flow:** `atomic-refactor-plan` → `atomic-refactor-execute`

| Field | Plan Output | Execute Input | Match? |
|-------|-------------|---------------|--------|
| Roadmap | `COMPONENT_REFACTORING_ROADMAP.md` | Referenced for component list | ✅ YES |
| Work distribution | `PARALLEL_REFACTORING_PLAN.md` | Referenced for priorities | ✅ YES |
| Agent prompts | `prompts/agent-N-prompt.md` | Used by execute agents | ✅ YES |

**Status:** ✅ COHERENT - Clear documentation handoff, no data file dependencies

---

### 3. Accessibility Chain (INDEPENDENT)

**Tasks:** `a11y-audit`, `contrast-matrix`

| Relationship | Status |
|--------------|--------|
| `a11y-audit --scope color` | May call `contrast-matrix` internally |
| `contrast-matrix` standalone | Fully independent |

**Status:** 🟢 INDEPENDENT - Can run in any order, optional integration

---

## Critical Issues Detected

### Issue #1: Brownfield Inventory Data Handoff (CRITICAL)

**Location:** audit → consolidate transition

**Problem:** Consolidate expects inventory data in `.state.yaml`, but Audit creates separate `pattern-inventory.json`.

**Evidence:**
- **ds-audit-codebase.md:110** - Output: `pattern-inventory.json`
- **ds-consolidate-patterns.md:44** - Step 1: "Read .state.yaml to get inventory data"

**Impact:** Consolidate task will FAIL at Step 1 - cannot find inventory data in state file.

**Fix Options:**
1. **Option A (Recommended):** Update Audit Step 8 to embed inventory IN `.state.yaml`:
   ```yaml
   audit:
     completed_at: "..."
     inventory:
       buttons: { unique: 47, total: 327, redundancy: 6.96 }
       colors: { unique: 89, total: 1247, redundancy: 14.01 }
       ...
   ```

2. **Option B:** Update Consolidate Step 1 to read `pattern-inventory.json` first, then state:
   ```
   1. Load Audit Data
      - Read pattern-inventory.json for metrics
      - Read .state.yaml for metadata
      - Validate audit phase completed
   ```

---

### Issue #2: Missing Failure Handling Rules

**Location:** All chains

**Problem:** NO tasks define what happens when:
- Quality gates fail (e.g., coverage <95%)
- Prerequisites missing
- Intermediate steps fail

**Evidence:**
- ds-extract-tokens.md:111 - "Target: >95% coverage" but no "if fails, do X"
- ds-consolidate-patterns.md:138 - "target_met: true" but no "if false" logic
- atomic-refactor-execute.md:177 - GATE 2 exists but no "then what" action

**Impact:** Agents may proceed with incomplete data or skip critical validation.

**Fix Required:** Add to each task's Error Handling section:
```markdown
## Rework Rules

| Condition | Action |
|-----------|--------|
| Coverage <95% | Re-run consolidation with stricter thresholds |
| Quality gate fails | HALT, manual review required |
| Prerequisites missing | Exit with clear message, list required files |
```

---

### Issue #3: State File Schema Not Defined

**Problem:** All tasks reference `.state.yaml` but no canonical schema exists.

**Evidence:**
- Audit expects: `phase: "audit_complete"`
- Consolidate adds: `consolidation: { ... }`
- Extract adds: `tokens: { ... }`
- Migration adds: `migration: { ... }`

**Impact:** Risk of key collisions, missing fields, inconsistent structure.

**Fix Required:** Create `docs/brad-frost/STATE_SCHEMA.yaml`:
```yaml
# .state.yaml schema for brad-frost squad
project:
  name: string
  path: string

audit:
  completed_at: timestamp
  scan_path: string
  inventory:
    buttons: { unique: int, total: int, redundancy: float }
    colors: { ... }
    spacing: { ... }
    typography: { ... }
    forms: { ... }

consolidation:
  completed_at: timestamp
  patterns_consolidated:
    colors: { before: int, after: int, reduction: string, clusters: int }
    ...
  overall_reduction: string
  target_met: boolean

tokens:
  completed_at: timestamp
  token_locations: { yaml: path, json: path, css: path, tailwind: path, scss: path }
  coverage: float

migration:
  completed_at: timestamp
  phase_count: int
  timeline: string

agent_history:
  - agent: string
    task: string
    timestamp: timestamp
    status: "success" | "failed" | "in_progress"
```

---

## Broken Chain Links Summary

| Transition | Issue | Severity |
|-----------|-------|----------|
| audit → consolidate | Inventory data format mismatch | 🔴 CRITICAL |
| All tasks | No failure handling rules | 🟡 HIGH |
| All tasks | State schema undefined | 🟡 MEDIUM |

---

## Recommendations

### Immediate (Block Squad Use)
1. Fix audit → consolidate inventory handoff (Issue #1)
2. Define canonical `.state.yaml` schema (Issue #3)

### High Priority (Before Production)
3. Add rework/failure rules to all tasks (Issue #2)
4. Add validation steps to check prerequisite files exist

### Nice to Have
5. Add state file versioning (`schema_version: 1.0.0`)
6. Create state validation script (`validate-state.sh`)
7. Add example `.state.yaml` to each task's Examples section

---

## Conclusion

The **brownfield chain is currently BROKEN** at the first transition. The consolidate task cannot read audit output because of a format mismatch.

**DO NOT use this squad** until Issue #1 is resolved.

The refactoring and accessibility chains are coherent and can be used independently.

---

**Scout:** "The chain is only as strong as its weakest link. Fix the audit handoff before shipping."
