[//]: # (markdownlint-disable MD013 MD041)

# Brief 361 — main easy-tier wave 7 (tri-compile)

**Brief:** 361 (scaffolder, co-drain). main keeps producing (~245 `≤0x40`) but
per-pick cost is rising (~36% in wave 6). Continue the `<0x80` simple cohort;
**tri-compile** (`tools/verify.py --cc all`); the recurring families carry the
clean picks. Target ~10-14. **Yield-watch: if this wave drops below ~10, flag it
and we pivot to the permuter backlog** instead of grinding deeper. Branch
`scaffolder/main-wave7`.

## Headline — 10 picks, at the floor; the lane is at the pivot threshold

**10 shipped**, all EUR objdiff 100%, all drop out of a clean re-delink, and EUR
`ninja sha1` PASSES (main `complete` 1733 → 1743). That is the **bottom of the
10-14 target**, and the trend is now unmistakable: **16 → 13 → 10** across waves
5-6-7. An 11th pick (`func_020489c4`) was found and verified at objdiff 100% but
**dropped at the link gate** (see gotcha) — so the *shippable* yield is 10, and
it took 3 batches (~14 modelled, ~14 skipped-on-sight as loops/packs/jump-tables)
to get there. **Recommendation: flag the pivot — wave 8 should be the permuter
backlog, not main wave 8.** (Details at the bottom.)

## The 10 picks by compiler tier

| tier | suffix | funcs |
|---|---|---|
| mwcc 2.0/sp1p5 | `.c` | `0206844c` `0204f998` `020672f4` `02067608` `02070f44` `0206afb8` |
| mwcc 1.2/sp2p3 | `.legacy.c` | `0206bf60` `0206bfdc` `020746ec` `0206c2c0` |

No sp3 picks this wave. Shapes: tail-list append (`0206844c`), accessor re-call
(`0204f998`), format-then-call (`020672f4`), default-guard-call chain
(`02067608`), global-chase clear (`02070f44`, shares `data_021a63d0` with wave-1
`02070fe8`), call + dual pointer-advance (`0206afb8`), guard-call (`0206bf60`),
out-param query (`0206bfdc`), call + global-chase predicated store (`020746ec`),
two-call sum (`0206c2c0`).

All 10: EUR objdiff 100% (direct, per-tier) · 10/10 clean re-delink drop-out ·
EUR `ninja sha1` OK.

## Gotcha — objdiff-100% does NOT guarantee link success for data refs

`func_020489c4` referenced `data_020ff924` (a `kind:data(any)` symbol in
`symbols.txt`). It passed the per-pick objdiff gate — because the comparator
treats reloc'd words as **wildcards**, a data reloc looks fine regardless of
whether the target is linkable. But `mwldarm` failed with `Undefined :
"data_020ff924"`: dsd emits no linkable definition for that data symbol (unlike
the `kind:bss` globals, which link). **`ninja sha1` is the real gate for any pick
that references a `data` (non-bss) symbol** — the objdiff 100% can be a false
pass. Dropped the pick; the other 10 reference bss/MMIO/literal targets and link
clean.

## Walls routed out

Frame-allocation: `020536d0` (`push {r3,...}` vs orig `sub sp,#4`), `0205d688`
(callee-saved + local-size frame layout). Reg-choice: `0207da48` (13v13 struct
shuffle). Plus loops / bitfield-packs / `addls pc` jump-tables skipped on sight.
All → permuter.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct, per-tier) | **10/10 byte-identical** |
| clean re-delink drop-out | **10/10** out of `_dsd_gap@main_*.o` |
| EUR `ninja sha1` | **OK** (full ROM byte-identical) |
| build routing | 6 → `mwcc` · 4 → `mwcc_legacy` |
| `ruff` (CI scope) / `tests/` / `check_match_invariants` | clean / 2339 passed / 0 errors |

`src/main/` gains 6 `.c` + 4 `.legacy.c`; EUR `arm9/delinks.txt` +10 `complete`
(1733 → 1743). No USA / JPN change.

## Recommendation — pivot to the permuter backlog (the brief's yield-watch)

The direct-mwcc main lane has now declined three waves running (16 → 13 → 10) and
the per-pick cost has risen sharply: the 0x34 tier is dominated by frame/reg/
scheduling/peephole near-misses, and even the clean picks now need 3 batches and
heavy on-sight triage. Per the brief's "below ~10 → pivot" rule, **wave 7 is the
inflection point — recommend wave 8 be the permuter backlog**, which is now
vendored (`tools/_vendor/decomp-permuter`) and holds a substantial, growing,
well-characterised set the direct path keeps routing there:

- `||`-equality base+offset family (`02031794`, `0202ef08`, `0202f59c`, `02031764`).
- commutative-operand canonicalisations (`02053600` [shipped .s], `020195b8`, `020536d0`).
- the peephole-split stride-24 members (`02018dcc`, `0201b690`).
- the reg-choice / frame-allocation / scheduling pile (this wave alone:
  `0205d688`, `0207da48`, `0205d688`, plus the accumulated waves-1..6 residue).

main still has ~235 `≤0x40` left for a fallback wave, but the permuter is the
higher-EV lane now. Standing: the `va_list` shim; `asm_escape --c` tri-compile.

## Cross-references

- `docs/research/brief-359-main-wave6-tri-compile.md` — wave 6 (the peephole
  split + permuter-vendored note).
- `tools/verify.py --cc all` — the tri-compile gate (but `ninja sha1` is the
  link gate for data-symbol refs, per the gotcha above).
