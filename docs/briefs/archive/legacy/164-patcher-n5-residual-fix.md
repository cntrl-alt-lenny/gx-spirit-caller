### cloud/patcher-n5-residual-fix

**Goal:** Fix the +12-byte SHA1 residual at n=5 that brief 160
surfaced. Brief 162 silenced the stderr warn but the underlying
geometric gap remains — any real path-2 source claim that drops
the veneer count 9 → 5 still breaks SHA1. This brief closes
the gap and unblocks path-2 scale-up waves (decomper).

**Context — what brief 160 + 162 documented:**

Brief 160 (PR #592) ran 3 ov004 `.rodata` source-claim
experiments. All dropped mwldarm's veneer count 9 → 5
(block-level cascade, not per-claim). At n=5:

- Patcher succeeds via brief 150's byte-detection.
- Output is **orig + 12 bytes** — SHA1 FAILS.
- The +12 isn't a patcher bug per se; mwldarm's input at n=5
  is 12 bytes larger than the formula predicts.

Brief 162 (PR #596) added a per-n override
(`N_INFERENCE_OVERRIDES = {5: 8}`) which silences the brief 150
disagreement note BUT doesn't change the patcher output. The
SHA1 residual remains.

Brief 162's empirical capture:

| n | pre-patch | pre-orig | ctor_pad_net | actual_delta |
|---|---:|---:|---|---:|
| 9 | 268,288 | +96 | 12 (NO) | 96 |
| 5 | 268,256 | +64 | 8 (WITH) | **52** |

The patcher's `actual_delta = 52` at n=5 means the patcher
removes 52 bytes from mwldarm's 268,256 → 268,204. Orig is
268,192. So the patched output is **+12 bytes** vs orig.

The geometric gap is unidentified — possibly an extra ctor
entry, extra pad bytes, or a section-alignment-cascade
artifact mwldarm emits at the n=5 boundary specifically.

**Brief 164 deliverables:**

### Part 1 — Diagnose the +12-byte residue

Reproduce brief 160's experiment 3 setup (claim
`data_ov004_021f4a40` as Pattern 1 `.c`). Capture the
post-patch arm9_ov004.bin and diff against orig:

1. `cmp -l build/eur/arm9_ov004.bin extract/eur/arm9_overlays/ov004.bin`
   to enumerate byte-level diffs.
2. Identify where the +12 bytes live (likely contiguous; could
   be in ctor, pad, or a downstream section).
3. Cross-reference against brief 132's W7 research +
   brief 134/146/150 patcher comments. The +12 may correspond
   to:
   - An extra 12-byte ctor entry mwldarm emits at the n=5
     boundary.
   - 12 bytes of pad mwldarm adds for section-alignment that
     the patcher doesn't strip.
   - Something else entirely — empirical bisection determines.

### Part 2 — Extend patcher to strip / fix the +12

Once the gap is identified, extend the patcher to handle it
correctly at n=5. Possible shapes:

- **If +12 is extra ctor**: extend `_fix_ctor_and_pad` to
  detect and strip the additional entry.
- **If +12 is pad**: extend pad-handling to strip.
- **If +12 is something else**: design accordingly.

### Part 3 — Validate end-to-end

After the fix:

1. Re-run brief 160 experiment 3 (claim
   `data_ov004_021f4a40`). The claim should now SHA1 PASS
   for all 3 regions.
2. Sample other 4-aligned candidates from
   `docs/research/ov004-rodata-pointer-targets.md`. Each
   should drop the veneer count via the block-level cascade
   AND produce SHA1 PASS (not just at n=5 — at whatever n
   the cascade lands at).
3. The claim should be reverted before merging (per the
   brief 160 precedent — this brief ships the patcher fix,
   not source claims). The patcher behaviour change + tests
   are the deliverable.

### Part 4 — Tests

- Pin n=5 patcher behaviour at SHA1-PASSING output (the new
  patcher should produce orig bytes from the n=5 mwldarm
  input).
- Regression: n=9 (current main) unchanged.
- Regression: n=86 (historical) unchanged bit-for-bit.

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

- 3-region `ninja sha1` PASS preserved (current main, n=9).
- Manual injection of an ov004 `.rodata` claim → 3-region
  SHA1 PASS at n=5 (new behaviour).
- Manual revert of the injection → 3-region SHA1 PASS at n=9
  (idempotent).
- All existing tests pass + new n=5 PASS test.

**Non-scope:**

- ❌ Source-claim shipping (decomper brief 167+ owns the
  path-2 scale-up wave once this brief lands).
- ❌ Local-label generator gap (brief 163 funnel — separate
  small cloud follow-up; brief 166 candidate).
- ❌ Odd-aligned slot recipe (brief 160 finding #4 —
  separate decomper brief).
- ❌ AGENTS.md / state.md beyond PR.

**Success:**

- n=5 patcher residual identified + fixed.
- A real ov004 `.rodata` claim shipped + reverted in the
  PR's test scaffolding produces SHA1 PASS post-fix.
- 3-region SHA1 PASS preserved on current main.
- New regression tests pin n=5 SHA1-PASSING behaviour.
- W7 patcher chain extends: 134 → 142 → 146 → 150 → 162 →
  **164**.

**Branch:** `cloud/patcher-n5-residual-fix`

**Priority:** MEDIUM-HIGH. Critical-path for unlocking path-2
scale-up (brief 167+ decomper). Currently any path-2 claim
breaks SHA1; this brief lifts the constraint.

**After this brief lands:**

1. Brain scopes brief 167+ (decomper) for path-2 scale-up
   wave: claim 10-20 ov004 `.rodata` slots in mwldarm-
   veneer-block-aligned groups. Each block-suppression step
   drops 4 veneers; aim for n=9 → n=1 across multiple
   passes.
2. Subsequent low-n states (n=4, 3, 2, 1) may surface
   further gaps. Brief 164's diagnostic methodology (cmp -l
   bisection + patcher extension) becomes the template for
   any future gap.
