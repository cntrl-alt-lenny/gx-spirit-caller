# Cross-region cluster B bundle apply — FALSIFIED for mechanical apply

**Brief:** 172 (decomper). **Outcome:** mechanical cross-region apply of
brief 152/155's bundle recipe does NOT work for cluster B residue.
Each candidate needs per-symbol hand-tuning; the wave doesn't apply
mechanically the way brief 169's cluster A `.bss` zero-fill does.

## Hypothesis tested

Brief 172 specified ≥ 30 cross-region claims across 3 sub-pools (size-1/2
scalars + value=0 scalars + ov006). Implicit assumption: brief 152/155's
`unsigned int[N]` bundle recipe — which drained EUR cluster B residue —
applies mechanically to USA + JPN candidates per their own
`symbols.txt`.

## Iterations attempted

### Iteration 1: single-word `unsigned int[1]` bundle

```c
unsigned int data_X[1] = { 0x<val> };
```

**Result: FAIL.** mwldarm's `ALIGNALL(2)` directive still treats single-word
sections the same as `int x = 0` — they go to `.bss` (when value=0) or
get re-aligned, breaking the bundle's address claim. SHA1 fail.

### Iteration 2: multi-word bundle to next-named symbol

```c
unsigned int data_X[N] = { val, ... };  // N = 2..end_of_next_named
```

**Result: FAIL.** dsd rejects with `Last symbol 'data_Y' in section
'.data' has range 0x...0x... but is not contained within the file's
section range (0x...,0x...)`. The next-named symbol's gap-inferred
size extends past the bundle end. Bundle absorbs the symbol's start
but not its full extent — dsd's section-membership check fires.

### Iteration 3: zero-extend bundle while all-zero

Extended bundle by 4 bytes until at least 1 word non-zero (to keep mwcc
emitting to `.data` not `.bss`).

**Result: FAIL.** Triggers iteration 2's failure mode at the extended
end — newly-absorbed symbols' gap-extents conflict.

### Iteration 4: iterative inner-symbol absorption

Repeatedly extend bundle_end while any symbol inside `(start, bundle_end)`
has gap-inferred extent past bundle_end. Combined with iteration 3's
zero-extend.

**Result: FAIL.** Different mode — bundle ends up either (a) over-absorbing
beyond a safe cap, or (b) re-triggering iteration 2's check when the
absorption discovers MORE inner symbols whose extents extend further.
The loop terminates but the final bundle still has dsd-rejectable shape.

## Why brief 152/155 worked

Brief 152's `data_021020b4[16]` worked because the bundle was
**hand-tuned**: the human author inspected the surrounding symbol map,
chose the right N (16 words = 64 bytes covering exactly to the next
named symbol), confirmed there were no intervening symbols, and verified
the result was non-zero (because the candidate value was 0x80, not 0).

Brief 155's bundles similarly used candidate-specific extent choices
based on inspection of the `.data` map around each.

The mechanical apply has no such hand-tuning context — it picks a
bundle extent algorithmically and runs into one of 4 failure modes per
the iterations above.

## What does work cross-region

- **Brief 169 cluster A `.bss`** mechanically applies because `.bss` is
  zero-fill; no per-region content needed; `.space N` directives just
  re-create the zero-fill at the right addresses.
- **Brief 170 cluster B size=4 non-zero scalars + cluster B pointers**
  mechanically apply because each is a single 4-aligned slot with a
  known value and no inner-symbol gap concerns.

## What requires hand-tuning (brief 173+ / 174+ candidates)

1. **Cluster B size-1/2 (odd-aligned) cross-region.** Requires brief
   173's odd-aligned recipe work (which itself is research, not
   mechanical apply).
2. **Cluster B value=0 cross-region.** Requires per-candidate bundle
   tuning OR a smarter generator that knows to absorb adjacent named
   symbols' full gap-inferred extents (brief 174+ tool work).
3. **ov006 .data ordering shift.** Not investigated in this brief —
   gated on (1) + (2) first establishing a working baseline.

## Verification

No source changes shipped. 3-region SHA1 PASS + 27/27 OK preserved
(baseline state unchanged).

## Recommendation for brain

Brief 172 outcome: 0 source claims shipped, falsified hypothesis.
Brief 174+ should be a **cloud research brief** that:

1. Audits brief 152/155 worked examples for the exact bundle-extent
   selection heuristic that succeeded.
2. Builds a generator that automates that heuristic (likely needs to
   absorb full named-symbol gap chains until reaching a 4-aligned
   boundary with no pending gap-extension).
3. Then brief 175+ (decomper) re-runs the cross-region apply with
   the working generator.
