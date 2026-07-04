# Brief 524 — sm64ds lever verification + P-14/strength-reduction re-test

**Decomper, brief 524** (build-capable research, no delinks lane). Brief 469's
PR #1089 (Codex) ingested 44 codegen levers from `bmanus2-dotcom/sm64ds-decomp`
(a sibling DS decomp compiling with **mwccarm 1.2/sp2p3**, not our
**2.0/sp1p5**) into
[`reshape-recipes/imported-sm64ds.md`](reshape-recipes/imported-sm64ds.md),
tagging all 25 NEW + 2 CONTRADICTS entries `UNVERIFIED-ON-2.0`. This brief ran
every entry's 5-minute protocol on our actual toolchain via a direct
mwccarm-compile + objdump harness (mirroring `tools/verify.py`'s approach —
see `reference-direct-mwcc-harness` memory), plus `tools/verify.py --cc all`
for the one entry with a named real function to re-test against.

## Headline results

**Both CONTRADICTS resolved, opposite directions:**

1. **SM-2 (u64-mask address-laundering) — REFUTED for lifting P-14.**
   `codegen-walls.md`'s P-14 wall (sub-struct base-offset fold, in-range)
   stays **locked-permanent**. The laundering idiom does force *some*
   materialization/split — a new, real, non-obvious observation — but the
   split point is compiler-chosen by DP-immediate-encodability, not steerable
   to the wall's specific `0x1fc`/`0xc80` boundary. Full detail below and in
   the `codegen-walls.md` P-14 addendum.
2. **SM-3 (`#pragma opt_strength_reduction off`) — CONFIRMED, real and live.**
   Refines (does not overturn) a prior session's "strength-reduction not
   blockable from C" finding: that finding tested source-level rewrites only,
   which genuinely don't work; the pragma is a different, effective lever
   category. Promoted to `recipe-gotchas.md` gotcha 27.

**Of the 25 NEW levers:** 9 VERIFIED (promoted as gotchas 28-34, one doubled
up with SM-19's semantic confirmation), 7 REFUTED, 2 MOOT (already present in
our codebase/SDK), 2 UNTESTED (precondition not reproduced — flagged, not
claimed refuted), 6 deferred (lower priority per the source's own ranking).
Full per-entry ledger in the Counts table of `imported-sm64ds.md` (now
retitled `VERIFIED-ON-2.0`).

**No match landed this round.** SM-2 — the only lever tested against a
specific named real function (`func_02032724`) — refuted, so there was no
cracked wall to ship. Hunting a fresh real-function candidate for the other 8
verified levers (none of which named a specific target) would have scope-crept
this research brief into a full match-and-port pipeline; flagged as follow-up
leads below instead, per the brief's own "note it for a follow-up" option.

## SM-2 in detail — why P-14 survives a 7th idiom

The P-14 wall (`func_02032724`, `codegen-walls.md` lines ~6957-7052) is: mwcc
folds `self->inner.field` (a sub-struct field at a compile-time-constant,
in-range combined offset) into one `[self, #combined]` access and CSEs the
outer base, never emitting orig's `add r4, self, #K` + `[r4, #inner_off]`
split. A 6-idiom matrix (brief 250) found no C form forces the split.
sm64ds's SM-2 proposed a 7th: route the final address through a 64-bit
bitwise-AND identity op before the deref.

**Synthetic test** (`struct Outer{char pad[0x1fc]; struct Inner{char
pad2[0xc80]; int field;} inner;}`, matching P-14's exact offsets):

```c
void baseline(struct Outer *self)  { self->inner.field = 0; }
void laundered(struct Outer *self) {
    *(int *)(((int)self + 0x1fc + 0xc80) & 0xFFFFFFFFFFFFFFFFULL) = 0;
}
```

`baseline` folds exactly as P-14 predicts: `mov r1,#0; str r1,[r0,#0xe7c];
bx lr` (3 words). `laundered` genuinely **splits**: `add r0,r0,#0x27c; mov
r1,#0; str r1,[r0,#0xc00]; bx lr` (4 words) — real, new evidence that the
fold is not universally unconditional on 2.0/sp1p5.

**But the split lands at the wrong boundary.** `0x27c + 0xc00 = 0xe7c` (same
total), not `0x1fc + 0xc80`. Every variant tried — masking only the
sub-struct-pointer step (collapses back to the fold entirely), naming the
masked address as an explicit local (still splits at `0x27c`/`0xc00`), the
exact real-function control flow (`if`/`bl`/store, both masked-expression
occurrences) — always split at `0x27c`/`0xc00`. `0xe7c` itself isn't a valid
ARM data-processing immediate (rotated-8-bit encoding can't represent it —
the set bits span 10 cyclic positions); `0x27c` and `0xc00` both are. mwcc's
constant-materialization algorithm picks *its own* encodable split, with no
apparent sensitivity to which sub-expression additions the source grouped
together — and it doesn't even treat two identical occurrences of the masked
expression consistently (the load became `add+offset-ldr`; the store became
`add+add-to-full-address+zero-offset-str`).

Run against the real `func_02032724` (matching control flow exactly) via
`tools/verify.py --cc all`: **WALL on all 3 tiers** (2.0/sp1p5, 1.2/sp2p3,
1.2/sp3) — 10 words vs orig's 9, wrong split point. The 1.2/sp2p3 legacy tier
did something different again (pool-loads the full `0xe7c` as a literal
`.word` + register-register add — even longer, 13 words). **P-14 remains
locked-permanent** on our toolchain under every compiler tier we have.

## SM-3 in detail — the pragma is real, scoped, and specific

`#pragma opt_strength_reduction off` demonstrably blocks mwcc's
strength-reduction pass (index-times-constant-stride → post-increment
pointer walk) for non-power-of-2 element strides:

```c
struct Elem { int a, b, c; };  /* 12 bytes */
int sum_baseline(struct Elem *arr, int n) { /* ... total += arr[i].a ... */ }
#pragma opt_strength_reduction off
int sum_pragma(struct Elem *arr, int n)   { /* identical body */ }
#pragma opt_strength_reduction reset
```

`sum_baseline` → `ldr r2,[r0],#12` (post-increment, no multiply, 3-instr
loop). `sum_pragma` → `mov r2,#12; mul r3,ip,r2; ldr r3,[r0,r3]` (genuine
multiply + indexed load, different register allocation — framed
`push{r3,lr}` vs baseline's frameless). A bogus-pragma-name control
(`#pragma this_pragma_does_not_exist off`) on the same loop is
byte-identical to baseline, confirming this is a real, specific effect, not
"any pragma perturbs codegen." A function compiled after `#pragma
opt_strength_reduction reset` correctly returns to default (reduced)
behavior — the scoping works, no leakage past `reset`.

**Does not trigger on power-of-2-stride loops** (plain `int[]`) — ARM's
barrel-shifter addressing already makes those free, so mwcc doesn't
strength-reduce them regardless; nothing for the pragma to block. Only
applicable when the orig disasm shows an explicit `mul`/multi-instruction
stride computation.

## Notable individual findings among the 9 VERIFIED

- **Gotcha 28** (SM-1): accessing a *single* global via cast-deref
  (`*(T*)&g`) vs array-index (`g[0]`) — semantically identical C — swaps
  which register holds the pool base vs the loaded value. Same instruction
  count, genuinely different register assignment.
- **Gotcha 32** (SM-13): call-argument builder temps get their register
  color from **declaration/evaluation order**, not their eventual position
  in the call's parameter list. Mismatched order forces extra `mov`
  shuffling at the call site — likely a common, previously-unexplained
  source of near-miss "wrong temp register" diffs on any multi-arg call
  site with several locals built up beforehand.
- **Gotcha 34** (SM-22): nested switches reaching a shared fallback must
  `break`/`goto` to ONE shared tail — writing an early `return helper(...)`
  at each switch level's default case duplicates the call/epilogue once per
  level.
- **SM-10** (PMF ABI, not promoted as a gotcha — informational): confirmed
  the tagged 2-word pointer-to-member-function ABI (this-adjustment via
  `asr #1` discarding a tag bit, `tst`+branch choosing direct-pointer vs
  vtable-indexed dispatch) is real on 2.0/sp1p5, though the exact sequence
  depends on whether the PMF arrives as a parameter or a struct field (only
  the parameter case was tested). Worth revisiting if the "ov006 state
  machine" turns out to be genuinely PMF-shaped.

## Notable refutations (equally valuable — prune the search space)

- **SM-4** (C++ virtual dispatch "biggest unlock" claim): byte-identical
  output between a real `.cpp`/`extern "C"` virtual call and a plain-C
  vtable-slot emulation, in both a minimal and a thickened test. No
  distinguishable hoisting or pre-indexed-writeback tell on our compiler.
  The `.cpp` infrastructure itself works fine (confirms our existing
  per-file C++ opt-in is live) — just not for *this* specific distinguishing
  purpose.
- **SM-6** (pool-load hoisting): the *opposite* of predicted — a
  rarely-used pool-loaded global's load is scheduled lazily/predicated at
  point-of-use, not hoisted to function-top. Extends (doesn't contradict)
  our existing Recipe 6 lazy-scheduling finding.
- **SM-8** (volatile array SROA survival): mwcc 2.0/sp1p5 never
  scalar-replaces local arrays in the first place (tested both
  runtime-index and constant-index forms) — `volatile` is moot for this
  optimization on our toolchain specifically.
- **SM-20/SM-21/SM-26**: three separate "defeat an optimization via a fake
  dependency / reassignment / mutable local" tricks all failed —  mwcc's
  alias analysis, copy-propagation, and constant-folding all see through
  these source-level obfuscations and produce identical output regardless.

## Follow-up leads for whoever picks up the c-match lanes

None of the verified levers named a specific target function the way SM-2
did, so no match was attempted this round. Best candidates to keep in mind
while triaging near-misses:

- **Gotcha 28** (deref-vs-index): any single-global accessor near-miss with
  a register swap but matching instruction count.
- **Gotcha 32** (decl-order coloring): any multi-arg call site (3+ args)
  with an unexplained extra `mov` shuffle right before the `bl`.
- **Gotcha 27** (strength-reduction pragma): any loop over an array of a
  non-power-of-2-size struct where the near-miss shows a `mul`
  the orig doesn't have (or vice versa).

## Files touched

- `docs/research/reshape-recipes/imported-sm64ds.md` — every entry annotated
  with a Verdict line; header/counts updated to reflect resolution.
- `docs/research/codegen-walls.md` — P-14 addendum documenting the SM-2
  re-test.
- `docs/research/recipe-gotchas.md` — gotchas 27-34 added (full write-ups)
  + quick-reference table rows.
- `docs/research/README.md` — regenerated (`tools/generate_research_index.py`).

No `src/`, `config/`, or `tools/` changes — this was pure research, as scoped.
