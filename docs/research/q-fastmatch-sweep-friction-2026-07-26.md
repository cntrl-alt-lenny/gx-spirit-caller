# q-fastmatch-sweep-friction — 3 real fastmatch.py gaps fixed (2026-07-26)

**Asked:** `cm-ov002-unknown-sweep` (PR #1363) hit three real `tools/fastmatch.py`
gaps, worked around all three independently across its 5 worktrees, and
shipped the workarounds as prose instead of fixes. Fix the tool itself
this round — a real repro for each gap against pre-fix code, matching
`q-toolbugs-round2`'s (#1351) own rigor standard, not just a description
of the workaround.

## Gap (a): gap-object auto-discovery blind to individually-carved `.s` candidates

`find_gap_by_glob` only matches `build/<region>/delinks/**/_dsd_gap@<module>_*.o`.
dsd emits a `_dsd_gap@` object **only** for a genuinely-unassigned region
(bytes with no `delinks.txt` entry of their own yet) — never for a
function that already has its own individual entry, which every
whole-function-ship `.s` candidate does. Confirmed independently by 3 of
5 sweep batches in #1363, none of which could rely on it.

**Fix:** `find_gap_by_delinked_object(c_path, func, region)` looks up
the per-function reference object directly at
`build/<region>/delinks/<same-dir-as-source>/<name-with-suffix-swapped>.o`
— confirmed on the real `eur`/`usa` trees (e.g.
`src/overlay002/func_ov002_021aa4a0.s`, still `.s` in
`config/eur/arm9/overlays/ov002/delinks.txt`, has its reference at
`build/eur/delinks/src/overlay002/func_ov002_021aa4a0.o`, no tier
suffix, because dsd names it after the delinks.txt-registered path, not
the function name in isolation). Wired into `match_one`'s resolution
order between the `objdiff.json` lookup and the `_dsd_gap@` glob (kept,
not deleted — it's still correct for its own genuinely-unassigned-region
case).

## Gap (b): ninja "multiple rules generate X" when a `.c` draft and its still-`.s`-routed sibling coexist

`configure.py` adds a build rule for every `.c` **and** every `.s` file
under `src/`, regardless of `delinks.txt`. A candidate `.c` draft
sitting beside its own still-`.s`-routed sibling (the normal state while
iterating — `delinks.txt` isn't flipped until a candidate ships) makes
two rules target the same output object; ninja refuses to build
**anything** until that's resolved.

This is the exact same root cause `batch_sha1.py` already fixed
(`q-toolbugs-round2`, #1351) for its own multi-candidate, permanent-flip
use case (`_displace_stale_sibling` / `_restore_stale_sibling` /
`_reconfigure` / `_MULTIPLE_RULES_RE` / `_correlate_stale_sibling`).
Ported that pattern into `fastmatch.py`'s `ninja_compile_one` rather
than inventing a second one, adapted for a single-file, **read-only**
context: fastmatch never edits `delinks.txt`, so the sibling `.s` is
always restored byte-exact afterward (success or failure), and a
best-effort reconfigure resyncs `build.ninja` once it's back.

Guarded the same way `batch_sha1.py` guards against a stray unrelated
conflict: the collision path is checked against *this candidate's own*
expected sibling object path before self-healing — an unrelated
"multiple rules" fatal elsewhere in the tree is reported normally, not
silently papered over.

## Gap (c): unhandled `Path.relative_to(ROOT)` crash for an out-of-repo `--gap` path

`match_one`'s `gap_obj` result field assumed the resolved gap object is
always inside `ROOT`. Every other path flowing into that line is
tool-derived and provably inside `ROOT`; the one exception is a
user-supplied `--gap <path>` outside the repo, which raised `ValueError`
instead of reporting cleanly. Added `_display_path`, used only at that
one genuinely user-controlled call site.

## Queue-marker guard

Not re-added: `tests/test_work_queue.py::RealQueueFilesTest::test_no_malformed_headers_in_any_real_queue_file`
already does this generically. It scans every `docs/queue/*.md` file
(not just one lane) for `find_malformed_headers()` hits and fails CI the
moment a heading lacks a recognized `[STATUS]` bracket — the exact
`q-metric-extern-guard` shape. Confirmed it runs in real CI (`unittest
discover -s tests`, `.github/workflows/tests.yml`) and confirmed 15/15
`test_work_queue.py` tests pass on this branch. Added by a parallel
scaffolder-lane commit (`f31fc2feb`) in direct response to this same
incident — its own test docstring says "Third occurrence of this exact
class in this lane," matching the brain's own count. No new code added
here to avoid duplicating working coverage.

## Verification

All three gaps verified against **pre-fix code** via `git stash`
(mirroring #1351's own stash-revert rigor): 15 of 16 new/changed tests
fail pre-fix (`AttributeError`/`TypeError` on the not-yet-existing
functions or the changed `ninja_compile_one` signature), confirming
they actually exercise the fixed behavior rather than passing
vacuously. The 16th (`test_old_glob_path_finds_nothing_for_a_carved_single`)
intentionally passes both before and after — it documents *why* the new
path is necessary (the old glob's blindness is real and unchanged), not
the fix itself.

`python -m pytest tests/test_fastmatch.py -q`: 27 passed.
`python -m ruff check tools/fastmatch.py tests/test_fastmatch.py`: clean.
`python tools/gate3.py --scope all`: PASS (3-region clean sha1 + full
pytest suite) — expected to be a no-op regression check, since
`fastmatch.py` is a standalone per-TU diagnostic never invoked by the
`ninja`/`gate3.py` build path itself.

No `src/` or `delinks.txt` changes in this PR — pure tooling, so there
is no `.c`-added / `.s`-deleted / delinks-flip count to report.
