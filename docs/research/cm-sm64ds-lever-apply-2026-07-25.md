# cm-sm64ds-lever-apply: sweeping the 5 verified levers at scale (2026-07-25)

`cm-sm64ds-lever-verify` (brief 682) tested all 14 imported sm64ds
levers against exactly one candidate each. This item sweeps the 5
**VERIFIED-ON-2.0** levers across the parked corpus, per-lever, to
learn which imports earn their keep at scale rather than once.

**Result: 5 ships, 2 confirmed-load-bearing near-misses, 1
already-shipped-elsewhere false start, 2 clean per-candidate
negatives, plus 2 real `tools/verify.py` bugs found and fixed along
the way.** 3-region `gate3.py --scope all --clean` PASS.

## Method

Candidate research (my own, cross-referencing `codegen-walls.md`,
`attempts.tsv`, the brief-568 near-miss catalog, and live `git
ls-files` existence checks — several documented candidates had
already shipped via unrelated later work since those docs were
written, confirmed and excluded before dispatch) surfaced a
per-lever candidate list. 4 parallel agents then applied one
lever-group each, sharing this checkout directly (no worktree
isolation — `tools/verify.py`'s per-function `/tmp/_verify_<func>.o`
output path and read-only gap-object lookups are safe for concurrent
use on different function names; only I touched `delinks.txt`/git
state, sequentially, after each agent reported back). A 5th
candidate slice (the fake-dependency coloring lever) ran alongside
my own direct lever-6 test and the dedicated ov004 item.

**Tooling gotcha worth recording:** none of these candidates have a
`_dsd_gap@` object — they're all in the `complete`-marked
"whole-function ship-as-.s (GLOBAL_ASM endgame)" cohort, which dsd
doesn't treat as an open gap. `tools/verify.py`'s auto-gap-location
prints `NOT-IN-GAP` for all of them; the fix is passing
`--gap build/eur/delinks/src/<module>/<func>.o` explicitly (dsd's
per-function delinked original-bytes reference, which exists for
every function regardless of match status).

## Per-lever results

### Lever 3 — hidden-arg liveness (the load-bearing one from brief 682)

7 candidates checked. **The mechanism itself genuinely applied to 2**
(`func_ov002_021f2ca8`, `func_ov002_021ebf40`, both ov002 table-call
siblings whose tail-call was modeled with 0 args instead of the real
3 — fixing arity took both from wrong-logic to single-instruction
near-misses: `34v35` and `34v34` respectively, each blocked by a
separate, independent, previously-documented residual). **3 real
ships landed, none via this lever** — `func_ov002_021efac8` turned
out to already compile and match once verify.py's own `-lang=c99` bug
(below) was accounted for; `func_020490dc` and `func_02077ab4` shipped
via unrelated mechanical fixes (a duplicate global re-fetch; a
reconfirmed-already-correct 2-arg model) after the discriminator ruled
the lever itself out. 2 candidates reconfirmed brief 674's existing
negative verdict (`func_02052ecc` unchanged; `func_02077ab4` actually
**reversed** it — see below). `func_0209703c`'s residual is the same
orthogonal frame-shape wall already documented for its sibling
`func_02097004` in lever 2's own brief-682 entry.

**Worth flagging:** `func_02077ab4` was recorded in brief 674 as "NOT
a trampoline-arity false positive" (existing draft already correctly
modeled). A fresh, minimal rewrite reached `OBJDIFF 100%` (legacy
tier) on the first try — brief 674's negative verdict for this
specific function should be treated as superseded, not authoritative.

### Lever 6 — volatile-cast read pins load order

4 candidates checked (1 by me directly, 3 by an agent). **0 ships
via this lever.** `func_0206d79c` (my own): 5 variants (natural,
volatile-on-first-read, volatile-on-second-read, sequential-subtract,
single-pointer-materialization) all plateau at the same clean `9v9`
diff (3 words) or worse — volatile consistently perturbed unrelated
register choices rather than fixing the target load order, unlike
the lever's own worked example (`func_02066ea0`, a true copy-loop
shape). `func_020947b8`: confirmed not applicable at all (zero reads
in the function — every store writes a compile-time constant; lever
6 pins *read* order, and volatile-qualifying the stores themselves
had zero effect, matching the sibling project's own "lever 7 FAILED"
finding). `func_0207103c`: lever 6 tested as a bonus — genuinely
unfused one `ldmib`, confirming the mechanism is real here too, but
cost 1 extra instruction rather than saving any (target's schedule
needs zero fusion to begin with).

**Emerging pattern (2 independent confirmations now — the earlier
`func_0206d79c` sm64ds-lever-verify pass, and this sweep):** volatile
read-pinning reliably works on true load-then-immediate-store COPY
shapes (the lever's own origin) and reliably backfires or is
inapplicable on pure-arithmetic load-then-compute shapes. Worth
narrowing the lever's documented scope to copy-loops specifically in
a future re-import.

### Lever 9 — u64 pointer-laundering affects store-batching

3 candidates checked (all needing the untested "less batching"
direction). **0 ships via this lever**, but 1 ship in the same
candidate slice via unrelated tier-routing (`func_0209bf18` — see
above; both lever 6 and lever 9 were tried on it per instructions,
neither was needed). `func_0207103c`: tried, changed *which*
registers fused but didn't reduce register pressure or defeat the
fusion enough to close the gap (5 variants). `func_020b3850`: this
candidate is pointer-free (pure by-value `u64 * u64`), so lever 9's
mechanism has nothing to act on; laundering the arguments through a
pointer just forced a real stack spill and made things worse (2
variants) — reconfirms this function's existing
`codegen-walls.md` P-4 "confirmed genuine survivor, do not
re-attempt" tag rather than contradicting it.

### Lever 12 — field-by-field copy + explicit guard

6 candidates checked. **0 ships via this lever's own mechanism** — the
2 candidates that actually exhibited the shape (`func_0207f8d8`,
`func_0207f914`) had already shipped independently 2 days before this
sweep started (a stale source-doc candidate list, confirmed via live
`git log`). **1 ship via an unrelated bitfield-typing fix**
(`func_02098cdc`, surfaced during the same search). 1 confirmed
clean near-miss with no remaining struct-copy shape
(`func_ov002_0224e8fc`, `50v50`, pure register-relabeling + one
condition-code quirk — a permuter-class residual per this project's
own "route, don't grind" convention, not iterated further). 2
candidates correctly judged out-of-shape and not force-fitted
(`func_ov002_02246a50` a jump-table state machine, `func_ov002_022519c4`
a double-loop dispatcher — neither has a single `str` anywhere in the
function).

### Lever 2 — fake-dependency virtual-call-argument coloring

3 candidates checked (2 primary, 1 lower-priority). **1 ship, but via
a different wall class than the one under test**
(`func_ov011_021d2ca8` — a dead-stack-scratch/dead-store-elimination
issue, fixed with `volatile`-qualified dummy locals, `OBJDIFF 100%`).
**The lever itself is confirmed load-bearing on the other 2** — see
the `codegen-walls.md` C-39-residue update above — but an independent
3-word scratch-register residual remains on both (`15v15` and
`18v18`), reproduced identically on both candidates, which is itself
useful confirmation this is a stable, real sub-wall rather than a
one-off near-miss.

## Ships (5, all EUR-only — USA/JPN porting not attempted this pass)

Matches this campaign's established phased EUR-first convention.

| Function | Tier | Insns | Mechanism that actually closed it |
|---|---|---:|---|
| `func_0209bf18` | `.legacy.c` | 7 | tier-routing (neither assigned lever needed) |
| `func_02098cdc` | `.legacy.c` | 7 | bitfield-typing (unrelated to lever 12) |
| `func_020490dc` | `.legacy_sp3.c` | 17 | single vs. duplicate global re-fetch (unrelated to lever 3) |
| `func_02077ab4` | `.legacy.c` | 14 | reconfirmed-correct 2-arg model (unrelated to lever 3; reverses brief 674) |
| `func_ov011_021d2ca8` | `.c` | 23 | `volatile` dummy locals defeat dead-store elimination (unrelated to lever 2) |

Every ship this pass landed via a mechanism OTHER than the lever
being tested on that candidate — consistent with brief 682's own
levers 13/14 finding. The 5 levers' own direct hit rate at scale is
genuinely low (2 confirmed-load-bearing near-misses, 0 closed
matches) — valuable to know before investing further in this
specific import batch.

## Tool bugs found and fixed (own commits on this branch)

1. **False `OBJDIFF 100%` for Thumb candidates.** `_INSN`'s regex
   required exactly 8 hex digits (ARM-only); Thumb instructions
   disassemble as 4. `parse_words` silently returned an empty list
   for both sides of any Thumb comparison, and `compare_words([],
   [])` reported a false 100% match. Fixed with a regex alternation;
   2 new regression tests using synthetic Thumb objdump text (no real
   toolchain needed, runs in CI). Caught while testing
   `func_020947b8` — the agent didn't trust the tool's `0 insns`
   verdict and manually confirmed the real mismatch by eye, which is
   what surfaced this.
2. **`-lang=c` vs. the real build's `-lang=c99`.** Confirmed via
   `ninja -t commands` on all 3 compiler tiers — the actual project
   build has always used `-lang=c99`. verify.py's hardcoded `-lang=c`
   (C89) rejects mixed declarations-and-statements that C99 permits.
   This nearly caused a real incident: `src/overlay002/
   func_ov002_021efac8.c`, already shipped and byte-exact, failed to
   compile under the wrong flag with a completely convincing "C89
   violation" error, and a sweep agent proposed "fixing" it (hoisting
   a declaration) before I re-verified against the real build flags
   and found the original, unmodified file compiles and matches fine.
   No regression test added (the compile/subprocess path isn't
   exercised in CI per `tests/test_verify.py`'s own docstring); fix
   verified empirically against 3 real functions across all 3 tiers.

## Mandatory verification: .c-added == delinks.txt-flipped == .s-deleted

**5 == 5 == 5**, verified by diff:

```
.c files added (src/):         5
.s files deleted:              5
delinks.txt .s: -> .c: flips:  5
```

(`func_0209bf18.legacy.c`, `func_02098cdc.legacy.c`,
`func_020490dc.legacy_sp3.c`, `func_02077ab4.legacy.c`,
`func_ov011_021d2ca8.c`.)

## Gate

`python tools/gate3.py --scope all --clean` — 3-region PASS (EUR, USA,
JPN), forced-clean rebuild (required this pass: the branch deletes and
moves source files, not just additions).
