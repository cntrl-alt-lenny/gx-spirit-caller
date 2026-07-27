# cm-ov002-unknown-sweep-3: 82/166 shipped (49.4%) (2026-07-27)

## Method

Continued `cm-ov002-unknown-sweep-2` (#1372, 92-104B band, 65.5% shipped)
with the next size band up: `wall_aware_headroom.py --exclude-attempted
--min-size 108 --max-size 120` → **166 candidates**, all `src/overlay002/*.s`,
sizes 108-120 bytes (4-byte-aligned boundary immediately above the prior
band). Partitioned round-robin (by ascending address) into 5 batches of
~33, same WORKTREE-PARALLEL SWEEP PROTOCOL as the prior two sweeps: 5
`git worktree`s (`sweep3-1..5`), each seeded with all 3 baseroms + toolchain
and independently configured/built/sha1-verified before dispatch, using
the fixed `fastmatch.py` from `q-fastmatch-sweep-friction` (#1368) and
`q-fastmatch-selfheal-inflight` (#1373) — both cherry-picked onto this
branch since neither had merged when this branch was created.

## Result: 82/166 shipped (49.4%)

| Batch | Shipped | Notes |
|---|---:|---|
| 1 | 22/34 (64.7%) | Highest yield. New levers: eager-load-before-unrelated-guard, `volatile` to defeat CSE on a re-read-per-store field, dispatch-order inversion on a recursive function, `flag=1; if (negated) flag=0;` idiom over direct `\|\|`. 10 of 12 parks share one "whole-function register-mirror" signature (byte-identical shape, only register names differ) — flagged as a good permuter target. |
| 2 | 14/33 (42.4%) | New high-value lever: real bitfield struct (`unsigned int id:13`) beats manual `(x<<19)>>19` for a 13-bit id idiom used throughout the module — mwcc otherwise canonicalizes the shift-pair into a literal-pool-constant-and-AND. Confirmed `unsigned x <= 0` still canonicalizes to EQ, not the original's `ls` condition code. |
| 3 | 13/33 (39.4%) | Lowest yield, still well above zero given every candidate carried the generic "brief 294 endgame" bulk-wall header. New levers: addition-operand order controls which of two shift masks gets pool-loaded vs. derived; keep a bitfield's raw and remasked values as two separate named variables when both get reused differently. |
| 4 | 16/33 (48.5%) | **Reversed brief-294's own "no C-level lever exists" verdict on 6 of its shipped functions** — brief-294 A/B-tested `register`/duplication/`volatile` and correctly found them inert, but never tested declaration order, which was the single most productive lever this batch (cracked 4 functions outright). Found a real ninja "multiple rules generate" build hazard from leaving parked drafts uncleaned (fixed before finishing). |
| 5 | 17/33 (51.5%) | New levers: typed intermediate variable blocks mwcc from folding away a "redundant" mask the original keeps; `switch` beats if-elseif even for non-contiguous value sets; re-reading `self->field` fresh at each call site (not caching) matters for register-allocation match. Isolated an unresolved puzzle: mwcc will not tail-call a trailing `return sink(...)` once any `for` loop precedes it, even when the loop's own codegen already matches. |

**All 166 candidates carried the identical bulk-stamp header**
("whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302)... reg-alloc-
walled functions with no C match (brief 294 endgame)") — every batch
independently confirmed via cross-checking non-candidate files that this
is mechanical boilerplate, not per-function proof (consistent with the
project's own "brief 651 rework" framing already in the queue header, and
with the two prior ov002 sweeps' identical finding).

## codegen-walls.md updates (this PR)

Added a note directly above the P-wall index clarifying that brief-294's
own A/B testing (`register`, expression duplication, `volatile`, all
correctly found inert on the call-in-loop shape) is real and stands, but
has been cited far more broadly than that narrow result justifies — the
same "mechanical bulk stamp, not per-function proof" failure mode already
documented for the sibling `GLOBAL_ASM`/brief-302 tag. Cross-referenced
with a matching UPDATE note appended to
[`brief-294-regalloc-wall-scout.md`](brief-294-regalloc-wall-scout.md)
itself, citing this sweep's concrete reversal rate (49.4%, on top of the
prior sweep's 65.5%) as evidence.

## A minor, separate fastmatch.py bug fixed

`python tools/fastmatch.py --help` crashed with `ValueError: unsupported
format character 'm'` — found independently by 2 of 5 batches. Root cause:
argparse's help formatter treats a bare `%` in a help string as the start
of a `%(...)s` substitution; `--verbose`'s help text had a literal
`"non-100% matches"`. Fixed by escaping as `%%`, with a regression test
verified against pre-fix code via `git stash`.

## Verification

- **Three-way count**: `.c` added == `.s` deleted == `delinks.txt` flips ==
  **82 == 82 == 82** (verified via `git diff origin/main`, not summed from
  self-reports). Cleaned up 2 batches' leftover parked `.c` drafts (batch 2:
  19, batch 5: 16) before committing — both batches shipped correctly but
  left their non-shipped attempts sitting in the tree alongside still-active
  `.s` siblings, which independent verification caught before it could
  break a real build (confirmed via `ninja -n` before and after cleanup).
- `python tools/check_delink_dupes.py`: OK, no duplicate `.text` addresses.
- `python tools/sort_delinks.py`: 0 inversions post-merge.
- 5 worktree branches merged via `git merge --no-ff` — **zero conflicts**,
  consistent with every prior sweep using this protocol.
- Every shipped function independently re-verified at 100.0% by its own
  worker via `fastmatch.py`'s RESOLVED comparison before being reported
  shipped.
- `python tools/gate3.py --scope all --clean`: PASS — all three of
  `[eur]`/`[usa]`/`[jpn] SHA1 PASS` individually grepped from the full log.
- `python -m pytest tests/test_fastmatch.py -v`: 35 passed.
- `python -m ruff check` / `npx markdownlint-cli2`: clean.

## Mid-flight main catch-up

This branch was created from a stale local `main` ref that predated 12
PRs (including #1368 and #1363) merging into the real `origin/main` —
the same staleness gap `cm-ov002-unknown-sweep-2` and
`q-fastmatch-selfheal-inflight` hit. Merged current `origin/main` in
before finalizing: `config/eur/arm9/overlays/ov002/delinks.txt`
auto-merged with zero conflicts (disjoint address ranges from prior
sweeps' ships, as expected). `tools/fastmatch.py` / `tests/test_fastmatch.py`
conflicted exactly where expected (this branch's cherry-picked #1368+#1373
content vs. #1368's content now natively on `main`) — resolved by taking
this branch's version, a strict superset. `docs/queue/claude-decomper.md`
needed real hunk-by-hunk resolution.

## What's left

64/166 of this size-gated slice remain parked (documented per-batch above
with match% and residual class — the dominant unresolved class across all
5 batches is a pure register-allocation/naming permutation with otherwise
byte-identical instruction shape, a strong candidate for a future
permuter-based pass rather than further hand-RE). USA/JPN porting not
attempted, matching the phased EUR-first convention.
