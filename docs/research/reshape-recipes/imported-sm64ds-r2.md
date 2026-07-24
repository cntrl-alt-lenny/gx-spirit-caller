[//]: # (markdownlint-disable MD013 MD041)

# sm64ds mwccarm catalogue delta — re-ingest r2

**Status:** build-free source re-ingest, 2026-07-23. This report supersedes the
2026-07-03 snapshot in [`imported-sm64ds.md`](imported-sm64ds.md) for the
sections listed below; it does not claim that any peer observation has yet
been reproduced in this tree.

## What changed since the first import

The peer project moved from `bmanus2-dotcom/sm64ds-decomp` to
[`tangosdev/sm64ds-decomp`](https://github.com/tangosdev/sm64ds-decomp). Its
[`notes/mwccarm-codegen.md`](https://github.com/tangosdev/sm64ds-decomp/blob/main/notes/mwccarm-codegen.md)
is now 1,466 lines (commit `75213e58f490c64fdf9646a711129addd366c893`), versus
the 493-line file used by the first import. The new material is 21 dated
sections, 6h through 6z plus 7a through 7c. The source identifies its main
compiler as **mwccarm 1.2/sp2p3** with `-lang c99`; that is the same compiler
binary used by this tree's `.legacy.c` and `.thumb.c` routing tiers. The
peer's additional 1.2/sp3 tier and this tree's `.legacy_sp3.c` tier remain a
separate comparison axis.

The important correction is methodological: the peer's section 7a reports
that a uniform `register allocation` label was a categorizer failure, not a
compiler floor. Six of eight such head candidates then matched after ordinary
C-structure refinement. This is evidence against parking a whole near-miss
head from its label alone; it is not evidence that every register-coloring
residual is source-controllable.

## Delta catalogue

Each row below is transcribed from the new source section. “Peer result” is the
source's reported result, not a local verification. The requested seven
sections are marked **VERIFY**; they are the first candidates for a same-binary
1.2/sp2p3 check.

| Section | Date | Peer observation / lever | Peer result | Local status |
|---|---|---|---|---|
| 6h | 2026-07-08 | Launder a pooled global's full address through the u64/int round-trip to change its allocator class; pair with `opt_common_subs off` when EBB-local CSE matters. | `func_ov024_02111350`, div 25 → 0. | Re-ingested; existing r1 evidence, **VERIFY** on the exact legacy tier. |
| 6i | 2026-07-07 | A fresh block-scoped temporary around a virtual-call result changes the loop live-range coloring. | `_ZN10SphereClsn10DetectClsnEv`, div 16 → 0; the no-call aggregate-copy analogue did not respond. | Re-ingested; not in the requested first-pass checklist. |
| 6j | 2026-07-10 | Array-subscript form can prevent LICM from hoisting an index scale that pointer arithmetic leaves hoisted; pair with strength-reduction/common-subexpression controls as applicable. | `func_ov007_020ca308`, div 79 → 0. | Re-ingested; not in the requested first-pass checklist. |
| 6k | 2026-07-10 | Callee-saved locals color in reverse declaration order: the last long-lived declaration tends toward r7, then earlier declarations toward higher registers; the final pressure victim spills. | `_ZN5Stage9PS_RenderEv`, div 21 → 0. | **VERIFY** on 1.2/sp2p3 and 2.0/sp1p5 before treating as portable. |
| 6l | 2026-07-11 | Signed byte stores make `-1` as `mvn`; reverse-derive magic divisors and write `/N`; a named `u16` can preserve a narrowing triple. | Three reported matches: `func_02068ae8`, `func_ov002_020b5c4c`, and `_ZN6Player17St_SlideKick_MainEv`. | Re-ingested; local compiler/version sensitivity remains open. |
| 6m | 2026-07-11 | U64-laundering the destination dereference flips an aggregate-copy source/destination writeback-temp assignment. | Follow-up matched the warned 6i aggregate-copy floor; `func_ov090_02130f94` also matched with a plain aggregate assignment after other fixes. | Re-ingested; not in the requested first-pass checklist. |
| 6n | 2026-07-11 | Overlay 092 near-miss session: source shape, pointer laundering, and explicit loop/copy forms were used to separate schedule from allocator residuals. | Section records the session-specific levers and retained floors. | Re-ingested; verify only when a local candidate has the same shape. |
| 6o | 2026-07-11 | Ordering-residual triage separates statement/store order problems from four allocator/compiler-internal floors; do not call a residual a coloring wall before checking structure. | Five levers were tried; four residual classes remained floors in that session. | Re-ingested; routing rule, not a blanket lever. |
| 6p | 2026-07-13 | A loop counter reused across loops inherits the earlier loop's register color. | Reported as a reusable loop-web lever in the 0x400–0x800 Fable batch. | Re-ingested; no local byte claim. |
| 6q | 2026-07-13 | Register-web priority follows variable identity across the live range, not declaration or definition order; move the value to the other-named local. | `func_ov006_020d6e8c` r8/sb residual cracked after both ordering axes failed. | **VERIFY** on 1.2/sp2p3 and 2.0/sp1p5. |
| 6r | 2026-07-13 | `#pragma opt_propagation off` can retain a 0/1 ternary selector as a stack scalar. | New source section; included as a compiler-control observation, not a universal recipe. | Re-ingested; local flag legality/impact must be measured. |
| 6s | 2026-07-16 | Arm9 printf/soft-double cluster uses READ8/WRITE8 u16 RMW macros, source-level u64 shift loops, and specific macro/control-flow shapes. | Four helper candidates reached size-aligned near-misses; a systematic callee-saved assignment rotation remained. | Re-ingested; not a general game-logic recipe. |
| 6t | 2026-07-16 | Conditional early returns that look like asm can be plain C; the remaining double-guard case was separated from that general rule. | `func_02069918` matched as plain C; `func_02068398` remained a single-condition predication residual. | Re-ingested; 7b amends its asm syntax claim. |
| 6u | 2026-07-16 | Backend conditional optimization refuses to predicate a block with two or more CFG predecessors; arm size and calls/flags also affect conversion. | Single-condition `func_02068398` reported as unreachable from canonical C; `func_0205c048` is the matched two-predecessor precedent. | **VERIFY** on 1.2/sp2p3 and 2.0/sp1p5; do not copy the old asm-syntax caveat unchanged. |
| 6v | 2026-07-16 | Statement-level volatile can select a register only for a memory-home web; full-address laundering, named-vs-unnamed invariants, and equal-arm ternaries affect schedule/color interactions. | 22-match batch; examples include `func_0206ca7c` div 4 → 0 and `func_ov006_0210446c`. | Re-ingested; keep the stated preconditions. |
| 6w | 2026-07-18 | A comma operator can delay the second pooled pointer's live range so two pointers share a callee-saved register; derived versus explicit loop counters is the opposite-direction companion test. | `func_ov006_020ce674` reported landed; companion `func_ov006_020ec2bc` records the counter-shape effect. | Re-ingested; not in the requested first-pass checklist. |
| 6y | 2026-07-20 | Web rank can be moved by a zero-instruction self-select, declaration scope depth, copy placement relative to calls, or volatile memory reads. | OAM render residual 67 → 2 and WithMeshClsn 246 → 5; two allocator floors survived the session. | **VERIFY** on 1.2/sp2p3 and 2.0/sp1p5. |
| 6z | 2026-07-21 | Seven refinements: loop-invariant pragma on larger loops, element-accurate short typing, `char *` pointer arithmetic, both-side volatile, if-arm inversion, split post-increment capture, and statement order around a multiply. | 25-match refine cascade across PRs 527/530/531/532; also records a truncated-target tooling bug that hid a true match. | **VERIFY** the listed seven levers on 1.2/sp2p3 first. |
| 7a | 2026-07-22 | Uniform “register allocation” head labels can be categorizer failures. Run the head with all categories; landed levers included reverse store order, block scope, struct staging, short params, argument pass-through, and dropping an index temp. | Six of eight arm9 head candidates matched; two residual floors survived both model passes. | **VERIFY** on 1.2/sp2p3 first; this is the key anti-parking result. |
| 7b | 2026-07-22 | C-side predication floor remains, but the source's old statement that inline asm cannot spell conditional `ldm`/`bx` is corrected; also records fake-dependency stores, mixed temp/RMW interleave, both-side volatile, width/arity correction, and control-flow diagnosis. | Four additional arm9 head candidates landed; one concurrent match was not banked. | **VERIFY** the amendment and the four reported levers on 1.2/sp2p3. |
| 7c | 2026-07-22 | Spill slots group by type; deleting a named local can let EBB-local CSE choose the target web; mixed named/inline invariant spelling changes preheader order; volatile/ring-buffer and backward-spin-loop structure matter. | Seven third-cascade candidates reported landed; three confirmed floors plus one one-instruction hand-fix candidate remained. | Re-ingested; not in the requested first-pass checklist. |

## VERIFY-ON-1.2/sp2p3 checklist

This is the handoff checklist for the later CC verification item. It is
deliberately explicit about what is being tested and what counts as a result;
this report does not run a build.

| Section | First test | Required comparison | Record |
|---|---|---|---|
| 6k | Choose a local callee-saved-only near-miss with the same loop/web shape as PS_Render. | Compile the peer-inspired reverse declaration order through the `.legacy.c`/`.thumb.c` 1.2/sp2p3 route, then the existing 2.0 route. | Byte/reloc verdict, divergence before/after, and whether the direction survives the compiler change. |
| 6q | Choose a two-callee-saved color swap that already survived declaration and definition order. | Swap value identity between the two locals while holding statements and types constant. | Byte/reloc verdict; do not count a changed but non-matching color as a win. |
| 6u | Use a single-condition `beq + mov` near-miss and a two-predecessor control sample. | Compare plain C, a real two-condition CFG, and the peer's claimed pragma/asm variants. | Confirm the CFG-predecessor rule and record whether the conditional `ldm`/`bx` asm syntax assembles on our toolchain. |
| 6y | Use a schedule-correct/color-wrong pair with a memory-sourced web. | Test self-select, scope depth, copy placement, and volatile memory read independently. | Keep schedule and color deltas separate; reject any “fix” that adds instructions or changes reloc shape. |
| 6z | Re-run the seven numbered refinements only on matching local shapes. | Start with 1.2/sp2p3; repeat only a positive shape on 2.0/sp1p5. | One row per lever: target, source form, compiler tier, div/byte result, and whether the precondition held. |
| 7a | Take a uniformly categorized arm9 near-miss head. | Run the equivalent of `refine_wl.py --include-all-cats`; inspect all residuals before routing to permuter. | Count relabelled structural cases, ships, and genuine remaining coloring floors. |
| 7b | Use the `func_02068398`-class predication case plus one real game-logic asm sample. | Test `ldmeqia sp!, {lr}`, `bxeq lr`, and `DCD 0x...` syntax in a scratch; keep whole-function asm separate from readable C. | Syntax result, C result, and explicit no-go/near-miss status for the game-logic asm transcription. |

### Gate for the later verification

Do not promote a peer lever merely because it changes the assembly. A green
result is a byte-identical `.text` plus the project's relocation/link checks at
the stated tier. A source-shape change that only lowers divergence, changes
the register color, or changes the compiler's schedule without matching is a
near-miss and remains unverified.

## Source URLs

- Current repository and migration point: [`tangosdev/sm64ds-decomp`](https://github.com/tangosdev/sm64ds-decomp).
- Full current catalogue: [`notes/mwccarm-codegen.md`](https://github.com/tangosdev/sm64ds-decomp/blob/75213e58f490c64fdf9646a711129addd366c893/notes/mwccarm-codegen.md).
- Current matching workflow/oracle notes: [`notes/crack-loop-runbook.md`](https://github.com/tangosdev/sm64ds-decomp/blob/main/notes/crack-loop-runbook.md).
- Current project status and provenance: [`README.md`](https://github.com/tangosdev/sm64ds-decomp/blob/main/README.md).
- Previous imported snapshot, retained for history: [`bmanus2-dotcom/sm64ds-decomp`](https://github.com/bmanus2-dotcom/sm64ds-decomp).

The peer source is used as research evidence only. No peer source or ROM
asset is copied into this repository.
