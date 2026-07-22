# cm-epilogue-wall — the "epilogue-shape wall" was never permanent

Date: 2026-07-22
Branch: `claude/epilogue-wall-cc`
Queue: `docs/queue/claude-decomper.md` → `cm-epilogue-wall`

## Headline

**All 3 documented targets shipped, 100% match, 3-region byte-verified.**
The mechanism: brief 661 correctly diagnosed a recurring prologue/
epilogue mismatch (perfect-matching bodies, wrong stack-frame shape)
but concluded it was "genuinely uncontrollable from C" after trying a
`volatile` local (brief 654's fix for a *different* epilogue variant).
**It is controllable — via the project's own existing `.legacy.c` /
`.legacy_sp3.c` compiler-tier routing**, documented since brief
034/042/044/045 specifically for this exact prologue/epilogue family
and never tried on these 3 candidates. This is not a new lever; it's
an established one (`lever-payoff.md` #28/#29) that just wasn't
checked before the "permanent" conclusion was drawn.

## Diagnosis

`docs/research/style-a-epilogue.md` (briefs 034/042/044/045) already
documents the exact discriminator table:

| Compiler | Push | Sub-sp? | Epilogue |
|---|---|---:|---|
| 2.0/sp1p5 (default `.c`) | r3-spill dummy register when count is odd | no | `pop {regs, pc}` (fused) |
| 1.2/sp2p3 (`.legacy.c`) | no dummy register | `sub sp, #4` | `pop {regs, lr}; bx lr` (separate) |
| 1.2/sp3 (`.legacy_sp3.c`) | no dummy register | `sub sp, #4` | `pop {regs, pc}` (fused) |

Brief 661's own description of the wall — target uses `stmfd sp!,{lr}`
+ `sub sp,sp,#4` with either a separate `pop{lr};bx lr` or a fused
`pop{pc}`, while the default compile prefers a dummy second push
register with a fused `pop{pc}` and no `sub sp` — is a **verbatim
restatement of row 1 vs rows 2/3** of that table. Reading each of the
3 target `.s` files' actual epilogues against the table immediately
tells you which of the two non-default tiers each one needs:

| Function | Epilogue shape | Tier |
|---|---|---|
| `func_020915e4` | `add sp,#4; ldmfd sp!,{lr}; bx lr` (separate) | `.legacy.c` (1.2/sp2p3) |
| `func_0206eecc` | `add sp,#4; ldmfd sp!,{lr}; bx lr` (separate) | `.legacy.c` (1.2/sp2p3) |
| `func_020458d8` | `add sp,#4; ldmfd sp!,{pc}` (fused) | `.legacy_sp3.c` (1.2/sp3) |

## Results

| Function | Before | After routing fix | Extra lever needed |
|---|---:|---:|---|
| `func_020458d8` | 48% (epilogue-blocked, all 4 branch bodies already 100%) | **100%, first try** | none — routing alone closed it |
| `func_0206eecc` | 37.5% | **100%, first try** | none — routing alone closed it |
| `func_020915e4` | 69.2% (loop body 100%) | 57.7% → 65.4% → **100%** | 2 more fixes needed *after* routing: (1) an `unsigned` comparison where I'd written `int` (target uses `movhi`/unsigned-higher, not `movgt`/signed-greater — a real semantic difference, not a wall); (2) swapping the declaration order of two loop-local variables (`i` before `clamped`, not the other way) changed the 1.2/sp2p3 register allocator's choice enough to hit an exact match. This second fix is itself a small new data point: declaration order mattered for mwcc **1.2/sp2p3**'s allocator on this function, where the project's `lever-payoff.md` anti-pattern entry for reg-alloc/scratch-register swaps is evidenced entirely against the default **2.0/sp1p5** tier — worth keeping in mind that "0 W / 7 F, no lever moves it" was never tested against the legacy tiers specifically. |

## A 4th, unlisted function confirms the mechanism generalizes

Brief 661 named 2 more functions as "probable contributors" to the
same wall alongside the 3 above: `func_020967bc` and `func_020685c8`.
Checked `func_020685c8`'s epilogue: `add sp,#4; ldmfd sp!,{pc}` (fused)
— same `.legacy_sp3.c` shape as `func_020458d8`. Routed it and wrote a
draft (a byte-translation hash function, ending in a 64-bit-return
callee whose high word is the real result — matches brief 661's own
"don't guess a callee signature" lever from a different function):
**match jumped from a body-only ~30% (extrapolated from the target's
own instruction count) straight to 54.2%, with the entire
prologue+epilogue now `SAME`** — every remaining diff is in the loop
body (register churn plus one apparently-redundant signed-range
double-check whose C-level trigger isn't nailed down yet). Parked
un-shipped (this is bonus scope beyond the queue item's 3 named
targets), but it's strong independent confirmation that the routing
fix is the general mechanism, not a fluke of the first 3. Left for
`cm-nearmiss-backlog` — the epilogue-blocking part of its diagnosis is
now solved; what's left is an ordinary body near-miss.
`func_020967bc` (the remaining named function, a ring-buffer/queue
`.legacy.c`-shaped candidate) was read and confirmed to have the same
`.legacy.c` epilogue shape but not attempted — meaningfully more
complex (20-byte stack temp, an unresolved-signature helper call) —
also left for the near-miss backlog rather than this item's scope.

## Why this matters beyond these 3 functions

`wall_aware_headroom.py`'s `unknown` bucket for `main` has never been
filtered by epilogue shape. Given brief 661's finding that this
pattern showed up in 5 of 35 truly-random samples (~14%) purely by
chance, and that the fix requires zero body-level C changes for 2 of
the 3 confirmed cases, **a fast, mechanical pre-filter is now
possible**: for any `unknown`-bucket candidate, read the epilogue —
`sub sp,#4` + either a separate `pop{lr};bx lr` or `pop{pc}` — and
route directly to `.legacy.c`/`.legacy_sp3.c` *before* attempting a
body draft under the default tier. This should meaningfully raise the
hit rate on `cm-main-small-c`'s upcoming sweep (the next queue item),
which explicitly calls out applying whatever this item found.

## Updated the lever-payoff evidence table

`docs/research/reshape-recipes/lever-payoff.md` levers #28
(`.legacy.c`) and #29 (`.legacy_sp3.c`) evidence counts updated (6→8,
2→3) with this brief's ships and a cross-reference to this report and
`style-a-epilogue.md`. Did not create a new codegen-walls.md P-NN
entry — there's nothing permanent to document; the existing C-15/C-20/
C-24/C-26 routing-tier bucket already covers this exactly, brief 661's
mistake was not checking it, not a gap in the taxonomy.

## Gate

- `python tools/gate3.py --scope all --no-tests`: **GATE PASS**, all 3
  regions individually confirmed (`[eur] SHA1 PASS`, `[usa] SHA1
  PASS`, `[jpn] SHA1 PASS`), verified via a forced-clean rebuild of the
  3 EUR objects before the final run.
- All 3 EUR matches ported to USA + JPN via `tools/port_to_region.py`
  (which correctly preserves the `.legacy.c`/`.legacy_sp3.c` filename
  suffix in its rewritten output path). `func_020915e4`→`func_020914fc`
  is MEDIUM confidence (no relocs to disambiguate the address shift;
  accepted at `--confidence-floor MEDIUM`, consistent with prior
  briefs' handling of the same no-reloc-signature situation); the
  other 2 pairs resolved HIGH/EXACT_ADDR at the default floor.
  `port_to_region.py` prints but does not apply the `delinks.txt`
  routing line (known gotcha, see `main-small-contained-cmatch-lane.md`)
  — applied all 6 USA/JPN entries by hand.
- `python -m pytest -q tests`: 11 failed, 2850 passed — matches the
  established pre-existing Windows path-separator baseline (confirmed
  unrelated to this branch's files).

## Files changed

- `src/main/func_020915e4.legacy.c`, `func_020458d8.legacy_sp3.c`,
  `func_0206eecc.legacy.c` — new EUR matches (`.s` siblings removed).
- `src/{usa,jpn}/main/func_020914fc.legacy.c`,
  `func_02045830.legacy_sp3.c`, `func_0206ee58.legacy.c` — USA/JPN
  ports.
- `config/{eur,usa,jpn}/arm9/delinks.txt` — 9 entries routed total (3
  EUR + 3 USA + 3 JPN), each to the correct non-default compiler tier.
- `docs/research/reshape-recipes/lever-payoff.md` — evidence counts
  for levers #28/#29 updated.
- `docs/queue/claude-decomper.md` — `cm-epilogue-wall` marked DONE.
- `docs/research/queue-cm-epilogue-wall.md` — this report.
