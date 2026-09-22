### decomper/cluster-prop-0202b0e0

**Goal:** Cluster-propagation pilot round 5 against the new top-HIGH
cluster after brief 020 drained `func_02006164`. Anchor:
`main / func_0202b0e0` — size 0x20, sig 1, **10 matched / 31 unmatched
siblings**, predicted yield ≈74% [HIGH] per `tools/find_pattern_clusters
.py --version eur --top 8`.

**Context:**

- Brief 020 (PR #297) returned 20/23 = 87% yield by recognising the
  cluster was *heterogeneous* (one anchor shape + 11 sibling shapes
  all fingerprinting at the same `(size, sig_len)`) and writing
  per-shape templates rather than per-bit-position hand-patches.
  That flipped this brief's recommended ceiling: prefer a higher
  "distinct shape templates" cap over a tight "hand-patch" cap.
- Predicted yield 74% × 31 unmatched ≈ **23 expected matches**.
  Target band: 15–22 byte-identical siblings.
- 10-matched / 31-unmatched template confidence is *lower* than
  brief 020's 28/23 ratio. If this cluster is also heterogeneous,
  decomper may need to clone matched siblings from elsewhere in
  `src/` more aggressively (the brief-020 unlock pattern).

**Scope:**

- Match the unmatched siblings of `func_0202b0e0`. Standard
  cluster pipeline:

  ```
  python tools/find_pattern_clusters.py --version eur main 0x0202b0e0
  python tools/propagate_template.py apply \
    --template src/main/func_0202b0e0.c \
    --cluster main 0x0202b0e0 \
    --version eur
  ninja rom
  ninja objdiff
  ```

- Rename matched symbols in `config/eur/arm9/symbols.txt` per
  AGENTS.md convention.
- **Shape-template cap: up to 15 distinct shape templates per PR**
  (lifted from brief 020's de-facto practice; 12 shape-templates
  was clearly the right call, no reason to artificially constrain
  the next brief). Hand-patch cap: still 3 per PR (those are
  per-sibling tweaks, not new shapes — fundamentally noisier).
- Document each shape template in the PR body — anchor sym, target
  symbols using it, one-line shape description. Brief 020's
  table-of-shapes section is the gold standard.
- Standard verification gate: `ninja rom`, `dsd check modules`
  (must remain 24/27), `check_match_invariants` (no new error
  categories — pre-existing ov005 placeholder warnings expected to
  grow by the match count, that's normal), `next_targets.py` tier
  delta = PR claim.

**Non-scope:**

- ❌ Anything outside the `func_0202b0e0` cluster's 31 unmatched
  siblings.
- ❌ Touching the persistently-stuck ov006 clusters
  (`func_ov006_021c81a4` rank #1 LOW, `func_ov006_021b7ce0` rank
  #2 MED). Brief 023 (parallel cloud brief) is investigating those
  separately; until that lands, decomper effort there is wasted.
- ❌ Touching `tools/`, `libs/`, `include/`, `AGENTS.md`,
  `docs/state.md`.

**Success:**

- ≥ 15 byte-identical matches (15/31 = 48%, comfortable lower
  bound for a 74%-predicted cluster). 22+ matches counts as
  exceeding expectations.
- All matches verified locally + `pr-tier-delta` green.
- PR body documents:
  - Per-shape template table (anchor sym → target syms → one-line
    shape).
  - Any siblings dropped (with one-line reason — codegen quirk,
    different shape, etc.).
  - Confirmation the 24/27 dsd-check baseline holds.
  - Carryover reg-alloc notes for the next cluster brief — brief
    020's notes section is the model.

**Branch:** `decomper/cluster-prop-0202b0e0`

**After this brief lands:**

1. Brain queues the next pilot anchor from the post-PR cluster
   ranking. Likely candidates depending on what drains: rank-#3
   `func_02033f10` (16/31, 37% MED), rank-#5 `func_02001d84`
   (27/30, 37% MED), or whichever HIGH cluster surfaces.
2. If brief 023 (ov006 investigation) returns actionable tooling,
   re-rank the queue accordingly.
