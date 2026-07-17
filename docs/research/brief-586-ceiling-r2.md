# Brief 586 — ceiling round 2: consolidating the breakthrough

Date: 2026-07-17
Branch: `claude/c-ceiling-r2-586`

## Headline

**1 more function shipped above the old 544 B line (552 B → now also
952 B, both `arm9/main`), one previously-parked wall formalized with a
working counter-lever discovered along the way, and two honest parks
with precise, evidence-backed diagnoses.** The counter-lever find is the
most valuable result this round: brief 582's target-1 near-miss and
this brief's target-A near-miss turned out to be **two different
mwcc-tier symptoms**, and target A's — a known family (C-24) — had a
documented fix (`.legacy_sp3.c` routing) that took it from 91% to 100%
in two moves. That confirms the strategic read from 582: the >544 B
residue is gated by *codegen-detail iteration budget*, not comprehension,
and at least one class of that detail work is now a fast, repeatable
recipe instead of a fresh investigation every time.

## Objective 1 — finish `func_ov002_022b809c` (908 B): still parked, real progress made

Re-derived from the raw `.s` (the brief-582 scratch draft didn't
survive between sessions — different session, different scratchpad —
so this was a fresh re-derivation guided by 582's doc, not a resume of
a saved file). Two concrete fixes over the 582 attempt:

1. **Un-inlined the wrongly-factored helper.** 582's draft called a
   shared `static` function from the three dispatch targets
   (`.L_8c`/`.L_cc`/`.L_10c`); the original inlines that body
   independently at each site (no internal `bl`). Replaced the
   `static` function with a macro so the C is still written once but
   expands to three independent inlined copies, matching the original's
   actual shape. This alone took the match from 582's 15.5% (a
   structurally-split two-section object) to a properly single-section
   object.
2. **Re-derived the slot-toggle tail block from scratch, carefully.**
   582's version of this block (the `{7,9,0xa,0xc,0x11}` slot-resolve
   path) was flagged in its own doc as "lowest-confidence... needs a
   second, careful pass." This pass caught a real miss: `func_020212cc`
   takes the resolved slot value as its argument (`bl func_020212cc`
   fires with `r0` still holding `slots[idx]` from the immediately
   preceding load — no `mov` in between) — 582's draft had it as a
   bare `void func_020212cc(void)` call, dropping the argument
   entirely. Fixed to `func_020212cc(int slot)`, passing `val`.

**Current state: 216/226 real instructions, well short of 100%.** The
remaining gap is a **whole-function register-allocation swap**, not a
handful of local bugs:

- Prologue: mine emits `stmdb sp!, {r3,r4,r5,lr}; sub sp,sp,#0x8`
  (self→r4, cmd→r5); orig emits `stmdb sp!, {r4,r5,lr}; sub sp,sp,#0xc`
  (self→r5, cmd→r4) — same total stack (16 B either way, just a
  4-register-push-as-padding vs 3-push-plus-explicit-sub split, the
  **same C-24-family alignment-trick symptom target A hit** — but
  trying the same `.legacy_sp3.c` fix here made things *dramatically
  worse* (224 real insns, 172 of them divergent — the legacy tier's
  own independent register allocator picked a completely different
  scheme for this larger, denser function). **This confirms the
  `.legacy_sp3.c` lever is not a blanket fix for the alignment
  symptom — it only helps when the rest of the function's codegen
  is otherwise close, which target A's was and this one isn't.**
- Beyond the prologue, the r4/r5 swap ripples through essentially every
  instruction in the function (self and cmd are both referenced
  constantly), so the diff is dominated by `DIFF_ARG_MISMATCH` register
  renames rather than logic errors.
- One genuine scheduling puzzle, unresolved: in the three dispatch
  handlers, the original interleaves the `strh <v>, [self+0xc68]` store
  with the stack-argument setup for the `func_ov002_022b867c` call
  (store happens *before* the bitfield computations); my compiled
  output defers that same store to *after* the bitfield computations
  despite my C writing it first, textually. The three call sites also
  each land their 6th argument (`v`) at a *different* stack offset
  (`sp+8`/`sp+6`/`sp+4`) in the original — not the fixed single-slot
  layout a uniform 6-argument call would produce. That's model
  uncertainty about `func_ov002_022b867c`'s true signature/ABI that
  reordering my own source can't resolve without more ground truth.

**Verdict: parked, closer than 582 but not shipped.** This is a genuine
whole-function register-allocation divergence, the kind brief 582's
target 3 already flagged as needing "meaningfully more than the ~80
minute soft cap" — this round's ~90 minute budget bought two real bug
fixes and a clearer picture of exactly where the remaining gap is, not
a full close. Draft preserved for a future round (not committed; `.s`
restored, tree clean).

## Objective 2 — three fresh singletons in the 600-1200 B band

The brief-580 unified queue (`cmatch-queue.md`) turned out to track
small clone-family near-misses (4-24 B diffs), not size-based
candidates — confirmed by inspection, no size column exists. Per the
brief's own fallback, checked `docs/research/c-match-prep/INDEX.json`
(3,990 candidates with size/module/confidence fields): only 8 fell in
600-1200 B, 2 already flagged as confirmed reg-alloc walls (`020754f4`,
`021acb50`) by their own risk notes, and the remaining 6 were
concentrated in ov004/ov005/ov011/ov019 with several explicitly marked
"asm is TRUNCATED" in the prep index (the swarm's own view of the
source was incomplete — not a problem for us since the real `.s` is
always fully available in the worktree, but a sign the index's
`recipe`/`risk` fields needed independent re-verification, not
trusting them at face value). Given that, ran a fresh
`find_duplicates.py`-based singleton census (582's proven method) on
ov002 in parallel and drew from both pools.

### Target A — `func_0204f3c0` (arm9/main, 952 B): **SHIPPED**

**`ninja sha1` PASS, EUR.** A mode-gated context initializer/reset: a
common block of ~20 zeroed fields (each independently re-fetching a
singleton context pointer via `func_020498f0()` — real ground truth,
already-matched — matching the original's own redundant per-store
re-fetch rather than caching the pointer), then a `mode`-dependent
branch to either a 3-way byte-check dispatch (`func_020498dc(1)`,
bare return, or `func_020498dc(0xa)`), a second common zero-block plus
five `Fill32`/`func_0209448c`/`func_020945f4` bulk-clear calls (all
three callees' signatures confirmed from existing matched siblings),
then a second `mode`-gated 2-way dispatch, then a final zero-block.

**Iteration (91.2% → 100.0% in two fixes):**

1. **`signed char` vs `unsigned char`.** This codebase compiles with
   `-char signed`; two `((char *)ctx)[0x15]`-style byte reads (and one
   assignment) needed to be `unsigned char *` to get `ldrb` instead of
   `ldrsb` — the original never sign-extends these fields. Cross-cutting
   fix (every `ctx->0x15`/`ctx->0xd` site), jumped 82.5% → 93.3% in one
   move once the earlier `func_020459f0` return-type guess was also
   confirmed harmless.
2. **The C-24 alignment-trick symptom, and its known fix, applied
   cleanly.** After the char fix, the *only* remaining divergence was
   the exact pattern `codegen-walls.md` §C-24 already documents:
   default-tier (2.0/sp1p5) emits `push {r3,r4,r5,lr}` (dummy r3 as
   8-byte-alignment padding) where the original emits
   `push {r4,r5,lr}; sub sp,sp,#4` (explicit alignment) — at all 7 of
   this function's return points. C-24's own routing fix
   (`.legacy_sp3.c`, mwcc 1.2/sp3) applied directly: first pass fixed
   the stack accounting completely but introduced a *new*, smaller
   epilogue-style gap (`pop {r4,r5,lr}; bx lr` — 2 insns — instead of
   the original's `pop {r4,r5,pc}` — 1 insn, "Style B" per
   `CLAUDE.md`'s own tier table) at all 7 returns; that's a **different
   named tier-default** (Style A vs Style B epilogue), not a new wall —
   `.legacy.c` (1.2/sp2p3, Style A) was the wrong legacy tier, `mwcc
   1.2/sp3` was the right one for `pop {regs, pc}`. Renaming
   `.legacy.c` → `.legacy_sp3.c` fixed the epilogue too: 238/238
   instructions, **0 divergent**.
3. **One real condition-polarity bug caught by the now-clean diff.**
   With the tier/type issues gone, a single `addeq`/`ldmeqia` vs
   `addne`/`ldmneia` mismatch surfaced a genuine transcription error:
   `if (ctx->0x15 == 2) return;` should have been `if (ctx->0x15 != 2)
   return;` (the original returns bare when the byte is *anything but*
   2, and only calls `func_020498dc(0xa)` when it *is* 2 — I had the
   branch polarity backwards from the first read). Fixed → **238/238
   instructions, 0 divergent, byte-identical.**

Flipped `config/eur/arm9/delinks.txt`'s TU declaration to
`src/main/func_0204f3c0.legacy_sp3.c`, removed the `.s`, ran the real
gate:

```
gx-spirit-caller_eur.nds: OK
```

**USA/JPN port:** not attempted (same reasoning as brief 582's target
2 — no same-address override exists in either region, and hunting the
true cross-region equivalent is out of scope for this brief's timebox;
left for a dedicated port pass).

### Target B — `func_ov002_021b78b8` (ov002, 768 B): parked

A hand-compiled sparse-value decision tree: 33 distinct `id` values
sorted into 4 return categories (1/2/3/0-default) via a binary-search
comparison tree, zero external symbols or struct dependencies at all —
the cleanest possible dependency surface. The exact case-value set was
extracted by mechanically simulating every branch in the `.s`
(including one genuinely tricky ARM conditional-execution idiom —
`cmpne` predicated on a prior `cmp`'s flags — decoded by hand, not
guessed), not eyeballed, so the 33 values themselves are ground truth.
Wrote a plain C `switch` over that value set and let mwcc's own
switch-lowering build the tree, on the theory that the same compiler
given the same case set should reproduce the same algorithm — a safer
bet than hand-transliterating the tree's control flow instruction by
instruction.

**Result: 147/192 real instructions — 45 instructions short (~180 B).**
`DIFF_INSERT` on the original side confirms these are instructions
*only* the original has, not a mismatch of existing ones. The original
contains at least 3 spots where a value is computed, compared, and then
unconditionally branched past *without* checking the comparison result
— dead code by any normal reading, and not something a clean 33-case
`switch` naturally reproduces. That pattern is the signature of mwcc's
binary-search switch-lowering algorithm building a tree for a
*differently-shaped* case-value set than the one fed to it here (most
likely additional case values that collapse to the same 4 outputs but
change the tree's branch structure) — not a bug in the 33 values
themselves, which were independently verified by simulation.

**Verdict: parked, not a wall — an incomplete case-value reconstruction.**
Comprehension of *what the function returns for a given input* is
solid (verified against a from-scratch instruction-level simulation);
what's missing is the *complete* case-value set mwcc's tree was
actually built from. A future pass should walk the original's dead
compares specifically to back out the extra boundary values they imply,
rather than re-deriving the whole tree — the 3 known dead-compare
sites are a much smaller search space than the full function. `.s`
restored, tree clean.

### Target C — not attempted

Time did not permit a third fresh attempt after Objective 1's
re-investigation and target B's diagnosis. Rather than rush a third
pick and risk another incomplete, under-verified draft, the remaining
budget went to shipping target A cleanly, finishing the target-B
diagnosis precisely enough to be useful to a future brief, and
formalizing the wall taxonomy entry below. Noted here explicitly per
the project's own "no silent caps" convention — this is a real gap
against the brief's ask, not a hidden shortfall.

## Objective 3 — formalize the repeated-address rematerialization wall

Added **P-16** to `docs/research/codegen-walls.md`, using brief 582's
`func_ov002_02269534` (65.2% match, stuck) as the concrete repro:
mwcc sometimes folds a repeated `global_symbol+K` address into its own
literal-pool word (with zero-offset addressing) at 3+ call-separated
program points, instead of reusing the bare-symbol pool word every
other access in the function already uses (indexed addressing). Filed
under the same family as P-7/C-24/C-27 (all on mwcc's pool-dedup
peephole) but a distinct sub-case — those are about whether the *same
bare symbol* gets one or two pool entries; P-16 is about a symbol at a
*constant offset* getting folded into its own entry.

**Counter-lever status: not found this round either**, but the search
space narrowed usefully. `func_ov002_022b809c` (Objective 1's target)
looked like a promising second data point at first glance — it also
re-reads a value repeatedly across multiple `bl` calls — but on
inspection it doesn't exercise P-16 at all: the repeated access there
is a **parameter-relative** field (`self+0xc00+0x6a`, `self` already
resident in a register from function entry), not a **global-symbol**
access needing its own literal-pool materialization decision. P-16
specifically requires a global symbol at a constant offset repeated
across calls; neither of this brief's two fresh targets happened to
have that exact shape. The wall entry documents this explicitly so a
future brief doesn't have to re-discover the distinction — the next
productive step is deliberately hunting for a *second* real
`global+K`-across-calls repro (not just any repeated-read pattern) to
test candidate levers against.

## Strategic read: has the ceiling moved?

**Yes, further, and the failure modes are getting more legible.**
Brief 582 shipped one 552 B function and established the ceiling was a
budget effect, not a wall. This brief shipped a second, larger function
(952 B — nearly double) and, more importantly, turned one of 582's two
open questions (the C-24-family alignment symptom) into a **named,
two-step, repeatable fix** instead of a fresh investigation. That's the
real compounding value of a "round 2": each brief that documents its
near-misses precisely enough makes the *next* near-miss of the same
shape cheaper, even when — as with Objective 1 this round — the
straightforward-looking fix from the previous target turned out not to
transfer and had to be explicitly ruled out rather than assumed.

The two parks this round are genuinely different in kind from each
other, which itself is useful signal:

- **Objective 1's gap is a whole-function register-allocation
  divergence** — the same category brief 582's target 1 hit, but at
  larger scale (a 908 B function has far more live ranges for an
  allocator to choose differently across). This is the class of
  problem the swarm doc's own "P-11 reg-allocator plateau" family
  already names as often permuter-territory rather than
  source-shape-steerable — worth checking against a permuter run
  before spending more hand-iteration budget on it specifically.
- **Target B's gap is an incomplete reconstruction, not a compiler
  disagreement** — the fix is *more transcription work*, not a new
  lever. This is the "volume" failure mode 582's target 3 also hit,
  just manifesting as "missing case values" instead of "missing
  behavior blocks."

**Recommendation, updated from 582:** the C-24-family alignment fix
(`.legacy_sp3.c` when a function's *only* remaining gap after the
normal iteration loop is the push-r3-padding-vs-explicit-sub-sp
pattern at every return point) should go into the standard iteration
checklist alongside `suggest_coercion.py` — it's cheap to try, cheap to
detect (the diff signature is unambiguous), and this brief's evidence
is that it can take a function from "close" to "byte-identical" in one
move when it applies, and cause **no harm to try** since a bad fit
shows up immediately as a much worse diff (confirmed on Objective 1)
rather than a silent wrong match. Continue scaling attempt-budget with
function size and independent-behavior-count, not raw byte size alone —
target B (768 B, 33-way branch) and Objective 1's target (908 B,
7-behavior dispatcher) both needed more than their nominal size alone
would suggest, for different reasons.

## Final gate state

```
python3.13 tools/configure.py eur && ninja sha1
gx-spirit-caller_eur.nds: OK
```

`git status` clean except target A's shipped files (delinks.txt flip,
`.legacy_sp3.c` add, `.s` removal) plus the `codegen-walls.md` P-16
addition. Objective 1 and target B's drafts are not committed — both
`.s` files restored, verified via `git status`. No `ninja sha1` was run
for USA or JPN — target A is EUR-only this brief, matching brief 582's
established scope for this lane.
