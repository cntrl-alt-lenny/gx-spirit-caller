# Overlay C-match sweep queue (Brief 564)

Build-free census of exact-canonical clone/sibling groups in `ov000`–`ov023`.
Only never-attempted members are queued; prior attempts remain visible in the
status column for context.

| Rank | Family | Cluster | Members queued (address; size) | Byte-matched anchors | Exemplar | Prep dossier | ATTEMPTED status |
|---:|---|---:|---|---|---|---|---|
| 1 | ov020 parameter-pack sibling quad | 22 | `ov020:021ab964` (108B), `ov020:021aba54` (108B), `ov020:021abac0` (108B) | none | `021ab964` | yes, all 3 | MIXED: `021ab8f8` attempted; queued 3 NEVER |
| 2 | RGB555 min/max sibling trio | 52 | `ov020:021ada74` (280B), `ov022:021ab4b0` (280B) | none | `021ada74` | no, both | MIXED: `ov018:021ace68` attempted; queued 2 NEVER |
| 3 | HSV/RGB magic-multiply sibling trio | 53 | `ov020:021adb8c` (408B) | none | `021adb8c` | yes | MIXED: `ov018:021acf80`, `ov022:021ab5c8` attempted; queued 1 NEVER |
| 4 | Cross-overlay 472B dialog-setup siblings | 169 | `ov009:021aaaec` (472B), `ov016:021b5dd0` (472B) | none | `ov009:021aaaec` | no, both | NEVER-ATTEMPTED (2/2) |
| 5 | ov017/ov019 divmod-pack siblings | 191 | `ov017:021b7dac` (208B), `ov019:021b5948` (208B) | none | `ov017:021b7dac` | yes, both | NEVER-ATTEMPTED (2/2) |
| 6 | ov010/ov015 double-switch siblings | 178 | `ov010:021b32ac` (560B) | none | `021b32ac` | no | MIXED: `ov015:021b2df8` attempted; queued 1 NEVER |
| 7 | ov010/ov015 guard/store siblings | 50 | `ov010:021b6b58` (168B) | none | `021b6b58` | yes | MIXED: `ov010:021b46a8`, `ov015:021b3f98` attempted; queued 1 NEVER |

**Queued total:** 12 never-attempted functions in 7 family rows. No queued
member has a byte-matched C anchor in the existing records; the ranking is
therefore dossier/readiness first, then family size and simplicity.

## Census rules and exclusions

- Source membership is `docs/research/c-match-worklist.json` filtered to
  `module` `ov000`–`ov023`, excluding `ov002`; shared `cluster_id` and equal
  size define the mechanical family grouping. `VtableDispatchPatterns.md`
  supplies the dispatch-family context.
- ATTEMPTED means a word-boundary address hit in
  `docs/research/brief-*.md` or `docs/briefs/*.md`. This is history
  classification only, not a match claim.
- Prep is `yes` only when
  `docs/research/c-match-prep/<address>.c` exists.
- Briefs 529/531 fully swept the Pattern A1/A2 dispatch families (18
  candidates, 16 accepted); those families are not re-queued. Pattern A3 is
  in excluded `ov002`.
- Excluded known wall: cluster 20's ov004 Thumb veneer/data-as-code
  trampolines (`021dbdbc`, `021dbdd0`, `021de280`).
- No source, build graph, baserom, compiler, or generated index was changed or
  required.
