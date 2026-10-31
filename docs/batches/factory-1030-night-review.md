# Factory night 8 review (Sol, 253 functions)

Reviewed commit ae06dbe68 (verifier/factory-1030-night, base 88c314c20). Read-only: no build, no gate, no `src/` edit. Fastmatch was not re-run (it needs the toolchain); Brain's "each file 100%" claim for the tidy commit is unverified here.

## Commands

| Check | Result |
| --- | --- |
| diff scope | 253 A `.c`, 253 D `.s`, 34 M (18 `delinks.txt`, 15 existing `.c`, `attempts.tsv`). 253 unique function names, none also left as `.s`. |
| delinks routing (scripted) | every new `.c` appears exactly once across all `delinks.txt`; no routed path is missing a file; no path routed twice |
| ledger | base 12951 lines are a byte prefix of the new file; +3094 rows, 0 deleted |
| grep of 253 new `.c` | 0 `asm`, `#pragma`, `register`, `while(0)`, `__attribute__`. 3 files use `goto` (below). All includes resolve |
| data-offset scan | every `data_X + off` that lands past a different symbol was compared with the original `.s` literal pool: only `func_020548f4` and `func_02064dfc` rely on it, and both pool words are literally `data_X+off`. Honest |
| sample | 58 files read: all 6 files over 1024 B (the other 2 ledger sizes over 1024 B, `func_ov004_021da36c` and `func_02083dd8`, are reverted, still `.s`), 8 volatile files, 44 spread over main and overlays 000, 002-006, 008, 010, 011, 016, 021 |

## Findings

**BLOCKER:** none.

**SHOULD FIX 1:** `src/main/func_020a6924.legacy.c` line 18 casts the local array `data` to `volatile unsigned short *` twice. That is `volatile` on a local in all but syntax, and neither a 0x04 address nor memory read twice by source. Needs a non-volatile shape or an explicit waiver.

**SHOULD FIX 2:** `src/main/func_020678b8.c` lines 6 and 11 cast `s` to `volatile unsigned char *`. Plain heap/table bytes, one read per site; the cast only defeats reuse.

**SHOULD FIX 3:** `src/main/func_02059e5c.c` line 7, `Res * volatile res`. Line 16 stores `p->res`, line 17 reloads it. Not MMIO, not IRQ-shared; it is a store-forwarding lever.

**SHOULD FIX 4:** `src/main/func_02045d0c.legacy_sp3.c` line 7, `volatile unsigned char mode`, was not on Brain's list of volatile files. Needs the without-volatile percentage recorded, or a drop.

**SHOULD FIX 5:** integer-to-pointer casts to fit `func_ov002_022536e8(void *self, ...)`: `func_ov002_0223d1ec.c` (lines at `case 0x80`, `0x7c`, `0x7b`), `func_ov002_021f9434.c` line 25, and one more `(void *)self->owner` file. Rule: fix the declaration, not the call. Retype that parameter as `int`.

**NOTE:** `func_020b0afc.c` line 23, `volatile struct Num *` on a loop bound. It reloads `a->len` every iteration, which the original does; keep but record.

**NOTE:** the other volatile files are acceptable. `func_020940ac.legacy.c` is MMIO (0x040000b0, 0x040000e0). `func_02097528.legacy.c` and `func_0209c280.legacy.c` hold IRQ-shared fields inside `OS_DisableIrq` brackets (same accepted pattern as night 7); `f3c = f40` at line 40 reads back a just-written field.

**NOTE:** `goto`: `func_02037414.c` (lines 83-114: `select_slot`/`load_slot` retry cycle), `func_0200bb5c.c` (failure cleanup), `func_02010354.c` (`found`). Plausibly original control flow; not a switch/if substitute.

**NOTE:** `func_02021cd8.c` declares unused `int count, val; unsigned short timeout;` in three case blocks. Also `(const char *)0xc`/`0x11c` string ids in `func_ov002_0223d1ec.c` and `func_ov002_021f8348.c`.

**NOTE (tidy commit ae06dbe68):** sound. 22 files, +22/-22; 6 `volatile` drops on struct fields, return type `int` on `func_0203724c`, `unusedN` params on definitions only. The added params invent arity (tracked class, 63 new files carry `unused`).

**NOTE (revert eec156dbc):** sound. `func_02006394.s` is byte-identical to base, `delinks.txt` flipped back, a `parked` row appended; the earlier `shipped` row stays (append-only).

**NOTE (duplicates):** 37 addresses shipped twice (J1/J2 8, J7/J8 29). Each has one `.c`, one route, no stray `.s`. Ledger has 315 `shipped` rows for 253 files (37 duplicates plus 25 reverts, all 25 still `.s`), so size credit must come from files, not row sums. Ledger briefs read `factory-1031-*` for batch 1030.

## Not checked

195 other new files by eye; USA and JPN; any build result.

## Verdict

merge
