# Lever payoff playbook

Snapshot: 2026-07-22. This is a mechanical consolidation of the explicit
reshape recipes and outcomes in briefs 562, 579, 641, and 650, the contained
reshape catalog, `recipe-gotchas.md`, and `codegen-walls.md`. It is a lookup
table, not a proposal for new compiler experiments.

## How to read the evidence

`W/F` means recorded byte-match wins / recorded tried-and-failed attempts.
“Win” means the source says byte-identical, objdiff 100%, or shipped; a fuzzy
improvement is not counted as a win. A `+` means the report names the winning
examples but does not enumerate every trial. Synthetic compiler tests are
shown separately from corpus ships. A single mention with no outcome is kept
out of the ranking and marked **UNVERIFIED** below.

## ANTI-PATTERNS — do not iterate on these

| Wall / anti-pattern | Recorded symptom and evidence | Source |
|---|---|---|
| **Reg-alloc / scratch-register choice (NARROWED, not a blanket wall — see below)** | Same instructions and values, but mwcc chooses a different physical scratch register. R&D swarm r6/r8 + three sessions' reproduction: **6 of 7 named brief-641/P-4 instances byte-matched.** Pass 1 (correct compiler tier — plain `.c`/`.legacy.c`/`.thumb.c`, the b665/b667 routing pattern — plus, for one, forcing genuine store materialization with `volatile` on an otherwise-dead local) landed `func_02084ac4`, `func_02096040`, `func_ov004_021de264`. Pass 2, from a later-discovered live swarm scratchpad: the real fix for 2 more was a **corrected function signature** (arg count / return type), not a register trick — `func_020a724c` takes two forwarded `int` args (was wrongly modeled `void`); `func_0207e214` needed the swarm's exact struct-write field order. Pass 3 (r8 bet 3): `func_ov004_021dbe68` — parked for 2 prior sessions as "confirmed structurally correct, pure register-letter residue, unreachable from C source" after 4 independent rewrite attempts — turned out to be a **wrong-arity model, not a residue at all**: its callee `func_02094688` is a genuine 3-arg `(dst, src, len)` memmove routine (first instruction is `cmp r2, #0`, r2 used throughout), but a 2-arg trampoline model leaves r2 looking "dead" to the compiler, letting it reuse r2 as scratch instead of the target's r3. Forwarding a 3rd `int n` arg unchanged (`return func_02094688(b, a, n)`) matched byte-for-byte on the first try. **The generalized lever: a forwarded-but-untouched trampoline argument adds zero visible instructions to the caller — undercounting a trampoline's arity is invisible from the caller's own disassembly alone; always read the callee's first few instructions for which argument registers it actually reads before concluding a caller has a fixed, confirmed signature.** Only `func_020a71e4` remains an actual residue: 2-arg vtable call, confirmed structurally correct via direct objdump (every opcode/immediate/relocation matches except the r2-vs-r3 scratch choice), 4 source-level rewrites (explicit local, fn-pointer local, deref-call form, memory round-trip) all produced byte-identical output. **Do not park reg-alloc-shaped candidates on sight**; try correct-tier routing + a `volatile` local first, then check for a wrong signature — **arg count (verified against the callee, not guessed from the caller), arg type, and return type** — before accepting a residue as the genuine wall. `func_020b3850` and `func_0208b1ac` are confirmed genuine survivors (do not re-attempt). | [`brief-641-final47.md`](../brief-641-final47.md), [`brief-650-ov002-sweep.md`](../brief-650-ov002-sweep.md), `rnd-swarm-2026-07-23-r6.md` bet 1, `rnd-swarm-2026-07-24-r8.md` bet 3, `codegen-walls.md` P-4 |
| Branch-table constant rematerialization | `sel`/`off` constants are algebraically rematerialized as `sub` instead of the original independent `mvn`; four literal/order variants did not change it. **0 W / 3 family members; 4 variants.** | [`brief-562-cmatch-w2.md`](../brief-562-cmatch-w2.md) Family 1 |
| Guard-chain push/pop folding | mwcc folds an outgoing stack slot into the push/pop set instead of the target's explicit `sub/add`; four C restructurings produced the same wrong guard code, and a fifth duplicated the epilogue. **0 W / 3 family members; 4 direct variants.** | [`brief-562-cmatch-w2.md`](../brief-562-cmatch-w2.md) Family 2 |
| MMIO register-numbering residue | `.legacy.c` fixes C-23's base-folding wall, but the remaining MMIO value chain lands in the wrong register. **0 W / 4 family members; 5 variants.** Stop at the register-only residue and escalate to permuter/oracle work. | [`brief-562-cmatch-w2.md`](../brief-562-cmatch-w2.md) Family 3; `codegen-walls.md` C-23 |
| C-1r hybrid over-predication | Target has a predicated compare chain followed by a branchy return; standard C collapses the final return to predicated moves on all 15 compiler SPs. **0 W / 3 affected drops; 15-SP sweep.** | `codegen-walls.md` C-1r |
| P-4/P-11 allocator plateau | Tiny/mid-size functions remain register-renamed after source-shape sweeps. One documented P-4 permuter rule-out tried 5 variants × 15 SPs and ~900 iterations with no zero score. **0 W / 75 source/SP trials + permuter rule-out.** | `codegen-walls.md` P-4/P-11 |
| P-9 mask form (`cond ? -1 : 0`) | mwcc emits the wrong `mvnNE`/mask cascade. **0 W / 4 mask-form candidates** after 6 × 15-SP source sweeps and a later permuter plateau; the separate `if (!bit) return -1` early-return form is C-29 and does work. | `codegen-walls.md` P-9, C-29 |
| P-14 in-range sub-struct fold | Six C idioms failed to force the target's split base-offset computation; mwcc folds the combined offset. **0 W / 6 failed idioms** in the documented matrix. | `reshape-recipes/imported-sm64ds.md` SM-2; `codegen-walls.md` P-14 |
| CSE'd computed-temp operand order | Swapping commutative operands, naming a temp, and using `+=` do not change the canonicalized register/operand order; the permuter reached only its base score after 1,484 iterations. **0 W / 1,484 permuter iterations.** Use `.s`/asm escape if the exact residue matters. | `recipe-gotchas.md` Gotcha 19; `codegen-walls.md` |
| Refuted imported levers | SM-2, SM-4, SM-6, SM-8, SM-20, SM-21, and SM-26 were explicitly refuted by byte-identical controls or failed A/B tests; do not treat their proposed source forms as payoffs. | `reshape-recipes/imported-sm64ds.md` |

The anti-patterns are not “try harder” prompts. They are the documented
boundary conditions around the positive recipes below.

## Ranked levers

Ranks are by demonstrated corpus wins. Ties are ordered by the clearest
repeatability or the largest explicitly reported ship count.

| Rank | Lever | Codegen symptom it fixes | Where documented | EVIDENCE (W/F) |
|---:|---|---|---|---|
| 1 | False-branch-first conditional | Ternary emits a predicated pair in true-first order (`addne;moveq`) while the ROM has false-first (`moveq;addne`). | [`brief-562-cmatch-w2.md`](../brief-562-cmatch-w2.md) Family 4 | **7 / 0** — exemplar plus 6 zero-shot siblings byte-identical |
| 2 | Reload through output pointer, not a live local | The ROM re-reads an output value through `*out` at each use; a local stays live and removes the loads. | [`brief-562-cmatch-w2.md`](../brief-562-cmatch-w2.md), [`brief-579-cmatch-ov.md`](../brief-579-cmatch-ov.md) Family 2 | **7 / 0** — same 7-member family; the brief records the final 100% result |
| 3 | Real C bitfield for a shift-pair | mwcc canonicalizes `& mask` or explicit shifts to one `and`; a real bitfield forces `lsl`/`lsr` extraction. | [`brief-641-final47.md`](../brief-641-final47.md), [`brief-650-ov002-sweep.md`](../brief-650-ov002-sweep.md), `codegen-walls.md` C-17/C-22/C-39 | **≥5 / 0 enumerated** — 1 final47 ship plus 4 ov002 ships explicitly using the lever |
| 4 | Typed struct field instead of cast-arithmetic dereference | Pointer-cast arithmetic causes pool-load hoisting and packed-value register fragmentation; a typed field access preserves the target binding. | [`brief-579-cmatch-ov.md`](../brief-579-cmatch-ov.md) Family 1 | **3 / 0** — exemplar plus 2 siblings |
| 5 | C-39a sign-check as if-then + helper carries the tested value | Early return collapses `bmi` into conditional execution; an if-then body preserves the branch and helper argument liveness. | `recipe-gotchas.md` Gotchas 5/6, `codegen-walls.md` C-39a | **3 / 0** — brief 226 worked examples |
| 6 | C-39b helper-return reuse | Reuses the helper return and its live register instead of materializing a separate result path. | `codegen-walls.md` C-39b | **3 / 0** — brief 226 worked examples |
| 7 | C-39d multi-call re-read | Preserves the original re-read/liveness pattern across multiple helper calls rather than CSEing the value away. | `codegen-walls.md` C-39d | **3 / 0** — brief 229 pilot |
| 8 | C-39e null-check + helper at top | Keeps the null path and shared helper tail in the target's block shape. | `codegen-walls.md` C-39e | **3 / 0** — brief 235 pilot |
| 9 | Natural multi-call thunk shape | Match helper count, return form, and call order to the target; no special source trick is needed once the signature is right. | `codegen-walls.md` C-42, `recipe-gotchas.md` Gotchas 7–12 | **5 / 0** — brief 237 pilot, all byte-identical first attempt |
| 10 | MMIO bit-clear + tail-call shape | Models the volatile bit-clear and tail call in the source order needed for the MMIO address and call registers. | `codegen-walls.md` C-41 | **4 / 0** — brief 235 pilot |
| 11 | Return the argument, not a literal | A `return arg` lets the target's `ldmeqia`/return path reuse the incoming register; returning a literal changes the epilogue. | `codegen-walls.md` C-11 | **4 / 0** — brief 046 wave 6 |
| 12 | Short-body pure predication | Combine the side effect and value update in one ≤3-ARM-op if-body, then return once; early return emits a branch instead. | `codegen-walls.md` C-1/C-4 | **≥4 / 3 threshold drops** — 4 named matched functions; 3 four-op bodies were reclassified to P-6 |
| 13 | Branch polarity controls predication per guard | Choose `goto`/shared-tail or plain return independently at each guard; different guards in one function can need opposite shapes. A second concrete technique for the same problem: invert the guard that wants a real branch and NEST the next check strictly inside it (no `else`), keeping the early `return` only on the innermost single-statement arm — reproduces "outer guard branches, inner guard's own return still predicates" without a `goto`. | [`brief-650-ov002-sweep.md`](../brief-650-ov002-sweep.md), [`brief-664-ov002-unknown-batch1.md`](../brief-664-ov002-unknown-batch1.md), `codegen-walls.md` C-1/C-13 | **3 / 0** — one ov002 ship + one 93% near-miss via `goto`; 2 more ov002 ships (one zero-shot) via the inverted-nested-if technique |
| 14 | Repeated textual MAX3/MIN3 ternary | Keep the inner `(r>g)?r:g` text duplicated so mwcc emits the ROM's redundant compare instead of CSEing it. | [`brief-579-cmatch-ov.md`](../brief-579-cmatch-ov.md) Family 2 | **2 / 0** — exemplar plus byte-identical sibling after the template fix |
| 15 | Direct `%`, not manual divide/re-multiply expansion | Manual `x - (x/k)*k` lowers to a cheap `mul`; `%` selects the target's full `smull` modulo sequence. | [`brief-579-cmatch-ov.md`](../brief-579-cmatch-ov.md) Family 3 | **1 / 0** — 25%→100% in one source change |
| 16 | No explicit case for a shared default value | Model the observed fall-through/no-default switch and the shared zeroed outputs instead of inventing a helper/default case. | [`brief-579-cmatch-ov.md`](../brief-579-cmatch-ov.md) Family 3; [`brief-562-cmatch-w2.md`](../brief-562-cmatch-w2.md) Family 1 | **1 / 0** — one HSV/RGB ship explicitly depended on the corrected default interpretation |
| 17 | Ternary polarity (`m < 1 ? 0 : 2`) | Conditional moves are emitted in source true-branch order; invert the predicate so the first ROM `movXX` is the true arm. | `recipe-gotchas.md` Gotcha 3 | **1 / 0** — brief 229 pilot |
| 18 | XOR operand order | mwcc schedules the right operand's extract first; put the first desired extract on the corresponding source side. | `recipe-gotchas.md` Gotcha 4 | **1 / 0** — brief 226 pilot |
| 19 | Helper argument count as register-color control | Pass through the same live args so r1/r2 remain occupied and a short-lived field temp lands in the target r2/r3. | `recipe-gotchas.md` Gotcha 7; `codegen-walls.md` C-5/C-14 | **3 / 0** — brief 241 picks |
| 20 | Return-value reuse of the last literal write | Return the same literal written to the final field so one `mov` serves both roles and moves the pool address to the target register. | `recipe-gotchas.md` Gotcha 8 | **1 / 0** — brief 242 worked pick |
| 21 | `int` return + both helper args | Keep both incoming pointers live across the call and return the helper result to force the target's post-call temp colors. | `recipe-gotchas.md` Gotcha 9 | **1 / 0** — brief 242 worked pick |
| 22 | Trailing-helper literal match | Give the trailing helper the same literal as the preceding field store so mwcc CSEs the literal and relocates the pool binding. | `recipe-gotchas.md` Gotcha 12 | **1 / 0** — brief 248 worked pick |
| 23 | Stack-argument declared width | Declare stack-passed values as `int` and narrow at the `strh`, producing `ldr` loads while retaining narrow struct stores. | `recipe-gotchas.md` Gotcha 13; `codegen-walls.md` C-43 | **4 / 0** — one template drained four siblings |
| 24 | Explicit `& 1` + three-argument C-39 table helper | The extra live args move pool/field registers and the explicit mask preserves the target's redundant `and #1`. | `recipe-gotchas.md` Gotcha 14; `codegen-walls.md` C-39f | **16 / 0** — byte-identical word matrix for the verified recipe |
| 25 | Global-pointer chase with matching incoming-arg liveness | Forward the same args the target forwards so chase temps occupy the same low/high registers. | `recipe-gotchas.md` Gotcha 15; `codegen-walls.md` C-39g | **2 / 0** — brief 260 recovered both byte-identically |
| 26 | `unsigned char` type to retain `and #0xff` | Type-level narrowing survives optimization where an explicit redundant mask is folded away. | `recipe-gotchas.md` Gotcha 16; `codegen-walls.md` C-39f | **≥2 / 0** — gotcha records 22/22 synthetic words plus a real C-39-family recovery |
| 27 | Volatile dead-store / literal re-read | `volatile` prevents dead-store elimination and CSE of a required reload, preserving the ROM's second memory operation. | `recipe-gotchas.md` Gotcha 17; `codegen-walls.md` C-3 | **≥2 / 0** — 12/12 synthetic words plus the documented real-function match |
| 28 | `*.legacy.c` routing for the compiler-tier peephole | Use mwcc 1.2/sp2p3 when the 2.0 tier folds the target's prologue, pool, MMIO, or thunk shape differently. | `codegen-walls.md` C-15/C-20/C-24/C-26; [`brief-663-main-unknown-batch2.md`](../brief-663-main-unknown-batch2.md) | **≥9 / 0 enumerated** — C-15/C-20/C-24/C-26 plus brief 663's 3 IRQ MMIO-bracket ships (default tier merges nearby absolute MMIO constants into base+offset; `.legacy.c` keeps them as separate literals) |
| 29 | `*.legacy_sp3.c` routing | Use the 1.2/sp3 tier for `stmfd {lr}; sub sp,#4` and related pool-dedup/prologue shapes. | `codegen-walls.md` C-24; `recipe-gotchas.md` Gotcha 10; [`brief-663-main-unknown-batch2.md`](../brief-663-main-unknown-batch2.md) | **≥5 / 0** — brief 242, the C-24 worked example, plus brief 663's 3 ships |
| 30 | Split-statement bitfield-chain store/reload | Separate the bitfield write and reload so the allocator schedules the target's store/reload register dance. | `codegen-walls.md` C-25 | **≥1 / 0** — permuter-recovered byte-identical recipe |
| 31 | Pool-word duplication via distinct externs/aliases | Preserve two target pool words instead of letting mwcc deduplicate one symbol reference. | `codegen-walls.md` C-27/C-30 | **≥1 / 0** — default-tier byte-identical recipe |
| 32 | Explicit ternary intermediate for predicated cascade | Make the intermediate value explicit to preserve the target's conditional move cascade rather than collapsing it. | `codegen-walls.md` C-28 | **≥1 / 0** — worked example `func_020338f8` |
| 33 | `if (!p)` short-tail early return | Spelling the null test in the negated form selects the target early-return control flow; `p == 0` selects the wrong predicated cascade. | `codegen-walls.md` C-29 | **1 / 0** — permuter found and end-to-end validated the recipe |
| 34 | C-20 pack-halfwords + tail-call routing | Use the legacy tier and the documented double-cast/argument-pack source shape. | `codegen-walls.md` C-20/C-20a | **≥5 / 0** — three C-20 siblings plus two C-20a worked ships |
| 35 | C-17 omit redundant post-shift mask | Do not add a mathematically redundant `& mask` after the shift-isolation when the target keeps only the shift-pair. | `codegen-walls.md` C-17 | **≥1 / 0** — brief 055 wave 18 |
| 36 | C-18 combined-AND shared return | Combine two paths that converge on one return value when the target has one shared AND sequence. | `codegen-walls.md` C-18 | **≥1 / 0** — brief 055 wave 19 |
| 37 | C-19 `int` local for signed `lt` | Introduce the typed local when unsigned comparison lowers to `lo` but the target uses signed `lt`. | `codegen-walls.md` C-19 | **≥1 / 0** — brief 055 wave 19 |
| 38 | Switch case/source order | Put case bodies in the target address/emission order; a semantically identical reordered switch changes jump-table body layout. | `codegen-walls.md` S-2/C-44 | **≥1 / 0** — documented byte-identical switch example |
| 39 | Contained catalog: accumulator-first operand order | Name/order the accumulator and loaded operand so `add`/RMW operand slots follow the target. | `reshape-recipes/contained-reshape-catalog.md` Recipe 1 | **≥1 / 0 enumerated** — verified worked example |
| 40 | Contained catalog: asymmetric pool/register binding | Bind the two pool-loaded bases through the asymmetric locals that reproduce target register ownership. | `reshape-recipes/contained-reshape-catalog.md` Recipe 2 | **≥1 / 0 enumerated** — verified worked example |
| 41 | Contained catalog: selective MMIO base binding | Cache only the address group the target reuses; leave the other group as direct accesses. | `reshape-recipes/contained-reshape-catalog.md` Recipe 3 | **≥1 / 0 enumerated** — verified worked example |
| 42 | Contained catalog: hoist count, not base | Hoist the loop-invariant count while reloading the base each iteration when that is the target shape. | `reshape-recipes/contained-reshape-catalog.md` Recipe 4 | **≥1 / 0 enumerated** — verified worked example |
| 43 | Contained catalog: short-circuit `&&` | Use short-circuit comparisons when the target has condition-code lowering rather than a materialized boolean. | `reshape-recipes/contained-reshape-catalog.md` Recipe 5 | **≥1 / 0 enumerated** — verified worked example |
| 44 | Contained catalog: store order follows source-argument order | Write independent stores in the target's source/argument order, not ascending field offset. | `reshape-recipes/contained-reshape-catalog.md` Recipe 6 | **≥1 / 0 enumerated** — verified worked example |

## Recorded but unverified for a real corpus ship

These have an outcome in a synthetic/imported compiler test, or are explicitly
listed as a hypothesis, but the source does not record a real matched-corpus
ship. They are intentionally not ranked above the worked recipes.

| Lever | Symptom | Source | EVIDENCE |
|---|---|---|---|
| Access expression: cast-deref vs array index | Same single-global read/modify/write, but pool-base and loaded-value registers swap. | `reshape-recipes/imported-sm64ds.md` SM-1; `recipe-gotchas.md` Gotcha 28 | **0 corpus / 1 synthetic byte-identical; 0 failed** |
| `#pragma opt_strength_reduction off` | Blocks index-times-stride → post-increment pointer lowering for non-power-of-two strides. | `reshape-recipes/imported-sm64ds.md` SM-3; `recipe-gotchas.md` Gotcha 27 | **0 corpus / 1 synthetic A/B effect; 0 failed** |
| Unsigned pointer type for `lsr` | Signed pointer emits `asr`; unsigned pointer emits `lsr`. | `reshape-recipes/imported-sm64ds.md` SM-9; `recipe-gotchas.md` Gotcha 30 | **0 corpus / 1 synthetic confirmation; 0 failed** |
| PMF ABI shape + argument liveness | Tagged pointer-to-member-function dispatch sequence and register coloring. | `reshape-recipes/imported-sm64ds.md` SM-10 | **0 corpus / 1 synthetic confirmation; 0 failed** |
| Predicated-select override vs ternary | Assign-then-override emits unconditional + conditional move instead of two ternary conditional moves. | `reshape-recipes/imported-sm64ds.md` SM-12; `recipe-gotchas.md` Gotcha 31 | **0 corpus / 1 synthetic byte-identical pair; 0 failed** |
| `volatile` condition for a second read | Forces a second load in each branch arm instead of reusing the test value. | `reshape-recipes/imported-sm64ds.md` SM-15; `recipe-gotchas.md` Gotcha 33 | **0 corpus / 1 synthetic confirmation; 0 failed** |
| Nested-switch break to shared tail | `break`/shared tail emits one helper/epilogue; nested early returns duplicate it. | `reshape-recipes/imported-sm64ds.md` SM-22; `recipe-gotchas.md` Gotcha 34 | **0 corpus / 1 synthetic byte-identical pair; 0 failed** |
| `#pragma optimize_for_size on` | Candidate lever for early-exit epilogue duplication; the precondition was not reproduced. | `reshape-recipes/imported-sm64ds.md` SM-5 | **0 / 0 — UNVERIFIED** |
| `register`-qualified locals | Proposed allocator bias for locals/arrays. | `reshape-recipes/imported-sm64ds.md` SM-14 | **0 / 0 — NOT TESTED** |
| Deleting-destructor / `new T()` shape | Proposed C++ construction/destruction ABI shape. | `reshape-recipes/imported-sm64ds.md` SM-11 | **0 / 0 — NOT TESTED** |
| Runtime static-initializer pool ordering | Proposed source-order control of constructor-list pool words; test hit plain `.data` instead. | `reshape-recipes/imported-sm64ds.md` SM-18 | **0 / 0 — UNTESTED** |
| `enum` vs integer local type | Proposed local-type allocator distinction. | `reshape-recipes/imported-sm64ds.md` SM-23 | **0 / 0 — NOT TESTED** |
| `void *` pointer arithmetic materialization | Proposed adjacent form to the refuted u64 laundering test. | `reshape-recipes/imported-sm64ds.md` SM-24 | **0 / 0 — NOT TESTED** |
| Explicit constant call-arg / volatile-read ordering | Proposed cross-call ordering effect for two volatile argument reads. | `reshape-recipes/imported-sm64ds.md` SM-27 | **0 / 0 — NOT TESTED** |
| SM-19 boolean suffix sensitivity | `!= 0`/`!= false` are equivalent; `== true` is a different C condition, not a new codegen lever. | `reshape-recipes/imported-sm64ds.md` SM-19 | **0 new quirk / 1 expected-semantics check** |

## Coverage index

The rows above consolidate aliases so the same lever is not ranked twice. For
traceability, the remaining positive codegen-wall entries are also covered by
the table's legacy/routing rows or by the direct recipes above: C-2/C-2a,
C-3, C-5/C-6, C-7, C-8, C-9/C-10, C-12/C-13, C-15/C-16, C-21/C-22,
C-23, C-26, C-31–C-38, C-39, C-39a/b/d/e/f/g, C-40, C-43, and C-44.
Their worked examples and negative boundaries remain authoritative in
[`codegen-walls.md`](../codegen-walls.md); this playbook does not re-count a
variant already counted under its more specific recipe.

The imported SM-16 and SM-17 entries are marked MOOT in their source (the
idioms already exist in the project) and therefore are not payoff levers.
