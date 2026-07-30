# cm-ov002-unknown-sweep-5: 96/198 shipped (48.5%) (2026-07-29)

## Method

Continued `cm-ov002-unknown-sweep-4` (#1384, 124-132B band, 40.7% shipped)
with the next size band up: `wall_aware_headroom.py --exclude-attempted
--min-size 136 --max-size 148` → **198 candidates**, all `src/overlay002/*.s`,
sizes 136-148 bytes. Re-verified the candidate count on current `main`
(`ec1d367b2`, which had moved since the item was filed due to unrelated
cross-region port work) before partitioning — unchanged at 198.
Partitioned round-robin (by ascending address) into 5 batches of ~40,
same WORKTREE-PARALLEL SWEEP PROTOCOL as the prior four sweeps.

**New this round:** every batch dispatch prompt stated the "brief 302/294
header is mechanical boilerplate, not a per-function verdict" resolution
outright, per explicit instruction — no batch spent time re-deriving it
this time. Two known-wall members were pre-flagged to their batches
(`021e8b34` and `021eb128`, both confirmed P-17 cohort members) with
instructions to sanity-confirm rather than re-grind, and all batches were
told not to grind P-20 (`(player&1)*0x868`) members if encountered.

## Result: 96/198 shipped (48.5%)

| Batch | Shipped | Notes |
|---|---:|---|
| 1 | 19/40 (47.5%) | **Process note:** originally self-reported "9 shipped" while still mid-flight — verified via `fastmatch.py` but never executed the actual `.s`-delete/`delinks.txt` finalization steps, and had 23 more candidates in an unfinished state. Caught by checking `git status` directly rather than trusting the report; resumed with corrective instructions, individually re-verified every claimed match, and finished properly. New levers: `unsigned char` intermediate for `&0xff` mask steers `AND+LSL` over a redundant shift-pair; goto-shared-tail for 2-4-way same-constant guard chains involving calls (but a *different* return value in the chain must stay its own early-return). |
| 2 | 21/40 (52.5%) | Highest-yield batch. Sanity-confirmed `021e8b34` as the known P-17 member (97.2%, up from 72.2% on a broader lever set, same underlying wall) without re-grinding. New lever: ARM jump-table `pc+8` dispatch trap — index 0 targets the table's *second* row, not the first (took one function 8.6%→83.3%, see codegen-walls.md C-47). Found several new P-20 members. |
| 3 | 19/40 (47.5%) | Confirmed 5 new P-20 members. Identified two new wall classes: a "slot bit-manipulation register-pressure" wall (3 members) where the project's normally-reliable redundant `&1` remask lever actively backfires (codegen-walls.md P-22); a "pool-constant register-pairing" wall (2 members) distinct from P-20's own pairing (P-23). Confirmed `func_ov002_022b8430` needs `.legacy.c` routing (genuine Style A epilogue) though it still didn't converge past 0%. |
| 4 | 18/39 (46.2%) | Sanity-confirmed `021eb128` as the known P-17 member (25.0%, exact documented signature) without re-grinding. Confirmed 5 new P-20 members. Corroborated the call-result-direct-return lever independently (see C-48). Found a concrete data-layout fix: a sub-array needs 20-byte stride, not 4-byte struct-array stride. |
| 5 | 19/39 (48.7%) | Confirmed 1 new P-20 member (compounding with an independent second register swap). Identified a new "loop/field-extraction-variable register permutation" wall (6 members, codegen-walls.md P-21) distinct from P-20. New lever: union of a raw scalar and same-width bitfield to force a shift-pair over a manual mask, for byte-0-aligned fields. New lever: literal-pool slot assignment is sensitive to which statement runs first within a single branch, not just first-textual-occurrence in the function. |

**The rate is not monotonically declining.** 63.2% → 65.5% → 49.4% →
40.7% → **48.5%** — sweep-5 rebounded from sweep-4's low. This confirms
what the brief-294 note already argued: the decline tracks per-band
candidate composition, not a smooth exhaustion curve, and the "brief
302/294" header has never predicted the outcome either way.

## The header instruction worked

Every batch's dispatch prompt stated the header resolution verbatim this
round, per explicit instruction after sweep-4 found 2 of 5 batches
re-deriving it from scratch. Result: zero batches spent any reported time
re-investigating it this round — confirmed by all 5 reports explicitly
noting the header was treated as non-diagnostic per the brief, with no
framing of low yield as "this pool was pre-exhausted." Carrying resolved
process context forward into dispatch prompts, not just the lever list,
continues to be worth the extra prompt length.

## codegen-walls.md updates (this PR)

- **P-20's cohort more than doubled**: 11 → 28 confirmed members in a
  single sweep (17 new: 4 clean + 2 first-statement variant from batch 2,
  5 from batch 3, 5 from batch 4, 1 compound case from batch 5). Now one
  of the largest single wall classes found in ov002 — likely justifies
  prioritizing the Windows permuter blocker.
- **New P-21**: loop/field-extraction-variable register permutation, 6
  members, distinct from P-20 (broader family, no single shared idiom,
  match range 65-97% vs P-20's tight 87.9% floor).
- **New P-22**: slot bit-manipulation register-pressure wall, 3 members —
  flagged as a warning since the project's normally-reliable `&1` remask
  lever actively makes this shape worse.
- **New P-23**: pool-constant register-pairing wall on an `mla`'s two
  constant operands, 2 members, distinct pairing from P-20.
- **P-17 extended**: both pre-flagged members re-confirmed without
  re-grinding; 2 additional functions outside P-17's original surveyed
  address range (`021ece34`, `021f82b8`) show the identical single-
  instruction commutative-add symptom — flagged as a possible cohort
  expansion, not yet confirmed.
- **New C-47**: the ARM jump-table `pc+8` dispatch trap.
- **New C-48**: returning a call's result variable directly (not a fresh
  literal) elides a redundant `mov r0,#0` — independently found by 3 of
  5 batches this sweep, unusually strong corroboration for one lever.
- Refreshed the brief-294 P-wall-index note and
  [`brief-294-regalloc-wall-scout.md`](brief-294-regalloc-wall-scout.md)'s
  UPDATE section with this sweep's 48.5% data point.

## Verification

- **Three-way count via the new mechanized tool**: `python tools/check_activation_invariant.py origin/main..HEAD`
  caught a **real bookkeeping miss** — `func_ov002_02209c7c` (batch 3, a
  genuine 100% match) had its `.c` added and `.s` deleted, but the
  `delinks.txt` line was never flipped from `.s:` to `.c:`. Fixed in a
  dedicated commit; the tool then reported `96 == 96 == 96` OK. This is
  exactly the failure mode the tool exists to catch (the ROM would have
  still built byte-correct via the build graph's filename fallback,
  masking the bookkeeping drift from `ninja sha1`) — using the mechanized
  check instead of a manual `git diff` grep is what caught it this time.
- `python tools/check_delink_dupes.py`: OK, 81 delinks.txt, no duplicate
  `.text` addresses.
- 5 worktree branches merged via `git merge --no-ff` — zero conflicts on
  source files; `delinks.txt` auto-merged cleanly across all 5.
- No stray parked drafts this round — all 5 batches' own `ninja -n`
  pre-merge checks were clean (verified again post-merge, also clean).
- Every shipped function independently verified at 100.0% by its own
  worker via `fastmatch.py` before being reported shipped (batch 1's
  initial report was the one exception, corrected on resume as noted
  above).
- `python tools/gate3.py --scope all --clean`: PASS — all three of
  `[eur]`/`[usa]`/`[jpn] SHA1 PASS` individually grepped from the full log.
- `python tools/generate_research_index.py`: regenerated **before**
  pushing this time (PR #1384 landed a new research doc without this
  step and got blocked on `drift-check` as a result — fixed in a
  follow-up commit on `main`; this sweep does it up front instead).
- `python -m ruff check` / `npx markdownlint-cli2`: clean.

## No mid-flight main catch-up needed this time

`origin/main` had not moved since this branch's base commit
(`ec1d367b2`) — confirmed via `git fetch` +
`git rev-list --left-right --count origin/main...HEAD` showing 0 commits
behind. No catch-up merge, no conflict resolution needed.

## What's left

102/198 of this size-gated slice remain parked (documented per-batch
above and in each batch's own report). P-20 (28 members), P-21 (6
members), P-22 (3 members), and P-23 (2 members) together account for
39 of the 102 parks and are all permuter-shaped or otherwise
source-level-lever-resistant — a strong, growing case for unblocking the
Windows permuter lane. USA/JPN porting not attempted, matching the
phased EUR-first convention.
