# cm-ov002-unknown-sweep-2: 77/145 shipped (53.1%), PARTIAL — batch 2 of 5 incomplete (2026-07-26)

**Status: interrupted mid-sweep, uploaded for review rather than left uncommitted.** The session was stopped before batch 2/5 finished and before the full `gate3.py --scope all` run completed. Everything below is honest about what is and isn't verified — see "What's NOT done" at the end before merging.

## Method

Continued `cm-ov002-unknown-sweep` (#1363, 32-88B band, 63.2% shipped) with the next size band up: `wall_aware_headroom.py --exclude-attempted --min-size 92 --max-size 104` → **145 candidates**, all `src/overlay002/*.s`, sizes 92-104 bytes (4-byte-aligned boundary immediately above the prior band). Partitioned round-robin (by ascending address) into 5 batches of 29, same WORKTREE-PARALLEL SWEEP PROTOCOL as the prior sweep: 5 `git worktree`s (`sweep2-1..5`), each seeded with the baserom + toolchain and independently configured/built/sha1-verified before dispatch, agents worked directly in `src/overlay002/`, left changes uncommitted for central consolidation.

Used the FIXED `tools/fastmatch.py` from `q-fastmatch-sweep-friction` (PR #1368, cherry-picked onto this branch as 3 commits — `2dad3f9e4`, `62cbdd5d0`, `de0fbe59e` — since #1368 hasn't merged yet) instead of the workarounds the prior sweep used.

## Result: 77/116 attempted (66.4%), 77/145 of the full band (53.1%)

| Batch | Shipped | Notes |
|---|---:|---|
| 1 | 18/29 (62%) | 1 confirmed reversal of a previously-documented wall (`func_ov002_021edce8`, cited "brief-287 cd3f4-arg tail reg-alloc wall" — actual cause was a struct-padding typo, not a real limitation). New/refined levers: if-return-form matters for predication (plain `if/return` vs ternary), unsigned loop counter for `bcc` vs `blt`. |
| 2 | **INCOMPLETE** | Sweep was stopped mid-run. ~13-14 functions had already shipped on disk (uncommitted) at stop time. **Excluded from this PR entirely** — the worktree `sweep2-2` (and its branch `claude/cm-ov002-unknown-sweep-2-2`) still exists with that partial, unreviewed state; someone should either resume it or treat its 29 candidates as not-yet-attempted. |
| 3 | 20/29 (69%) | New lever: invert `if (cond) return X; ...bigBlock...` to `if (!cond) { ...bigBlock... } return X;` — forces a real branch instead of predication when the skipped block is large/call-containing. No new fastmatch.py issues (worked flawlessly across ~100 invocations). |
| 4 | 20/29 (69%) | Found a 4-function reg-mirror cluster (self/base pointer lands in `ip` in orig vs a low register in the compile, even with bitfield-struct-member access) — flagged as a possible new residual wall class distinct from the already-documented reg-alloc pattern, not yet fully explained. |
| 5 | 19/29 (65.5%) | 2 new levers: array-indexing syntax beats manual pointer-cast arithmetic for per-player block addressing (in single-access cases only — did not transfer to a dual-access case); bitfield-write ordering is a distinct, unresolved residual from the well-documented bitfield-read lever. One self-caught transcription error recovered 2 functions from "parked" to "shipped" after re-reading a call's implicit argument. |

**Total: 77 shipped, 39 parked (batches 1/3/4/5 only — batch 2's 29 are simply absent from this count, neither shipped nor formally parked).**

## codegen-walls.md updates (this PR)

Added **C-45** (`switch` over a small contiguous case range can avoid mwcc's range-fold) and **C-46** (explicit `(unsigned)` cast preserves a logical shift when mirroring a global bitfield read), documenting the 2 reversed wall verdicts from the immediately-preceding sweep (`func_ov002_022abf88`, `func_ov002_021e2cd4`, both from #1363) as real edits, not just prose — both functions carried only the generic "GLOBAL_ASM endgame" bulk stamp, never an individually-reasoned citation, so these are new lever entries rather than corrections to an existing specific citation.

The third item flagged from #1363 — the `func_ov002_022a1870` C-34 mistag — was checked and found **already fully corrected** by `cm-parked-reaudit-2` (#1348, merged 2026-07-25): its `.s` file header already reads "MISTAGGED (cm-parked-reaudit-2 batch B, 2026-07-25)" with the correct residual analysis, and codegen-walls.md already narrates the correction. No further edit needed there — confirmed by reading the current file, not assumed from the prior sweep's writeup.

This round independently found a **3rd** reversed verdict not in the original ask: `func_ov002_021edce8` (batch 1), which cited "brief-287 cd3f4-arg tail reg-alloc wall" and turned out to be a struct-padding typo. Not yet added as its own codegen-walls.md entry — flagged here for whoever continues this branch, since it wasn't part of the original scope and deserves its own look at whether "brief-287"'s wall citation needs broader correction (i.e. is this typo systemic to other cd3f4-tail citations, or a one-off).

## Verification

- Three-way count (`git diff origin/main`): **77 == 77 == 77** (`.c` added, `.s` deleted, `delinks.txt` `.s:`→`.c:` flips in `config/eur/arm9/overlays/ov002/delinks.txt`).
- `python tools/check_delink_dupes.py`: OK, 81 delinks.txt files, no duplicate `.text` addresses.
- `python tools/sort_delinks.py config/eur/arm9/overlays/ov002/delinks.txt`: 0 inversions, no-op (already correctly sorted post-merge).
- 4 worktree branches merged via `git merge --no-ff` — **zero conflicts**, consistent with every prior sweep using this protocol.
- Every shipped function was independently re-verified at 100.0% by its own worker via `fastmatch.py`'s RESOLVED comparison (catches Mode A/wrong-pool and Mode B/wrong-callee false positives that raw objdiff misses) before being reported shipped.
- `python -m ruff check`: clean.

## A 4th fastmatch.py gap found (independently, by 4 of 5 batches — 1, 3's absence is notable, 4, and 5)

The ninja-collision self-heal added in #1368 only resolves a "multiple rules generate X" error when X matches the CURRENT candidate's own `.s` sibling. If a DIFFERENT, still-in-flight candidate's `.c` draft is what's actually colliding, fastmatch.py fails naming the wrong file and does not self-heal — and the self-heal's own successful-path cleanup (restore + reconfigure) can reintroduce the collision for whatever other candidate is mid-draft at that moment. All affected batches converged on the same workaround: never let more than one `.c`/`.s` collision pair coexist in the tree at once. Filed as a spawn_task suggestion (chip) during the session for a dedicated follow-up fix with the same stash-verified rigor as the original 3 gaps. Batch 3, notably, hit zero fastmatch.py issues across ~100 invocations — the bug is real but not universal; it only manifests when 2+ candidates are mid-draft simultaneously, which 3 of the 4 batches apparently did at some point and 1 didn't.

## What's NOT done (read before merging)

1. **Batch 2/5 (29 candidates) is entirely unfinished.** Its worktree (`sweep2-2` / branch `claude/cm-ov002-unknown-sweep-2-2`) has an uncommitted, unreviewed partial state (~13-14 functions' worth of file changes) that was deliberately EXCLUDED from this merge/PR because it was still being actively written to when the session stopped — grabbing it risked an inconsistent snapshot. Someone should check that worktree's current `git status`, decide whether to finish it or discard it, and finish the sweep with a proper batch 2 pass (or fold its untouched 29 candidates into a future `cm-ov002-unknown-sweep-3`).
2. **`python tools/gate3.py --scope all --clean` was started but its completion was NOT confirmed before this doc was written.** Check the PR's CI or re-run locally before merging — do not treat this as gated on the strength of per-function `fastmatch.py` checks alone. (Precedent: #1363 needed `--clean` for the same reason — high volume of file moves/deletions can mask stale `.o`s in an incremental build.)
3. **The 3rd reversed-wall-verdict finding (`func_ov002_021edce8`) has no codegen-walls.md entry yet** — see the section above.
4. USA/JPN porting not attempted — EUR-only, matching this campaign's phased EUR-first convention.
