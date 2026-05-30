[//]: # (markdownlint-disable MD013 MD041)

# Brief 271 — Over-fire drain wave 5 (the productive families)

**Brief:** 271 (decomper). (A) Batch-drain Family F (IRQ
critical-section ×21) + Family G (memset wrapper ×8) via brief-268
templates. (B) more C-39f indexed-0x868 + C-41 + Fill32 + clean
C23-noMMIO.

## Headline

**16 .c shipped, all objdiff 100 % + 3-region SHA1 PASS** (6 Family F +
6 Family G + 4 C-39f indexed). 16/19 attempted = 84 % yield. Below the
~35 target — the two corrections this wave: **Families F/G are
MIXED-tier** (the brief's "route `.legacy.c`" holds for only ~⅓), and
**the clean-member counts are smaller than estimated** (most F shells
have loops, most G bodies are bespoke, most indexed-0x868 >0x40 are
2-D / guarded / double-table).

## Key correction — Families F/G are mixed-tier; route by epilogue

The shell/recipe is the same, but the *tier* is per-pick (gotcha 10):

| epilogue | tier | suffix |
|---|---|---|
| `ldmfd {…,lr}` / `pop {…,lr}` + separate `bx lr` | Style-A (1.2/sp2p3) | `.legacy.c` |
| `pop {…, pc}` (no sub-sp) | default (2.0/sp1p5) | `.c` |
| `sub sp,#4` … `add sp,#4; pop {…, pc}` | 1.2/sp3 | `.legacy_sp3.c` |

This wave's Family F spans all three (`02091af4` `.legacy.c`,
`02032e8c/ec4/efc/f38` `.c`, `0208a684` `.legacy_sp3.c`); Family G too.
Routing everything `.legacy.c` (the brief's instruction) mis-fires on ⅔.

## (A) Family F — IRQ critical-section shells (6)

`OSIntrMode old = OS_DisableIrq(); <work>; OS_RestoreIrq(old);`
(old parked in r4). Clean 1-helper shells:

- `02091af4` (.legacy.c) — `if (self->f64 != 2) func_02091a8c(&self->f9c);`
- `02032e8c` `02032ec4` (.c) — `func_02094688(...)` (arg order is per-pick:
  `e8c` = `(a1, self+0xe3c, 64)`, `ec4` = `(self+0xe3c, a1, 64)`).
- `02032efc` `02032f38` (.c) — `func_02094688(.., *(char**)(self+0xe7c)+a1*12, 12)`.
- `0208a684` (.legacy_sp3.c) — `func_0207d12c(g, a0);`

Of 23 `[Disable,helper,Restore]` functions, only these 6 are
**clean 1-helper shells**; the other 17 have loops / multi-branch /
`blx` bodies (per-pick, not batch).

## (A) Family G — memset (`func_020945f4`) wrappers (6)

- `0206fc2c` (.legacy.c) — conditional fill (brief-268 example).
- `02077f8c` (.legacy.c) — memset + **MD5 seed** (`0x67452301`…).
- `020785cc` (.legacy.c) — memset + **SHA-1 seed** (5 words incl.
  `0xc3d2e1f0`).
- `02097810` (.legacy.c) — memset + **gotcha-17 volatile** re-read tail.
- `02052df4` (.legacy_sp3.c), `02052e90` (.c) — `memset(self,0,12);
  helper(self,…); func_02053600(self, K);`.

Of 17 memset callers, 6 transcribe cleanly; the rest have bespoke
bodies (multi-helper, conditional struct-copy).

## (B) C-39f indexed-0x868 (4)

- `022036a8` `022036f0` `0220ce90` — **2-D** `base + (bit0&1)*0x868 +
  b1_5*20`, `return v == 0 / != 0`.
- `02201e74` — **1-D** `(1-bit0)`-indexed, stride-reuse bound
  `v <= 0xbb8` (mwcc derives `0xbb8` via `add #0x350` from the live
  0x868 stride).

Both index forms need the explicit `& 1` (`(bit0 & 1)`, `((1-bit0) &
1)`) for the redundant `and #1`. Of 46 indexed-0x868 >0x40, only these
4 are clean single-read simple-compare; the rest are 2-D-with-2-bases,
double-table, guarded (`b6_11`/`a2` prefix), or register-bound — all
moderate per-pick.

## Non-shippers — P-candidates

| Pick(s) | % | Divergence |
|---|---:|---|
| `0220dcdc` `0220c980` `02202d08` | 13-23 | 2-D indexed bit-test `((v>>K)&1)==0` — my index/tail recipe is structurally off; these have a more complex shape than the simple-compare family (needs per-pick disasm, not the template). |

(Plus the 17 loop-bodied Family F + the bespoke Family G + the
2-D/guarded indexed tail — deferred as moderate per-pick, not P.)

## Process notes

1. **Mixed-tier routing** (above) cost the most iteration — confirm the
   epilogue before choosing `.legacy.c` vs `.c` vs `.legacy_sp3.c`.
2. **Stale-object trap:** re-routing a pick's tier (`.c` →
   `.legacy_sp3.c`) leaves the old `build/…/func_X.o(.resolved)` which
   objdiff still compares (showed 73 %/61 % while `ninja sha1` PASSED).
   `find build -name 'func_X.o*' -delete` + rebuild fixes it. **`ninja
   sha1` is authoritative; a stale objdiff is not.**

## Yield by tier

```text
Family F (clean shells)   : 6/6   (100%, of 23 candidates — 17 loop-bodied)
Family G (clean memset)   : 6/6   (100%, of 17 callers — rest bespoke)
C-39f indexed-0x868 >0x40 : 4/7   (the 3 bit-test off-recipe)
overall                   : 16/19 (84%)
```

## For wave 6 / the brain

Across waves 1-5 the over-fire cohort's **clean-template** veins
(StyleA helper-families, C-39f simple-indexed, C-41/Fill32 tails,
brief-266 quirks, Family F/G clean shells) are substantially drained.
What remains in every family is the **moderate per-pick tail** (loops,
guards, 2-D/double-table indices, bespoke bodies, mixed tiers) at
~50-70 % yield. Recommend the brain weigh (a) continuing to grind that
tail vs (b) declaring the over-fire *cheap* vein drained after 5 waves
and pivoting to the Track-2 cold-RE accelerators (m2c / dsd-ghidra).

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 16/16 at 100 % |
| `tools/check_match_invariants.py` | 0 errors (4618 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2276 passed |

## Cross-references

- `docs/research/recipe-gotchas.md` § StyleA over-fire families F/G
  (brief 268), gotcha 10 (`.legacy_sp3.c`), 14 (redundant `& 1`),
  17 (volatile).
- `docs/research/brief-269-overfire-drain-wave4.md` — the C-39f
  indexed-0x868 family this extends + the C-41/Fill32 tails.
