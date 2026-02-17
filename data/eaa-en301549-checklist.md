# European Accessibility Act — EN 301 549 Checklist

**Standard:** EN 301 549 v4.1.1 (2024)
**Scope:** Requirements applicable to design system components and documentation
**EAA Enforcement:** June 28, 2025

---

## Section 9: Web Content (maps to WCAG 2.1 AA)

All WCAG 2.1 Level AA success criteria apply. Key areas for design systems:

| Requirement | WCAG SC | DS Impact | Check |
|-------------|---------|-----------|-------|
| Text alternatives | 1.1.1 | Icon components need `aria-label` | All icons have accessible name |
| Captions | 1.2.2 | Media components need caption support | VideoPlayer supports captions prop |
| Adaptable | 1.3.1 | Semantic HTML in all components | No `<div>` where `<button>` needed |
| Distinguishable | 1.4.3 | Color contrast ≥ 4.5:1 | Contrast matrix passes |
| Keyboard | 2.1.1 | All interactive components keyboard-operable | Tab through all components |
| Focus visible | 2.4.7 | Focus indicators on all interactive elements | `:focus-visible` styles present |
| Input purpose | 1.3.5 | Form inputs support `autocomplete` attribute | Input components accept autocomplete |
| Reflow | 1.4.10 | Components work at 320px viewport | Responsive design verified |
| Text spacing | 1.4.12 | Components tolerate user text spacing overrides | No overflow on 1.5x line-height |
| Dragging | 2.5.7 | Drag components have click/tap alternative | DnD has keyboard alternative |
| Consistent identification | 3.2.4 | Same function = same label across DS | Audit cross-component labels |
| Error prevention | 3.3.4 | Forms for legal/financial data are reversible | Form components support undo |
| Accessible auth | 3.3.8 | Login doesn't require cognitive test | Auth components support passkeys |

## Section 10: Non-Web Documents

Applicable when design system generates documentation (PDF, DOCX):

| Requirement | Check |
|-------------|-------|
| 10.1.1.1 Non-text content | Images in docs have alt text |
| 10.1.3.1 Info and relationships | Doc headings use proper hierarchy |
| 10.1.4.3 Contrast | Doc text meets 4.5:1 contrast |
| 10.2.1.1 Keyboard | Interactive docs navigable by keyboard |

## Section 11: Software

Applicable to component APIs and developer experience:

| Requirement | Check |
|-------------|-------|
| 11.5.2.3 Use of accessibility services | Components expose ARIA roles/states |
| 11.5.2.5 Object information | Props/state changes announced to AT |
| 11.5.2.7 Values | Range components expose min/max/current |
| 11.5.2.12 Focus | Programmatic focus management works |
| 11.5.2.17 Modifications | State changes via API trigger AT updates |

## Section 12: Documentation and Support

| Requirement | Check |
|-------------|-------|
| 12.1.1 Accessibility docs | Component docs describe a11y features |
| 12.1.2 Accessible documentation | Docs themselves are accessible |
| 12.2.2 Info on a11y features | ARIA usage documented per component |
| 12.2.3 Effective communication | Docs available in multiple formats |

## Section 13: ICT Services

Usually N/A for design systems unless they include:
- Real-time communication components (chat, video call)
- Emergency service interfaces

If applicable:
| Requirement | Check |
|-------------|-------|
| 13.1.2 Text relay services | RTT support in chat components |
| 13.1.3 Emergency access | Emergency UI meets response time requirements |

---

## EAA Timeline

| Date | Milestone |
|------|-----------|
| June 28, 2019 | EAA adopted (Directive 2019/882) |
| June 28, 2022 | Member states transposition deadline |
| **June 28, 2025** | **Enforcement begins — products must comply** |
| June 28, 2030 | Transition period ends for existing services |

## Key Differences: EAA vs WCAG-only

| Aspect | WCAG Only | EAA (EN 301 549) |
|--------|-----------|-------------------|
| Scope | Web content | Products + services (broader) |
| Legal force | Best practice | EU law with penalties |
| Documentation | Optional | Must be accessible itself |
| Support | Not covered | Support channels must be accessible |
| Cognitive a11y | Limited | Stronger requirements (3.3.8) |
| Dragging | Not covered | Must have alternatives (2.5.7) |
