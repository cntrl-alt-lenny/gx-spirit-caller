# Factory night 9 review (87 functions)

Reviewed ca1aab7ae (base b8155efa2). Read-only: no build, no fastmatch, so Brain's "each touched file 100%" is unverified.

## Commands

| Check | Result |
| --- | --- |
| scope | 87 A `.c`, 87 D `.s`, 15 M. 87 unique names, none also EUR `.s`. |
| routing (scripted) | each new `.c` routed exactly once; no deleted `.s` still routed; no missing path; no double route. |
| ledger | base 16051 lines are a byte prefix; +1388 rows (115 shipped, 1273 parked), 0 deleted. |
| shipped rows | 114 addresses = 87 files + 6 Brain reverts + 21 driver reverts (parked row after, `.s` kept). `0x02231dec` shipped twice, one file. |
| baseline | only the two `func_0200cb50.s` self-call lines removed; C now resolves them. |
| grep, 87 `.c` | 0 `asm`, `#pragma`, `register`, `while(0)`, `__attribute__`, `goto`. `volatile` only MMIO: `func_0200cb50.c`, `func_020931f8.legacy.c`. |
| data offsets (scripted) | C `data_*` symbols equal the base `.s` pool words in all 87; no pool offsets. Honest. |
| sample | 33 files read: the 12 largest (none over 1024 B), both volatile files, spread over main and overlays 002, 004, 008. |
| Brain commits | revert: 6 `.s` byte-identical to base, routes flipped, 6 parked rows. Tidy: declarations only. |

## Findings

**BLOCKER:** none.

**SHOULD FIX 1:** pointer-to-int casts at call sites to fit `int` parameters; retype the callee instead. `func_02055a84.legacy_sp3.c` 22-43, `func_020608b4.legacy_sp3.c` 10-13, `func_020580a0.legacy_sp3.c` 22-40, `func_0205f844.legacy_sp3.c` 26, `func_02063288.legacy_sp3.c` 33-98, `func_0206ed7c.legacy.c` 13, `func_0200cb50.c` 42/81/85, `func_ov002_02219734.c` 55 (same pointer passed as pointer at 61), `func_ov002_022b0198.c` 29/32.

**SHOULD FIX 2:** `func_ov002_02245dd4.c` 14 and 40: player number carried in `void *self` to match `func_ov002_022536e8`. Declare it `int`.

**NOTE (empty-parens externs):** `f()` drops the prototype in `func_0200a488.c:25`, `func_020608b4.legacy_sp3.c:3`, `func_02063288.legacy_sp3.c:19`, `func_0206d600.legacy.c:40`, `func_02088350.legacy_sp3.c:31`, `func_ov002_021d05a4.c:19`, `func_ov002_02219734.c:25`, `func_ov002_022bdb88.c:17`. A prototype lever; track as a class.

**NOTE (contortion):** `func_ov002_021bd948.c` 47-54 (repeated `&(data+po)[eo]`, comma expression) and `func_ov002_022a68ec.c` 5-25 (`int[5]` scratch copy) are fitted but use no banned construct.

**NOTE (func_0200cb50.c):** `if (!n) return;` at 39 and 75 tests a computed address. The +0xd4 read is a displacement from the one pool symbol.

**NOTE (tidy):** sound; `unusedN` params added to 9 definitions invent arity, and other files keep old arities.

**NOTE (revert rows):** class `tool-anomaly`, brief `factory-1103-integration`; reclassify later.

**NOTE (ledger):** briefs mix `factory-1103-K*` and `factory-1104-K*`; 50 of 87 files have a later parked row for another tier. Credit size from files.

## Not checked

54 other new files by eye; USA and JPN; which `func_ov002_02231dec` copy was kept; any build result.

## Verdict

merge
