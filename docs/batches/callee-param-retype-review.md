# Review: callee-param-retype

Verifier review of `221656316` (PR 1666) against `origin/main`
(`8f29ff66e`), read blind from the diff before the summary.

## Verdict

**FIX FIRST.** No ROM risk: all three regions rebuild byte-identical. But the
batch retyped two caller definitions and left their 42 call sites with the
same `(int)` casts this batch exists to remove, behind externs that now
disagree with those definitions. A short fix in the same batch.

## Findings

**SHOULD FIX 1: `func_0205ae4c`/`func_0205ae8c` half-retyped.**
`src/main/func_0205ae4c.c:24` and `src/main/func_0205ae8c.c:24` are now
`int (char **a, char *b, char *c)`, but `src/main/func_0205a18c.legacy_sp3.c:4-5`
and `src/main/func_0205a974.legacy_sp3.c:1-2` still declare
`(int *a, int b, int c)` and `include/game/prototypes.h:1088-1089`
`(void *, int, int)`. The 42 calls (22 in `func_0205a18c`, 20 in
`func_0205a974`) still pass `(int)data_…, (int)buf`. The summary does not
mention them. Retype both externs and `prototypes.h`, drop the casts, re-gate.

**SHOULD FIX 2: `func_0206ee18` prototype stale.**
`src/main/func_0206ee18.legacy.c:3` is now `void (void *a0, …)`;
`include/game/prototypes.h:1249` still says `(int, int, int, int)`.

**NOTE (one level down):** retyped callers now declare pointer parameters
that the unchanged definitions take as `int`: `func_0206d148`
(`func_0206d1f0.legacy.c:7`), `func_020453fc` (`func_02045470.legacy_sp3.c:13`),
`func_02061798`/`func_02061b60` (`func_02064208.legacy_sp3.c:9-10`),
`func_02063ae0`/`func_02063ca4`/`func_020643d8` (`func_02063854.legacy_sp3.c:18-22`).
Before the batch these externs matched their definitions. Disclosed as
follow-ups; fine as long as that batch is queued. Also
`func_02060c9c.legacy_sp3.c:14` declares `func_02060cbc` with `char *`;
the definition uses `signed char *`.

**NOTE (claim):** the summary says `func_020644a4`'s local extern now matches
its definition; `func_02063854.legacy_sp3.c:24` returns `int`, the
definition `unsigned int`. Parameters do match.

**NOTE (`func_020643d8`):** the reason holds. The definition forwards its
fourth argument (r3) to `func_020643ec`, so it truly reads four registers,
while callers pass one, two or four arguments. No single prototype fits.
Not tested: whether `func_02063288.legacy_sp3.c:19` could take the 1-arg
`(void *self)` view that four sibling callers already use.

Checked and sound: every other retyped callee's definition agrees with all
of its declarations in `src/`, `include/`, `libs/` (script over all
three; USA/JPN ports use other names). Assert signature matches its format
string. Seven of the review's eight empty-parens externs are gone (grep).
No `(int)` pointer casts remain into any other retyped callee; the six left
are value casts (`(int)self->f0 << 16`). The diff adds no `volatile`,
`#pragma` or `asm`. All 69 hunks that are not pure cast/extern edits were
read: local, field and parameter retypes, thunk arity cuts and one added
argument (`func_0208e420.c:9`, `GX_SendFifo48B(m, (void *)0x4000400)`,
the SDK signature). 11 touched files compiled at `-w all` against
`origin/main` show only new "result of function call is not used" and
unused-argument warnings, no implicit conversions. Counts re-derived: empty-parens externs
508 → 416; `(int)` removed 363, added 4.

## Evidence (at `221656316`)

```text
$ python tools/gate3.py --scope all --log <log>          (exit 0)
$ grep -nE "SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)" <log>
24481:[eur] SHA1 PASS
50079:[usa] SHA1 PASS
75678:[jpn] SHA1 PASS
75718:1328 passed, 17 skipped, 132 subtests passed in 30.09s
75721:==================== GATE PASS ====================
75722:gate3: GATE EXIT 0
$ python tools/check_match_invariants.py --version eur  (exit 1 = warnings only)
Found 13999 issue(s): 0 error(s), 13999 warning(s).
$ python tools/check_fake_matches.py                     (exit 0)
check_fake_matches: OK
$ python tools/check_delink_dupes.py                     (exit 0)
check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)
$ python tools/fw.py check                               (exit 0)
0 error(s), 16 warning(s)    (the standing word-count warnings)
```

The invariant warnings are the standing placeholder-name class; the
touched names (`func_02058070`, `func_0205ae4c`, …) were already in it.
