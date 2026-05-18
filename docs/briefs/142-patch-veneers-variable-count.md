### cloud/patch-veneers-variable-count

**Goal:** Make `tools/patch_ov004_veneers.py` tolerant of
variable veneer counts so source-level claims in ov004's
`.rodata` section can land. Brief 141 surfaced this as a hard
block — adding 2 `.rodata` claims dropped mwldarm's emitted
veneer count from 86 → 9, and the patcher hard-fails on the
`EXPECTED_VENEER_COUNT = 86` assertion.

**Context — what brief 141 documented:**

Brief 134's patcher was scoped to the empirically-observed
86-veneer state of ov004 at that time. The hard count is
encoded as a constant + an early assertion that the scanner
must find exactly 86 contiguous 12-byte veneers.

Brief 141 ran the natural data-tier sweep on ov004 (cluster
C / D-1 / D-2 / Pattern 3) and discovered:

> Source-level claims in ov004's `.rodata` section suppress
> veneer emission (mwldarm resolves pointers locally via the
> defined symbol instead of routing through veneers) → veneer
> count drops below 86 → patcher hard-fails with `expected
> 86 veneers in input (found 9)`.

Empirical bisection (brief 141):

- 25 `.data` claims + 0 `.rodata` claims → **86 veneers
  preserved** → patcher succeeds.
- Adding 2 `.rodata` claims (`0x02200e40`, `0x02200ed8`) →
  **9 veneers** → patcher fails.

This is a generalisation of brief 132's mwldarm-veneer-trigger
model: locally-defined symbols in `.rodata` shrink the set of
"unresolved at link time" symbols that mwldarm routes through
veneers.

**Brief 142 deliverables:**

1. **Replace `EXPECTED_VENEER_COUNT` constant with a
   dynamically-derived expectation.** The scanner should
   accept any count `0 ≤ n ≤ 86`. Whatever count is found,
   the patcher splices that many.

2. **The downstream cascade math must adapt.** Brief 134's
   patcher assumes a 1024-byte (86 × 12 = 1032 → padded to
   1024) shift across `.data` + `.bss`. If `n < 86`, the
   shift is `n × 12` rounded up to alignment. The existing
   binary-patch-cascade code paths need to be parameterised
   on the observed `n`.

3. **Regression preservation.** All existing brief 134
   tests must continue to pass. Add new tests covering:
   - 0-veneer case (fully-claimed ov004 .rodata) → patcher
     is a no-op
   - 9-veneer case (brief 141's empirical state)
   - 86-veneer case (current main-baseline, no .rodata
     claims) → unchanged
   - Intermediate counts (e.g. 43-veneer mid-state) verified
     against synthetic fixtures

4. **Verify 3-region 27/27 + SHA1 PASS preserved.** This
   patcher is on the critical SHA1 path; any regression
   breaks `ninja sha1` across all 3 regions.

5. **Update brief 134 / W7 documentation.** Note that the
   86-count is an empirical artefact of the current source
   coverage, not a structural constant. The W7 mitigation
   shape is "splice all observed veneers" — generic.

**Method:**

1. Read brief 134's `tools/patch_ov004_veneers.py` (the hard
   assertion is in the scanner / main function).
2. Read brief 141's PR description for the empirical finding.
3. Read brief 132's `docs/research/ov004-thunk-section-fix.md`
   for the mwldarm-veneer-trigger model.
4. Decouple the count assumption — pure scanner returns the
   list of `(addr, target)` pairs; patcher consumes that
   list; cascade math derives the shift from
   `len(veneer_list) * 12`.
5. Add tests + regression suite.
6. Verify 3-region 27/27 + `ninja sha1` PASS preserved
   across EUR + USA + JPN.

**Non-scope:**

- ❌ Cluster work on ov004 `.rodata` (that's the decomper's
  brief 144+ work after this patcher generalisation lands).
- ❌ Other tooling fixes (Pattern 3 generator `.extern` —
  brief 145 candidate; `data_symbol_sizes.py` `kind:bss` —
  brief 145 candidate).
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- Patcher accepts any veneer count `n ∈ [0, 86]`.
- All existing regression tests pass.
- 4+ new tests covering different `n` values.
- **3-region 27/27 preserved.**
- **3-region `ninja sha1` PASS preserved.**

**Branch:** `cloud/patch-veneers-variable-count`

**Priority:** MEDIUM. Unblocks the next ov004 cluster wave
(decomper) but not gating SHA1.

**After this brief lands:**

1. **ov004 `.rodata` cluster work unlocked.** Pattern 3
   chunks in ov004 + cluster C `.rodata` candidates become
   accessible.
2. **W7 mitigation becomes general.** The patcher will adapt
   to any source-coverage state.
3. **Decomper brief 144 (cluster B wave 1 — IF this lands
   first) or brief 145 (ov004 .rodata cluster wave 2)** —
   the next pool opens up.
