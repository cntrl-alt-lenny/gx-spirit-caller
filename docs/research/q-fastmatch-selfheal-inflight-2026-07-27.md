# q-fastmatch-selfheal-inflight — the 4th fastmatch.py gap fixed (2026-07-27)

**Asked:** `cm-ov002-unknown-sweep-2` (#1372) found a fourth real `tools/fastmatch.py`
gap, independently hit by 4 of its 5 worktree batches: the ninja-collision
self-heal added in `q-fastmatch-sweep-friction` (#1368) does not resolve a
"multiple rules generate X" error when a *different* in-flight candidate
caused it. Fix it with the same rigor as #1368/#1351 — a real repro against
pre-fix code, verified via `git stash`, not just a description.

## Root cause

`ninja_compile_one`'s self-heal (from #1368) checked whether the reported
collision path matched exactly the *current* candidate's own `.s` sibling
before attempting to fix anything. That's correct for the single-candidate
case #1368 was built to fix, but wrong for how a real worktree-parallel
sweep actually iterates: multiple candidates in the *same* module directory
are frequently mid-draft at once (draft `.c` A, test it, draft `.c` B before
resolving A, etc.), so ninja's parser can report a collision for whichever
file it hits first in `build.ninja` — which is not necessarily the file
`fastmatch.py` was actually asked to compile. The old check then failed
outright, naming the wrong file, with no self-heal attempted at all.

One batch's report sharpened this further: even fixing candidates
reactively, one at a time, can flip-flop — restoring a healed sibling and
reconfiguring can reintroduce the exact same fatal for whichever *other*
candidate is still mid-draft at that moment.

## Fix

Added `_find_stale_c_s_collisions(c_path)`: scans `c_path`'s own directory
(not the whole `src/` tree) for every `.c` file that still has a plain `.s`
sibling on disk — the general shape of the collision, not just the current
candidate's own. `ninja_compile_one` now:

1. Confirms the reported "multiple rules" collision is in the **same
   build-output directory** as the candidate being compiled (a collision
   reported for a different module can't be fixed by touching files here,
   and scanning there would just be pointless risk to another lane's
   unrelated in-progress work — skipped entirely in that case, matching
   the original safety principle).
2. If so, displaces **every** stale sibling found in that directory
   together, in one pass (not one at a time — this is what prevents the
   flip-flop failure mode).
3. Reconfigures once, retries the original compile.
4. Restores **every** displaced sibling byte-exact afterward, success or
   failure, then a best-effort resync reconfigure.

## Verification

- 6 of 8 new/changed tests in `tests/test_fastmatch.py` **fail against
  pre-fix code** (`git stash` on `tools/fastmatch.py` alone) with
  `AttributeError` on the not-yet-existing `_find_stale_c_s_collisions`
  helper — confirmed they exercise the fix, not passing vacuously.
- Updated `test_does_not_self_heal_a_stray_conflict_for_a_different_file`
  (renamed `test_does_not_self_heal_a_collision_reported_in_a_different_directory`):
  the old version's "unrelated" file was actually in the *same* directory
  as the candidate under test, so under the new broader-scan design it no
  longer tested what its own docstring claimed (self-heal would have
  triggered — the retry just still failed because the mock always returns
  failure). Rewrote it to use a genuinely different directory, which is the
  real boundary the new code respects.
- New `test_self_heals_when_a_different_in_flight_candidate_caused_the_collision`
  and `test_healing_two_candidates_at_once_does_not_reintroduce_either_collision`
  directly prove the fix's two claims: it heals a collision reported for
  someone else's file, and healing multiple stale pairs together (not
  serially) avoids the reintroduction failure mode.
- New `TestFindStaleCSCollisions` class unit-tests the scanning helper in
  isolation (directory scoping, tier-suffix handling, no-stale-sibling
  case).
- `python -m pytest tests/test_fastmatch.py -v`: 34 passed.
- `python -m ruff check`: clean.
- `python tools/gate3.py --scope all --clean`: PASS (3-region clean sha1 +
  full pytest suite) — expected no-op regression check, `fastmatch.py` is
  never invoked by the real `ninja`/`gate3.py` build path.

## Merging with main mid-flight

This branch was created before 12 other PRs (including #1368 and #1363
themselves) merged into `main`. Rather than leave it based on a stale
snapshot, merged current `origin/main` into this branch before finishing:
`tools/fastmatch.py` and `tests/test_fastmatch.py` conflicted exactly where
expected (cherry-picked #1368 content vs. the same content now natively on
`main`) — resolved by taking this branch's version, which is a strict
superset (the original 3-gap fix plus this PR's 4th-gap fix on top).
`docs/queue/claude-decomper.md` needed a real hunk-by-hunk resolution (kept
this branch's newly-appended items, dropped a now-stale "not yet merged"
caveat note since #1368 is genuinely merged for real).

No `src/` or `delinks.txt` changes in this PR — pure tooling, so there is
no `.c`-added/`.s`-deleted/delinks-flip count to report.
