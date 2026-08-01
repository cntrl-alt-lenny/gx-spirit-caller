# cm-ov002-unknown-sweep-14: two real process incidents, both recovered without data loss (2026-08-01)

## Purpose

Same protocol as sweep-9 through sweep-13: plain, module-agnostic
selection across 149-512B, 5 worktrees, `ninja delink` in setup, one
consolidated gate. New this round, per explicit instruction: any lever
independently rediscovered twice goes into the dispatch prompt
verbatim rather than waiting for a third rediscovery — C-55 (with its
sweep-13 backfire caveat), C-44 (with its broadened non-jump-table
scope note), and C-64 (with its specific `for`-loop tell) were all
quoted in full in every dispatch prompt this round. A cheap-close
attempt on `func_ov002_0220ad78` (98.4%, flagged as closable with the
known C-64 fix) was made directly before dispatch.

## Result: 24/100 shipped, 4,968 bytes

| Source | Shipped | Bytes | Notes |
|---|---|---|---|
| Direct (`func_ov002_0220ad78`) | 0/1 | 0 | Guard/loop mechanism transferred cleanly; new, distinct residual surfaced and resisted 5 variations — reverted |
| Batch 1 | 3/20 | 672 | Correct branch; new finer-grained register-scramble sub-pattern found |
| Batch 2 | 4/20 | 984 | Agent crashed before reporting; work recovered and verified independently |
| Batch 2b (follow-up) | 4/16 | 752 | Covers batch 2's un-reported remainder |
| Batch 3 | 4/20 | 860 | Landed on the wrong branch (see incident below); recovered intact |
| Batch 4 | 3/20 | 512 | Correct branch; new C-55 extension found |
| Batch 5 | 6/20 | 1,188 | Correct branch; absorbed batch 3's misplaced commit cleanly |
| **Total** | **24/100** | **4,968** | |

This is the lowest ship count since sweep-9, driven almost entirely by
the two process incidents below costing real time and by batch 2's
crash directly reducing that batch's coverage — not by the candidate
pool being unusually hard.

## The cheap close: mechanism transferred, a new residual surfaced

Applied C-64's known for-loop fix directly to `func_ov002_0220ad78`
before dispatching anything. The core mechanism transferred exactly as
predicted: all 4 preceding guard clauses matched immediately, and
rewriting the trip-count check as a bare `for` loop (with the bound
reassigned mid-loop to a second table's value, matching C-64's
two-table shape) reproduced the target's `LS` condition code on the
first try. But a new, separate residual surfaced: the real target has
a redundant `and rN, rN, #1` immediately before a `mul`/`mla`, at 2
symmetric sites (the initial table lookup and the loop continuation
re-test), that 5 tested variations did not reproduce — direct bitfield
member access, a cached local variable, array-indexed table access, a
dead-store reuse, and full preceding-context reproduction via
standalone `mwccarm` compilation (matching the method that resolved
C-64 itself). Reverted via `park_one.py` rather than ship a partial
match. This is a real, precisely-bounded, currently-unresolved
question — not a failure of C-64's mechanism, which is independently
confirmed working. Flagged for a future dedicated pass. (One dispatched
batch also hit this same function independently and reconfirmed the
identical wall, with no additional progress — consistent, not new
information.)

## Two real process incidents this round, both caught and recovered without data loss

**Incident 1 — a queue-file edit landed directly on `main`, mid-round
too.** Before this: after syncing to `origin/main` at the start of the
round, a `git commit` immediately following (without creating a
working branch first) landed on shared `main`. Caught immediately;
did not force-push or rewrite `main` (a worse action than the mistake
itself) since the content was a low-risk documentation edit that would
have reached `main` anyway. Created the proper branch from that point
forward. Separately, the SAME header — written as `id [S]` with no
title/em-dash before the bracket — turned out to be invisible to
`work_queue.py`'s own parser, caught by `test_work_queue.py`'s
malformed-header test. Root cause, now fully understood: `[S]` was
**never** a valid status marker on its own (`STATUSES` only recognizes
`TODO`/`CLAIMED`/`DONE`/`PARKED`) — every prior round's `[S]` only
appears bundled alongside a real `[DONE]` tag added at completion,
where it's swallowed as trailing title text, not read as a second
status. The actual in-progress marker should always be `[TODO]`.
Corrected and reconfirmed passing before commit.

**Incident 2 — two dispatched agents collided in one worktree.** The
agent launched for batch 3 (real assignment: `func_ov002_021bf2a4`,
`func_02031470`, and 18 others) reported finishing, but its own report
said it committed to `claude/cm-ov002-unknown-sweep-14-batch5` — the
wrong branch for its assignment. Verified directly rather than
assumed: `claude/cm-ov002-unknown-sweep-14-batch3` had no commit at
all (still at its base); `claude/cm-ov002-unknown-sweep-14-batch5` had
a commit whose shipped-function list matched batch 3's real assignment
exactly, not batch 5's. Checking the live batch-5 worktree found
uncommitted changes for 3 of batch 5's own real candidates sitting on
top of that misplaced commit — the real batch-5 agent was still
actively working in the same directory. Did not touch that worktree
while another process might still be writing to it. The real batch-5
agent later finished, explicitly confirmed the same collision in its
own report ("a second, independent agent session was concurrently
dispatched to this same branch/worktree... it committed its own work
before I did; my commit sits cleanly on top with no conflicts"), and
its commit landed correctly stacked with zero conflicts. Net effect:
no work was lost — both 20-candidate assignments completed and are
both present on the `batch5` branch as two separate commits, merged
normally. The mislabeled agent itself noticed the anomaly and flagged
it as a suggested follow-up (a "concurrent writer" it couldn't
explain); once the real cause was understood, that suggestion was
withdrawn with an accurate explanation rather than left to describe a
non-existent external actor. Root cause of the original mix-up (how
the batch-3 agent ended up operating in batch-5's directory) remains
unknown — first occurrence in 14 rounds, not treated as a signal a
standing process change is needed yet.

**Incident 3 — batch 2's agent crashed before reporting.** Its final
message was corrupted, non-report text. Rather than treat the batch as
a total loss, checked its branch (no commit) and its live worktree
(uncommitted changes for 4 candidates) directly, independently
re-verified each of those 4 via `fastmatch.py` before trusting or
committing any of it, and treated the other 16 candidates as
completely unknown status — not assumed parked. Re-dispatched exactly
those 16 as a clean follow-up batch (batch 2b) rather than leaving a
gap or guessing.

## New levers and confirmations

**C-55 extension, precisely characterized (batch 4):** `goto` reliably
forces a real branch only when one arm is a genuine function exit — a
`return`. When both arms of an if/else instead rejoin at a shared
*loop-continuation* point, `goto` does not reliably suppress
if-conversion; converting the same logic to a `switch` (even with only
2-3 case values, no jump table needed) does. Also: a `goto` target
label must sit at its exact original address position inline in the
function, not floated to the end or written as a separate
`fail: return X;` block, or it produces a duplicate epilogue instead
of sharing the real one. Added to C-55's entry in `codegen-walls.md`.

**C-65 (last round's loop-body strength reduction) got another
consistent data point (batch 2b):** an incrementing loop-induction
variable used only as `base + var*K` gets auto-strength-reduced by
mwcc unless the source computes it fresh from the loop counter each
iteration, rather than incrementing a running accumulator — the same
mechanism as C-65's load-side fix, on a different function.

**A finer-grained cousin of the register-scramble family (batch 1):**
several functions keep a value alive across multiple comparisons in an
unprotected scratch register (`r0`-`r3`/`lr`) with *no* intervening
calls, while the equivalent C lands the same logic in a different,
equally-valid register — distinct from the callee-saved-register
version this family usually shows.

**Bitfield-vs-plain-mask generalizes further (batch 2b):** the
struct-bitfield trick (forcing `lsl`/`lsr` extraction instead of
`tst`/`and`) works not just for single-bit fields but for multi-bit
(9-bit, 13-bit) and byte-sized fields too.

**Confirmed, not new:** the universal `.s`-file boilerplate header
(`"GLOBAL_ASM endgame, brief 302/294"`) was flagged by 2 more batches
as suspicious this round. Both correctly did not let it block real
work (one shipped 3/20, the other reconfirmed the header appears on
unrelated files project-wide) — the finding itself isn't new
(established in sweep-12/13), but the discipline of not treating it as
a stop sign held up again independently.

## Verification

- `check_activation_invariant.py c91a2d491..HEAD`: OK — 24 `.c` added
  == 24 `.s` deleted == 24 delinks activations.
- `check_delink_dupes.py`: OK — 81 `delinks.txt`, no duplicate `.text`
  addresses.
- `gate3.py --scope all --clean`: run ONCE on this consolidated branch
  — all three regions SHA1 PASS.
- Candidate pool C-32-screened twice (targeted grep against a 170-item
  pre-screen buffer, 2 genuine hits caught and excluded; cross-checked
  against a full-region `predict_walls.py` scan of all functions, zero
  additional hits) — plus an explicit exclusion list for functions
  already confirmed to hit C-61's generalized residual, per this
  round's instruction to stop re-attacking it.
- Every shipped function's byte size independently recomputed from
  `delinks.txt`'s own `.text` spans rather than trusted from batch
  reports, given two of six "batches" this round had corrupted or
  misattributed self-reporting.

## What this suggests for future targeting

`func_ov002_0220ad78`'s redundant-AND residual is a real, bounded,
currently-unexplained question distinct from anything else in the
catalogue — worth a dedicated standalone-compilation pass if it
recurs. C-65's load-vs-store asymmetry has now accumulated a 4th-ish
data point (this round's batch 2b finding is mechanistically the same
as the load-side fix, just on a different function) without yet
explaining the asymmetry itself. C-61's early AND/MUL residual was not
re-attacked this round per instruction, and no batch reported hitting
it — consistent with it being a settled, generalized, currently-closed
question rather than one still generating new evidence.
