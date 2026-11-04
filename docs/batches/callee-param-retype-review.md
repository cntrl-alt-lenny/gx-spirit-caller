# Review: callee-param-retype

Verifier review of PR 1666, read blind from the diff against `origin/main`
(`8f29ff66e`).

## Round 1 (`221656316`): FIX FIRST

- **SHOULD FIX 1:** `func_0205ae4c`/`func_0205ae8c` definitions retyped,
  but `func_0205a18c`/`func_0205a974` externs and `prototypes.h` were left
  `int`, with 42 `(int)` casts at the calls.
- **SHOULD FIX 2:** `prototypes.h` still had `func_0206ee18(int, …)`.
- **NOTEs:** pointer externs over unchanged `int` definitions one level down
  (`func_0206d148`, `func_020453fc`, `func_02061798`, `func_02061b60`,
  `func_02063ae0`, `func_02063ca4`, `func_020643d8`, `func_02060cbc`
  signedness); `func_020644a4` extern returned `int`.
- Otherwise sound: all retyped callees consistent, 7 of 8 empty-parens
  externs gone (508 → 416 in `src/`), no `volatile`/`#pragma`/`asm`
  added, 11 files at `-w all` showed no new implicit conversions. Gate
  passed at `221656316` (three SHA1 PASS, `GATE EXIT 0`).

## Re-review (`e24c72bed`): MERGE

Read every hunk of `221656316..e24c72bed` (30 files) and re-ran the
declaration-consistency script over `src/`, `include/` and `libs/`.

- **SHOULD FIX 1: resolved.** Definitions are `(void *a, char *b, char *c)`;
  both externs and `prototypes.h:1088-1089` match; no `(int)` casts remain
  into either (script: 0).
- **SHOULD FIX 2: resolved** (`prototypes.h:1249`).
- **One level down: resolved** except `func_020643d8`. Definitions now take
  pointers: receive chain `func_0206d148` → `func_0206d0b0` →
  `func_0206ceb8` (request record) / `func_0206cfa0` (+ `func_0206cd64`'s
  record), `func_020453fc` (allocator hook typedefs too), `func_02063ca4`
  and its handlers, `func_02061798`, `func_02061b60`, `func_02061c5c`,
  `func_02063ae0`; `func_02060cbc` uses plain `char`. `func_020644a4`
  returns `unsigned int` in all four declarations.
- **NOTE (`func_020643d8`, revert 1):** the arity reason is real;
  `func_020640c0` sets r1 for this call, so a one-parameter prototype
  changes its code. Still left: the definition (`func_020643d8.c:5`) and
  `prototypes.h:1136` take `int a` for the object pointer, and
  `func_02063ed0.legacy_sp3.c:28-30` still passes `(int)self` through an
  empty-parens extern. Typing `a` as `void *` while keeping four
  parameters was not tried. Disclosed as a follow-up.
- **NOTE (`func_020643ec`, revert 2):** the reason is real. Its second and
  third parameters are small integers (callers pass 1, 2, 4, 6, 7 or 0/1), typed
  `void *` on `main` so that `func_02063620`'s
  `state == 6 ? (void *)0 : (void *)1` matches. That fit predates the
  batch. The batch changed only its local extern of `func_02061c5c`, so
  the third slot now agrees with the definition's `void *b`.
- Remaining declaration differences are struct-name views or predate the
  batch (`func_020628b0` short/int, `func_0206ee18`'s `int (void)` view,
  `func_020580a0`, `func_02094688`).

## Evidence

At `35062767a`, the merge of `e24c72bed` with round 1's review.
`git diff e24c72bed 35062767a -- src include libs config tools` is empty.

```text
$ python tools/gate3.py --scope all --log <log>          (exit 0)
1075:[eur] SHA1 PASS
1202:[usa] SHA1 PASS
1329:[jpn] SHA1 PASS
1369:1328 passed, 17 skipped, 132 subtests passed in 28.94s
1372:==================== GATE PASS ====================
1373:gate3: GATE EXIT 0
$ python tools/check_match_invariants.py --version eur  (exit 1 = warnings only)
Found 13999 issue(s): 0 error(s), 13999 warning(s).
$ python tools/check_fake_matches.py                     (exit 0)
check_fake_matches: OK
$ python tools/check_delink_dupes.py                     (exit 0)
check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)
$ python tools/fw.py check                               (exit 0)
0 error(s), 16 warning(s)    (the standing word-count warnings)
```
