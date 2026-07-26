# q-invariants-green: get `Match invariants` green on main (2026-07-25)

`Match invariants` had been red since ~2026-07-22 with 4 error-severity
`cross_file_name_drift` findings. Two independent root causes, confirmed
and fixed separately per the queue item's own diagnosis.

**Result: `python tools/check_match_invariants.py` now reports 0 errors**
(11,748 warnings remain — pre-existing, non-blocking per the check's own
severity split). 3-region `gate3.py --scope all`: EUR/USA/JPN all
`SHA1 PASS`; the overall gate label still reads FAIL solely because of 2
pre-existing `tests/test_m2c_feed.py` failures unrelated to this change
(confirmed identical on a `git stash` of this branch's own prior state —
`m2ctx.py` shells out to a bare `gcc`, not present on this Windows
environment's `PATH`; the project's native toolchain is mwccarm/wibo, not
gcc).

## (a) Three dead placeholder externs

`extern void func_02086800_dummy(void);` in `src/main/func_02086800.c`,
`src/usa/main/func_02086718.c`, `src/jpn/main/func_02086718.c` — brief-494
campaign-prep swarm-draft leftovers. Confirmed via grep the declaration is
never referenced in any of the three function bodies; deleted the 3 lines
(and the blank line that separated them from the function). Did not use
the checker's own suggested `rename_symbol.py` fix — its diagnosis
(rebase drift) doesn't apply here, there's no real symbol to rename to.

Proved rather than assumed that deleting an unreferenced `extern` cannot
change codegen: all 3 files are the active `delinks.txt` TUs in their
respective regions, and `gate3.py --scope all` (forced-clean, see above)
still reports byte-identical SHA1 for all 3 regions after the deletion.

## (b) Checker bug: comments not stripped before extern-scanning

`check_cross_file_name_drift`'s `_EXTERN_FN_RE` (`\bextern\b[^;{]*?...`,
`re.DOTALL`) scans raw file text including comments. Its lazy
`[^;{]*?` can bridge across an ENTIRE multi-line `/* */` doc comment,
from a real "extern" mention in prose all the way to an unrelated later
`word(...);`-shaped fragment inside the same comment block, and capture
whatever identifier sits there as if it were a real declaration.
Concretely, `src/overlay001/func_ov001_021ca144.c`'s opening comment
describes the C-27 alias recipe in prose ("a second extern name at the
identical address (data_..., ...) that neither the compiler nor the
assembler can prove aliases the first. ... sets c;") — the regex bridged
from "extern" to a coincidental `c;` deep in a later sentence and
reported it as `extern ... c`, a phantom symbol.

Fixed by scanning `tools/progress.py::_strip_c_comments_and_literals`'s
output instead of the raw text — an existing, already-reused (by
`asm_void_counter.py`) character-by-character comment/string/char-literal
blanker that preserves newline positions exactly, so `_line_number`'s
line-counting against the original text stays correct. Applied to both
`check_cross_file_name_drift`'s C/C++ extern scan (the one that actually
fired) and `_all_header_decl_names` (same regex-on-raw-text pattern,
same latent risk, not yet triggered — fixed proactively rather than
leaving a known-identical bug in place for headers).

This is the same bug CLASS the q-khdays-toolkit port fixed upstream (a
`return` statement misparsed as a declaration) — same root cause
(scanning raw source text with a lazy DOTALL regex instead of stripping
comments first), different specific trigger. Did not port that fix's
exact code (it targeted a different tool/language surface); reused this
project's own existing comment-stripper instead, which already exists
for exactly this class of problem.

Added `tests/test_check_match_invariants.py::TestCrossFileNameDrift
::test_comment_prose_mentioning_extern_not_flagged`, reproducing the
real false-positive's shape (comment mentioning "extern" + parenthetical
+ a later `;`) as a synthetic fixture, asserting zero issues. 34/34 tests
in the file pass; 3019/3021 project-wide (the 2 pre-existing gcc-gap
failures noted above are the only exceptions, confirmed unrelated).

## Gate

`python tools/check_match_invariants.py`: 0 errors (was 4).
`python tools/gate3.py --scope all`: EUR/USA/JPN `SHA1 PASS` (3/3);
overall label FAIL only from the 2 pre-existing, confirmed-unrelated
`test_m2c_feed.py` failures.
