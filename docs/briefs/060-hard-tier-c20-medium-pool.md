### decomper/hard-tier-c20-medium-pool

**Goal:** Fall back from the ≤ 0x60 cap (brief 057 final yield ~25%
in wave 23) and mine the **90-candidate MEDIUM C-20-family
thunk-shape pool** surfaced by PR #397's reloc-sig pre-filter as the
primary selection input. Cap returns to ≤ 0x40. Quality is the
small-thunk shape (0x20-0x40, sig=1, propagation-ready cluster
membership), not raw byte volume.

**Context:**

Brief 057 final tally across 3 waves:

| Wave | Cap | Matches | Bytes | Yield | Notes |
|---:|---:|---:|---:|---:|---|
| 21 (initial) | 0x60 | 7 | 476 | 70% | All cap-raise wins |
| 22 (self-ext 1/2) | 0x60 | 7 | 428 | 70% | All cap-raise wins; surfaced S-1 + C-21 |
| 23 (self-ext 2/2 FINAL) | 0x60 | 2 | 112 | 25% | Below gates; sweet spot exhausted |
| **total** | | **16** | **1016** | **~57%** | |

The cap-raise paid off for two waves and exhausted in the third. Per
brief 057's success clause:

> If yield collapses → fall back to ≤ 0x40 OR pivot to USA/JPN
> bootstrap OR tools investment.

This brief picks the first option but **with a sharper target than
brief 055**: the 90-candidate thunk-shape pool from PR #397's
[`docs/research/c20-family-corpus-scan.md`](../research/c20-family-corpus-scan.md).
The pool's size distribution is 60 of 90 at 0x20-0x30, 17 at
0x2c-0x30, and only 6 at the upper edge (0x38-0x40). Cluster
membership means each candidate has a matched representative the
asm can be compared against; the C-20 routing recipe is drop-in for
the homogeneous halfword-pack triplet shape (wave 22 success
confirms).

Wave 23 already burned the three HIGH-confidence drops from PR
#397: `func_0206eea0` matched (wave 23), `func_ov002_022a8668`
dropped (mwcc 1.2 `mvn r1, #0` wall), `func_ov002_0226b00c` dropped
(byte-pack tail-call detection wall, same as wave 19+20+23). Those
two confirmed walls go on the skip list.

**Selection rule:**

- **Primary pool:** the 90 MEDIUM-confidence candidates in the
  `docs/research/c20-family-corpus-scan.md` table (sizes
  0x20-0x40, sig=1, propagation-ready).
- **Anchor-first comparison:** each cluster has a matched
  representative (anchor column in the doc). Compare each
  unmatched target's asm against the anchor before committing to
  routing.
- **Apply** codegen-walls coercions as they fit:
  - C-20 + C-20-family routing via `.legacy.c` for halfword-pack
    triplet shape (wave-22-style; the doc's *Cluster A* shape).
  - C-21 ternary-to-constants (wave 21 fold).
  - **C-21 (new candidate):** explicit-next-ahead walk loop —
    wave 23 surfaced this on `func_020a333c`. When a walk loop
    keeps `cur` and `next` as separate registers, the source
    must explicitly track `next` one step ahead:

    ```c
    /* Doesn't match: */
    node_t *cur = head;
    while (cur->next != 0) cur = cur->next;

    /* Matches: */
    node_t *cur = head;
    node_t *next = cur->next;
    while (next != 0) { cur = next; next = next->next; }
    ```

    Not yet codegen-walls-formal (no PR fold), but treat as live
    apply-list pending. If you use it productively, flag in PR
    body for cloud's next fold-in.
  - C-2a / C-9 / C-12 / C-14 / C-15 / C-16 / C-17 / C-18 / C-19
    as they fit (unchanged from briefs 053/055/057).
  - **S-1 awareness** — uniform offset shift after a `char _pad[]`
    field is *not* codegen, it's struct authoring. Fix the pad
    size first before chasing C-N candidates. (Wave 23 demonstrated
    the workflow works.)
- **Skip:**
  - Byte-pack C-20 variant (`func_ov002_0226b00c` shape) — wave
    19+20+23 wall confirmed. Cloud research brief queued
    separately.
  - Cross-module C-20 with `mvn r1, #0` constant derivation
    (`func_ov002_022a8668` shape) — wave 23 wall.
  - P-1 (lsl/lsr collapse), P-4 family (fnptr reg-alloc), P-6
    (≥4-op predication threshold), P-7 (pool dedup), C-1r
    over-predication, ov004 BSS.
- **Cap:** ≤ 0x40 (back from 0x60). The MEDIUM pool's 0x38-0x40
  band is fair game; nothing above 0x40 in this brief.

**Workflow:**

Standard. find_shape_templates corpus at ~430+ functions.
Cluster-anchor compare per candidate is the leverage: each
unmatched target has a matched sibling already shipped, so the
disassembly comparison is direct rather than speculative.

**Scope:**

- Match 6–12 hard-tier functions from the 90-candidate MEDIUM
  pool. Quantity is the goal this brief (vs. brief 057's quality
  bias); the 0x20-0x30 candidates are cheaper per attempt.
- Aim for **≥ 250 bytes** combined per wave.
- PR body documents per-target byte counts + which cluster they
  came from (the doc's anchor column).

**Non-scope:**

- ❌ Sizes > 0x40 (cap-raise reverted; defer to a future brief if
  yield justifies it again).
- ❌ The two confirmed wall candidates from wave 23 above.
- ❌ Documented-wall candidates (see Selection rule skips).
- ❌ Tools / libs / include / AGENTS.md / state.md edits.

**Success:**

- ≥ 6 byte-identical matches AND bytes-matched ≥ 250.
- All matches verified locally + `pr-tier-delta` green.
- PR body documents which 90-pool clusters were drained vs.
  remaining (calibration for next-brief sizing).

**Branch:** `decomper/hard-tier-c20-medium-pool`

## Self-extend clause

If yield ≥ 40% AND bytes-matched ≥ 250 → up to **2** follow-up
waves under the same rule. Same gate as brief 055/057.

If yield < 40% OR bytes-matched < 250, hand back to brain — the
MEDIUM pool didn't propagate as well as the reloc-sig signature
suggested, time to either rescope the pool (brain runs strict
asm-grep option (b) from PR #397) or pivot tier.

**After this brief (and self-extends) land:**

1. If the 90-pool propagates at ≥ 40% → the pool is the right
   size for a couple of waves; brain queues brief 062 chaining
   from the residual.
2. If propagation drops in the middle of the pool → likely a
   cluster-quality issue. Brain runs the strict asm-grep
   (option b from PR #397) against the residual to triage which
   clusters are truly C-20 vs. just structurally similar.
3. If the pool drains cleanly and yield holds → next decision
   point is either USA/JPN bootstrap (new region badges from 0%)
   or a tools investment on find_shape_templates given the
   accumulated ~430+ corpus.
