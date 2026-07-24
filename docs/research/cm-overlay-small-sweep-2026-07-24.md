[//]: # (markdownlint-disable MD013 MD041)

# cm-overlay-small-sweep — overlay small-tier sweep, 64/118 shipped (54%)

Standard EUR readable-C sweep on the OVERLAY small-tier (≤160B), disjoint
from the decomper's main lane. Candidates pulled from
`wall_aware_headroom.py --json --max-size 160` filtered to `ovNNN`
modules, weighted toward the 18 project-wide `coercible`-tagged small
candidates plus a broad `unknown`-pool sample across every overlay.
Split into 5 non-overlapping batches (~23-24 candidates each), run in
parallel via isolated worktree agents given the volume, then merged back
into one branch (git's 3-way merge handled every `delinks.txt` overlap
across the 5 batches cleanly, zero conflicts — multiple batches edited
`ov002`'s `delinks.txt` independently and none collided).

## Result: 64/118 shipped (54%), 39 parked, 15 genuine linker-level walls left untouched

| Batch | Modules | Shipped | Parked | Not attempted |
|---|---|---:|---:|---:|
| 0 | ov000/ov002/ov004/ov006/ov011/ov016 | 15/24 | 7 | 2 |
| 1 | ov000/ov002/ov004/ov006/ov009/ov010/ov016 | 12/24 | 12 | 0 |
| 2 | ov000/ov002/ov004/ov011/ov023 | 10/24 | 14 | 0 |
| 3 | ov000/ov002/ov004/ov006/ov011/ov012 | 13/23 | 10 | 0 |
| 4 | ov000/ov002/ov006/ov011/ov013/ov019 | 14/23 | 9 | 0 |
| **Total** | | **64/118** | **52** | **2** (both genuine C-31/C-32 linker walls) |

**ov002 is by far the densest restocking target**: 971 of the
project-wide 1,010 non-main small-tier candidates (per
`wall_aware_headroom.py`), and the overwhelming majority of both ships
and parks in every batch. Every other overlay combined contributed a
handful each. Future overlay small-tier sweeps should expect to spend
nearly all their time in ov002.

## The most important finding: "documented wall" citations are unreliable at a striking rate

Every single batch independently cracked at least one candidate that
`ov00N_core.h` or a prior brief had explicitly catalogued as a confirmed,
permanent wall:

- `func_ov002_02273b1c`, `func_ov002_02267f90` — briefs 356/358
  "reg-mirror"/"unsteerable by C form" — cracked via a real `struct`
  typed extern (not `char[]+cast`) and a fallthrough-to-shared-return
  restructure, respectively (batch 0).
- `func_ov002_0220c2c0` — brief 356 "unsteerable predicate-vs-branch
  wall" — cracked once the correct forwarded-argument signature was
  identified; the prior negative result likely never had the right
  signature to begin with (batch 3).
- `func_ov011_021ca600`, `func_ov011_021ccf8c` — `ov011_core.h`'s own
  "3 prior attempts reverted" wall note — cracked via the same
  struct-member-access-not-pointer-cast convention (batch 4).
- `func_ov019_021b4c30` — `ov019_core.h`'s documented 70%-match
  near-miss — the straightforward if/else form reproduces it clean
  (batch 4).

**Six documented "permanent" verdicts reversed in one sweep**, on top of
[[cm-regalloc-trampoline]]'s reversal earlier this campaign. The
recurring root cause across all of them: the prior investigation used
pointer-cast arithmetic (`*(int*)(base+N)`) instead of a typed struct
member (`base->field`) — these compile to genuinely different pool-
constant-folding behavior in mwcc, not just different-looking C for the
same result. **Any wall citation whose original investigation predates
the project's now-standard typed-struct-extern convention should be
treated as unverified, not settled**, until re-checked with that
convention specifically.

The generic "GLOBAL_ASM endgame, brief 294/302" header comment stamped
on ~20 of the swept files is confirmed (again, matching
`docs/research/brief-640-wall-audit.md`'s finding from an earlier
session) to be `asm_escape.py`'s unconditional boilerplate, not a
per-function verdict — it carries zero evidentiary weight either way.

## Epilogue-routing rule refinement

The standing routing rule (read the target's epilogue before drafting:
fused `pop{regs,pc}` → `.legacy_sp3.c`) is **incomplete**. Batch 2 found
and confirmed against an existing shipped sibling: a fused-pop epilogue
by itself is not sufficient — the determining signal is whether the
**prologue** also has a separate `sub sp, #4` stack adjustment before
the register-save. Fused-pop-epilogue **with** that prologue shape →
`.legacy_sp3.c` (mwcc 1.2/sp3) as before; fused-pop-epilogue **without**
it → plain default-tier `mwcc 2.0/sp1p5`. This single correction
contributed to 6 of batch 2's 10 ships (candidates that were being
mis-routed to `.legacy_sp3.c` and failing to match there). Worth folding
into `docs/research/sp3-routing-decision.md` and the queue's own routing
instructions for future sweeps.

## New levers found

- **Struct-member access, not pointer-cast arithmetic, for pool-constant
  folding**: `*(int*)(base+N)` folds `N` into a second pool constant
  (wrong shape) where `base->field` keeps a single pool-loaded base
  register plus `[reg,#imm]` addressing matching the original. The
  single highest-value lever this sweep — directly responsible for at
  least 4 of the 6 wall reversals above.
- **Symmetric raw-shift folds to a single `AND`**: `(x<<N)>>N` with
  equal N gets mwcc-peephole-folded to `and #mask`, losing an
  instruction the target has as a genuine shift-pair. A real bitfield
  struct member (`unsigned x:W`) avoids the fold. Recurred 3+ times
  across batches.
- **Pointer-parameter reassignment vs. a new local**: when the target
  offsets an incoming pointer arg in place (`self += 0xc000;`) rather
  than computing into a fresh local, matching that in C (reassigning the
  parameter) fixes a register-letter swap a fresh local can't.
- **Declaration order controls register scheduling** when a match is
  already close (>80%) — reordering local declarations (not their use)
  flipped several clean register-letter swaps. Not a reliable fix when
  starting from a low match percentage; only closes small residual gaps.
- **Ternary/comparison polarity** and **struct-stride miscalculation**
  (a campaign-prep draft's assumed 6-byte or 16-byte stride vs. the real
  8-byte or 40-byte one) were both cheap, high-value checks — several
  ships were one-line fixes once caught, worth checking before assuming
  a deeper wall.
- **`unsigned short`/explicit narrow-cast locals**, not `int`, when the
  target re-masks a value after each conditional OR — reproduces mwcc's
  redundant truncate-after-each-op codegen for a genuinely narrow field.

## Confirmed genuine wall classes (correctly left unshipped)

- **C-31 mwldarm interwork veneers** and **C-32/C-33 cross-overlay
  hardcoded `BL`/pool-word walls** — link-level, not codegen; a C
  source form cannot reproduce a hand-encoded `.word` targeting an
  address with `module:none` in `relocs.txt`. 2 candidates were genuine
  instances and correctly never attempted; several more were recognized
  from prior documentation and skipped without wasting a build.
- **Predicate-vs-branch, single early return**: an early-return with
  nothing else to share a branch target with reliably compiles to
  `movne`/`moveq` predication regardless of C form or condition
  polarity — confirmed independently by 3+ batches as unsteerable.
- **Pure instruction-scheduling / register-choice walls**: functions
  that reach the exact right word count and near-100% structural shape,
  where mwcc's choice of which independent value to compute first (and
  which physical register it lands in) didn't respond to any of
  statement reordering, declaration reordering, `volatile`, or manual
  inlining. This is this project's own long-established "park on sight
  once diagnosed" class — confirmed again here, not reopened.

## Tooling gap found (not fixed this item — flagging for follow-up)

`fastmatch.py`'s resolved-comparison mode reports a false "0 orig
words" (looks like total failure) for at least one Thumb gap object
with multiple dsd-emitted local labels
(`func_ov004_021dcd1c.thumb.c`), even though the object is actually
byte-identical — confirmed via manual `objdump -s -j .text` diffing
before shipping. Likely the same base class of bug as the
already-documented tier-suffix/bulk-gap false-negatives (see
[[cm-small-resweep-1-2]]), but a distinct trigger (Thumb multi-label
objects specifically). Worth a dedicated fix in a future tooling item;
worked around by hand this time, not blocking.

## Process notes

- Ran as 5 parallel `general-purpose` agents in isolated git worktrees
  (`isolation: "worktree"`), each given the full routing/verification
  playbook and a disjoint candidate list. Consolidated by committing
  each worktree's uncommitted changes on its own branch, then `git
  merge --no-ff` all 5 into one integration branch sequentially — the
  real 3-way merge algorithm cleanly resolved every `delinks.txt`
  overlap across batches with zero manual conflict resolution needed.
- Two agents (batches 0 and 3) stopped mid-report waiting on a
  belt-and-suspenders whole-ROM `ninja sha1` that was still running in
  the background; both had already completed and verified every
  individual function via `fastmatch.py`'s resolved-mode comparison
  (the load-bearing check) before that point. Resumed batch 0 via
  `SendMessage` to get its complete final report rather than treat the
  truncated stop as done; batch 3's report was already complete on its
  own, so left as-is — its background sha1 was superseded by this
  item's own final consolidated gate regardless.
