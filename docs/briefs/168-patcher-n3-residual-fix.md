### cloud/patcher-n3-residual-fix

**Goal:** Extend the patcher's low-n coverage to handle n=3
(and likely n=4, 2, 1). Brief 167 (PR #602) reached n=3 for
the first time via a real ov004 `.rodata` source claim
(`data_ov004_021e3de8`); the patcher broke SHA1 because
`N_INFERENCE_OVERRIDES = {5: 8}` doesn't cover n=3. Apply
brief 164's walk-forward methodology to the n=3 cluster
shape.

**Context — what brief 167 documented:**

Brief 167 ran the first production path-2 scale-up wave.
Findings:

- 6 ov004 `.rodata` claims kept at n=5; 3-region SHA1 PASS;
  4,464 bytes matched.
- **Sub-5 state reached**: `data_ov004_021e3de8` dropped n
  from 5 → 3 (3 veneer-target loads at offsets +0xe8 /
  +0x168 / +0x174 inside the claim's size 0x178).
- **Patcher broke SHA1 at n=3** with brief 162's stderr
  note: `byte-detected net 4 (delta 32) vs n-inferred
  delta 24`.
- Claim reverted; brief 168+ flagged to extend coverage.

The brief 162's `N_INFERENCE_OVERRIDES` dict only covers
n=5: `{5: 8}`. n=3 hits the fallback formula
(`n*12 - 12 = 24`) which disagrees with byte-detection's
measured value of 32.

**Brief 168 deliverables:**

### Part 1 — Diagnose the n=3 cluster shape

Reproduce brief 167's experiment: claim
`data_ov004_021e3de8` as Pattern 1 `.c`, run the build,
capture pre- and post-patch arm9_ov004.bin, diff against
orig:

1. Confirm the byte-detected `ctor_pad_net = 4` at n=3
   (brief 162 stderr observed 32 actual_delta vs 24
   n-inferred — confirms the n=3 cluster shape isn't the
   formula's NO_TERMINATOR shape).
2. Bisect via `cmp -l` to identify the cluster shape:
   - If 28-byte cluster (matches brief 164's
     `WITH_TERMINATOR_LONG`): walk-forward detector
     should already handle it — investigate why it
     didn't.
   - If a new cluster shape (e.g., 40 bytes, 44 bytes,
     etc.): document the new mwldarm-emitted layout
     (`[ctor | terminator | pad | ... ]`) and the net
     output delta.
3. Per brief 167 finding #5, sub-5 candidates only come
   from band-1 symbols. Brief 168's investigation may
   surface that mwldarm's veneer-emission at n=3 has a
   different ctor/pad shape than higher-n states.

### Part 2 — Extend the patcher

Two acceptable paths:

- **Path A (recommended)**: extend
  `N_INFERENCE_OVERRIDES` with the n=3 byte-detected
  `ctor_pad_net`. If diagnosis surfaces a new cluster
  shape, add a corresponding constant alongside
  `CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_LONG`.
- **Path B**: extend the walk-forward detector to
  recognise additional shape variants if brief 164's
  current detector misses them.

If the n=3 cluster shape IS the 28-byte
`WITH_TERMINATOR_LONG` brief 164 fixed, this is a pure
override-table extension (Path A; expected:
`N_INFERENCE_OVERRIDES = {5: 8, 3: ???}` where ??? is the
byte-detected value).

If it's a NEW shape, the walk-forward detector may need
adjustment — Path B.

### Part 3 — Sample n=4, 2, 1 if reachable

While the build setup is hot, opportunistically try to
trigger n=4, n=2, n=1 states:

- n=4: claim 2 band-1 slots simultaneously (might cascade
  past n=3 to n=1?).
- n=2: claim 3 band-1 slots? (speculative — depends on
  block structure).
- n=1: claim 4 band-1 slots?
- n=0: claim 5+ band-1 slots?

If any state is reachable, capture the byte-detected
`ctor_pad_net` and extend `N_INFERENCE_OVERRIDES`
accordingly. If unreachable from current source coverage,
leave for future sampling.

### Part 4 — Tests

Pin the new n=3 behaviour + any other low-n states
sampled. Existing tests must continue passing:

- n=86 (brief 134 historical baseline) — bit-identical.
- n=9 (current main NO_TERMINATOR) — unchanged.
- n=5 (brief 164 WITH_TERMINATOR_LONG) — unchanged.
- **n=3 (brief 168 NEW)** — pinned to whatever shape
  diagnosis identified.

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

- 3-region `ninja sha1` PASS preserved (current main,
  n=9).
- Manual injection of `data_ov004_021e3de8` claim →
  3-region SHA1 PASS at n=3 (new behaviour).
- Manual revert → 3-region SHA1 PASS at n=9 (idempotent).
- All existing tests pass + new n=3 PASS test.

**Non-scope:**

- ❌ Source-claim shipping (decomper brief 170+ owns the
  scale-up wave 2 once this lands).
- ❌ Odd-aligned slot recipe (brief 160 finding #4 —
  separate decomper brief).
- ❌ AGENTS.md / state.md beyond PR.

**Success:**

- n=3 patcher residual diagnosed + fixed.
- A real `data_ov004_021e3de8` claim shipped + reverted
  in test scaffolding produces SHA1 PASS post-fix.
- 3-region SHA1 PASS preserved on current main.
- New regression tests pin n=3 SHA1-PASSING behaviour.
- W7 patcher chain extends: 134 → 142 → 146 → 150 → 162
  → 164 → **168**.

**Branch:** `cloud/patcher-n3-residual-fix`

**Priority:** MEDIUM. Same pattern as brief 164 — empirical
state surfaced by decomper's scale-up, fix unblocks the
next wave. Not blocking SHA1 (current n=9 unchanged).

**After this brief lands:**

1. Brief 170+ (decomper) ships path-2 scale-up wave 2 at
   n=3 (and possibly lower). Brief 167's band-1
   enumeration is the candidate list.
2. The W7 patcher chain becomes calibrated across yet
   another mwldarm boundary; the walk-forward detector +
   override table is the established pattern.
3. Subsequent low-n states (if reachable) will follow the
   same brief 164/168 methodology: diagnose → extend →
   test.
