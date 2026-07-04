[//]: # (markdownlint-disable MD013)

# Brief 527 - MAIN MED-leaf c-match wave

Branch: `claude/cmatch-main-527`

Scope: MAIN-only c-match lane from `docs/research/campaign-analytics/safe-queue-v3.md` §4, MED-tier tiny-leaf rows 13-38 (the safe pool of pre-prepared campaign dossiers under `docs/research/dossiers/`), explicitly avoiding the main-HIGH avalanche zone and Codex b521's parked `02085460`.

## Outcome

- Candidates attempted: **23** (all pre-prepared dossiers in the assigned pool)
- EUR matches accepted: **6**
- USA/JPN ports: pending post-EUR-gate (see below)
- Reshape-parked: **15**
- Compiler-tier-only matches (zero C reshape): **2** (`02076cc0`, `0208b108` — Style-A/`mwcc 1.2/sp2p3` epilogue, routed via `.legacy.c`)

## Matched candidates

| Addr | Recipe | Key fix(es) |
|---|---|---|
| `02005d54` | if/else-if base-table select | Rewrote as explicit `switch` — orig's linear `cmp;beq;cmp;beq;b` needs genuine branches, not predication; switch triggered the right lowering immediately. |
| `0200aa08` | 3-bit bitfield RMW, mod-6 | Declared the MMIO-adjacent struct with a leading `pad0` field (typed struct, not array+offset-cast) so the `+0x4` stayed a separate load instead of folding into the pool relocation addend; added an explicit `unsigned short` intermediate to force the 16-bit zero-extend orig keeps. |
| `02026f78` | 3-iter struct-array fill + iter-0 side writes | Marching pointer (`entry++`) for the struct array, index-addressing for the parallel plain array — orig uses both strategies for the two arrays simultaneously. Also needed: swapped store order for the two conditional globals (fixes pool-load order), hoisted `sum +=` before the if-block, and swapped `i`/`sum` declaration order (register-role gotcha 11). |
| `02033a80` | signed-byte strided linear search | Converted the two `return -1;` exit paths to `goto fail;` sharing one tail block — orig reuses a single `.L_174` from two branch sites, my initial two-site inline predication diverged. Also hoisted the pointer increment above the loop-continue check (fixes predicated-vs-unconditional add) and swapped declaration order for the register-role match. |
| `02076cc0` | big-endian 2/3-byte key scan | **Zero C changes** — the draft matched EUR instruction-for-instruction except the epilogue (`ldmeqia+bxeq` / `ldmia+bx lr`, 2-step). Renaming to `.legacy.c` (routes through `mwcc 1.2/sp2p3`) reproduced the exact Style-A epilogue with no other edits. |
| `0208b108` | 4-lane Q20.12 fixed-point multiply | **Zero C changes** — same Style-A signature (no r3-spill, `sub sp,#4`, separate `ldmfd{lr};bx lr`). `.legacy.c` rename matched byte-for-byte on the first legacy-tier compile. |

**Process note for future dossier-driven waves:** check the prologue/epilogue shape *before* attempting any C-level reshape. The discriminator (from `docs/research/style-a-epilogue.md` / `sp3-routing-decision.md`) is: no r3-spill in the push + a separate `sub sp,#4` + a 2-step `pop-lr-then-bx-lr` epilogue → rename to `.legacy.c` first. Two of six matches this wave needed *no* source changes at all once routed correctly — this check is nearly free and should run before any reshape attempt.

## Parked candidates

All parked with the working tree fully reverted (`.s` restored via `git checkout HEAD --`, delinks.txt line reset, scratch `.c` removed). One-line reasons:

| Addr | One-line reason |
|---|---|
| `02000d4c` | P-11-class register-pressure wall: orig needs 6 live regs (uses `lr` as a 6th scratch, stack-framed); our best compile only needed 5 (frameless). No C form found to force the extra register. |
| `0202e5ac` | Compiler-internal jump-table immediate-decomposition: orig materializes the dense-run pivot via one `add`+`sub`; ours needs two `sub`s since 0x1586 isn't a single ARM rotated-immediate. Confirmed the dossier's own "permuter-class" prediction. |
| `02038908` | PRNG state update: `volatile` fixed the CSE'd read-count and read-order, but a residual shift-scheduling choice (which operand of the final `orr` gets pre-shifted early) didn't respond to operand-order flips — compiler-canonicalized, matches the dossier's own "confidence: low" flag. |
| `02054b44` | Park-Miller step: our compile masks `&0xffff`/`&0x7fff` via shift-pairs (no pool load); orig uses AND-with-pool-constant (3 literal words vs our 1). Tried mask, algebraic derivation, cast-truncation, and `#pragma opt_strength_reduction off` — all four produce identical shift-based code. Compiler-fixed for this exact "mask the low half-word" idiom. |
| `0206afec` | Byte-serialize-4-bytes: got the `stmdb{r0-r3}` spill and load/store pairing to match via paired byte temps, but the specific byte-to-register mapping within each load pair (and the associated single- vs split-instruction stack padding) is fixed regardless of declaration order — 2 independent reorderings had zero effect. |
| `0206f170` | Confirmed dossier's own high-confidence prediction: mwcc never emits the fused `mlals` (flag-setting multiply-accumulate); always separates into `mul`+`cmp`, and adds a stack frame besides. Hard ISA-selection limitation, not iteration-dependent. |
| `0207103c` | 64-bit LCG state update: mwcc's `unsigned long long +=` lowering always inserts `orr rX,rY,#0` register-copy overhead before `adds`/`adc`; tried direct add, fused single-expression add, and manual 32-bit carry detection (which produced an entirely different, worse `cmp`+`movcc/movcs` sequence). Confirmed permuter-class per the dossier. |
| `0207e1c4` | 5x table-address computation + store: got the exact `mla` addressing right, but mwcc fully reschedules the whole basic block (interleaves compute+store) regardless of C statement order — tried both "store immediately" and "compute all 5 then store all 5" source shapes with byte-identical output either way. |
| `0207e840` | eor-predicate branch select: fixed the CSE-hoisted `p->f18` load (needed a `volatile` type-pun cast, not just per-branch scoping) and got everything else byte-identical, but the boolean XOR's value is discarded via `teq` in every C phrasing tried (bare expression, named temp, compound `^=`) where orig materializes it via `eors`. 4 phrasings, zero effect — compiler-fixed liveness optimization. |
| `0207ec28` | u16 range-test + wrap-subtract ternary: got the signed/unsigned compare pair and 3-of-4 predicated instructions (`subne`/`addne`/`moveq`) to match; the final 16-bit truncate stays unconditional (applies to both paths) instead of orig's predicated `movne` pair. 6 variants tried (ternary w/ and w/o casts, if/else, assign-then-return) — none produced the 4th predicated instruction. |
| `0208060c` | 2D tilemap fill: fixed a duplicate height-check (do-while instead of for, avoiding the redundant entry-check) and got the register set back to the correct 6, but mwcc folds the second extract-shift into the loop body's `orr` operand every iteration instead of hoisting the loop-invariant value once like orig. 5 variants (plain/volatile/register/narrow-cast) — volatile fixed the fold but caused a worse stack-spill; reverted to the closest (19/20 instructions) form. |
| `0208541c` | Indexed table walk + bitfield insert: full instruction sequence matches; only divergence is orig using `lr` as an extra scratch register (no r4 push) vs our compile preferring `r4` (with `lr` staying pure-return-address). Same register-pressure "which register" choice as `02000d4c` but same total count either way — variable-collapse experiment had zero effect. |
| `0208c3e4` | Fixed-point dot product: matched the Style-A legacy-tier signature and the `smull`/`smlal`/`adds`/`adc` shape exactly, but mwcc always picks `a[0]*b[0]` as the `smull` initializer regardless of addition order (tried textual order, explicit sequencing via separate statements, and named pointer-free scalar temps — 3 phrasings, always a[0] first) where orig starts with `a[1]*b[1]`. |
| `0208ddec` | DISPCNT/BG3CNT addr-calc: the `ldrh bg` read is scheduled early (right after the address computations) in every declaration order tried; orig defers it to right after `cmp mode,#3`. Dossier's own explicit park criterion ("if the ldrh bg scheduling divergence persists, park as permuter-class"). |
| `0208de94` | Sibling of `0208ddec` — same `ldrh bg` scheduling wall, confirmed via one verification compile (dossier explicitly flagged this as the identical wall). |
| `0208e6ac` | MMIO bitfield insert with a guard store: two independent divergences — the `a==0` early-return path branches (`bne`) instead of fully predicating like orig (6-instruction predicated block with `bxeq`), and mwcc derives the `0x04000060` constant algebraically from the already-loaded `0x0400035c` (`sub r3,ip,#764`) instead of a second pool load like orig. Consistent with the session's established "compiler finds a cheaper equivalent" wall class; not pursued further given time budget. |

## New wall patterns observed this wave (for future dossier-writers)

Several parks this wave hit variations of a recurring theme — **mwcc canonicalizes certain scheduling/operand/register choices independent of C source phrasing** — worth flagging explicitly since multiple candidates burned 2-6 reshape attempts before confirming this:

1. **Fixed load-pair register mapping.** For "load two adjacent bytes then use both," mwcc assigns a fixed register to each offset regardless of declaration order (`0206afec`).
2. **Fixed accumulator-initializer choice.** For a 3+-term `long long` sum-of-products (dot product / smlal chains), mwcc always picks the lowest-index term as the `smull` initializer regardless of addition order or explicit sequencing (`0208c3e4`).
3. **Fixed mask-to-shift preference for half-width masks.** `x & 0xffff` (and the `(x<<17)>>1`-style 15-bit sibling) always lowers to a shift-pair, never a pooled-constant `and`, when the masked value directly feeds an arithmetic op — contradicts recipe-gotchas.md gotcha 25's general claim, suggesting gotcha 25 may be narrower in scope than currently documented (worth a follow-up audit).
4. **Fixed liveness-driven `eors`-vs-`teq` choice.** A boolean XOR whose value is never reused always compiles to `teq` (discarding the result), even when the source explicitly names/reuses the value via compound assignment.
5. **Fixed loop-invariant shift scheduling.** A loop-invariant two-shift extraction can get *one* shift hoisted before the loop and the *other* folded into the loop body's consuming instruction every iteration — `volatile` fixes this but adds an unwanted stack spill; no C-level middle ground found.

None of these responded to declaration-order swaps, `volatile`, `register`, explicit sequencing, or pragma bracketing in this wave's testing — they look like genuine compiler-internal scheduling/selection passes, not reshape-able from portable C. Recommend cataloging as new wall classes in `codegen-walls.md` if a future wave confirms the pattern again on different candidates.

## Porting

All 6 EUR matches ported to USA and JPN via `tools/port_to_region.py`. 4 resolved cleanly at the default HIGH confidence floor; the other 2 (`02033a80`, `02076cc0.legacy`, `0208b108.legacy` — 3 candidates, not 2) are pure leaf functions with no relocations to cross-check, so the porter's symbol resolution landed at MEDIUM (D2 v2 auto-promoted from LOW via a consistent address-shift consensus across 5 HIGH-confidence neighbors). Accepted at `--confidence-floor MEDIUM` and let the per-region `ninja sha1` gate be the final arbiter — both USA and JPN passed byte-identical, confirming the ports are correct.

| EUR addr | USA/JPN addr | Confidence |
|---|---|---|
| `02005d54` | `02005d38` | HIGH |
| `0200aa08` | `0200a9ec` | HIGH |
| `02026f78` | `02026f24` | HIGH |
| `02033a80` | `02033a30` | MEDIUM (leaf, no relocs) |
| `02076cc0` | `02076bd8` | MEDIUM (leaf, no relocs) |
| `0208b108` | `0208b020` | MEDIUM (leaf, no relocs) |

USA and JPN addresses are identical for all 6 candidates in this wave (same shift within this address range for both regions).

## Verification

Final SHA gates:

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

