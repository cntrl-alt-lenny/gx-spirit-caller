### cloud/patcher-low-n-extended-coverage

**Goal:** Extend `tools/patch_ov004_veneers.py`'s n-inference
table to cover the n=5 state (and likely n=4, 3, 1) surfaced
by brief 160's path-2 experiments. Brief 150 (PR #576) made
byte-detection authoritative + degraded n-inference to a
warn, so this brief doesn't change SHA1 behaviour — the
patcher already produces correct output at n=5 via byte
detection. The goal here is to **eliminate the stderr-noise
warning** at low-n states so future path-2 waves run cleanly.

**Context — what brief 160 documented:**

Brief 160 (PR #592) ran 3 ov004 `.rodata` source-claim
experiments. All claims dropped mwldarm's veneer count from
9 → 5 (block-level suppression — not per-claim as initially
hypothesized). At n=5 the patcher succeeds via byte-detection
but logs:

```text
note: 5-veneer ctor/pad shape disagrees with n-inference:
byte-detected net 8 (delta 52) vs n-inferred delta 48.
Byte-detection takes precedence; this is informational only.
```

Brief 150's Option A (byte-detection authoritative) means
SHA1 stays PASS — the patcher does the right thing. But:

- The note will fire EVERY time someone makes a path-2 ov004
  `.rodata` claim that lands the build at n=5.
- Brief 163+ path-2 wave (decomper, queued) will trigger
  this repeatedly. Decomper has to mentally filter the warn.
- Future n-values dropping further (n=4, 3, 2, 1) likely
  produce similar warnings; each is a separate untested
  state.

**Brief 162 deliverables:**

### Part 1 — Empirical sampling

The `expected_output_delta_for(n)` formula brief 150 left
in place uses `n × 12 - 8` for WITH_TERMINATOR cases. Brief
150 pinned at n ∈ {0, 2, 7, 9, 43, 86}. Brief 160 added n=5
to the empirical set with delta=52 (which equals `5 × 12 -
8`) BUT byte-detected delta is 48 (off by 4). The mwldarm
binary input is 12 bytes LARGER than the formula predicts.

Sample additional low-n values experimentally:

- Trigger n=4 by claiming TWO 4-aligned ov004 `.rodata`
  slots (each suppresses 4 veneers per brief 160's finding;
  but block-level may cap at 9 → 5 then 5 → 1). If 5 → 1
  not achievable cleanly, fall back to mwldarm output
  inspection at synthetic input.
- Sample n=3, n=2, n=1, n=0 if reachable. n=0 should match
  brief 150's pinned case.
- For each: record actual mwldarm output size, byte-detected
  delta, n-inference delta.

If empirical sampling isn't tractable (some n-values may
not be reachable from current source coverage), fall back
to a code-level analysis of mwldarm's veneer-emission
behaviour: read brief 132's research note + brief 134's
patcher comments to understand the +12 B mwldarm-input
shape variant.

### Part 2 — Refine `expected_output_delta_for(n)`

Either:

- **Path A**: extend the table to a per-n mapping with the
  empirically-measured deltas. The simplest shape is a
  dict literal:

  ```python
  N_INFERENCE_OVERRIDES = {
      # n: ctor_pad_net (bytes), from brief 162 empirical sampling
      5: 8,   # corrects brief 150's formula (was inferring 4)
      # add 4, 3, 1, 0 as sampling allows
  }
  ```

  Then `expected_output_delta_for(n)` first consults this
  dict; on miss, falls back to the formula.

- **Path B**: derive a more general formula that subsumes
  the empirical data points. Brief 134's docstring +
  brief 150's helper comments may give clues to mwldarm's
  actual ctor/pad allocation rule. If a generalised
  formula fits all measured cases, prefer it over the
  per-n dict.

### Part 3 — Tests

Pin behaviour at all newly-measured n values. Suite must
still be all-passing.

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

- 3-region `ninja sha1` PASS preserved (the historical n=86
  case must produce bit-for-bit identical SHA1, plus n=9
  and any other n-values currently reachable from main
  state).
- New tests pin the low-n behaviour empirically.
- The stderr disagreement note must NO LONGER fire at
  n=5 (and other newly-covered n values).
- All existing tests pass.

**Non-scope:**

- ❌ Path-2 source claims (brief 163 decomper after this
  lands).
- ❌ Path-1 reclassification work (separate brief; brief
  156 risk caveats still apply).
- ❌ Odd-aligned slot recipe (brief 160 finding #4 —
  separate decomper brief if/when path-2 scales).
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- N-inference table covers low-n values empirically.
- Stderr disagreement note no longer fires at n=5 (and
  whatever other low-n states get covered).
- 3-region SHA1 PASS preserved.
- New tests pin the behaviour; full suite green.

**Branch:** `cloud/patcher-low-n-extended-coverage`

**Priority:** MEDIUM. Not blocking SHA1 (already PASS via
byte-detection); makes future path-2 waves run cleanly
without warning noise.

**After this brief lands:**

1. Brief 163 (decomper, parallel-track) scales up the
   path-2 wave once this brief makes the patcher quiet
   across the low-n range.
2. The W7 patcher chain (brief 134 → 142 → 146 → 150 →
   162) becomes fully calibrated against the empirical
   mwldarm behaviour across the full reachable n range.
