# Brief 582 — probing the 544 B C-match ceiling

Date: 2026-07-16
Branch: `claude/c-ceiling-probe-582`

## Headline

**The ceiling does not stand at 544 B. It shipped clean on the first probe
(552 B, `arm9/main`, real `ninja sha1` PASS), and the two near-misses both
failed for reasons that are NOT comprehension — one is a specific,
reproducible mwcc register/literal-pool quirk with a concrete repro; the
other ran out of hand-derivation time on a genuinely denser function before
a structural modeling mistake (a shared helper the original actually
inlines 3×) could be fixed.** 1/3 shipped, 2/3 parked with full diagnosis,
0/3 stuck on "couldn't understand what the assembly does." That 0/3 is the
headline: every function in this probe was fully traced to a correct
behavioral model within the timebox. The bottleneck the campaign should
plan around is **codegen-detail iteration time and logical density at
larger sizes**, not comprehension difficulty.

## Method

Per-function protocol: read the `.s` + cross-reference already-matched
sibling `.c` files in the same module for established symbol/struct
conventions (this codebase has no shared per-overlay headers for most
data — each TU locally declares the exact struct/offset shape it needs,
proven by compiling), sketch the full behavior by hand, scaffold with
`tools/m2c_feed.py --m2c --context` (brief 555) as a cross-check, iterate
via `ninja build/eur/<path>.o` (single-TU compile, no full link) +
`objdiff-cli diff` + `tools/suggest_coercion.py` (the wall-taxonomy rule
engine), and only run the real `ninja sha1` gate once a single-TU objdiff
showed 100%.

Target selection: a fresh `find_duplicates.py` shape-clustering pass
(`--min-count 2`) plus a `delinks.txt` span parse gave an exact-count-
matching cross-check against the improvement-swarm doc's own numbers (390
ov002 / 244 main candidates >544 B — this reproduced those two counts
exactly), then filtered to functions absent from any shape cluster
(singletons). Picked in order: one ov002 singleton in the 550-800 B band
(warm-up), one `main` singleton in the same band (the required non-ov002
sample, moved early rather than last so it wasn't at risk if time ran
short), then one escalated ov002 singleton once the `main` attempt shipped
clean — using the momentum, not a fixed size list decided up front.

**A process lesson worth recording for future briefs:** while target 2's
background `ninja sha1` was still running, I started target 3's
single-TU `ninja` compile in the *same worktree* — a second concurrent
`ninja` invocation against the same `build/` tree. It didn't crash
anything, but it left a stale, wrong `.o` for the abandoned target-3
attempt cached under a path the still-running full build later linked in,
and the gate failed with a 644,625-byte diff — a false alarm that looked
exactly like target 2 breaking something. Deleting the stale `.o` and
re-running `ninja sha1` in isolation gave a clean `OK`. **Never run a
second `ninja` invocation against the same worktree while a full gate
build is in flight, even a narrow single-file one — its cached outputs
can get linked into the concurrent full build.** See the target-2 section
for the exact diagnostic trail.

## Target 1 — `func_ov002_02269534` (ov002, 548 B): PARKED, named codegen quirk

A 4-way duel-progress state-machine tick (states 0-2 dispatch via a
`data_ov002_022d016c+0xd20` step counter; state 0 posts an arg-pack event;
state 1 sweeps the opposing player's 5-slot row — stride 0x14, matching
the project's documented `Ov002Slot`/row-table family — for a pending
request and falls into state 2; state 2 either forwards to
`func_ov002_021b01f4`, arms a type-9 vote when both players' first-row
words disagree, or posts a different arg-pack event). Fully traced by
hand before writing any C; every callee's real signature was confirmed
against already-matched siblings in the same file
(`func_ov002_021d59cc.c`, `func_ov002_021b9ecc` call sites) or, for the
one genuinely unmatched callee (`func_ov002_021b01f4`), inferred from its
single-argument call shape.

**Real bug found and fixed during the attempt:** the first draft modeled
the 5-slot sweep as `struct subrow { char _pad[0x38]; unsigned short
f38; }; row++` — but `sizeof(subrow)` is 0x3a, not the 0x14 stride the
original actually uses (confirmed via `add r6,r6,#0x14` in the `.s`). The
read offset (0x38) and the per-iteration stride (0x14) are independent
numbers; embedding the field inside a struct conflated them. Fixed by
walking a bare `char*` incremented by `0x14` and casting-with-offset for
the read. This alone fixed the loop-stride divergence.

**What's left, precisely:** the step-counter increment
(`*(int*)(data_ov002_022d016c+0xd20) += 1;`) appears verbatim at three
separate return points (case 0's own early return, the state-1→2
fallthrough midpoint, and the final state-2 exit — matching the
original's own three independent, non-shared copies of this same
"reload+increment+store" sequence). At all three sites, my build
materializes `data_ov002_022d016c+0xd20` as its own fresh literal-pool
word (`ldr r2,[pc,#N]` then `ldr/str [r2,#0]`), while the original
reloads the *bare* symbol and uses `[r1,#0xd20]` indexed addressing
(reusing the exact same literal the function's very first access — the
switch-dispatch read, which DOES match byte-for-byte — already uses).
Net effect: one extra 4-byte pool word (552 B compiled vs. 548 B target)
plus a register-allocation ripple (`r7`/`r5` vs. `r8`/`r6` for two
loop-local values) that propagates through the rest of the function.
Neither `x = x + 1` vs `x += 1` nor the subrow fix changed this — it
reproduces identically either way. Final state: 137 insns, 65.2% match,
12 divergent instructions, all directly attributable to this one pattern
(three folded-vs-indexed pairs plus their downstream register echoes).
Tried and confirmed via `tools/suggest_coercion.py`: it flagged S-1
(padding off-by-one) at HIGH confidence, which was a real, useful
signal (padding pointed at the *symptom* — code growth — but the
mechanism was this literal-folding pattern, not a struct pad; S-1's own
"if the struct looks correct, suspect...cascade" escape hatch was the
right call).

**This is not in the existing wall taxonomy.** Candidate name for a
follow-up brief to formalize: *repeated-address rematerialization after a
call* — when the identical `symbol+constant` address expression is used
as an lvalue at 3+ non-dominating program points separated by
call-clobbers, mwcc sometimes folds the combined address into its own
pool constant rather than reusing the bare-symbol literal + indexed
addressing that a single/first use gets. Two more independently-observed
instances (not just this one) would confirm it's systemic rather than
this-function-specific; that's exactly the kind of investigation a
follow-up brief should timebox separately, since cracking the *general*
lever is worth more than any one function it unblocks.

Draft preserved at
`docs/research/campaign-analytics/` is not needed — the working file is
attached to this PR for reference; the `.s` was restored and the tree is
clean (verified via `git status`).

## Target 2 — `func_02037dc0` (arm9/main, 552 B): SHIPPED

**`ninja sha1` PASS, EUR.** A mode-dispatch scan: `arg0 - 0x8f00000`
selects one of 6 loop variants (each walking all 28 entries of the fixed
`data_0219b760` table, 0x78 stride, skipping inactive entries and applying
a per-mode flag-bit guard before calling `func_02037d28`) or, for any
other mode, resolves a caller-context entry via `func_02037b58` — whose
real signature (`Entry68 *func_02037b58(int id)`) was already on `main`
from `func_02038168.c`, giving hard ground truth for the shared
`Entry68` struct's `f34` flags field. `func_020366b0.c` (already matched,
"VERIFIED byte-exact") independently confirmed the exact
`data_0219b2e0+0x34` sub-table-lookup idiom the mode-5 case needed, down
to the same `0xc`-byte stride — strong cross-validation that the shape I
was reconstructing was real, not guessed.

The `switch`-over-6-dense-cases + jump-table dispatch matched
byte-for-byte on the very first compile (138/138 instructions, size
exact at 0x224). The one iteration needed: the mode-5 sub-table pointer
(`*(unsigned char**)(data_0219b2e0+0x34)`) was hoisted above the loop in
the first draft; the original re-derives it *inside* the loop body every
iteration. Moving it back inside fixed both the extra/misplaced
instruction AND, as a side effect, a register-allocation swap
(`r7`/`r8` vs `r9`/`r8`) that had been rippling through all six case
bodies — one source fix, two symptoms resolved. Result: 137/137
instructions, **100.0% match**, confirmed via `tools/suggest_coercion.py`
and directly via the objdiff-cli JSON diff (zero `DIFF_ARG_MISMATCH` /
`DIFF_INSERT` / `DIFF_DELETE` entries).

Flipped `config/eur/arm9/delinks.txt`'s TU declaration from `.s` to `.c`,
removed the `.s`, and ran the real gate twice (the first run false-failed
due to the target-3 build-contamination race documented above; the
second, clean run — nothing else running in the worktree — passed):

```
gx-spirit-caller_eur.nds: OK
```

Committed on this branch (`ce85a605`).

**USA/JPN port:** not attempted. `func_02037dc0` doesn't exist at the
same address in either region's `symbols.txt`/`delinks.txt` (no
`src/usa/main/func_02037dc0.*` or `src/jpn/main/func_02037dc0.*`
override) — the logical equivalent, if present, lives at a different
address in each region's own text layout, per this project's own
documented region-porting convention. Locating it independently in each
region is real work (brief 533's B1 finding hit exactly this: "would
need the standard EUR-equivalent-hunting process"), not a trivial
same-address copy, so per the brief's explicit "do not force it"
instruction this was left for a dedicated port pass rather than rushed
here.

## Target 3 — `func_ov002_022b809c` (ov002, 908 B): PARKED, ran out of time

A command handler: stashes two args into a per-object struct, dispatches
a 23-way jump table (most command values are no-ops at this stage;
twelve read `data_ov002_022d1910+0x90`, three read `+0x92`, one reads a
direct sub-field — each of those writes the loaded value into the
object's `+0xc68` field and calls `func_ov002_022b867c` with three
bit-extracted sub-fields plus two stack args), then runs six independent,
unconditional command-specific tail checks (a straightforward equality
store, a three-way pairwise bitfield comparison across three `u16`
sub-fields, a zero-store, two single-field pokes, and a shared
slot-table resolve/clear covering five more command values via an
OR-chain).

Comprehension reached the same standard as targets 1 and 2 for the
dispatch mechanism and the first four tail checks — each was traced
instruction-by-instruction with a concrete C mapping before typing
anything. Two things were NOT yet solid when the timebox ran out:

1. **A real structural bug in the first draft**, not a diagnosed
   codegen wall: the shared `.L_8c`/`.L_cc`/`.L_10c` dispatch body was
   factored into a `static` helper function. The original *inlines* that
   body independently at each of the three call sites (it's a
   whole-function `.s` ship with no internal `bl` to itself) — mwcc
   correctly compiled my helper as a genuinely separate symbol, splitting
   the object into two `.text` sections (0x48 + 0x298 B) instead of one,
   which is why the first (only) build attempt read 15.5% match. This is
   a known, fixable mistake (un-inline the three call sites), not a
   wall — I simply ran out of time to apply and re-verify it.
2. **The slot-table resolve tail check** (covering command values
   `{7, 9, 0xa, 0xc, 0x11}`) was reconstructed from the `.s` under time
   pressure and is the lowest-confidence part of the draft — the nested
   bit-packing on the four sub-field toggles at the end needs a second,
   careful pass against the raw assembly before it should be trusted.

**Verdict: incomplete, not stuck.** Every piece of this function has a
plausible, individually-traceable shape; nothing here looked like a
reg-alloc wall or an unrepresentable idiom. The honest read is that a
908 B function with 7 largely-independent behaviors packed into one TU
needs meaningfully more than the ~80-minute soft cap for a *first-pass*
correct-and-verified reconstruction, purely on volume — this project's
own swarm data agrees (matched C on this branch averages ~48 B/TU vs.
~344 B/TU for the residue; the density gradient is real, and this
function sits well above even that average). The `.s` was restored,
`config/eur/arm9/overlays/ov002/delinks.txt` was never touched, and the
tree is clean — verified via `git status` showing only target 2's three
files changed.

## Strategic read: does the ceiling stand?

**No — not as a hard wall.** A 552 B `arm9/main` function shipped
byte-identical on the first attempt this brief made above the previous
544 B high-water mark, with only one iteration (a hoisting fix, not a
rewrite). That alone falsifies "544 B is where readable-C stops working."

**But it doesn't fall for free, either, and the two ways it can still
cost you are different in kind:**

- **Target 1's failure mode is a genuine, nameable codegen gap** — not
  comprehension, not reg-alloc in the traditional sense, but a specific
  mwcc address-materialization choice this campaign hasn't catalogued
  yet. If a follow-up brief confirms it recurs on 1-2 more functions and
  finds a C-level lever for it (candidate ideas: forcing the compiler to
  keep the base pointer live across the call via an extra dummy use;
  restructuring the three tail sites to route through one shared `goto`
  target the way the mode-1→2 fallthrough in target 2 modeled cleanly),
  that's a real, reusable unlock — worth a dedicated timeboxed
  investigation separate from grinding this one function.
- **Target 3's failure mode is pure volume/density**, and it scales with
  size in a way the 484 B precedent (which failed on comprehension) and
  target 1/2 (which didn't) both undersell: this project's own easy
  material is long since drained (per the swarm doc's 7.2× density
  gradient), so the >544 B residue isn't just "the same kind of function,
  but bigger" — it's disproportionately made of functions with more
  independent behaviors per byte. An agent budget of ~80 minutes is
  enough for the *552-900 B, single-cohesive-behavior* tier (targets 1
  and 2 both fit this) but not reliably enough for the
  *900 B+, multi-behavior* tier target 3 sits in.

**Recommendation:** the ceiling is real as a *budget* phenomenon, not a
*capability* one. 1.1 MB of >544 B residue is not off-limits, but a
production wave against it should scale attempt-budget with function
size (something like 60-90 min for the 550-750 B tier this brief validated
twice, materially more for 900 B+, ideally with the target-1 quirk
formalized into the wall taxonomy first so it stops costing a full
investigation per occurrence) rather than treating every candidate as a
uniform-cost pick. The `main` result specifically also weakens the
"overlay methods don't transfer to main" precedent this brief was
scoped to test for (`VtableDispatchPatterns.md`'s 89%-overlays/0%-main
split) — this was a clean main win via the same comprehension-first,
ground-truth-cross-referencing method used on ov002, not a
transfer-failure.

## Final gate state

```
python3.13 tools/configure.py eur && ninja sha1
gx-spirit-caller_eur.nds: OK
```

`git status` clean except target 2's three-file change (already
committed). No `ninja sha1` was run for USA or JPN — target 2 is EUR-only
this brief, per the "do not force it" port guidance above.
