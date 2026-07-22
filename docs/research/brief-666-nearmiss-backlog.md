# Brief 666 — convert brief 661's documented near-misses (queue item cm-nearmiss-backlog)

**Result: 2/5 shipped, 2 more with major measurable progress, 1 unchanged.**

## Scope

Brief 661 left 6 open near-misses. `func_0206eecc` was already resolved
in this session's separate epilogue-wall work (unmerged PR #1275) —
not re-attempted here to avoid duplicate work. The remaining 5:

## Ships (2)

### `func_020967bc` — ring-buffer dequeue (74.3% → 100%)

A bounds-checked ring-buffer read: check `index*8 < ctx->limit`, call a
helper to copy 8 bytes from `ctx->base + index*8` into a local 2-word
output buffer, write the two output words back into `self`'s fields,
then notify via a second helper call. Brief 661 already had the body
and epilogue essentially right (74.3%); the residual needed two fixes:

1. **Unsigned comparison** for the bounds check (`index * 8 >=
   (unsigned int)ctx->limit`, not a plain signed `int` compare) —
   target uses `cmp`+`bge` (unsigned), the signed form compiles to
   `bge`→`bgt`-family with the wrong condition code.
2. **Return the raw call result, not a literal** (lever #11) — both
   the failed-copy path and the final success path return whatever
   the just-called helper returned in r0, not a hardcoded `1`/`0`.

### `func_020403d4` — multi-call global-state setup (26.8% → 100%, first try)

Five sequential accesses to the same global pointer, each re-reading
it fresh rather than caching it in a local — brief 661's own
already-documented "don't cache a global in a local" lever, applied
literally (every access written as a fresh `data_0219d9d4` expression,
never assigned to a local variable) — combined with `.legacy_sp3.c`
routing for the epilogue shape. Shipped 100% on the very first
attempt once both were applied together.

Both ported to USA + JPN, individually verified 100%.

## Major progress, not fully closed (2)

### `func_0209a000` — IRQ-guarded conditional dispatch (18-19% → 70.7%)

The two structural gaps brief 661 flagged both had real fixes:

1. **Branch polarity was inverted.** The target falls through on the
   failure path and jumps to the success path — writing `if (result
   >= 0) {success} else {failure}` produces the opposite branch
   layout. Swapping to `if (result < 0) {failure} else {success}`
   fixed the entire block layout (9.8% → 63.4%).
2. **Epilogue tier.** `.legacy.c` routing recovered the failure
   branch's epilogue to a byte-perfect match (63.4% → 70.7%) — that
   whole branch is now 100% identical, callback dispatch included.

The remaining gap is confined entirely to the success branch's two
flag-update statements (`flags36 |= 4; flags34 &= ~4;`): target reuses
one register (`r2`) for both read-modify-write sequences, mine uses
two (`r2`, `r3`). An explicit shared temp variable didn't change the
allocation — reg-alloc-insensitive, matching the documented
anti-pattern. There's also a small "boolean-survival" artifact at the
very top (target computes `(result>=0)` as an explicit 0/1 value,
compares it again, and branches on *that* — a literal redundant
double-test) that an explicit intermediate variable didn't reproduce
either (the compiler simplifies it away). Parked at 70.7%.

### `func_02073fc8` — Internet-checksum-style routine (22.9% → 35.4%)

The full odd/even-alignment-aware checksum accumulation loop (brief
661's "not modeled" note) is now modeled: two separate accumulation
loops gated on `(uintptr_t)addr & 1`, byte-swap normalization around
the even-aligned loop, and the final 32-bit-into-16-bit fold. The
remaining gap is in the exact shift/mask instruction selection for the
byte-swap steps and loop-exit branch condition codes — a genuinely
intricate bit-manipulation routine that would need several more
iterations to pin down exactly, not attempted further under this
brief's time budget.

## Unchanged (1)

### `func_020685c8` — hash function (54.2%, unchanged)

Already parked at 54.2% during this session's epilogue-wall work
(`.legacy_sp3.c` routing already applied, epilogue confirmed matching).
Tried 2 more variants this brief (declaration-order swap) — both
**worse** (45.8%, matching a separate declaration-order attempt from
the epilogue-wall session that also regressed). The residual is a
project-wide "prefers `lr` as scratch register throughout" allocation
choice that this project's own anti-pattern evidence (0W/7F) already
predicts is source-shape-insensitive. Left at 54.2%.

## Gate

`python tools/gate3.py --scope all --no-tests` — 3-region PASS.
