[//]: # (markdownlint-disable MD013 MD041)

# Brief 351 — main easy-tier wave 2 (dual-compile)

**Brief:** 351 (scaffolder, co-drain). Wave 1 proved main's easy tier is a live,
singleton-heavy vein worth ~50% of clean shapes *when dual-compiled*. Keep
mining it: continue the `<0x80` simple cohort, **dual-compile every candidate**
(mwcc 2.0 `.c` AND 1.2/sp2p3 `.legacy.c`), ship whichever hits EUR objdiff 100%,
don't call a wall until both compilers are tried. Keep the `.L_`-span comparator
fix; consider committing a canonical `tools/verify.py`. Per-pick gate = EUR
objdiff 100%; leave ov002 to the decomper. Branch `scaffolder/main-wave2`.

## Headline — 15 picks across THREE compiler tiers; the lever holds

**15 shipped, all EUR objdiff 100%, all drop out of a clean re-delink, and EUR
`ninja sha1` PASSES** with the wave applied (main `complete` 1661 → 1676). Top of
the 10–15 target. The dual-compile lever from wave 1 not only held — it surfaced
a **third tier**: 4 picks needed mwcc **1.2/sp3** (`.legacy_sp3.c`), the
`sub sp,#4` prologue + Style-B `pop {pc}` cohort. So "dual"-compile is really
**tri**-compile: 2.0 → 1.2/sp2p3 → 1.2/sp3.

Of ~22 distinct candidates sampled, **15 matched (≈68%)** — batch 1 = 6/9,
batch 2 = 9/10 — confirming wave 1's "main easy tier is a live ~50%+ vein when
all compilers are tried."

## The 15 picks by compiler tier

| tier | file suffix | funcs |
|---|---|---|
| mwcc 2.0/sp1p5 | `.c` | `0207d9f4` `0201b730` `0201ca88` `0202b100` `0202bc84` `02031b74` `020340e0` |
| mwcc 1.2/sp2p3 | `.legacy.c` | `0204802c` `02093820` `0209870c` `020a5e68` |
| mwcc 1.2/sp3 | `.legacy_sp3.c` | `020882d4` `0203c85c` `0203e3d4` `0203f6a0` |

Shapes (a tour of the easy tier): doubly-linked-list unlink (`0207d9f4`),
list-push-to-global with head re-read (`02031b74`), 2-param inclusive range
(`020340e0`, the wave-1 r1-tested recipe re-proven), bit-clear via helper-mask
(`0201b730`), zero-header + `func_020945f4` clear tail-call (`0201ca88`),
call→table-index sum (`0202b100`), byte-table bit-test (`0202bc84`); the legacy
set is a delay-then-kick (`02093820`), a conditional-arg call (`0209870c`,
ternary `?5:0`), an `OS_RestoreIrq` critical-section tail (`020a5e68`), and a
predicated guard-pair clear (`0204802c`); the sp3 set is a signed-1-bit tail
guard (`020882d4`, `(x<<31)>>31`), an alloc+init (`0203c85c`), a clamp+table
forward (`0203e3d4`, `min(a2,12)`), and a `!call()` predicate (`0203f6a0`).

All 15: EUR objdiff 100% (direct, per-tier) · 15/15 clean re-delink drop-out ·
EUR `ninja sha1` OK.

## The sp3 third tier (new this wave)

The `.legacy_sp3.c` routing (CLAUDE.md: mwcc 1.2/sp3, the third tier) handles the
`sub sp, #4` prologue + Style-B `pop {regs, pc}` epilogue. Four picks failed both
2.0 and 1.2/sp2p3 but matched 1.2/sp3 — the tell is a small leaf/forwarder that
opens with `stmfd {…lr}; sub sp, #4` and closes with `ldmfd {…pc}` (pc popped
directly). The harness now tries all three tiers in order (2.0 → sp2p3 → sp3) and
reports the first 100%.

## Canonical `tools/verify.py` (committed — was harness-only, regressible)

The `.L_`-span comparator fix lived only in the throwaway `/tmp` harness and was
re-derived from scratch each session (it cost two false near-misses in wave 1
before being found). It is now **`tools/verify.py`** with a CI-tested pure core
(`parse_words` spans `.L_*` sublabels; `compare_words` treats relocs as
wildcards) plus a tri-compile CLI (`--cc all` auto-locates the gap object and
tries every tier). `tests/test_verify.py` pins the span behaviour on synthetic
objdump text (the `0201f0f4` split-gap regression) — no wine/objdump, runs in CI.
It can't silently regress again.

## Walls (resisted ALL THREE compilers → permuter/m2c)

- `02084a9c` / `02084ac4` — guarded `blx` through a field fn-ptr then a bit-op
  (`|=0x20` / `++`); 10v10 every tier (the indirect-dispatch reg/schedule class,
  cf. wave-1 `02054314`).
- `0209640c` — table bit-test returning bool; mwcc fuses the test (`tst`) and
  schedules tighter than the orig's verbose `mov #1; ands; moveq #0` (8v10).
- `02031794` — two-constant `||` equality returning 0/1 (12v11); the `||`
  materialises an extra compare none of the three front-ends drops.

Skipped per brief (not walls): loops `0208bf14` (MMIO spin-wait), `020a6a00`
(strlen), `0201d0e8` (popcount); the `02098c70` stack-temp struct copy
(uncertain semantics, deferred).

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct, per-tier) | **15/15 byte-identical** |
| clean re-delink drop-out | **15/15** out of `_dsd_gap@main_*.o` |
| EUR `ninja sha1` | **OK** (full ROM byte-identical) |
| build routing | 7 → `mwcc` · 4 → `mwcc_legacy` · 4 → `mwcc_legacy_sp3` |
| `ruff` / `tests/` / `check_match_invariants` | clean / 2339 passed / 0 errors |

`src/main/` gains 7 `.c` + 4 `.legacy.c` + 4 `.legacy_sp3.c`; `tools/verify.py`
+ `tests/test_verify.py` added; EUR `arm9/delinks.txt` +15 `complete`
(1661 → 1676). No USA / JPN change.

## Recommendation for the brain

1. **main's easy tier is far from thinning** — 369 candidates `≤0x40` remain
   after this wave, and the tri-compile yield is ~68% of clean shapes. A wave 3
   is well worth it; the cost is per-pick modelling (singletons), not search.
2. **Always tri-compile** (2.0 → sp2p3 → sp3) — `tools/verify.py --cc all` does
   it. The sp3 tier is not rare on main (4/15 here).
3. **Next, the legacy-lever re-sweep of the catalogued backlog** (the brief's
   heads-up): brief 340's "yields 0" never tried `.legacy.c`/`.legacy_sp3.c`, so
   the ov004/006/011 §WALL reg-alloc/predication misses are now a live target.
   Start it after main thins.

## Cross-references

- `docs/research/brief-349-main-stragglers-wave1.md` — the probe that found the
  comparator bug + the legacy lever (wave 1).
- `tools/verify.py` / `tests/test_verify.py` — the now-canonical comparator.
- `docs/research/style-a-epilogue.md`, `docs/research/sp3-routing-decision.md` —
  the `.legacy.c` / `.legacy_sp3.c` tier routing.
