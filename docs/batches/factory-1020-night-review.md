# Factory night 4 review (Sol, 397 functions)

Reviewed commit 2c58deb2c (brain/factory-1020-night, base 7f7e188c8). Verifier worktree only.

## Commands

| Check | Result |
| --- | --- |
| diff scope | 397 A `.c`, 397 D `.s` (same function each, scripted), 29 M. Only `src/`, 18 `delinks.txt`, `attempts.tsv` change. 794 delinks lines = exactly the 397 `.s:` to `.c:` flips; 0 stray lines. The 10 modified `src` files only add `intN unusedN` parameters to callee definitions (one of them an `asm` file, signature only). No baseline file changes |
| grep of 397 new `.c` | 0 `asm`, `#pragma`, `register`, raw data, section attributes, `do{}while(0)`, extern asm. `goto`: 2 files (`0200b384`, `0200b7fc`), allocation-failure cleanup labels, read as source. 3 `union`s, all struct members, none wraps a local or parameter. 16 files with `volatile`: 13 are MMIO 0x04000000-0x04001xxx; 3 are not (below) |
| `validate_attempts.py` | exit 0; base 7221 rows unchanged and first; +1135 rows (402 shipped, 733 parked) |
| reverted 5 | `022b8430`, `022b867c`, `0207845c`, `02049270`, `02055f84`: each is still `.s`, shipped row followed by a parked row (`022b8430` has the review row) |
| `check_fake_matches.py` / `check_delink_dupes.py` | `OK` (exit 0, `do-while-zero 3, volatile-local 1`, baselined) / `OK (81 delinks.txt...)` |
| `check_match_invariants.py --version eur` | exit 1, `Found 13999 issue(s): 0 error(s), 13999 warning(s)` (placeholder-name warnings, same as night 3) |
| gate3 `--scope all --log` outside the worktree | `[eur] [usa] [jpn] SHA1 PASS`, `check_references: OK` (baseline entries 5906, unchanged), `1328 passed, 17 skipped`, `GATE PASS`, `gate3: GATE EXIT 0` |
| `progress.py --version eur` | Natural-C **992,550** B, asm-C **4,420** unchanged. 992,550 - 877,558 = 114,992 = sum of the 397 ledger sizes |

D1+D2: 130 functions of 513-1024 B (delinks ranges match the ledger lanes); D3-D6: 267.

## Findings

**SHOULD FIX 1 (night 3's again): side or player int passed as `void *self`.** `func_ov002_021e276c` (10 new files; `0222396c`, `0222c3dc` cast), `func_ov002_022536e8` (3 files; `02242f28` casts) and `func_ov002_021e2550`. Verified 100.0%: first parameter `int`, casts dropped, in `0222c3dc`, `0222f67c`, `0222396c` (plus `func_ov002_021d7c1c(int a, void *b, int c)`), `02242f28`, `0223fa20`. The definitions also compile at 100.0% as `(int self, ...)`, with `func_ov002_021d59cc(int self, ...)` and `typedef void (*Handler)(int self, ...)`.

**SHOULD FIX 2: `Task_PostLocked` sizes cast to `void *`, result cast from `int`.** `0200b384`, `0200b7fc`, `0202838c`, `022ac0c0` write `(Type *)Task_PostLocked((void *)(n * 4), 4, 0)` (16 sites), because `Task_PostLocked.c` is defined `int Task_PostLocked(void *arg0, int, int)`. Verified 100.0%: `extern void *Task_PostLocked(int size, int align, int flags);` with no casts in those four, and the definition itself as that signature calling `void *func_0207d494(void *ctx, int size, int align)`.

**SHOULD FIX 3: other int/pointer swaps**, each 100.0% after the change: `func_ov002_021d2d18.c` `extern Packed *func_ov002_021b9b64(int unused0);` and `*func_ov002_021b9b64(id)`; `func_ov004_021d5ce4.c` `extern void *func_02031d80(...)`, `node = func_02031d80(...)`; `func_020326d4.c` `extern void *func_02032e38(ctx_02032e38_t *ctx, int size, int align);` and `func_02032e38(obj, size, 4)`; `func_020a3b20.legacy.c` `extern void func_020a5d74(int);` and no `(char *)` cast.

**NOTE**
- The 3 non-MMIO `volatile` sites are load-bearing: without it `0201f954` 21.8%, `02046a5c` 34.6%, `0208c844` 18.8%.
- `ov002_021ded8c` uses `(Event *)&event` over a `u32` parameter; the original spills r1, so faithful, but a by-value `Event` is honest.
- `ov002_0224c69c` has stray blank lines; `func_ov014_021b4810(int unused0)` is called with a pointer.

## Sample

Big, `Random(1022)` of 130:

```text
020716bc.legacy ov002_022ac0c0 ov002_02243ae4 02017888 ov002_022a4c90 ov002_021c1ad0 ov002_02215540 ov002_02237994 ov002_02236228 02015f7c ov019_021b573c ov002_022bb294 020a3b20.legacy 02064864.legacy_sp3 ov002_021d600c 02014c3c ov002_0227b174 02075df4.legacy ov002_021f72f8 ov002_0224c69c ov002_022bc2b4 ov002_022ae7b4 ov010_021b3774 ov000_021aa5b8 0207bfd4.legacy 0202838c 02030c7c ov015_021b2df8 ov002_02239b68 ov011_021cd35c
```

Retry, `Random(1023)` of 263 with an older parked row:

```text
ov014_021b2644 ov006_021c63cc ov011_021ce344 020a67cc.legacy ov004_021d5ce4 ov002_0224d374 02000d4c ov004_021d5318 ov002_021d2d18 ov002_022a63d0 ov002_021ded8c ov002_021ebf40 ov002_021f1bac ov002_02203074 020aed64 020326d4 ov010_021b7218 ov002_0223876c 020aaec0 ov002_022214dc 02052ecc.legacy_sp3 ov002_0224e184 ov002_0222f67c ov006_021cab6c 0206d79c.legacy 0208be9c.legacy ov002_0222c3dc ov002_02252558 02092074.legacy ov011_021cc814
```

All 60 read in full. Control flow reads as source; nothing bent to fit; struct layouts plausible.

## Parked big functions tried (20 min each)

- `func_ov002_022a60f4` (98.6%): best 85.7%. Declaring the four bitfield locals in reverse order fixes stack slots; the original overwrites `sub` with the computed value, but register scheduling still differs.
- `func_ov010_021b3a1c` (97.8%): 51.1%. It needs a second pool word for `data_ov010_021b8d08`, i.e. a symbols alias I may not add.

## Patterns for the agent prompt

- Parameters fed a side, player or size are `int`; fix the definition, not each cast.
- Allocator results are pointers; never wrap `(void *)` around an int.

## Not checked

The 337 unread files; USA/JPN beyond the gate; the 2 caller return-type edits; untried same-class sites.

## Verdict

Scope is as claimed and the gate passes in all three regions, so every shipped function is byte-identical. Defects are type honesty only: 0 of 60 read files needed a body change, about 12 had a typing defect. I trust the unread 337 at that rate and would merge 2c58deb2c, with SHOULD FIX 1-3 as a follow-up touching only externs and four definitions.
