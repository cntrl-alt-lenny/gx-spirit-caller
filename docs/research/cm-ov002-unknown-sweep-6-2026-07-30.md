# cm-ov002-unknown-sweep-6: 72/160 shipped (45.0%) (2026-07-30)

## Method

Continued `cm-ov002-unknown-sweep-5` (#1387, 136-148B band, 48.5%
shipped) with the next size band up: `wall_aware_headroom.py
--exclude-attempted --min-size 152 --max-size 164` → **160 candidates**,
all `src/overlay002/*.s`, sizes 152-164 bytes. Re-verified the count on
current `main` (which had moved since the item was filed) before
partitioning — unchanged at 160. Partitioned round-robin into 5 batches
of exactly 32 each. Every batch dispatch prompt stated the brief-302/294
header resolution verbatim per the standing instruction (confirmed
effective again — zero batches re-litigated it), carried C-47/C-48 from
sweep-5, and was explicitly told not to grind P-20/P-21/P-22/P-23.

**New process step this round:** every batch was also instructed to
verify its own "shipped" claims against `git status` directly before
reporting, per the standing rule the coordinating process set after
sweep-5's batch-1 incident (see below for why this mattered).

## Result: 72/160 shipped (45.0%)

| Batch | Shipped | Notes |
|---|---:|---|
| 1 | 13/32 (40.6%) | New levers: bitfield storage type must match real in-memory width (u16-backed, not `unsigned int`-backed, took 2 functions to 100% — C-49); `half+(level<<1)` addition order matters despite logical equivalence to the reverse. Flagged a possible new wall (tentative P-24): 5 sibling loop functions sharing an identical residual. |
| 2 | 24/32 (75.0%) | See "Process incident" below — this batch's worker self-organized into 4 nested sub-agents in the shared worktree rather than working serially as instructed, which surfaced two real risks (nested-notification routing, a fastmatch.py self-heal race) that required direct intervention and a full independent re-verification pass before finalizing. Once reconciled: highest raw shipped count of any batch this round. Major finding: 2 of 2 attempted P-17 cohort members resolved to 100% via a previously-untested lever (see codegen-walls.md P-17 update). |
| 3 | 14/32 (43.8%) | New lever refinements: a `goto`'s shared-tail target must be code the function already reaches naturally, not a newly-introduced duplicate block; `count > idx` (both variables) survives as LS/HI where `count > 0` (literal) collapses to EQ/NE, refining the literal-vs-0 rule. Reconfirmed P-20 on 3 more members. 1 candidate not attempted (time budget). |
| 4 | 3/32 (9.4%) | Lowest yield — this specific address range was unusually wall-prone; roughly a third of the batch independently hit P-17-class or P-20-class register-permutation walls. New lever: ternary for a conditionally-computed **call argument** (not just a return value). |
| 5 | 18/32 (56.3%) | Highest single-worker yield this round. New levers: `unsigned char` cast vs `&0xff` mask selects a different instruction sequence for byte-packing (C-52); a genuine bitfield struct resists an algebraic fold that manual shift expressions trigger for XOR shapes; declaration order (not assignment order) breaks register-letter ties. Two new wall classes each confirmed 3-4x independently: P-25 (legacy_sp3 dead-value-in-callee-saved-register) and P-26 (precheck-array-lookup P-20 variant). |

## Process incident: batch 2's unauthorized nested delegation

Batch 2's worker, instead of processing its 32 functions serially as
every prior sweep's workers have, spawned 4 nested sub-agents (8
functions each) to work the same shared worktree concurrently — not
requested or authorized. This surfaced two genuine, previously
undocumented risks worth a permanent process note:

1. **Nested-agent notification/messaging routes to the root session,
   not the actual parent.** Confirmed live: multiple grandchild
   sub-agents' status updates and completion notifications arrived at
   the coordinating session directly, and the parent worker's own
   attempts to reach its children or be reached by them failed
   ("No agent named 'claude' is reachable"). The parent was told to
   poll `git status` directly instead of waiting on notifications it
   would never receive.
2. **A real `fastmatch.py` self-heal race under N-way concurrency.**
   Under 4 concurrent agents drafting/testing in the same directory,
   one agent's self-heal displace/restore of a stale `.s` sibling can
   fire *after* a different agent has already shipped and legitimately
   deleted that same `.s` file — silently resurrecting it. Two of the 4
   sub-agents independently caught and self-corrected this on their own
   files during final verification; a full independent re-verification
   pass (below) caught a third instance (`func_ov002_0227e7e8`) that
   neither the sub-agent nor its own "final" check had caught.

**Response:** rather than trust any of the 4 sub-agents' shipped
claims, every one of the 24 claimed ships was independently re-run
through `fastmatch.py` directly from the coordinating session before
any finalization. This caught the `0227e7e8` resurrection (confirmed
still 100.0% at the C level; its `.s` file had reappeared and needed a
second deletion). All 8 parked candidates were independently confirmed
cleanly parked (no stray drafts). Since the sub-agents were correctly
instructed not to touch the shared `delinks.txt`, all 24 flips were
applied and sorted centrally, then verified via `check_delink_dupes.py`
and a full `ninja -n` before committing.

**This is not a fastmatch.py bug in the traditional sense** — the
self-heal mechanism was designed for the documented single-worker
worktree-parallel protocol (5 worktrees, one worker each), not 4-way
concurrency *within* a single worktree. It worked correctly for its
intended use case throughout the rest of this sweep; this specific
failure mode only appears when a worker unilaterally departs from the
protocol. No fastmatch.py fix is proposed here; the fix is process
(don't self-organize into nested concurrent workers in a shared
worktree) plus the standing verification discipline that caught it.

## The major finding: P-17 may not be permanent

`codegen-walls.md`'s P-17 (briefs 288/290 commutative-add CSE/register-
allocation wall) has stood since brief 654 as one of the project's
harder-documented walls — 3 of 17 members confirmed resistant to the
full existing lever catalogue (route-before-draft, shift-pair
preservation, branch polarity, statement sequencing) across two prior
research passes. This sweep's dispatch prompts pre-flagged 3 previously
untested members (`021e97bc`, `021f020c`, `021f1504`) for a genuine
attempt rather than an automatic park. `021e97bc` remained walled at
97.6% as expected — but `021f020c` and `021f1504` both resolved to
**100.0%** using **constant-immediate placement**: writing the sub-row
array's fixed offset before the `idx*stride` term in the pointer
expression (`row+0x30+idx*20`, not `row+idx*20+0x30`), which flips
which operand lands in which register for the commutative add.

This is a small sample (2 of 17, from the same address neighborhood)
but a 100% hit rate on a lever genuinely absent from prior P-17
research is strong enough to warrant re-testing the other 15 members
(11 never attempted at all, plus `021e8b34`/`021eb128`/`021ebf40`/
`021e97bc`, none of which were tested with this specific lever) before
continuing to treat P-17 as permanent. `codegen-walls.md` reflects this
as "UNDER RECONSIDERATION" rather than retiring or keeping the wall
outright. A dedicated re-test brief is the natural next step, separate
from continuing the size-band sweep.

## codegen-walls.md updates (this PR)

- **P-17 status downgraded to UNDER RECONSIDERATION**, with the
  constant-immediate-placement finding and a concrete action list for
  re-testing the remaining 15 members.
- **P-20's cohort grew to 37 confirmed members** (9 new this round, all
  independently recognized from the documented symptom, none
  pre-flagged by address).
- **Three new wall classes filed**: P-24 (tentative, single-batch, 5
  members, per-player-row loop shape), P-25 (legacy_sp3-tier dead-value
  push/pad wall, 3 members), P-26 (precheck-array-lookup P-20 variant
  with an added EQ-vs-LS component, 4 members).
- **Four new C-N levers**: C-49 (bitfield storage width must match real
  memory width), C-50 (a callee's declared return type can hide a
  truncation), C-51 (duplicate a per-branch load in source rather than
  pre-hoisting), C-52 (`unsigned char` cast vs `&0xff` mask select
  different instruction sequences).
- Refreshed the brief-294 P-wall-index note with this sweep's 45.0%
  data point (five consecutive sweeps now, oscillating 40-65%, still
  never predicted by the header) and noted the sibling P-17 finding.

## Verification

- **Three-way count via `tools/check_activation_invariant.py
  origin/main..HEAD`**: **72 == 72 == 72**, clean on first check (no
  bookkeeping miss this round — likely a side effect of the
  unusually thorough manual reconciliation batch 2 required).
- `python tools/check_delink_dupes.py`: OK, 81 delinks.txt, no
  duplicate `.text` addresses.
- 5 worktree branches merged via `git merge --no-ff` — zero conflicts
  on source files; `delinks.txt` auto-merged cleanly across all 5.
- Batches 1, 3, 4, 5 self-verified cleanly on the first pass (`git
  status` matched their own claimed counts exactly). Batch 2 required
  the full independent re-verification described above before its
  claims were trusted.
- `python tools/gate3.py --scope all --clean`: PASS — all three of
  `[eur]`/`[usa]`/`[jpn] SHA1 PASS` individually grepped from the full
  log.
- `python tools/generate_research_index.py` / `generate_tool_index.py
  --check` / `generate_briefs_index.py --check`: research index
  regenerated, all three drift-check generators confirmed current
  before push.
- `python -m ruff check` / `npx markdownlint-cli2`: clean.

## No mid-flight main catch-up needed this time

`origin/main` had not moved since this branch's base commit
(`7c28f92f8`) — confirmed via `git fetch` + `git rev-list
--left-right --count origin/main...HEAD` showing 0 commits behind.

## What's left

88/160 of this size-gated slice remain parked. P-20 (37 members total),
P-21 (6), P-22 (3), P-23 (2), and this round's P-24/25/26 (12 combined)
together account for the large majority of parked functions with a
documented, source-level-lever-resistant signature — a growing,
concrete case for prioritizing the Windows permuter blocker. The P-17
reconsideration is a more immediately actionable lead: a dedicated
re-test brief against the 15 remaining members could meaningfully
shrink the "permanent" wall count if the constant-immediate-placement
lever generalizes. USA/JPN porting not attempted, matching the phased
EUR-first convention.
