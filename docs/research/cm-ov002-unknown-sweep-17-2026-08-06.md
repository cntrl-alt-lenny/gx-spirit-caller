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

## The actual 5×20 dispatch, reconstructed precisely from the on-disk pool files

The PR's original "8 candidates double-dispatched" claim was imprecise
— written from memory rather than reconstructed from the actual pool
files each dispatch prompt was composed from. Redone properly here by
diffing every batch's real dispatched candidate list against the 5
`batchN.txt` files the pool-building script actually wrote to disk.

**Root cause, both effects: after rebuilding the pool to add the
P-wall exclusion pass (`build_pool2.py`, which rewrote all 5
`batchN.txt` files), batch 2's, 3's, and 4's dispatch prompts were
each composed by reading the CORRECT rebuilt file — but shifted 4
lines forward: each batch's actual dispatch was `batchN.txt[4:20]`
(its own true last 16) plus `batch(N+1).txt[0:4]` (the next batch's
true first 4), not `batchN.txt[0:20]` as intended.** Batch 1 was
different again: composed from the PRE-rebuild draft still held in
context, never re-read from the final `batch1.txt` at all. Batch 5,
having no "batch 6" to borrow from, was padded with 4 hand-picked
"filler" entries that (also from stale context) duplicated 4 of
batch 1's actual candidates instead.

**Net effect, fully reconciled against the 5 on-disk `batchN.txt`
files:**
- **4 candidates were genuinely double-dispatched** (batch 1 and
  batch 5 both worked them): `0224dafc` (parked 5.0% batch 1, parked
  38.5% batch 5), `0228c924` (parked ~10% batch 1, parked 12.8%
  batch 5), `021ee668` (parked 97.4% batch 1 — the closer attempt,
  parked 56.4% batch 5), `021bbc68` (parked 32.5% batch 1, but
  **shipped** by batch 5 — a genuine case of a second independent
  attempt succeeding where the first didn't). No merge conflicts
  resulted from any of the four, since a park is a no-op relative to
  base state.
- **The batch-1/batch-2 overlap the PR originally flagged was a false
  alarm, exactly as batch 2 reported when asked mid-task.** Batch 1's
  actual dispatch (built from the pre-rebuild draft) happened to
  include the same 4 addresses that are `batch2.txt`'s true first 4
  (`021b1e80`, `021edd4c`, `021eef88`, `021f40f4`) — but batch 2's
  *actual* dispatch, per the 4-line shift above, started at
  `batch2.txt[4]`, never touching them. Zero actual overlap; batch 1
  covered these 4 alone.
- **2 off-pool candidates were attempted that should have been
  excluded entirely**: `02249a54` (parked 2.5%) and `0224d818`
  (parked 69.2%) were both already-known P-wall members present only
  in the pre-rebuild draft batch 1 was accidentally dispatched from —
  the P-wall exclusion pass had correctly dropped them from the final
  pool. Both were recognized and parked fast by batch 1 per the
  dispatch prompt's own "recognize and park fast" guidance, so no real
  investigation time was lost, but they don't belong to the round's
  100-candidate tranche and are logged in `attempts.tsv` as such.
- **4 candidates nominally in batch 5's true pool were actually
  covered by batch 4** (`02287024`, `02294d5c`, `02296814`,
  `022b13ec` — the 4-line-shift borrow described above). This is a
  relabeling, not a duplication or omission: all 4 were attempted
  exactly once, just by a different batch's worktree than the
  pre-dispatch plan intended.
- **6 candidates from the true 100-candidate pool were never attempted
  by anyone**: `02251b14`, `0225680c`, `02280ad8`, `02286ae8`,
  `0229230c`, `022b2660` — batch 1's true rightful last 6 (all 156B),
  silently dropped when batch 1 was dispatched from the pre-rebuild
  draft instead. This is the one real gap against the "100-candidate
  tranche" framing: **94 of the 100 planned candidates were actually
  attempted**, not 100.

None of this affects the shipped total (42, independently verified via
`check_activation_invariant.py` against the real merged diff) or the
park verdicts recorded in `attempts.tsv` — every actual attempt this
round, including the 2 off-pool ones and both sides of the 4 genuine
duplicates, is logged as its own row (58 park rows total, matching
100 - 42 shipped exactly, since the double-counted addresses and the
off-pool extras net out against each other in that arithmetic).

### The actual per-batch partition

| Batch | Candidates actually worked (20 each) |
|---|---|
| 1 | `021bbbc0` `022029e0` `0224dafc`\* `0228c924`\* `021bbc68`\* `021ee668`\* `021eecd8` `0220bd20` `0220d558` `02227c4c` `02228418` `022327b8` `02232c84` `02246ecc` `02249a54`† `0224d818`† `021b1e80` `021edd4c` `021eef88` `021f40f4` |
| 2 | `021ff87c` `022013d4` `0220d638` `022101c4` `0221454c` `02216e9c` `02240a10` `02243508` `0224a28c` `0224f024` `02271608` `02286ed4` `022942d0` `02296048` `022ae374` `021ba38c` `021c1a2c` `021d7268` `021f03d4` `021f2710` |
| 3 | `0220c320` `02214aa0` `0222d2f8` `0222ffc0` `0223965c` `022499b0` `0224fe84` `02251f70` `02257888` `021aeb5c` `021b9000` `021cd64c` `021cd6f4` `021ea10c` `021ed090` `021eddec` `021f3000` `02201614` `0220aad0` `0220c0b8` |
| 4 | `0220cc98` `02212fbc` `0221b5ac` `0223d144` `02244b08` `02249268` `0224a1e4` `0224b0b0` `0224c0b8` `0224e0dc` `02250498` `02253000` `02263858` `0226df90` `02280794` `02283bc8` `02287024`‡ `02294d5c`‡ `02296814`‡ `022b13ec`‡ |
| 5 | `021b1fe8` `021bcd80` `021be2d8` `021d16f8` `021d7054` `021ebddc` `021eed74` `021ef41c` `021f9190` `02203a40` `02208bfc` `02209d04` `0221be00` `0222054c` `02220e54` `0222742c` `0224dafc`\* `0228c924`\* `021bbc68`\* `021ee668`\* |

\* = one of the 4 genuinely double-dispatched (batch 1 + batch 5).
† = one of the 2 off-pool extras (already-known P-wall members,
recognized and parked fast, not part of the true 100-candidate pool).
‡ = nominally batch 5's true pool, actually covered by batch 4 (no
duplication — see above). Never attempted by anyone: `02251b14`,
`0225680c`, `02280ad8`, `02286ae8`, `0229230c`, `022b2660`.

## Process lesson: verify a dispatch prompt's candidate list against the on-disk pool file, every time, immediately before sending

Both issues in this section trace to the same root cause: composing a
dispatch prompt from context held before a mid-session pool rebuild,
rather than re-reading the file the rebuild actually wrote. This is
now the second time this exact class of mistake has occurred in this
campaign (after sweep-15's worktree-location mismatches, a different
symptom of the same underlying discipline gap) — a strong signal that
"re-verify against the actual file on disk, immediately before using
it, every single time, no matter how recently it was read" needs to be
a literal checklist step before composing any dispatch prompt from a
freshly-rebuilt artifact, not something assumed to carry over
correctly from an earlier read in the same turn.

## 21 orphaned `.s` files across 3 of 5 batches

Batch 4 independently discovered and fixed a real latent bug: the
standard ship workflow (write `.c`, flip `delinks.txt`, verify)
doesn't delete the superseded `.s` file, and once both a `mwasm .s`
rule and a `mwcc .c` rule exist for the same output path in a
regenerated `build.ninja`, a full `ninja` build (not `fastmatch.py`'s
isolated per-TU build) fails with "multiple rules generate
build/.../X.o". Batch 4 fixed its own 10 ships; batches 1, 3, and 5
(21 files total) did not, since they had no way to know about batch
4's mid-session discovery. Caught during consolidation via a full
audit of every one of the round's 42 shipped functions (not trusted
from any individual batch's diff — `check_activation_invariant.py`
first reported 42 `.c` added but only 31 `.s` deleted, which is what
triggered the audit), fixed in two cleanup commits before gating.

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
- `wall_aware_headroom.py --json --exclude-attempted --min-size 149
  --max-size 512`, ov002 `candidate` count: **1,272 before this round
  → 1,176 after** (both figures from a fresh run against the branch,
  not carried from an earlier session), a drop of 96 — the 42 shipped
  plus the net-new unique addresses this round's `attempts.tsv` rows
  cover in-band.

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
