[//]: # (markdownlint-disable MD013 MD041)

# Brief 399 — ov004 Thumb-cohort drain, wave 3 (untried medium residue) + pivot-watch

**Brief:** 399 (decomper). Wave 3 of the Thumb lane (briefs 393/395/397). Sweep the
~13 untried medium Thumb funcs with the banked recipe kit; **pivot-watch** — if
<~4 clean or mostly walls, stop and say the vein is tapped. Target ~4-8 (lower
yield expected). Branch `decomper/ov004-thumb-w3`.

## Headline — 5 matched; vein NOT tapped, but the clean *structural* tier is now drained

**5 matched, EUR/USA/JPN `ninja sha1` = OK, carve-size audit clean (5 sizes exact,
0 overlaps).** Above the pivot threshold (≥4), so **no pivot this wave** — the
recipe kit still cracks this tier. But the 5 are all *control-flow* funcs
(dispatchers / validation handlers / orchestrators); what remains is the
*data-shaping* tier (detailed builders) + walls, which is higher-cost. See the
wave-4 recommendation.

## The 5

| addr | size | what |
|---|---|---|
| `021dc7bc` | 0x62 | command dispatcher (`switch`→tail-call) |
| `021dd150` | 0xbc | record dispatcher (validate + 3-way type dispatch) |
| `021dd040` | 0x110 | validation handler (type-0 path) |
| `021dcf38` | 0x108 | validation handler (type-1 path, sibling of dd040) |
| `021dcd64` | 0x110 | decrypt-validate-rebuild orchestrator (composes dc020/dc238) |

## Recipes that carried it (extending the kit)

- **Deferred pointer past the entry guard** (`021dd040`/`021dcf38`/`021dce74`): when
  the orig computes a base pointer (`arg1+12`, `arg1+36`) *inside* the post-guard
  block, declare it and assign it **after** the `if (arg0 != K) return;` — a top-of-
  function `char *p = arg1+12;` hoists the computation and diverges.
- **Reused vs one-use pointer = split vs fold**: `arg1+12` used ≥2× stays in a reg
  and the field offset is a second `adds` (`021dd040`'s `p+16`/`p[12]`); used **once**
  it folds to `arg1+28` (the `021dce74` near-miss — unrecoverable without the struct).
- **Cache `rec+4` for a re-read** (`021dd040`): the orig computes `rec+4` early and
  uses it for the *second* of two `bswap(*(int*)(rec+4))` reads — write `int *v =
  (int*)(rec+4);` and use `*(int*)(rec+4)` then `*v`.
- **Shared-return switch** (`021dd150`): `case K: x = f(); break; … return x;` (not
  `case K: return f();`) to get the orig's store-to-result + branch-to-shared-epilogue.
- Plus the standing kit: dispatch via `switch` (cmp/beq chain for sparse large
  cases), tail-call returns, `arg2[0]++` early-outs, the unsigned `< 1` guard.

## ⚠️ Lesson: dcheck does NOT validate pool constant *values*

`021dcd64` passed dcheck but **failed `ninja sha1`** (1 wrong byte → 128 KB ROM diff
via ov004 compression). Cause: a pool constant I mis-read as `0x1010` from the LE
bytes `00 10 00 00` — the true value is **`0x1000`**. dcheck canonicalises
`ldr [pc,#N]` → `pool` and drops trailing `.word`s, so a wrong literal (or pool
order, or `bl` target) is invisible to it. **`ninja sha1` is the only gate.** A fast
per-pick pinpoint: `cmp build/<ver>/build/arm9_ov004.bin
extract/<ver>/arm9_overlays/ov004.bin` → exact byte → address `0x021c9d60 + off` →
function. (Banked this in `ov004_core.h`.)

## Deferred / walled (the 8 not shipped)

- **`021dce74`** (0xc2) — validation handler, **88/89**: the lone instruction is a
  `arg1+28` that the orig emits as `+12; +16` (a 2-level struct member access);
  `arg1+12` is used once so mwcc folds it. Unrecoverable without the struct def.
- **`021dc998`** (0xce) — TLV validator built on a **sparse-switch binary-comparison
  tree** (`cmp #53; bgt/bge; cmp #48/#64/#69`); the pivot/tree shape is mwcc-chosen.
- **`021dc830`, `021dcbf0`** — PC-relative **jump tables** (`add rN,pc; ldrh; bx rN`).
- **`021dbc8c`** (0x7c) — PRNG/LCG; several embedded constants at an odd pool offset.
- **`021dc474`** (0x8c), **`021dc570`** (0xf4), **`021dc664`** (0x158) — detailed
  builders (overlapping stack structs, per-field `strb/strh` + `ldrsb/ldrsh` casts,
  divmod, multiple constants). Matchable but high per-pick cost.

## Vein status + wave-4 recommendation

The Thumb cohort has now yielded **27 + 14 + 8 + 5 = 54 funcs** across waves 1-3 + the
harness brief. The **control-flow tier is drained** (dispatchers/handlers/
orchestrators — this wave got the last clean ones). What's left in the ~13-func
residue: **the data-shaping tier** (4 detailed builders, matchable but slow — many
field writes, casts, constants), **2 jump-table walls**, **1 switch-tree wall**, and
**1 struct near-miss**.

**Recommendation:** the named-recipe yield is thinning. Wave 4 is a judgment call:
either (a) grind the 4 detailed builders (lower funcs/hour, still real C), or
(b) **pivot the decomper to a fresh overlay's easy clean-C tier** (brief 364's
guidance — the levers shine on a fresh easy tier, not a drained overlay's hard
residue). Given the builder cost, **(b) is the better ROI** — the Thumb cohort's
*easy* clean-C is effectively tapped even though a few builders remain.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (5 `.c`, byte-identical; ov004 binary identical) |
| Carve-size audit (5 sizes vs symbols.txt, overlaps) | **PASS** (exact, 0 overlaps) |
| No orphan `.thumb.c` | clean |

## Cross-references

- `docs/research/brief-397-ov004-thumb-drain-wave2.md` — wave 2 + the orchestrator/
  builder primitives this wave composes.
- `docs/research/brief-364-overlay-resweep.md` — the "levers shine on a fresh easy
  tier, not a drained residue" guidance behind the wave-4 pivot recommendation.
- `src/overlay004/ov004_core.h` §VERIFIED b399 — per-func recipes + the
  dcheck-misses-pool-values lesson.
