# C-match sweep queue (Brief 559)

Mechanical, build-free census for the Claude Code C-match lane. This document
catalogs exact-canonical clone/sibling groups already present in `src/main`; it
does not claim that any queued C source matches. Queue order puts families with
an existing byte-matched anchor ahead of anchorless families.

## Queue

| Rank | Family | Cluster | Members queued (address; size / ARM insns) | Existing byte-matched anchors | Exemplar to crack first | Prep dossier | ATTEMPTED status |
|---:|---|---:|---|---|---|---|---|
| 1 | VRAM threshold-dispatch family (16 total; unattempted tail) | 0 | `0208f850` 104/26; `0208f8b8` 104/26; `0208f920` 104/26; `0208f988` 104/26; `0208f9f0` 104/26; `0208fa58` 104/26; `0208fac0` 104/26; `0208fb28` 104/26; `0208fb90` 104/26; `0208fbf8` 104/26; `0208fc60` 104/26; `0208fcc8` 104/26 | `0208f6b0`, `0208f718`, `0208f780`, `0208f7e8` (4/16 accepted C matches in brief 507) | `0208f850` (clean threshold-dispatch wrapper) | yes, all 12 | MIXED family; queued tail NEVER-ATTEMPTED |
| 2 | Literal-base dispatch sibling quad | 19 | `0208fdf0` 104/26; `0208feb4` 104/26; `0208ff1c` 104/26; `0208ff84` 104/26 | none | `0208fdf0` | yes, all 4 | NEVER-ATTEMPTED (4/4) |
| 3 | Branch-table constant-return family | 30 | `02047fb8` 116/29; `02048880` 116/29; `0204ab88` 116/29 | none | `02047fb8` | yes, all 3 | NEVER-ATTEMPTED (3/3) |
| 4 | Guard-chain clone family | 33 | `02089df8` 120/30; `02089e70` 120/30; `02089ee8` 120/30 | none | `02089df8` | yes, all 3 | NEVER-ATTEMPTED (3/3) |

**Queued total:** 22 functions in 4 family rows; 3 rows are wholly
never-attempted and one is the never-attempted 12-function tail of a mixed
family.

## Census rules and exclusions

- Worklist source: `docs/research/c-match-worklist.json`; `module == "main"`
  and the listed `cluster_id` define family membership. The report’s named
  seeds are cluster 0 (VRAM), cluster 18 (MMIO), and cluster 19; the address
  seeds additionally identify the relative-offset, branch-table, and
  `02089df8` clone families.
- A size in the worklist is divided by four for the ARM instruction count.
- A prep dossier is marked present when the corresponding
  `docs/research/c-match-prep/<address>.c` file exists.
- ATTEMPTED means a word-boundary address search found the address in either
  `docs/research/brief-*.md` or `docs/briefs/*.md`. The queued tail above has
  no such hit. This is history classification only, not a match judgment.
- The four VRAM anchors are the accepted EUR C matches explicitly recorded in
  `docs/research/brief-507-cmatch-med-dossier-w2.md`; their regional ports are
  not counted as separate family members.
- Excluded known walls: privileged MCR cache-operation addresses
  `020928cc`, `020928e8`, `02092940` (wall C-8), and the C-34 duplicate-pool-
  slot addresses `02024574`, `020270d0`, `02028790`.
- Excluded already-attempted families: relative-offset table walker cluster 6
  (`02089134` through `0208938c`), MMIO/accessor cluster 18
  (`0208df0c`, `0208df60`, `0208e1cc`, `0208e220`), and alloc-wrapper cluster
  17 (`0207e54c`, `0207e664`, `0207e6f0`, `0207e748`).

No build, baserom, compiler, or generated index step is required for this
doc-only census.
