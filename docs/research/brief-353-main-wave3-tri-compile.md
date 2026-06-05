[//]: # (markdownlint-disable MD013 MD041)

# Brief 353 — main easy-tier wave 3 (tri-compile)

**Brief:** 353 (scaffolder, co-drain). main is far from thinning (~369 easy
candidates `≤0x40` after wave 2, ~68% match when all compilers tried). Continue
the `<0x80` simple cohort; **tri-compile every candidate** with
`tools/verify.py --cc all` (2.0 → 1.2/sp2p3 → 1.2/sp3), ship whichever hits EUR
objdiff 100%; don't skip sp3 (4/15 last wave); don't call a wall until all three
are tried. Per-pick gate = EUR objdiff 100%; leave ov002 to the decomper. Target
~12–15. Branch `scaffolder/main-wave3`.

## Headline — 14 picks; sp3 is now the *largest* legacy tier

**14 shipped, all EUR objdiff 100%, all drop out of a clean re-delink, and EUR
`ninja sha1` PASSES** (main `complete` 1676 → 1690). Upper half of the 12–15
target. The tri-compile lever held (~54% of sampled clean shapes matched), and
the **sp3 tier was 5 of 14** (36%) — heavier than wave 2's 4/15, confirming the
brief's "don't skip sp3."

## The 14 picks by compiler tier

| tier | suffix | funcs |
|---|---|---|
| mwcc 2.0/sp1p5 | `.c` | `02052f88` `02033278` `02044228` `02045570` `02047804` `0205d534` `020535d4` |
| mwcc 1.2/sp2p3 | `.legacy.c` | `02053748` `0206a958` |
| mwcc 1.2/sp3 | `.legacy_sp3.c` | `0204fa24` `0204fa50` `02051e94` `02051f1c` `02053488` |

Shapes: guarded long-long forward (`02052f88`), sub-object init sequence
(`02033278`), printable-char predicate (`02044228`, unsigned compares →
`movcc/movls`), global-field equality pair (`02045570` u16==6 / `02047804`
word==5, the latter sharing the `data_0219dc78` pointer-global with wave-2's
`0204802c`), dedup probe (`0205d534`), validated bitfield insert (`02053748`),
bit-flags→weight sum (`0206a958`), an accessor-recall byte-getter clone pair
(`0204fa24` f14 / `0204fa50` f13), a `func()-519` clamp (`02051f1c`), and a 5-arg
stack-spill forward (`02053488`).

All 14: EUR objdiff 100% (direct, per-tier) · 14/14 clean re-delink drop-out ·
EUR `ninja sha1` OK.

## Recipes (added/re-proven)

- **Bind a nested-call-as-arg to a temp** to drop a redundant `mov`: `int v =
  f(a0) | 4; g(a0, v);` emits `orr r1,r0,#4` directly, where `g(a0, f(a0) | 4)`
  adds a `mov r1,r0` first. (`020535d4`, 12v11 → 100%.)
- **Unsigned locals for unsigned compares**: a char-class predicate whose orig
  uses `movcc`/`movls` needs `unsigned c = *p;` (a signed `int` gives
  `blt`/`ble`). (`02044228`.)
- **sp3 is common on main** — small leaves/forwarders opening `stmfd {…lr}; sub
  sp,#4` and closing `ldmfd {…pc}` go to `.legacy_sp3.c`. Tri-compile always.

## Walls / deferrals (resisted the relevant tiers)

- `02053600` — get-modify-set; the only diff is a **commutative `orr` operand
  order** (`orr r1,r4,r1` vs `orr r1,r1,r4`) that mwcc canonicalises regardless
  of C source order. A canonicalisation-residue `.s`-escape candidate
  (`tools/asm_escape.py --c`), not a C fix.
- `02064d88` — `mul` + high-word of a long-long return; under sp3 the frame and
  body match but `p` lands in **r1 vs orig r2** (caller-saved reg choice).
  Permuter-class.
- `02067328` — bounded array append; 10v11 across tiers (mwcc drops one guard
  insn the orig keeps).
- **varargs forwarder family** (`020a9764` / `020aac84` / `020aeda4`, identical
  `push {r0-r3}` + va_list shape) — **deferred, needs an SDK mechanism**: there
  is no `stdarg.h` in mwcc's include path and no `va_list` precedent anywhere in
  `src/main`. Flagged for the brain (an `stdarg`/`va_list` header would unlock
  this whole class). Skipped per brief: loops (`02076260`, `020ace98`,
  `0206e504`, `02073da0`, …).

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct, per-tier) | **14/14 byte-identical** |
| clean re-delink drop-out | **14/14** out of `_dsd_gap@main_*.o` |
| EUR `ninja sha1` | **OK** (full ROM byte-identical) |
| build routing | 7 → `mwcc` · 2 → `mwcc_legacy` · 5 → `mwcc_legacy_sp3` |
| `ruff` / `tests/` / `check_match_invariants` | clean / 2339 passed / 0 errors |

`src/main/` gains 7 `.c` + 2 `.legacy.c` + 5 `.legacy_sp3.c`; EUR
`arm9/delinks.txt` +14 `complete` (1676 → 1690). No USA / JPN change.

## Recommendation for the brain

1. **main's easy tier is still rich** — ~330 candidates `≤0x40` remain at ~54%
   tri-compile yield. Wave 4 is worth it; always run `--cc all`.
2. **The varargs forwarder family is blocked on a header**, not a wall — a small
   `stdarg.h`/`va_list` shim (matching mwcc's ABI) would unlock `020a9764` and
   its siblings (a recurring printf-style wrapper shape). Worth a one-off.
3. **Route the canonicalisation residue (`02053600`) to the `.s` escape hatch**
   and the reg-choice misses (`02064d88`) to the permuter.
4. Still queued: the **legacy/sp3 re-sweep of the catalogued ov004/006/011 wall
   backlog** (brief 340 never tried the legacy compilers) — after main thins.

## Cross-references

- `docs/research/brief-351-main-wave2-dual-compile.md` — wave 2 (the sp3 tier's
  debut + canonical `tools/verify.py`).
- `tools/verify.py --cc all` — the tri-compile gate used throughout.
- `docs/research/style-a-epilogue.md`, `docs/research/sp3-routing-decision.md`.
