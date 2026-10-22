# Factory night 5 review (Sol, 422 functions)

Reviewed commit bbba5a5cf (verifier/factory-1021-night, base 8f61edf8c). Verifier worktree only; no `src/` edit is committed.

## Commands

| Check | Result |
| --- | --- |
| diff scope | 422 A `.c`, 422 D `.s` (same function each, scripted; 80 are `.legacy*.c` replacing a plain `.s`), 35 M. Only `src/`, 20 `delinks.txt`, `attempts.tsv` and `reference_baseline.txt` change. 422 `.s:` lines became 422 `.c:` lines and nothing else moved in `config/` (scripted, legacy suffix normalised). 13 modified `src` files only add `intN unusedN` parameters (one is an `asm` file, signature only). Lanes: E1 55, E2 60, E3 58, E4 36, E5 42, E6 28, E7 43, E8 62, E9 38 |
| baseline diff | exactly 6 `missing-reloc` lines deleted, all for `func_0200c874.s` and `func_02077398.s`, both replaced here |
| `validate_attempts.py` | exit 0, `errors: 0`, 10037 rows. Main's 8356 rows are a byte-identical prefix; +1681 rows (433 shipped, 1248 parked), all appended |
| `check_fake_matches.py` / `check_delink_dupes.py` | `OK` (exit 0, `do-while-zero 3, volatile-local 1`, baseline entries 4, unchanged) / `OK (81 delinks.txt, no duplicate .text addresses)` (exit 0) |
| `check_match_invariants.py --version eur` | exit 1, `Found 13999 issue(s): 0 error(s), 13999 warning(s)` (placeholder names, same as night 4) |
| `progress.py --version eur` | Natural-C **1,255,414** B (52.62%), asm-C **4,420** unchanged. 1,255,414 - 992,550 = 262,864 = sum of the 422 ledger sizes |
| `ninja` (EUR, my worktree) | exit 0, `gx-spirit-caller_eur.nds: OK`. Not the gate; Brain's three-region gate stands |
| grep of 422 new `.c` | 0 `asm`, `#pragma`, `register`, `goto`, `while(0)`, raw data, section attributes, function-pointer-cast calls. 16 files hold a `union`: all are bitfield words or struct members, built from memory or fields, none overlays a parameter and none is `volatile` |
| `volatile` (33 files) | 23 are only MMIO (0x04xxxxxx, VRAM 0x05-0x07 as plain args). The other 10 are Brain's list: 5 are MMIO or DMA control reads, 5 are struct fields or globals (below). No `volatile` local, no volatile cast of ordinary memory |

## Findings

**BLOCKER:** none.

**SHOULD FIX 1: ids and sizes passed as `void *`, because old definitions say `void *`.** Verified 100.0%, one edit per group, no `src` edit kept:

- `func_ov002_021b0c04.c`: `int self` (and its two externs); drop `(void *)` at 021ced48, 021d264c, 02211b64, 02226268 (2), 02227834. Seven files 100.0%. About 20 older callers share the cast.
- `func_ov002_021ae4bc.c`: `int self` (and `func_ov002_0229ce5c(void *buf, int self, int result)`); drop casts in 02272414, 022726b4. 100.0%.
- `func_ov004_021c9ef0.c`: `int selfv`, `func_0202c0c0(int id)`; drop casts in `func_ov004_021d83b0.c`. 100.0%.
- `func_02037dc0.c`: `(int modeArg, int arg1, int arg2)`, `func_02037d28(void *, int, int)`; drop casts in `func_ov002_022bc4fc.c`. 100.0%.
- `func_02050054.legacy_sp3.c`: `(int a0, int a1)`, `func_0204525c(int, int)`, `FnPtr(int, ...)`; drop casts in `func_020501cc.legacy_sp3.c`, `func_02050450.legacy_sp3.c`. 100.0%.

**SHOULD FIX 2 (tracked class, new callers):** `(void *)` on a side or player in 021e105c, 0221e6c0, 02226574, 0223cb40 (also calls `func_ov002_022536e8` with 2 args), 022414ec, 02272414 and `func_ov002_021d7c1c((void *)self->side, (void *)idx, 0)` in 0221bfb0. `Task_PostLocked`: `extern void *Task_PostLocked(int size, int align, int flags);` and no casts, verified 100.0% in `func_020085e4.c`, `func_ov002_022ac9ec.c`, `func_ov004_021dba08.c`, `func_ov005_021ab00c.c`, `func_ov011_021d2008.c`. `func_ov005_021ab3e8.c` (3 sites, int fields hold the result) not tried.

**SHOULD FIX 3:** `func_ov002_0226d00c.c` is `(void *self, int id)` but uses `(int)self` 15 times. With `int self` and `func_ov002_022536e8(int, int, int)` declared in-file: 100.0%.

**SHOULD FIX 4:** `func_ov002_02217d5c.c` reads `masks[side+2]` past `masks[2]`. `u16 masks[4];` replacing `masks[2]; counts[2]` and `masks[2]`/`masks[3]` for the two `counts` writes: 100.0%.

**NOTE**

- Non-MMIO `volatile` is plausible shared state: `Context.index` (020501cc), `mode` (0204717c), `History.index` (021cdb64), three RX-ring globals (02073ac0), two `Obj_t` fields and `Entry.size` (020a2784).
- Load-bearing oddities, not fixable by tidying: dropping `Packed *q = &p` in 022461d8 gives 18.0%; `counts[side]` in 02217d5c gives 42.0%.
- 121 ov002 files index `data_ov002_022cf16c` as a `char` array with `(player & 1) * 0x868`; four loops (02251908, 02252998, 02252d98, 0224f3e4) read the count as `base + 0x10`/`0x14`/`0x18` where `data_ov002_022cf17c`/`80`/`84` exist. A shared board struct is the real fix.
- 47 `(int)func_xxx` callback casts in 31 files; 64 files declare callees as `f()`, 17 of them `func_ov002_021ca2b8`.
- 0204abfc: empty `if` with a comma-reload of `data_0219dc84`; 0203244c reuses `result` as constant 0.
- 11 shipped functions were reverted by the driver (`tool-anomaly`); each is still `.s`, the ledger shows shipped then parked.

## Sample

Big, `Random(1021)` of 70 (1025-2048 B), 15:

```text
ov008_021ad570 ov006_021bb954 ov002_021ced48 ov002_021fe3d4 ov002_021feb08 ov002_022a10fc ov002_022a7054 ov002_0226d00c ov002_021e3968 ov002_021cb584 0204abfc.legacy_sp3 ov002_022b4950 ov002_0229c7f8 ov002_021fc3e8 020a9960
```

Mid, of 209 (513-1024 B), 15:

```text
0207b62c.legacy ov002_02229ee8 ov005_021ab3e8 ov002_022b4df0 ov002_02299d34 02015b10 ov002_021fb21c ov002_022acd4c 0200c874 ov000_021ae69c ov002_0229d32c ov002_0223f6c4 ov002_02217d5c ov002_022461d8 0204d674.legacy_sp3
```

Retry (E7-E9), of 143, 15:

```text
ov002_021eff70 ov002_0224f3e4 ov002_02251908 ov002_02252998 ov006_021b7db0 ov005_021ad284 ov002_02252d98 0203244c 020125ac 020a72f0 ov004_021db780 ov017_021b66a8 02093014.legacy 02046b3c.legacy_sp3 ov012_021cb320
```

All 45 read in full: no fake-match trick, no sum-constants. About 8 had a typing defect, 1 an out-of-range index.

## Not checked

The other 377 files; USA and JPN beyond Brain's gate; older `(void *)` callers outside this diff.

## Verdict

Scope is exactly as described, ledger and checks are clean, and EUR rebuilds byte-identical. Defects are type honesty only, none changes a byte. I would merge bbba5a5cf with SHOULD FIX 1-4 as a follow-up touching definitions and externs.
