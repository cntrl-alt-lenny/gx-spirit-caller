[//]: # (markdownlint-disable MD013 MD041)

# Brief 403 — diagnose-and-route wave 1: the permuter's lane is real but narrow; the `.s` lane carries the volume

**Brief:** 403 (decomper). Settle 383-vs-401: re-diagnose the overlay reg-alloc
residue FRESH, route genuinely single-transform diffs to the vendored permuter,
everything else to `asm_escape --whole-function` `.s`. Deliverable beyond ships:
the permuter hit-rate on freshly-diagnosed single-transform targets + the
C-via-lever / C-via-permuter / `.s` / parked / deferred split.

## Headline

**16 ships (2 matched `.c` + 14 whole-function `.s`), 3-region `ninja sha1` OK —
and the answer to the brief's question: the permuter went 0-for-2 on this
wave's freshly-diagnosed targets; the hand-LEVER kit (not the permuter) cracked
the only genuinely expression-driven diffs.** The fresh-diagnosis protocol
re-classified the seed list: what the catalog called "const-materialisation
near-misses" splits into (a) an expression-driven subset that one targeted
recompile ships (commutative-operand-order), and (b) allocator
register-NUMBERING / scheduling-cascade residue that neither hand-C nor the
permuter touches (re-confirming brief 358's plateau on fresh, minimal
targets). The endgame for the overlay residue is `.s` + levers, with the
permuter as a last-resort probe — not a lane.

## The split (à la brief 358)

| lane | count | targets |
|---|---|---|
| C via hand-lever (1 recompile each) | 2 | ov017 `021b2280` + ov008 `021aa4a0` (instruction-identical popcount pair — commutative-operand-order) |
| C via permuter | **0** | — (both probes plateaued; see hit-rate) |
| `.s` via asm_escape (byte-identical + link-proven) | 14 | ov017 `021b33dc`/`021b768c`; ov000 `021ac920`; ov008 `021aba3c`/`021abb08`/`021abba0`/`021ac430`/`021ac4d0`/`021af4c4`/`021acfa0`; ov016 `021b22d8`/`021b5390`/`021b6f08`/`021b32f0` |
| PARKED on `kind:data(any)` (no `.s` route) | 5 | ov017 `021b66a8`; ov008 `021aafa4`/`021b2268`; ov005 `021acfb0`; ov016 `021b3174` |
| DEFERRED (permuter-resistant + no `.s` route) | 2 | ov017 `021b2c8c` + ov016 `021b2824` (instruction-identical dispatcher pair — pure 3-reg rotation) |
| stale seeds (already shipped on origin/main) | 2 | ov016 `021b287c`/`021b28f4` (PR #895) |

## Permuter hit-rate on freshly-verified single-transform targets: 0/2

Both probes ran the full `tools/permute.py <fn> --run --max-seconds 900`
(vendored permuter, overlay resolution worked out of the box — the brain's
tools exception was NOT needed; the only manual step is the documented
flat-path bridge copy `build/eur/disasm/src/overlayNNN/<fn>.s` →
`build/eur/disasm/ovNNN_<addr>.s`).

| target | suspected class (fresh) | base | best | iters | outcome |
|---|---|---|---|---|---|
| ov017 `021b2c8c` dispatcher | const-mat ("zero-materialised-twice") | 450 | 250 | ~8k | **plateau.** The "const-mat" label was a symptom; after the dispatch-order-inversion + `volatile` levers the residue is a pure 3-reg rotation (reg-NUMBERING). Permuter mutations explored mixed base-derivation but cannot steer the allocator. Deferred (kind:data ref blocks `.s`). |
| ov008 `021acfa0` byte-combine | peephole-split (`(hw<<24)>>24` → `and #0xff`) | 1890 | 765 | ~7k | **plateau.** The permuter DID find the dodge direction — variable shift amount (`b0 = 24; b0 = v << b0;`) survives copy-propagation where a literal dead-var doesn't — but the residual load-hoist/store-sink + r4–r6 spill cascade didn't close in 900s. Shipped `.s` instead (kind:data-clean). |

**Read against brief 363 (3/8 on main):** the overlay residue's
"single-transform" members carry allocator/scheduler cascades that main's
pilot targets didn't. Combined permuter record on fresh targets: 3/10
across briefs 363+403, all 3 on main. **For the overlay endgame, the
permuter is a last-resort probe, not a lane** — route reg-alloc/scheduling
residue straight to `.s`, spend the saved wall-clock on lever-testing
(this wave's 2 lever cracks each took ONE recompile after reading the
fresh diff).

## Key findings

1. **The commutative-operand-order lever ships without the permuter.** The
   popcount pair's "mask low-vs-high derive" miss (brief 401) is operand
   ORDER: mwcc pool-loads the constant of the FIRST-evaluated `+` operand and
   derives the partner mask via the barrel shifter in operand-2. Writing the
   high-mask term first matched in ONE recompile. The brief-401 "unsteerable
   across 5 mask forms" verdict was wrong because all 5 forms kept the
   low-mask term first.

2. **"Zero-materialised-twice" was a symptom, not a class.** Fresh diagnosis
   of the dispatcher pair: dispatch-order inversion (`if (fn != 0) {…}
   return 1;`) fixes the predicate-vs-branch layer; a `volatile` state
   pointer pins the store order; what remains is a PURE 3-register rotation
   ({base,zero,idx} = orig {r0,r1,r2} vs mwcc {r2,r0,r1}) — allocator
   register-numbering. The permuter ran 900s/~8k iterations and plateaued at
   score 250 (never matched); explicit `z`/`t` temps copy-propagate away.
   This is brief 358's reg-alloc plateau, reproduced on a fresh,
   minimal, single-block target. **Reg-NUMBERING ≠ single-transform; route
   these straight to `.s` (or defer when `kind:data` blocks that).**

3. **The `kind:data(any)` link gate bites the diagnose-and-route lane at the
   same rate the scaffolder sees.** 5 of the 19 `.s`-lane candidates (26 %)
   have at least one `kind:data` ref and cannot ship as `.s` (delink
   `Undefined`) — matching the scaffolder's w13-16 drop-rate climb
   (18→28 %). The dispatcher pair is ALSO permuter-resistant — a class with
   NO current route: C-walled + `.s`-blocked. A data-section carve harness
   is the unlock and is becoming the binding constraint on the endgame.

4. **Recursive self-`bl`s soft-fail asm_escape's pre-link word-compare**
   (`0xebfffffe` reloc placeholder vs the delinked orig's resolved
   displacement) — benign; the link gate proves the bytes (ov016 `021b22d8`
   quicksort). Pattern applies to any self-calling `.s` escape.

5. **Census hygiene held:** 2 of the brief's 12 seed addresses were already
   shipped (`021b287c`/`021b28f4`, PR #895) — the per-wave "confirm uncarved
   against delinks `start:` addresses" check (brief 362/401) keeps paying.

## Verification

| Gate | Status |
|---|:---:|
| asm_escape byte-identity per `.s` pick | OK (14/14; quicksort via link gate) |
| dcheck instruction-identity per `.c` pick | OK (popcount pair; trailing-pool artifact only) |
| per-overlay bin cmp (ov000/ov008/ov016/ov017) | IDENTICAL |
| EUR `ninja sha1` | **OK** |
| USA `ninja sha1` | **OK** |
| JPN `ninja sha1` | **OK** |
| carve-size audit (delinks end == symbols.txt size) | OK (16/16; 0 interval overlaps) |
| delinks sorted (sort_delinks.py) | OK (ov000/ov008/ov016/ov017) |
| test suite | 2344 passed |

## Cross-references

- `docs/research/brief-401-fresh-overlay-scout.md` — the seed diagnoses this
  wave re-verified (2 stale, 1 re-classified).
- `docs/research/brief-358-ov002-routing-pass.md` — the routing-report shape +
  the original reg-alloc-plateau measurement.
- `docs/research/brief-363-permuter-pilot.md` — the single-transform crack
  classes (commutative-operand, peephole-split).
- Per-overlay `*_core.h` §VERIFIED brief-403 blocks — recipes + parked lists.
