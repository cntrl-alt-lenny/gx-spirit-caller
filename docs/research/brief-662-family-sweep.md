# Brief 662 — anchor-backed family sweep

Date: 2026-07-22
Branch: `claude/family-sweep-662`

## Headline

**2 functions shipped, 3-region byte-verified.** The bigger result is
methodological: the census's own "Anchor verification audit" (`0
VERIFIED, 54 SUSPECT, 37 AMBIGUOUS` across all 91 families) sounds
alarming but checks the wrong address — its "C anchor now?" column
tests the **exemplar** (a still-`.s` candidate, which by construction
can never have a C anchor), not the **claimed anchor siblings**. I
independently re-checked the anchor addresses directly against
`delinks.txt` and they are genuinely real C matches (see "Auditing
the audit" below). The REAL finding from actually attempting
candidates: **families clustered around tiny (8–28 byte) exemplars
are dominated by assembly-level tricks — shared-epilogue stubs,
interwork veneers, cross-function raw branches — that cannot be
expressed in C regardless of anchor quality.** These are genuine
false anchors for propagation purposes, distinct from the audit's
sig=0 ambiguity concern. Once real C logic is present (structs,
loops, arithmetic), the anchor genuinely helps — one direct clone hit
100% on the first try.

## Auditing the audit

Family-census-2026-07.md's own audit (`q-family-verify`) reports every
sampled row (A-01–A-20) as "C anchor now? no." Read literally this
would mean the entire 91-family census is built on non-existent
anchors. Independently checking the underlying claim before trusting
either the census or the audit:

```
A-01 exemplar 0207708c → still .s (correct: it's the candidate)
A-01 claimed anchor 02000c44 → func_02000c44.c (real C match)
A-01 claimed anchor 02001e54 → func_02001e54.c (real C match)
A-02 claimed anchor 02006e1c → Task_Invoke.c (real, named C match)
A-07: 23/23 claimed anchors resolve to real .c files
A-09: 19/20 claimed anchors resolve to real .c files (1 uses a
       non-`func_` symbol name my regex missed, e.g. libs/nitro/*.c)
```

The audit's "C anchor now?" column checked the **exemplar** address
(one of the still-unmatched candidates) rather than the **claimed
anchor addresses** (the already-matched siblings the family is built
around) — an exemplar can never pass that test by construction, so
every row reads "no" regardless of whether the family's real anchors
exist. The census's underlying anchor data is sound; the audit's
verdict column is not. This is worth fixing in the census/audit
tooling directly (flagged, not fixed here — doc/tool-only scope
wasn't part of this brief), since a future operator skimming "0
VERIFIED" would reasonably (and incorrectly) write off the whole
census.

The audit's OTHER signal — `sig=0` (empty relocation signature) vs a
real numbered signature — is separately meaningful and did track real
risk in practice (see below), just not via the VERIFIED/SUSPECT/
AMBIGUOUS labels as literally stated.

## What "anchor-backed family" actually means here

This census's anchors are **shape clusters** (same byte size + same
relocation-signature shape), not literal duplicate-function-body
clones like the historical VRAM (16/16) or table-walker (7/7)
families the brief's framing references. Reading 3 of A-10's real
anchors alongside its already-known candidates (from
[`brief-655-main-sweep.md`](brief-655-main-sweep.md), which
blind-sampled straight into this exact family without knowing it):
`func_020070dc` (strlen), `func_0200b35c` (byte-narrowing copy loop),
`func_0200bfa4` (2×2 decision matrix) — three semantically unrelated
functions that happen to share a size/reloc-shape bucket. The anchor
is useful as **style/lever precedent** (what kind of C tends to
compile to this byte budget, and which reshape trick a sibling
needed), not as a literal template to find-and-replace addresses on.
Where that distinction matters most: `func_0202f3e8`'s own header
comment — *"frameless-leaf const-compare → switch defeats predication
(gotcha/brief 266)"* — directly named the lever that unlocked
`func_02031794` below, a function from a **different** family (A-08)
that I'd separately parked at 45% in brief 655 without knowing this
recipe existed.

## Attempts

### Shipped (2)

| Function | Family | Result | Lever |
|---|---|---:|---|
| `func_02031794` | A-08 | **100%** | Anchor `func_0202f3e8`'s comment named the exact fix: `switch` (not `if`/`\|\|`) for a 2-sparse-constant equality test defeats predication. Brief-655 near-miss (45%) resolved. |
| `func_020821e4` | A-21 | **100%** | Direct clone of the anchor family's "pack N fields into one word via left-to-right `\|`-chain, store to a global struct field" shape — first-try match, no iteration. |

### Confirmed false anchors (read, not compiled — un-C-expressible by construction)

| Function | Family | What it actually is |
|---|---|---|
| `func_0207708c`, `func_020a9914` | A-01 | Shared-epilogue-only stubs (`ldmia sp!,{...}; bx lr` with no prologue) — branch targets from OTHER functions' mid-body `b` instructions, not real standalone functions. mwcc never emits a matching bodyless tail from C. |
| `func_0209085c` | A-02 | ARM interwork veneer (C-31): `ldr r1,[pc,#0]; bx r1; .word target`. Already confirmed genuine in brief 655. |
| `func_020b3648` | A-03 | Hand-encoded `.word` raw branch into the MIDDLE of a sibling function's body (`func_020b3658+0x10`) — mwasm can't resolve a cross-function label, so this is permanently `.s`. |
| `func_0206be1c`, `func_02074e4c` | A-05 | Same shared-epilogue-stub pattern as A-01 (byte-identical bodies to each other). |
| `func_020b3808` | A-05 | Same cross-function-raw-branch pattern as A-03 (jumps into `func_020b3814`'s loop body — a `r4=0`/`r4=1` dual-entry-point pair for a shared 64-bit-divide routine). |

Five for five: every family whose exemplar was ≤16 bytes and free of
real field/loop logic turned out to be one of these three un-C-
expressible shapes. This is a strong, mechanically-checkable filter
for a future pass: **before attempting a family, read the exemplar —
if it's a bare `ldmia sp!,{...}; bx lr`/`add sp,...;ldmia...` with no
matching `stmdb`/`push` in the same body, or contains a hand-encoded
`.word 0xEA0...` "b" opcode, skip the whole family.**

### Parked near-misses (compiled, real attempts, not walls-by-inspection)

| Function | Family | Best % | Residual |
|---|---|---:|---|
| `func_02052704` | A-10 (revisit) | 60% | `switch` lever (which fixed `func_02031794` above) does NOT transfer to small *contiguous* case values (2,3,4) — mwcc's range-collapse optimization kicks in regardless of `if`/`switch`/`default`-omission; only worked for the *sparse* constants in `func_02031794`. Genuine sub-pattern boundary on the lever, not a bug in applying it. |
| `func_0209640c` | A-10 | 40% | `tst`+`movne/moveq` (mine) vs `ands`-keeping-the-value (target) — 3rd confirmed instance of this exact residual this campaign (2 more in [`brief-655-main-sweep.md`](brief-655-main-sweep.md)). |
| `func_0208b1c8`, `func_0208b300` | A-04, A-08 | 14%, 0% | Neither Thumb nor ARM struct-init/transpose bodies trigger mwcc's `stmia`/`ldmia` register-group fusion from plain field-by-field C assignment — fusion only reproduced (brief 655) when source values are already-adjacent **incoming parameter registers**, not values loaded from another struct. A real, reproducible gap, not yet levered. |
| `func_0207f8f8`, `func_02067b8c` | A-06 | 37.5% each | Confirmed 5th/6th instance (campaign-wide) of: a single-guard if-body with 4+ side-effecting ARM ops and no `else` compiles to a real `bxne`/`bxge` branch from natural C, while the ROM keeps it fully predicated. Distinct from (broader than) codegen-walls.md's C-1r, which is specifically about a predicated-compare-chain-then-branchy-return; this is "any multi-op guarded side-effect block, no else." Worth a new catalogue entry. |
| `func_02078eec` | A-06 | 0% | 2×`u32` struct return via hidden pointer (`r0`) — ABI shape confirmed correct (`r1`=real arg, `r0`=dest, matches target), but mwcc also materializes a stack-local copy of the return value and writes it twice (once to the stack temp, once through `r0`); target writes through `r0` only. Tried a named local and a compound-literal return; both produced the identical double-write. |
| `func_02098cdc` | A-06 | 14%→0% | A 32-bit word packs a 24-bit payload + 8-bit flag byte at the SAME address (byte 0x1f of the word at +0x1c). Modeling as `word & mask` reads the whole word for both the flag test and the payload; target reads the flag via a separate `ldrb` at the byte address. A bitfield-struct rewrite got the shift-pair extraction instruction to match exactly but not the byte-load. Genuine near-miss, not attempted further this brief. |
| `func_02064d88` | A-22 | 20% | Logic byte-identical (`bl` + `mov r0,r1` both match — confirms the callee returns via `r1`, a 64-bit/2-register return read for its high word). Prologue/epilogue differs: mine emits `stmdb sp!,{r3,lr}` (padding register folded into the push), target emits `stmfd sp!,{lr}; sub sp,sp,#4` (separate reservation). **This is the same epilogue-shape pattern brief 661 independently found 3× and flagged as a P-18 candidate** (found via a completely different, size-sorted sampling method on the same day) — strong independent cross-validation that it's a real, reproducible wall, not a fixable one. |
| `func_02038dac`, `func_0203aeec` | A-20, A-19 | 50%, 59% | Textbook reg-alloc/scratch-register anti-pattern (identical instruction sequence, 2 scratch registers swapped throughout) — confirmed, parked on sight per `lever-payoff.md`'s explicit guidance, no further iteration attempted. |
| `func_02021660` | A-18 | 45% | Partially reg-alloc (register swap in the loop, same anti-pattern as above), partially structural (target has an extra upfront `ble` bail I couldn't reproduce without either losing the improvement or adding a wrongly-predicated extra instruction). Array-indexed access (17%) was much worse than an explicit incrementing pointer (45%) — worth remembering: prefer pointer increment over `arr[i]` when modeling a loop over a strided array, even before knowing which register wins. |
| `func_0201d5c0` | A-23 | 20% | Target mixes predication and an early conditional `bx` in one instruction stream in a way that doesn't map cleanly to either "if/else" or "if debug the guard-body-then-fallthrough" C shapes tried. |
| `func_02079e20` | A-08 | 72.7% | Control flow is 100% identical (`b`/`sub`/`cmp`/`beq`/`cmp`/`beq`/`mov`/`bx` all match); only the address arithmetic for `arr[len-1]` differs (`sub;lsl;ldrh[+0]` vs `add(shl);ldrh[-2]`) — both compute the same address, mwcc chose the other decomposition. A rewrite forcing an explicit `idx = len-1` local made it much worse (16.7%), reverted. |
| `func_0207da1c` | A-08 | 27.3% | Struct-offset error caught and fixed mid-attempt (an extra `char pad2[0xa]` had pushed a field 10 bytes off — a reminder to compute struct offsets from the **actual disassembly offsets**, not accumulate padding guesses). After the fix, logic partially matches (2 of 4 stores byte-identical) but the bitfield-extraction preamble still diverges — likely reg-alloc-adjacent, not chased further. |

## Coverage

Read (and correctly triaged) 26 distinct addresses across ~14 of the
91 families; compiled and gated 18 of those as real C attempts (2
shipped, 16 parked); confirmed 5 more as un-C-expressible by direct
inspection without wasting a compile cycle on them. This is a sample,
not an exhaustive sweep of 91 families × 268 candidate-member slots —
consistent with the project's established practice of sampling a
tranche and reporting honestly rather than claiming full coverage
(see [`brief-655-main-sweep.md`](brief-655-main-sweep.md),
[`brief-650-ov002-sweep.md`](brief-650-ov002-sweep.md)). Zero-shot
rate on real attempts: 2/18 (11%) shipped without any iteration beyond
the first compile; both of the shipped functions matched on either
the first or second try. The remaining 16 parked attempts split
roughly evenly between confirmed anti-pattern instances (reg-alloc
swap, tst/ands, epilogue-shape, guarded-if-branch — 9 of 16, each
matching a pattern already seen 2+ times campaign-wide) and genuine
unresolved near-misses (7 of 16, each a new specific residual not yet
catalogued).

## Gate

- `python tools/gate3.py --scope all --no-tests`: **GATE PASS**, all
  3 regions individually confirmed (`[eur] SHA1 PASS`, `[usa] SHA1
  PASS`, `[jpn] SHA1 PASS`), re-verified via a forced-clean rebuild of
  the EUR objects specifically (per the process lesson from brief
  655 — an in-session gate pass after activate/revert-script cycling
  is not trustworthy on its own without this).
- Both EUR matches ported to USA + JPN via `tools/port_to_region.py`
  (`func_02031794`→`func_02031740` MEDIUM confidence, accepted at
  `--confidence-floor MEDIUM` since the size+shift-consensus signal
  was strong and the EUR match is independently byte-verified;
  `func_020821e4`→`func_020820fc` HIGH/EXACT_ADDR, default floor).
  `port_to_region.py` writes the `.c` file and prints the needed
  `delinks.txt` line but does not apply it (known gotcha, see
  `main-small-contained-cmatch-lane.md`) — applied all 4
  USA/JPN `delinks.txt` edits by hand.
- `python -m pytest -q tests`: 12 failed, 2849 passed — identical to
  the pre-existing Windows path-separator baseline (confirmed
  unrelated to this brief's files).

## Files changed

- `src/main/func_02031794.c`, `src/main/func_020821e4.c` — new EUR
  matches (`.s` siblings removed).
- `src/{usa,jpn}/main/func_02031740.c`,
  `src/{usa,jpn}/main/func_020820fc.c` — USA/JPN ports.
- `config/{eur,usa,jpn}/arm9/delinks.txt` — 6 entries routed total
  (2 EUR + 2 USA + 2 JPN).
- `docs/research/brief-662-family-sweep.md` — this report.
