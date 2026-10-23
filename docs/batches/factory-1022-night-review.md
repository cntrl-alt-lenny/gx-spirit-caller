# Factory night 6 review (Sol, 120 functions)

Reviewed commit f580c1f40 (verifier/factory-1022-night, base 24c33abee). Verifier worktree only; no `src/` edit is committed.

## Commands

| Check | Result |
| --- | --- |
| diff scope | 120 A `.c`, 120 D `.s` (same directory and function each, scripted; legacy suffix normalised), 23 M. Only `src/`, 15 `delinks.txt`, `attempts.tsv` and `reference_baseline.txt` change. 120 `.s:` lines became 120 `.c:` lines and nothing else moved in `config/` (scripted). The 6 modified `src` files only add `intN unusedN` parameters (one is an `asm` signature). Lanes: F1 7, F2 18, F3 13, F4 14, F5 7, F6 16, F7 6, F8 13, F9 28, F10 15 |
| baseline diff | exactly 1 `missing-reloc` line deleted, for `func_ov002_021b4be4.s`, replaced here |
| `validate_attempts.py` | exit 0, `errors: 0`, 11412 rows. Main's 10037 rows are an unchanged prefix (0 deleted lines, one appended hunk); +1375 rows (137 shipped, 1238 parked) |
| `check_fake_matches.py` / `check_delink_dupes.py` | `OK` (exit 0, `do-while-zero 3, volatile-local 1`, baseline entries 4, unchanged) / `OK (81 delinks.txt, no duplicate .text addresses)` (exit 0) |
| `check_match_invariants.py --version eur` | exit 1, `Found 13999 issue(s): 0 error(s), 13999 warning(s)` (placeholder names, same as night 5) |
| `progress.py --version eur` | Natural-C **1,368,394** B (57.35%), asm-C **4,420** unchanged. 1,368,394 - 1,255,414 = 112,980 = sum of the 120 ledger sizes (scripted) |
| `ninja` (EUR) | exit 0, `gx-spirit-caller_eur.nds: OK`. Not the gate; Brain's three-region gate stands |
| `fastmatch.py eur` on all 120 new `.c` | exit 0, 120 of 120 `100.0%` |
| grep of 120 new `.c` | 0 `asm`, `#pragma`, `register`, `while(0)`, raw data, section attributes. 2 files hold a `union` (below). 4 files hold `goto` (below) |
| `volatile` (9 files) | 7 are only MMIO (0x04xxxxxx). The other 2 are Brain's list, below. No `volatile` local |

## Findings

**BLOCKER:** none.

**SHOULD FIX 1: allocator typed `int`, results cast to pointers.** `Task_PostLocked` is declared `int` with `(void *)size` arguments in `func_02029f74.c`, `func_ov004_021cdd38.c`, `func_ov006_021c8e98.c`; with `(node_t *)` casts in `func_ov011_021d2428.c`; stored through `*(int *)` in `func_ov021_021aaf5c.c`. With `extern void *Task_PostLocked(int size, int align, int flags);` and no casts, `func_02029f74.c` and `func_ov011_021d2428.c` are 100.0% (verified). `func_0205af90.legacy_sp3.c`: `extern void *func_020453e8(int a);` and `dst=func_020453e8(0x204);` 100.0% (verified).

**SHOULD FIX 2: pointers passed as `(int)` / `(long)`.** `func_02066010.legacy_sp3.c` casts the same `&b` as `int`, `unsigned int`, `long` and `unsigned long`; with `extern void func_020672f4(Buffer *, int);` and plain `&b` it is 100.0% (verified). Same class, untried: `func_0205af90`, `func_02056264`, `func_ov006_021c72c8`, `func_ov009_021ac4d0`, `func_ov002_02239f10`; `found` in `func_0205af90` is an `int` used as `Item *`.

**SHOULD FIX 3:** `func_ov015_021b3280.c` line 35, `remaining = *(int *)&o->timer;` is a no-op cast of an `int`. `remaining = o->timer;` is 100.0% (verified).

**NOTE**

- `volatile`, `func_ov002_022a4250.c`: `a` is the literal 0x04000000 / 0x04001000 (DISPCNT A and B). Real hardware, keep.
- `func_ov002_02274bc0.c` (`done`) and `func_ov002_022a9d9c.c` (`Bits.active`) are ordinary game state, not MMIO and not shared. Without the cast: 47.5% and 64.3% (one load missing). I found no non-volatile spelling (pointer table, temp index: 47.5%). Declaring `done` itself volatile: 49.5%. This is the documented "repeated load" lever in `docs/compiler-quirks.md`, so I keep both as NOTE, not BLOCKER.
- `goto`: `func_020639c8` (restart scan after removing an item), `func_ov002_021be4a0` and `func_ov002_021fca38` (shared failure exit that sets a message), `func_ov002_0225702c` (shared cleanup call). All real control flow.
- Load-bearing oddities: `if(x == 0) { } else FAIL` in `func_ov002_021fca38` (plain `if(x) FAIL`: 98.1%); `(ModeBool)IsSpecialMode(...)` in `func_ov002_022a392c` (without: 11.3%).
- Unions: `func_ov002_021b7d54` (a struct member) and `func_ov002_021d6870` (a local bitfield word filled by field, then read as `bits`; its `rest` is never set). No overlay of a parameter.
- Function-pointer casts: `func_020507b4` calls a callback stored in the object (fine). `(int (*)(int,int))func_ov002_0228de58` and `(int (*)(int))func_0202f578` in `func_ov002_0228fa1c`, `func_ov002_021f781c`: the `(int)func_xxx` class.
- 71 of the 120 have `parked` rows after their `shipped` row; row order is not chronology and all 120 are 100.0%. 17 shipped functions were reverted by the driver (`tool-anomaly`) and are still `.s`.
- Tracked classes again: `(void *)player`, `(player & 1) * 0x868` with neighbour symbols (`func_ov002_0225ca60`, `func_ov002_02261c44`), `f()` declarations, `int *s` used as a struct (`func_ov009_021ac4d0`, which also pastes one switch twice), raw `char *` offsets (`func_ov011_021cca04`, `func_020507b4`).

## Sample

All 21 of 2049-4096 B read in full:

```text
ov002_021be4a0 ov002_021b4be4 ov002_0227b9b8 ov002_0225ca60 ov008_021b0bc4 ov002_022451b8 ov002_02261c44 ov002_0228fa1c ov002_021b59b0 ov002_02200908 ov002_02275ebc ov002_0225b338 020507b4.legacy_sp3 ov002_021b7d54 ov009_021ac4d0 ov002_0226eb5c ov002_021c034c ov002_0228300c ov002_021fca38 ov011_021d2428 0205af90.legacy_sp3
```

`Random(1022)` of the other 99, 20 read in full:

```text
ov002_021b2e04 ov002_0224eb3c ov004_021d6468 ov002_02239f10 020903d4.legacy ov002_0224b2e0 ov002_022a392c ov006_021c72c8 ov006_021c6104 02066010.legacy_sp3 ov011_021cca04 ov002_02238864 ov002_021f0028 ov002_0225702c 020639c8.legacy_sp3 ov021_021aaf5c ov002_021f80b0 ov002_02274bc0 ov015_021b3280 ov002_0223f5b4
```

No fake-match trick or sum-constants. Eight had a typing defect (above).

## Not checked

The other 79 files by eye; USA and JPN beyond Brain's gate.

## Verdict

Scope, ledger, checks and the EUR rebuild are clean, and no function needs reverting. Defects are type honesty only; none changes a byte. I would merge f580c1f40 with SHOULD FIX 1-3 as a follow-up.
