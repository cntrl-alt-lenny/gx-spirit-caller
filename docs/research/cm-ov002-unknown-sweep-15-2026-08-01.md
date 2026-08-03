# cm-ov002-unknown-sweep-15: a real dispatch-infrastructure bug caught and worked around live, plus a fully-resolved new lever (2026-08-01)

## Purpose

Same protocol as sweep-9 through sweep-14: plain, module-agnostic
selection across 149-512B, one consolidated gate. New this round, per
explicit instruction after two worktree-collision incidents in the
last three rounds: **one worktree, one agent, enforced** — every batch
worktree verified individually before dispatch, and every dispatch
prompt required each agent to verify its own `pwd`/branch against its
assignment as a mandatory first step, stopping immediately on any
mismatch rather than proceeding. Also carried forward: C-55, C-44,
C-63, C-64, and C-65, all quoted verbatim in every dispatch prompt.

## Result: 26/100 shipped, 5,756 bytes

| Batch | Shipped | Bytes | Notes |
|---|---|---|---|
| 1 | 6/20 | 1,256 | Started correctly; caught the round's dispatch-infrastructure bug (see below) as evidence, resolved question 1 (and-before-mul/mla) with a real fix |
| 2 | 5/20 | 1,216 | Blocked on the wrong-directory bug, resumed correctly |
| 3 | 7/20 | 1,568 | Best batch; blocked and resumed; found a second working fix variant for question 1 and a new C-65 manifestation |
| 4 | 4/20 | 872 | Blocked and resumed; two more confirmations of question 1's fix; a real tier-routing table refinement |
| 5 | 4/20 | 844 | Blocked and resumed; strongest single data point for question 1 (one instruction block, 4 source variations, byte-identical every time) |
| **Total** | **26/100** | **5,756** | |

## A real dispatch-infrastructure bug, caught live by the enforcement this round explicitly asked for

4 of 5 dispatched agents (batches 2 through 5) independently reported
the identical problem as their mandatory first step: their shell
session started in the base `decomper` checkout, on this round's own
integration branch, instead of their assigned `sweep15-batchN`
worktree. Only batch 1 started correctly. This is exactly the failure
mode the round's standing instruction was written to catch — and it
worked exactly as intended: all 4 agents stopped immediately without
reading a single candidate file, editing anything, or touching git
state beyond read-only diagnostics, and reported the mismatch instead
of guessing.

Verified directly before responding to any of them: `git worktree
list` confirmed all 5 `sweep15-batchN` worktrees existed, were
correctly and exclusively checked out to their own distinct branches,
and were not in use by any other process. The problem was specifically
that each agent's shell session's *starting* working directory didn't
match its assignment — a dispatch/launch-level issue, not a corruption
or a genuine collision between two agents this time. Each of the 4 was
resumed with an explicit confirmation that its own worktree was
verified safe and a direct instruction to `cd` there itself, re-verify,
and then proceed exactly as originally assigned. All 4 did, and all 4
completed their real work normally after that.

This is a new, more specific finding than the prior two rounds'
worktree-collision incidents (where an agent operated in a wrong
directory *other agents were also using*, causing a genuine collision).
Here, no collision occurred — each agent's assigned worktree sat idle
and correctly configured the whole time; the agents simply hadn't been
placed there yet. Worth a closer look at whether the dispatch mechanism
reliably sets each background agent's starting directory, since this
affected 80% of this round's batches.

## Open question 1 — resolved with two working fixes, exceptionally well-confirmed

Sweep-14 flagged a new, unexplained residual: a redundant
`and rN, rN, #1` immediately before a `mul`/`mla`, present in the real target but
absent from an otherwise-correct draft, in a value mwcc can already
prove is 0/1-ranged (from a bitfield or shift-pair extraction). This
round resolved it with **two working fixes** — an explicit `& 1` mask
written directly at the multiply's operand, or an explicit intermediate
variable declared as its own statement before the value is used — both
forcing the compiler to treat the value as needing re-verification
rather than a provably-clean read. Documented as **C-66** in
`codegen-walls.md`.

The confirmation volume this round is the strongest any new lever has
had at the point of first full write-up in this campaign: at least 8
independent instances across 4 of 5 batches, entirely blind (no batch
was told the mechanism, only that the open question existed). One
instance (`func_ov002_02214cb8`, batch 5) is a particularly strong data
point on its own — the exact same instruction block, including the
redundant `and`, appeared byte-identical across 4 genuinely different
source structurings the batch tried for unrelated reasons.

## Open question 2 (C-65 load-vs-store asymmetry) — one new manifestation, still open

No batch hit the exact documented address-computation shape this
round. But batch 3 found a related manifestation in plain accumulator
arithmetic: an outer `acc += CONST` gets strength-reduced into a halved
induction variable that eliminates a division the real target still
shows; recomputing the value via fresh multiplication each iteration
instead preserved the target's full division-with-rounding codegen.
This broadens C-65's scope from address computation to general
arithmetic strength reduction, but doesn't resolve the underlying
load-vs-store asymmetry question — added as a scope note, not treated
as a full answer.

## Other findings

- **C-55, C-44, C-63, C-64 all got further independent confirmation**,
  consistent with prior rounds. C-64 specifically got at least 2 more
  partial confirmations (the `LS`-only-from-`for`-loop mechanism held,
  though neither target fully closed due to unrelated loop-invariant
  restructuring conflicts).
- **New: a jump-table entry for a case value provably unreachable**
  given an earlier bound check still compiles as real logic, not
  dead-code-eliminated (batch 2, `func_ov019_021b4f1c`) — a genuine
  mwcc quirk worth remembering when a target's jump table looks
  larger than the reachable case set suggests it should be.
- **New: a "two independent walking pointers" shape** (two related
  struct fields a fixed offset apart, each with its own incrementing
  pointer, rather than one padded struct) recurred 3 times in one batch
  and was the key fix each time — combining them into a single struct
  reliably caused excess register pressure the target doesn't have.
- **Tier-routing table refinement**: `.legacy.c` does not require
  `sub sp, #4` to appear — confirmed on a target with a genuine 2-step
  `pop {regs, lr}; bx lr` epilogue and zero stack allocation. The
  pop-target shape alone is the reliable 3-tier signal; `sub sp, #4`'s
  presence is incidental to a function's own stack needs in either
  direction, not a discriminator by itself. Added to
  `style-a-epilogue.md`.
- **Register-set-correct-letter-scrambled wall** remained the single
  most common park reason across every batch, consistent with every
  prior round.
- **A self-contradicting batch report, reconciled against ground truth
  rather than trusted either way**: batch 2 listed
  `func_ov002_02275938` as parked at 98.2% in its own parked-list table,
  but separately claimed elsewhere in the same report to have "cracked"
  it via declaration-order reordering. Checked directly rather than
  guessing which half was right: no `func_ov002_02275938.c` exists on
  the merged branch, and `delinks.txt` still points at the original
  `.s` file. The parked-list entry was correct; the "cracked it" line
  was a stale or misattributed claim in the agent's own prose, not a
  real result — consistent with the round's activation-invariant count
  (26 == 26 == 26, not 27) already confirmed independently. This is the
  same class of self-report unreliability the round's other three
  incidents showed: check ground truth, don't average the two claims
  or trust the more optimistic one.

## Verification

- `check_activation_invariant.py 1050e7b5f..HEAD`: OK — 26 `.c` added
  == 26 `.s` deleted == 26 delinks activations.
- `check_delink_dupes.py`: OK — 81 `delinks.txt`, no duplicate `.text`
  addresses.
- `gate3.py --scope all --clean`: run ONCE on this consolidated branch
  — all three regions SHA1 PASS.
- Candidate pool C-32-screened twice (targeted grep against a 170-item
  pre-screen buffer, 4 genuine hits caught and excluded; cross-checked
  against a full-region `predict_walls.py` scan, zero additional hits),
  plus the standing exclusion list for C-61's already-generalized
  residual (no re-selections this round).
- Every batch's branch and commit independently verified via `git log`
  before its results were recorded, given this round's dispatch
  incident — no batch's report was taken at face value without a
  direct check.

## What this suggests for future targeting

C-66 is resolved enough that it can go into the standard verbatim
dispatch-prompt lever set starting next round, the same way C-55/
C-44/C-63/C-64/C-65 are now handled. C-65's load-vs-store asymmetry is
still open with one new adjacent data point; not yet at the volume C-66
reached. The dispatch-infrastructure question (why 4 of 5 agent
sessions started in the wrong directory) is worth investigating
directly before the next round if it recurs — this round's enforcement
caught it cleanly with zero cost beyond one extra message exchange per
batch, but a fix at the source would remove even that overhead.
