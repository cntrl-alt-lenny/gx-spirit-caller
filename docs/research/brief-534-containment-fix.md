[//]: # (markdownlint-disable MD013 MD041)

# Brief 534 — `containment_check.py` module-awareness fix + safe-queue re-verification

**Brief:** 534 (Claude scaffolder, tooling/analysis lane — no delinks
edits, collision-free with the decomper's brief 535). Own worktree
`claude-534`, branch `claude/containment-fix-534`.

## What this wave did

1. **Fixed `tools/containment_check.py`'s missing module awareness.** The
   tool defaulted to main's ARM9 binaries and VA base for every candidate,
   regardless of whether the candidate was actually an overlay function.
   An overlay candidate's compiled bytes never land in the main image at
   all, so a caller who didn't manually override `--built`/`--extract`
   silently diffed the wrong (always-clean) pair and got a false
   CONTAINED. This is the root cause of the 3/4 false-CONTAINED verdicts
   brief 525 hit, and — found while fixing it — is directly documented as
   having happened before: brief 518's own dossier literally says
   *"Official `tools/containment_check.py` reported zero main-ARM9 diff,
   but the overlay fallback found 805,331 diff bytes"* for `021e2e18`.
   Fix, tests (29, all passing), and full detail in the tool's own updated
   docstring and `tests/test_containment_check.py`.
2. **Re-verified all 107 `safe-queue-v3.md` "carried" rows** against
   current repo state (file-existence-based, not delinks.txt-text-based —
   see the stale-delinks finding below) and every intervening c-match wave
   brief (500–533), producing
   [`safe-queue-v4.md`](campaign-analytics/safe-queue-v4.md). **99 of 107
   are already resolved or already attempted-and-recorded; only 8 are
   genuinely untouched.** Full breakdown, the 8 candidates' own table, and
   the methodology are in that doc — this is the "GENUINELY-contained
   shortlist" brief 534 asked for, with the honest caveat that a real
   contained-vs-avalanche verdict needs an actual C draft (out of scope
   for a no-match/no-ship wave), so what's verified here is metadata
   accuracy and attempt history, not future compile outcomes.

No matching or shipping happened this wave, per the brief's own
collision-free constraint — `git status` shows only the tool fix, its
test file, the two docs, and the README index regen.

## Byproduct finding (flagged, not fixed — out of scope)

6 EUR `main` delinks.txt lines still declare a `.s` file that's been
deleted (the matching `.c` exists and is tracked). Doesn't break the
build — `configure.py` discovers sources by globbing the filesystem, not
by trusting delinks.txt's text — but it's stale documentation that misled
this brief's own first-pass cross-reference before switching to a
file-existence check. Detail and the exact 6 addresses are in
safe-queue-v4.md.

## Recommendation for the next round

The 8 genuinely-open queue rows are a small, well-evidenced remainder —
not worth a dedicated wave on their own. Combined with brief 532/533's
direct-attempt negative results, this closes out the "is the queue
actually dry" question with row-level evidence: yes, for the MED/RETRIAGE
tiers the safe-queue methodology covers. The strategic call from here
(permuter-class register-swap residue vs. large bespoke RE vs. calling
this campaign phase done) is exactly what the LANE STATE header already
flagged as the next round's decision — this brief supplies the evidence
for that call, not the call itself.

## Verification

Tooling-only wave; no source/delinks changes, so the 3-region gate is
unaffected by construction. Confirmed anyway (no regressions from the
fresh worktree/build used to self-check the 8 open candidates):

```text
gx-spirit-caller_eur.nds: OK
```

29/29 new tests pass (`python -m unittest tests.test_containment_check
-v`); full existing suite (2,450 tests) collects cleanly with no import
errors after the change.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
