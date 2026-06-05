[//]: # (markdownlint-disable MD013 MD041)

# Brief 355 — main easy-tier wave 4 (tri-compile)

**Brief:** 355 (scaffolder, co-drain). main is still rich (~330 easy candidates
`≤0x40` at ~54% tri-compile yield). Continue the `<0x80` simple cohort;
**tri-compile every candidate** (`tools/verify.py --cc all`); never skip sp3 (it
was the largest legacy tier last wave). **Route obvious endgame residue out of
the way** instead of grinding: pure canonicalisation miss (like `02053600`) →
the `asm_escape.py` `.s` hatch; reg-choice miss (like `02064d88`) → the permuter
backlog. Per-pick gate = EUR objdiff 100%. Target ~12–15. Branch
`scaffolder/main-wave4`.

## Headline — 13 C picks + 1 routed `.s`

**14 shipped** (13 tri-compiled C + 1 whole-function `.s`), all EUR objdiff 100%,
all drop out of a clean re-delink, and EUR `ninja sha1` PASSES (main `complete`
1690 → 1704). The tri-compile lever held; this wave **legacy/sp2p3 was the
dominant tier (8 of 13 C)** — main's Style-A / predicated-guard cohort runs deep.

## The 14 picks

| tier | suffix | funcs |
|---|---|---|
| mwcc 2.0/sp1p5 | `.c` | `020680cc` `0207d18c` |
| mwcc 1.2/sp2p3 | `.legacy.c` | `0206c188` `02077a88` `0207e638` `0208c884` `0208e4ec` `0208e518` `020a0604` `02091cf8` |
| mwcc 1.2/sp3 | `.legacy_sp3.c` | `0205428c` `0205ffd4` `0207fea8` |
| **whole-function** | **`.s`** | **`02053600`** (canonicalisation residue, routed) |

Shapes: teardown sequence (`020680cc`), node-seed (`0207d18c`), conditional-field
+ call-sum (`0206c188`), global-chase guarded store (`02077a88`, shares
`data_021a63d0` w/ wave-1 `02070fe8`), bounds-checked stride lookup (`0207e638`),
sign-magnitude encode into a u16 (`0208c884`), an **MMIO double-read clone pair**
(`0208e4ec` bit13 / `0208e518` f8-field, volatile `*(unsigned*)0x04000600`),
5-arg stack forward (`020a0604`), IRQ-disable + call (`02091cf8`), arg-shuffle
2-call (`0205428c`), get-field + call + store (`0205ffd4`), alloc + 3-field init
(`0207fea8`).

All 14: EUR objdiff 100% (direct, per-tier) · 14/14 clean re-delink drop-out ·
EUR `ninja sha1` OK.

## Routed residue (the brief's "don't grind" instruction, executed)

- **`02053600` → whole-function `.s` (shipped).** A confirmed
  commutative-`orr`-order canonicalisation miss (mwcc fixes `orr r1,r1,r4` →
  `orr r1,r4,r1` regardless of C source order). `asm_escape.py --whole-function`
  emitted a byte-exact `.s` (11 words verified) — now `src/main/func_02053600.s`.
- **`02068d24` → permuter backlog.** CSE-vs-recompute: mwcc keeps `o+0x4c` in a
  reg across the two calls (10 insns), the orig recomputes the `add` each time
  (11). No C lever forces the de-CSE.
- **`0207da1c` → permuter backlog.** A clean r2/r3 swap (the `a1+16` survivor vs
  the bitfield-extract temp land in opposite registers); statement reorder
  doesn't flip it.
- Bitfield-pack `020821e4` and the `ldm/stm` de-interleave `0208b300` → `.s` /
  permuter (register-list codegen, no clean C form).

## Tool finding — `asm_escape --c` is 2.0-only (extend to tri-compile)

`asm_escape.py --c` compiles the byte-near `.c` with the **default 2.0**
compiler, then demands a pure single-instruction swap. `02053600` is an **sp3**
function — under 2.0 its `.c` is 9 insns vs the orig's 11 (a count mismatch from
the frame difference), so `--c` **REFUSED** it even though it's a clean
single-swap under sp3. Worked around with `--whole-function` (heavier: ships the
whole function as asm). **Recommendation:** teach `asm_escape --c` to tri-compile
(2.0 → sp2p3 → sp3) and pick the tier whose count matches the orig, so sp3/sp2p3
canonicalisation misses can ship as the *minimal* 1-line `.s` instead of a
whole-function dump. (Filed as a follow-up; not done here.)

## Walls / deferrals

Loops (`02079e20`, `0207cf78`, `0208be70`, `020919ac`, `0209286c`) skipped per
brief. The **varargs forwarder family** (`020a9764` + siblings) stays deferred —
still no `stdarg.h`/`va_list` shim (a one-off SDK task for the brain).

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct, per-tier) | **14/14 byte-identical** |
| clean re-delink drop-out | **14/14** out of `_dsd_gap@main_*.o` |
| EUR `ninja sha1` | **OK** (full ROM byte-identical) |
| build routing | 2 → `mwcc` · 8 → `mwcc_legacy` · 3 → `mwcc_legacy_sp3` · 1 → `mwasm` |
| `ruff` / `tests/` / `check_match_invariants` | clean / 2339 passed / 0 errors |

`src/main/` gains 2 `.c` + 8 `.legacy.c` + 3 `.legacy_sp3.c` + 1 `.s`; EUR
`arm9/delinks.txt` +14 `complete` (1690 → 1704). No USA / JPN change.

## Recommendation for the brain

1. **main still isn't thinning** — ~305 candidates `≤0x40` remain at a steady
   ~50–55% tri-compile yield; wave 5 is worth it (always `--cc all`).
2. **Extend `asm_escape --c` to tri-compile** so sp3/sp2p3 canonicalisation
   misses ship as minimal 1-line `.s` (this wave needed `--whole-function`).
3. Standing: the **varargs `va_list` shim** and the **legacy/sp3 re-sweep of the
   catalogued ov004/006/011 wall backlog** remain queued for after main thins.

## Cross-references

- `docs/research/brief-353-main-wave3-tri-compile.md` — wave 3.
- `tools/asm_escape.py` — the `.s` hatch (`--whole-function` used here; `--c`
  limitation noted above).
- `tools/verify.py --cc all` — the tri-compile gate.
