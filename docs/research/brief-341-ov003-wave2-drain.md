[//]: # (markdownlint-disable MD013 MD041)

# Brief 341 — ov003 clean-C wave 2 (the tier transition)

**Brief:** 341 (scaffolder, co-drain). Branch off fresh `origin/main` (after
\#855 / #856 landed), re-`dis` so wave-1's 11 are subtracted, continue the
per-state methods / dispatch / bounds / cell-lookup families over
`data_ov003_021cf6c0`, full recipe library incl. the new declaration-order
callee-saved lever. Per-pick gate = EUR objdiff 100%; the brain runs the
3-region SHA1 on merge. Own `src/overlay003/`, the ov003 `delinks.txt`,
`ov003_core.h`. Target ~8.

## Headline

**2 shipped (`.c`), both EUR objdiff 100% + `ninja rom` OK — and a clean
TIER TRANSITION.** Wave 1 (brief 339) drained ov003's clean per-state-method
vein; the 19 funcs still in the gap are now uniformly **Mac-lane**. I attempted
the four tractable-by-size residue funcs across every miss-class and confirmed
all four resist direct-mwcc reshaping. The two that matched are the only two the
tier had left for us. This mirrors ov015 wave 2 (5) and ov021 wave 2 (6), only
sharper — ov003's wave-1 cut deeper, so wave 2's floor is lower.

## The 2 picks

| func | size | recipe |
|---|---|---|
| `021ccd20` | 0x60 | BG-map rect fill — nested `h*w` cell loop, `(tile\|pal<<12)`, **unsigned** 16-bit tile wrap |
| `021ca10c` | 0xf0 | full scene teardown — dual-engine display blank + BGxCNT/blend clear + RNG mix + vblank re-register |

- **`021ccd20`** — the one reshape: the tile wrap `tile = (tile + 1) << 16 >> 16`
  emits a signed `asr` and misses at 95.8%; casting to **unsigned**
  `(unsigned)(tile + 1) << 16 >> 16` emits the `lsr` the orig uses. 100%.
- **`021ca10c`** — matched first try; the ov005 teardown recipe verbatim plus the
  MMIO idioms (inline-cast display blank on both engines, `b=(vu32*)0x04001010`
  so `(int)b - 0xfc0` derives via `sub`, `-0x10` from
  `func_0208e2f4(addr,0x3f,-0x10)`, the `data_021040ac` XOR-mix, and
  `func_020057dc(func_0201261c)`).

## Why only 2 — the residue is Mac-lane (attempted + catalogued)

Every remaining gap func `< 0x110` was attempted to a real objdiff number, then
deferred by **confirmed** miss-class (not by guess):

| func | best % | miss-class | why it won't reshape |
|---|:---:|---|---|
| `021cc010` / `021cbf08` | 48% | **strength-reduction** | clone pair; orig lowers one band-row base as `lr<<5; +<<1` and the other as a decrementing counter — mwcc folds the first to a single `<<6`; no C form blocks the fold |
| `021cd358` | 43% | **scheduling** | dense `func_0201ef90` marshalling; two reshapes landed (below) but the residue is batched-`stmia`-vs-split-`str`, the r4–r8 vs r3–r7 spread, and address-add order |
| `021cbdf4` | 89.5% | **caller-saved coin-flip** | escaping `{int hi; short attr}`; mwcc puts const→r2 / computed→r3 regardless of assignment **or** store order; orig is reverse because the trailing `func_02005dac(1,0)` reserves r0/r1 |
| `021ceb84` | 62% | **callee-saved permutation** | 4-iter sprite build, kind/fmt/affine/ybase permuted across r6–r9; declaration-order reorder made it worse |
| `021cedf8` | 64% | **stack-layout** | 11-arg `func_0201e964` builder; frame split + an extra r3 save diverge |
| `021cbe8c` | 87% | discriminant coin-flip | (wave-1 carry) switch discriminant in r0 not r1 — same as ov005 `021ad284` |

The rest of the gap (13 funcs) is the 0x1bc–0x182c render/init/update monsters
(`021ca2bc` alone is 1547 insns) — out of scope for direct-mwcc.

## Two NEW reshape levers (portable, banked even though 021cd358 stays Mac-lane)

Recovered on `021cd358` (22% → 43% before the scheduling wall):

1. **Avoid `mla` base-fusion.** A shared `char *row = o + i*S;` local fuses the
   base to a single `mla`. When the orig keeps `i*S` (a `mul`) and `o` separate —
   computing each pointer as `o + off + i*S` (so it batches the `o+off` bases into
   high callee-saved regs) — **do not bind the base**; inline `i*S` into every
   pointer expression so only that product is CSE'd. (22% → 25%, and it unlocked
   the r7/r8 base-batching the orig wants.)
2. **Switch block order follows source case order.** An out-of-line `default`
   placed after the cases is emitted **last**; mwcc lays jump-table bodies out in
   source order. Add an explicit `case 0:` (sharing the default value) **first** so
   the bodies come out ascending like the orig. (25% → 43%.)

Both are added to `ov003_core.h` §wave-2 and the cross-overlay recipe memo.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (per-unit + `report.json`) | **2/2 = 100.0** |
| in-tree build + link (`ninja rom`) | compiled + linked, ROM written |
| ov003 `delinks.txt` | +2 `complete .text`; gap set 21 → 19 (−2, clean re-dis) |
| `check_match_invariants.py` | **0 errors** |
| `ruff check tools/ tests/` | clean |
| 3-region `ninja sha1` | deferred to the brain on merge (per brief) |

Pre-flight: branched from fresh `main`; cleaned stale gaps + re-`dis`. Deferred
near-misses removed from `delinks.txt` and `src/` before the authoritative build.

## Recommendation — pivot off ov003

ov003 is **drained for the scaffolder**: waves 1+2 = 13 matched, and the
remaining 19 are now a confirmed Mac-lane block (SR / scheduling / coin-flip /
permutation / stack-layout, plus the big render bodies). A wave 3 on ov003 would
be grinding the catalogued residue, not draining a tractable vein. The recipe
library is overlay-portable (proven across ov006/005/015/021/003), so a **fresh
overlay** — `ov019` (~20 gap) or `ov009` (~15) per the decomper's survey — will
ramp like every fresh overlay has. Recommend the next scaffolder wave pivot
there; route ov003's residue to the permuter/m2c lane.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
