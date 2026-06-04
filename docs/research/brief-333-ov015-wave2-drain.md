[//]: # (markdownlint-disable MD013 MD041)

# Brief 333 — co-drain wave 2: ov015 0x80+ tier (tier transition)

**Brief:** 333 (scaffolder, co-drain). Continue ov015 (wave 1 = brief 331,
PR #847, 12 matched). Per-pick gate = EUR objdiff 100% (direct-mwcc); the brain
runs the 3-region SHA1 on merge. Own `src/overlay015/`, the ov015 `delinks.txt`,
and `ov015_core.h`. Target ~10-12; reshape any 70%+ register-choice near-miss
before deferring; catalogue permuter/scheduling misses for the Mac lane.

## Headline

**5 shipped (all `.c`), all EUR objdiff 100% + `ninja rom` OK.** Wave 2 is a
**tier transition**: wave 1 drained ov015's easy/linear `<0x100` tier (12 picks);
what remains is render/layout-heavy and **direct-mwcc-resistant**. The 5 matched
are the tractable constructors/tickers/blit-setups; the other 5 attempted came
in as register/store/scheduling near-misses that the recipes can't steer
(catalogued for the Mac lane, per the brief). ov015 matched: → +5 (17 total).

## The lever — bind the struct base to a local

Every tractable wave-2 pick touches `data_ov015_021b5e44` (and `/28`) many times
across calls. The orig loads the base **once** into a callee-saved reg; a direct
`data_ov015_021b5e44 + off` reference **reloads it every time** → large diffs.
Binding `char *s = data_ov015_021b5e44;` at the top fixed it: **021b4740 22% →
100%**, **021b3614 88% → 100%** (same recipe as wave-1 `021b35d0`). This is the
extension of the wave-2 reshape recipe (`ov005_core.h §VERIFIED`) to struct-heavy
functions.

## The 5 picks

| func | size | shape | the catch |
|---|---|---|---|
| `021b3170` | 0x80 | scroller constructor | orig const-folds `o[0x5a]-o[0x56]` (just-stored 0xc0/0) → write literal `0xc0` |
| `021b4740` | 0x8c | fade-out ticker | bind struct base; 5-arg `func_0208e318` (4 regs + stack) |
| `021b46c8` | 0x78 | fade-in ticker | sibling of 021b4740 (swapped 4th/5th arg + branchless tail) |
| `021b3614` | 0xb0 | cell blit | bind struct base; two stack buffers |
| `021b3028` | 0x88 | status redraw | linear; two stack out-slots |

Also banked the **divmod r0/r1 recipe** from wave 1 (`func_020b3870` quotient by
name; remainder via `long long` `>>32`) — the tickers use `level*31/scale`.

## ⚠️ Tier transition (the actionable signal)

Waves 1+2 = **17 matched**; the easy/linear `<0x100` tier is now largely drained.
The remaining ~17 funcs are **render/layout-heavy**: nested tile-fill loops
(`021b30f0`), stack-struct glyph builders (`021b27d8`/`021b2280`), MMIO
bit-packers (`021b3e14`), big per-case rect math (`021b2514`), string-measure
loops (`021b3718`). Wave 2 hit **5 of 10 attempts**; every miss was a
**local-variable register/store CHOICE** mwcc makes differently — distinct from
the struct-base *loads* the bind recipe fixes, and not steerable from C.

**Recommendation:** this is a yield transition like ov005's, but ov015 is **not
thin** (many funcs remain) — they're just harder. The brain should weigh a 3rd
ov015 wave (expect ~5/wave) against a fresh overlay, and route the render/layout
tail + the allocator near-misses below to the **m2c/permuter Mac lane**.

## Deferred near-misses (NOT shipped — reshaped per brief, then catalogued)

| func | % | class |
|---|:---:|---|
| `021b5a14` | — | **permuter** (indirect `blx` dispatch; ov005 `021acfb0` kin) |
| `021b3f98` | 76% | `col` local in r0 vs r1 (alloc coin-flip; bind-to-temp got it to 76) |
| `021b27d8` | 71% | `req[0]/req[1]` want `stmia`, mwcc splits the stores |
| `021b2490` | 61% | the `phase` param register (save-via-`movs` vs `cmp`) |
| `021b43a8` | 44% | whole r4–r7 allocation rotated (a/b/acc/s) |
| `021b30f0` | 34% | nested tile-fill loop — pointer-IV factoring + loop lowering |

(Plus the wave-1 carry-overs `021b28a8` cond-move order, `021b23f4` sa/sb alloc.)

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (per-unit + `report.json`) | **5/5 = 100.0** |
| in-tree build + link (`ninja rom`) | compiled + linked, ROM written |
| ov015 `delinks.txt` | +5 `complete .text`, clean re-dis drop-out |
| `check_match_invariants.py` | **0 errors** |
| `ruff check tools/ tests/` | clean |
| 3-region `ninja sha1` | deferred to the brain on merge (per brief) |

Pre-flight: branched from fresh `main` (`0587964` = #847 + #848); cleaned stale
gap files + re-`dis` so wave-1's 12 are subtracted.

## Cross-references

- `docs/research/brief-331-ov015-wave1-drain.md` — wave 1 (the easy tier + the
  divmod recipe).
- `src/overlay015/ov015_core.h` — §VERIFIED wave-2 block + the bind-struct-base
  lever + the tier-transition note + the near-miss catalogue.
