# cm-ov002-unknown-sweep-17: full-scale worktree-parallel sweep, 42/100 shipped — the campaign's best round (2026-08-06)

## Purpose

Sweep-16 ran single-lane and stopped at 12 attempts / 3 ships — the
same ~25% rate as sweeps 13-15 (27/24/26 ships) — establishing that
the shortfall was scale, not yield. This round applied the
WORKTREE-PARALLEL SWEEP PROTOCOL at full scale for the first time
since sweep-15: an explicit 100-candidate tranche, 5 batch worktrees
of 20, same 149-172B ov002 band, one consolidated gate. Two mini-items
ran first, single-lane, as a canary before any batch worktree was
created.

## Result: 42/100 shipped, 6,960 bytes — best ship rate this campaign

| Batch | Shipped | Bytes | Notes |
|---|---|---|---|
| 1 | 3/20 | 472 | Discovered a substantial parallel "hard-tier retriage" research effort (`docs/research/retriage/`, `docs/research/dossiers/`) this session hadn't previously cross-referenced |
| 2 | 11/20 | 1,768 | Best single batch; extensive C-63/C-65 refinements |
| 3 | 6/20 | 992 | C-67 generalization to block dispatch; identified 2 recurring open wall families |
| 4 | 10/20 | 1,680 | New P-29 wall family (eager MLA fusion, 6 instances); caught a real .s-cleanup tooling gap |
| 5 | 12/20 | 2,048 | 3 new bitfield/operator-sensitivity findings; 2nd P-25 and P-20 confirmations |
| **Total** | **42/100** | **6,960** | Previous best was sweep-12 at 40/100 |

Mini-items (single-lane, before batch dispatch): 0 additional ships
(all 6 targets parked), but resolved 3 open questions from the prior
round's OBSERVED note and promoted 2 findings to numbered P-wall
entries (P-23 upgraded from provisional to confirmed; P-27 created).

## Mini-item A (canary) — one shared symptom, three different outcomes

Re-attempted the 3 row-pointer `mla` register-swap parks
(`func_ov002_0224bd3c`, `func_ov002_021f058c`, `func_ov002_021eba34`)
flagged together in sweep-16's OBSERVED-NOT-CONFIRMED note, using the
one untried variant (a C-63 bitfield-typed intermediate). The result
separated the three into what they actually were:

- **`func_ov002_021eba34`** is an already-documented **P-20** member —
  landed at the identical 76.3% sweep-6 recorded for it in 2026-07-30.
  Should have been recognized and parked on sight; the note that
  flagged it didn't cross-reference the P-wall catalogue.
- **`func_ov002_0224bd3c`** is a genuinely new **P-23** member —
  promoted from provisional (n=2) to confirmed (n=3), with the most
  exhaustive single-member variation coverage in the catalogue (7
  restructurings combined across this round and sweep-5).
- **`func_ov002_021f058c`** was not the same wall at all. A genuine
  C-63 extension (idx-stride-0x14 struct array) plus a C-55 goto fix
  took it from a 39.5% park to **97.4%**, parked one word short on an
  unrelated commutative-`add` operand-order residual.

## Mini-item B — post-call scheduling family promoted to P-27

Fresh attempts on 3 near-miss parks flagged by sweep-16's OTHER
OBSERVED note (`func_ov002_021d1158` 99.3%, `func_ov002_022a8190`
95.0%, `func_ov002_02299c9c` 92.1%) reproduced the documented
call-adjacent scheduling resistance and found a 4th independent
manifestation within `02299c9c` itself. Promoted to **P-27** (a
family, not one mechanism — branch-vs-predicate, instruction-block
reordering, and pool-constant materialization all show the same
"immediately after a call, source restructuring stops working"
character). None of the 3 re-attempts beat their previously-recorded
high-water marks (independent reconstructions landed lower: 87.2% vs
99.3%, 71.8% vs 92.1%; the third, `022a8190`, matched its 95.0%
exactly) — reported honestly rather than claimed as improvements.

## Full-scale sweep — pool construction

`wall_aware_headroom.py --json --exclude-attempted` returned 1,272
candidates in the 149-512B band after excluding `attempts.tsv`'s known
set. Two additional exclusion passes were applied before selecting the
top 100 by size:

1. **Doc-scan**: every function address named in
   `cm-ov002-unknown-sweep-9` through `-15`'s research docs (29
   addresses, 20 in ov002).
2. **P-wall catalogue scan**: every address mentioned anywhere in the
   `## Permanent P-wall index` section (116 addresses) — this caught
   46 candidates the doc-scan alone missed, including several already
   4+ rounds deep into an existing P-wall (P-20/P-24/P-26 members from
   sweep-4 through sweep-6, predating `attempts.tsv`). **This
   cross-check is the highest-value new step this round** — a naive
   pull would have wasted real dispatch slots re-confirming
   already-catalogued walls.

C-32 cross-overlay-BL screening ran on the resulting pool: zero hits
(plausible for this size band; smaller self-contained helpers rarely
reach into another overlay).

## Two dispatch mistakes, both caught and corrected transparently

**Stale pool data used for batch 1 and part of batch 5.** After
rebuilding the candidate pool to add the P-wall exclusion pass, batch
2 through 4's dispatch prompts were composed from a fresh re-read of
the rebuilt files; batch 1's full list and 4 "filler" entries added to
batch 5 were composed from the PRE-rebuild data still in context,
without re-verifying against the files actually written to disk. Net
effect: 4 candidates were dispatched to both batch 1 and batch 2 (all
4 already-completed park-vs-park, no conflict — flagged to batch 2
mid-task via `SendMessage`, confirmed no actual overlap with its real
list), and 4 more were dispatched to both batch 1 and batch 5's
"filler" (real duplicate work: `0224dafc` and `0228c924` both parked
by each batch independently at different match percentages, `021bbc68`
was PARKED by batch 1 (32.5%) but SHIPPED by batch 5 — a genuine
example of a second independent attempt succeeding where the first
didn't — and `021ee668` was parked by both at 97.4% (batch 1, closer)
and 56.4% (batch 5)). No merge conflicts resulted, since a park is a
no-op relative to base state; the only cost was some duplicated
effort, partly offset by the `021bbc68` recovery.

**21 orphaned `.s` files across 3 of 5 batches.** Batch 4 independently
discovered and fixed a real latent bug: the standard ship workflow
(write `.c`, flip `delinks.txt`, verify) doesn't delete the superseded
`.s` file, and once both a `mwasm .s` rule and a `mwcc .c` rule exist
for the same output path in a regenerated `build.ninja`, a full `ninja`
build (not `fastmatch.py`'s isolated per-TU build) fails with
"multiple rules generate build/.../X.o". Batch 4 fixed its own 10
ships; batches 1, 3, and 5 (21 files total) did not, since they had no
way to know about batch 4's mid-session discovery. Caught during
consolidation via a full audit of every one of the round's 42 shipped
functions (not trusted from any individual batch's diff), fixed in two
cleanup commits before gating.

## Lever findings — the round's major confirmations and extensions

**C-63 (row-table addressing)** got three real refinements: an
idx-stride-0x14 struct-array extension (mini-item A) closed
`021f058c` to 97.4%; batch 3 found the struct-array fix alone isn't
sufficient for scheduling — the stride multiply needs its OWN early
statement, separately; batch 5 found that when a row combines a
constant sub-offset with a variable-scaled index, the constant must be
added BEFORE the multiply term in source order to match target's `add`
operand order. All three apply together, not as alternatives.

**C-65 (loop strength reduction)** moved from "isn't guessable, try
array-indexing" to two concrete counter-recipes: array-indexing for
the non-reduced case (as before), typed-pointer-then-increment for a
genuinely strength-reduced case (batch 2's `0224a28c`/`0224f024`
twins) — plus evidence the outcome can differ between two related
index computations in the SAME function (`021ba38c`). Also confirmed
the LS-vs-EQ recipe holds even when the loop bound is reassigned from
a different symbol mid-loop (batch 2).

**C-66 (redundant and)** got a real extension, independently
confirmed twice in one round (batches 4 and 5, no cross-talk): the
same "already-provably-0/1 gets its mask elided" mechanism also
strikes `orr`-based bit-packing, not just `mul`/`mla`.

**C-55 (branch-to-block polarity)** got three refinements: applies to
a single plain equality guard, not just if/else-if or shared tails
(batch 1, 4 confirmed instances in one function); applies per
early-return, not per-function — one guard can need goto while a
sibling in the same function correctly stays predicated (batches 2 and
5 independently); and a genuine counter-example where plain if/else
beats goto for the identical control-flow graph (batch 4) — when goto
doesn't move a residual, try removing it entirely before concluding
the function is walled.

**C-67 (switch-on-equality)** moved from single-instance to confirmed
and generalized: resolves full block dispatch (different call
sequences per arm), not just value assignment, including a case where
the `switch` restructure reproduced an entire 4-arm branch structure
byte-for-byte with only an unrelated residual left (batch 3).

**C-56 (declaration order)** got a 3rd confirmation, two independent
fixes in one function (batch 3) — not a new lever, corrected in place
after batch 3 characterized it as new without checking the catalogue
first.

**Two new entries**: **C-68** (a PerPlayerRowTable row's split 9-bit
id is reconstructed by ADD across two disjoint bit ranges, not OR —
4 recurring instances, batch 1) and **C-69** (the exact C operator/cast
used to reach a bitfield member controls codegen independent of the
resulting value — `x--` vs `x = x-1`, and an explicit narrowing cast
that's actively harmful rather than merely redundant — 2 instances,
batch 5).

**P-wall catalogue**: P-20 (+1, 38th confirmed member), P-25 (+1, 4th
confirmed member), P-26 (+5 new unique members, corrected a
mischaracterization where 3 batches independently rediscovered this
already-9-member-strong wall as a fresh "open C-64 contradiction"
without checking the catalogue first — now the round's second
instance of that exact failure mode, after mini-item A's P-20/P-23
mix-up), and two new tentative entries: **P-28** (a broader
register-mirror family than P-20/P-23's literal `mla`-operand shape,
proposed independently by 3 batches, 16 members) and **P-29** (an
eager-`mla`-fusion wall distinct from register-identity issues
entirely, flagged for RE/permuter attention, 7 members, single batch).

## Verification

- `check_activation_invariant.py 760b32c75..HEAD`: OK after cleanup —
  42 `.c` added == 42 `.s` deleted == 42 delinks activations.
- `check_delink_dupes.py`: OK — 81 `delinks.txt`, no duplicate `.text`
  addresses.
- `gate3.py --scope all --clean`: all three regions (eur/usa/jpn) SHA1
  PASS, run once on the fully consolidated branch, confirmed safe to
  run (no other lane compiling) before starting.
- All 5 worktrees verified via their own mandatory first-step
  `pwd`/branch self-check before any candidate work began; no
  dispatch-location mismatches this round (unlike sweep-15's 4-of-5
  incident) — the stale-pool-data mistake above was a candidate-list
  problem, not a worktree/branch problem.

## What this suggests for future targeting

The worktree-parallel protocol at full scale validated decisively:
42% ship rate vs. sweep-16's single-lane 25%, confirming the shortfall
really was scale, not yield — the accumulated lever set (C-44 through
C-69, 24 live P-walls) is now mature enough that most candidates in
this band resolve to either a known recipe or a known wall quickly.
Two process lessons stand out for next round: (1) **re-verify
dispatch-prompt candidate lists against the actual on-disk pool file
immediately before sending**, not from context held before a
mid-session pool rebuild — this is now a 2-for-2 pattern (sweep-15's
worktree mismatches, this round's stale candidate lists) of "verify
against ground truth right before the dispatch, not from memory of an
earlier step"; (2) **the P-wall catalogue and the newly-discovered
retriage/dossier corpus are both underused as pre-dispatch
cross-references** — three separate rediscoveries of already-known
walls this round (P-20/P-23's mini-item A mix-up, P-26's 3-batch
rediscovery, batch 1's declaration-order-vs-C-56) all would have been
caught by a `grep` against the catalogue before writing up a "new"
finding. Worth considering whether a future dispatch prompt should
include a mandatory "grep the P-wall affected-picks lists for this
address before treating a residual as novel" step.
