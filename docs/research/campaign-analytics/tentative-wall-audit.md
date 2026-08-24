# Tentative-wall audit

Read-only reconciliation of the nine `LIVE (tentative)` P-walls in
`docs/research/codegen-walls.md` against the ledger. A ledger row was treated
as a family hit only when its `park_class` or `park_family` contains the wall
key. A tag is evidence to inspect, not evidence to promote by itself.

| Wall | Catalog members | Tagged ledger rows | Out-of-list rows | Decision |
| --- | ---: | ---: | ---: | --- |
| P-23 | 2 | 8 | 5 | Stay tentative. `02253304` is the explicitly retracted clean ship; the other five are P-20/P-23 composite or provisional register-allocation cases, not fresh isolated P-23 evidence. |
| P-24 | 5 | 0 | 0 | Stay tentative. The catalog says these are one batch and lacks an independent re-confirmation. |
| P-28 | 16 | 26 | 9 | Stay tentative. The nine omitted rows are same-round P-28-tagged sub-shapes; the catalog itself says this family may split into separate walls, so a tag cannot promote it. |
| P-29 | 7 | 6 | 1 | Stay tentative. `ov006/021ca264` is a mirror-MLA-resistance shape, outside P-29's ov002 guard/row-loop cohort. |
| P-30 | 5 | 21 | 21 | Stay tentative. The out-of-list rows span later main and overlay sweeps with register-numbering/pressure symptoms, not the catalog's main shared-large-offset-base signature. |
| P-33 | 3 | 3 | 2 | **Promote to LIVE confirmed.** `main/0206e33c` is the catalog's explicitly described bidirectional third member; the two other out-of-list rows are different P-32/P-33 composite or adjacent-register-reuse symptoms. |
| P-34 | 2 | 2 | 0 | Stay tentative; no new evidence. |
| P-35 | 1 | 1 | 0 | Stay tentative; no new evidence. |
| P-37 | 1 | 2 | 1 | Stay tentative. `main/020a67cc` is the catalog's explicitly caveated separate-`bx lr` scope-broadening candidate, not a confirmed second trigger. |

## Out-of-list ledger rows

These are the rows requiring human-readable disposition rather than silent
catalog mutation:

- P-23: `ov002/021b1e80`, `ov002/0228c924`, `ov002/021bbbc0`,
  `ov002/021bbc68`, `ov002/0224d818`. Every row is tagged `P-20-P-23-*`
  but has the generic/provisional register-allocation classification.
- P-28: `ov002/022327b8`, `ov002/021edd4c`, `ov002/021ba38c`,
  `ov002/021d7268`, `ov002/0224fe84`, `ov002/02251f70`,
  `ov002/02249268`, `ov002/02253000`, `ov002/02287024`. These are
  sub-shapes from the same sweep's family proposal and require symptom-level
  separation before any promotion.
- P-29: `ov006/021ca264`, a different module and mirror-MLA-resistance shape.
- P-30: `main/020417e8`, `main/02044528`, `main/0204bb5c`, `main/020720b4`,
  `main/02077c08`, `main/0207b18c`, `ov002/0224f548`, `ov002/0224f9c0`,
  `ov002/0224d660`, `ov002/0224e840`, `ov002/0224c1e4`, `ov011/021cd2d4`,
  `ov006/021c15a4`, `ov011/021d2008`, `ov004/021cc21c`, `ov006/021c71e0`,
  `ov004/021ce1ec`, `ov004/021d9fc4`, `ov004/021ce364`, `ov006/021c3384`,
  `ov004/021da1bc`. Their recorded shapes identify register-pressure or
  P-36-adjacent symptoms rather than P-30's catalog signature.
- P-33: `ov006/021b3318` is a P-32/P-33/C-45 composite, and
  `ov006/021c4348` is adjacent
  register-reuse rather than the same-register repeated-equality wall.
- P-37: `main/020a67cc` remains the catalog's explicitly caveated
  scope-broadening candidate.

No P-23 promotion was made: `ov002/02253304` remains retracted exactly as the
catalog correction requires.
