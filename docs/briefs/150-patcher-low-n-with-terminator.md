### cloud/patcher-low-n-with-terminator

**Goal:** Fix the low-`n` boundary in
`tools/patch_ov004_veneers.py` surfaced by brief 147. Brief
146 generalised the patcher to NO_TERMINATOR shape for
`0 < n < 86`, but bisection in brief 147 found mwldarm
continues emitting the **WITH_TERMINATOR** shape at very low
`n` (empirically `n < 9`). The byte-detection check
correctly detects WITH_TERMINATOR there; the n-based
inference still defaults to NO_TERMINATOR — disagreement
triggers brief 146's safety check and blocks the build.

**Context — what brief 147 documented:**

Brief 147 (PR #572) shipped 14 ov004 `.rodata` claims at
n=9 — all 3 shapes (Pattern 1 .c, .s, Pattern 3 chunk)
verified. Self-extend gates met but blocked when extending
dropped veneer count:

| Claims | veneer_count | Patcher | SHA1 |
|---:|---:|:---:|:---:|
| 14 | 9 | OK | PASS ✓ |
| 15 | 7 | mismatch error | FAIL ✗ |
| 19 | 2 | mismatch error | FAIL ✗ |

Patcher error:

```
ctor/pad shape mismatch: byte-detected net 8 (actual delta 16)
disagrees with n-based inference (delta 12) for veneer_count=2.
```

**Mechanism:** mwldarm continues emitting the WITH_TERMINATOR
ctor shape (16 bytes: 8-byte ctor + 8-byte pad with
WRITEW(0) terminator) at very low `n`. Brief 146's
n-inference assumes any `0 < n < 86` is NO_TERMINATOR (12
bytes: 4-byte ctor + 8-byte pad, no terminator). The
empirical boundary is somewhere between `n=9` (NO_TERMINATOR)
and `n<9` (WITH_TERMINATOR). Decomper's bisection narrowed
it to `n ∈ {2, 7}` triggering the WITH_TERMINATOR shape.

**Brief 150 deliverables — pick option A or B:**

### Option A (recommended) — degrade n-inference to a warn

Trust the byte-detection truth exclusively. The byte-
detection check inspects bytes 12-15 of the post-splice
cluster (which empirically distinguish WITH_TERMINATOR from
NO_TERMINATOR per brief 146). If that check is reliable
across the full `n ∈ [0, 86]` range, the n-based inference
is redundant — drop it to a warn (e.g., log "expected
WITH_TERMINATOR at n=N but byte-detected NO_TERMINATOR" but
don't fail).

**Risk:** if byte-detection ever ambiguates (e.g., a future
ov004 source-coverage state where bytes 12-15 are
coincidentally zero), the warn-only path would silently pick
the wrong shape and break SHA1. Mitigation: tests
explicitly cover the ambiguous case, OR add a second
independent discriminator (e.g., post-splice cluster length
sanity-check vs expected_output_delta_for(n)).

### Option B — recalibrate n-inference

Refine `expected_output_delta_for(n)` to model the empirical
mwldarm boundary:

```python
def expected_output_delta_for(n: int) -> int:
    if n == 0 or n == 86:
        return n * 12 - 8   # WITH_TERMINATOR (or no ctor for n=0)
    if 0 < n < SOME_LOW_THRESHOLD:
        return n * 12 - 8   # WITH_TERMINATOR (newly discovered)
    if SOME_LOW_THRESHOLD <= n < 86:
        return n * 12       # NO_TERMINATOR
```

The empirical threshold needs measurement. Brief 147 found
n=9 → NO_TERMINATOR works; n=7 / n=2 → WITH_TERMINATOR.
Sample at additional n values (3, 4, 5, 6, 8) to pin the
exact threshold.

**Risk:** the threshold may not be a clean cutoff. mwldarm's
behaviour at the boundary may depend on factors other than
n (e.g., presence/absence of specific symbol kinds in
`.rodata`). Option A is simpler and more empirically robust
to such subtleties.

### Recommendation

**Option A** unless byte-detection has known failure modes.
Decomper's brief 147 funnel explicitly recommended this
approach.

### Tests

- Pin the new behaviour at `n ∈ {0, 2, 7, 9, 43, 86}` with
  byte-detected shape matching observed mwldarm output.
- The `n=86` historical case must still produce the
  bit-for-bit SHA1 PASS that brief 142 + 146 preserve.
- The `n=2` and `n=7` cases (currently broken) must produce
  3-region SHA1 PASS post-fix.

### Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge)

- `python -m unittest tests.test_patch_ov004_veneers` — all
  passing (38 baseline + new low-n tests).
- 3-region `ninja sha1` PASS at the current main veneer count
  (validates the WITH_TERMINATOR path at the historical n=86
  case is undisturbed).
- 3-region `ninja sha1` PASS after manually injecting an extra
  ov004 `.rodata` source claim (validates the WITH_TERMINATOR
  path at the new low-n case ships clean).

**Non-scope:**

- ❌ Touching decomper-owned src/ or delinks.txt.
- ❌ ov004 cluster source-level work — that's brief 151+
  (decomper, after this lands).
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- Patcher accepts `n ∈ [0, 86]` end-to-end, including the
  low-n WITH_TERMINATOR boundary.
- 3-region `ninja sha1` PASS preserved.
- Tests pin the new behaviour at multiple n values.

**Branch:** `cloud/patcher-low-n-with-terminator`

**Priority:** MEDIUM. Not blocking SHA1 (already PASS).
Unblocks ov004 `.rodata` wave 2 (decomper brief 151+ would
ship the additional ~6 symbols brief 147 left on the table
plus deeper sub-cluster drain).

**After this brief lands:**

1. Brain scopes brief 151 (decomper, ov004 `.rodata` wave 2)
   to ship the residue brief 147 couldn't.
2. Patcher's W7 mitigation is now general across the full
   empirical mwldarm behaviour space — brief 134 → 142 → 146
   → 150 chain complete.
