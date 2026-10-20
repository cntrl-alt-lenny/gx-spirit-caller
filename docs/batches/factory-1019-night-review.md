# Factory night 3 review (Sol, 460 functions)

Reviewed commit f0a881170 (brain/factory-1019-night, base 3f122fe2e). Verifier worktree only.

## Commands

| Check | Result |
| --- | --- |
| diff scope | 460 A `.c`, 460 D `.s` (same function each), 25 M `.c`, 17 delinks, `attempts.tsv`, `reference_baseline.txt`. No libs/. The 920 delinks lines are exactly the 460 `.s:` to `.c:` flips of the shipped set (scripted, 0 strays) |
| 25 M files | only added `intN unusedN` parameters to existing callee definitions; no bodies changed |
| baseline lines removed | 2, both for `func_0201cd1c.s`, which is deleted in this diff |
| grep of 460 new `.c` | 0 `asm`, `#pragma`, `register`, raw data, section attributes, `do{}while(0)`. `goto`: 3 files (`0200b614`, `0200ba00`, `020add04`), cleanup/reset labels, read as source. No `.s` symbol is missing from any `.c` (scripted over all 460; no neighbour+offset names) |
| `validate_attempts.py` | exit 0, `errors: 0`; base 6123 rows unchanged and first; +1098 rows (466 shipped, 630 parked) |
| reverted 7 | each shipped row is followed by a parked row, function still `.s` (incl. `022b8430`, Brain's review row) |
| `check_fake_matches.py` / `check_delink_dupes.py` | `OK` (exit 0, `do-while-zero 3, volatile-local 1`, all baselined) / `OK (81 delinks.txt...)` |
| `check_match_invariants.py --version eur` | **exit 1**, `0 error(s), 13999 warning(s)` (placeholder-name warnings; the gate calls it advisory) |
| gate3 `--scope all` | `[eur] [usa] [jpn] SHA1 PASS`, `check_references: OK`, `1328 passed, 17 skipped`, `GATE PASS`, `gate3: GATE EXIT 0` |
| `progress.py --version eur` | Natural-C **876,638** (base 713,310, +163,328), asm-C 4,420 unchanged. Ledger sizes of the 460 survivors sum to 163,328 |

## Findings

**SHOULD FIX 1: int passed where the prototype says pointer.** `func_ov002_02244554`, `0226e580`, `0228b9d8`, `022645b4`, `0221e2a4` write `(void *)side` or `(void *)self->player` into `void *` parameters of `func_ov002_022536e8`, `021d7970`, `021e276c`; others pass the int uncast. Verified fix: declare the first parameter `int`, drop the casts: 100.0% in all five. `func_ov002_0220df58.c` takes `int a` and casts it to `struct Self *`; typing the parameter `struct Self *` is 100.0%. The callee definitions in `src` still say `void *`.

**SHOULD FIX 2: `func_02047c08.legacy_sp3.c:49` casts `func_020454cc` (declared `void(int,int)`) to an allocator type.** Declaring it `void *func_020454cc(void *, unsigned int)` and dropping the cast is 100.0%.

**NOTE**
- Two parked functions the ledger scored 99.1% match at 100.0% by reordering one address sum: `func_ov002_0221f0e4` (`+0x30+kind*20`) and `func_ov002_021dbd48` (`off + 0x30 + row`). The only diff word was `add` operand order. Both 100% files sit in Brain's shared side-session notes folder as `func_ov002_0221f0e4.verified100.c` and `func_ov002_021dbd48.verified100.c`. Not committed.
- Nine non-hardware `volatile` sites (struct fields, one pointer parameter, one `self+0x70` cast) are all load-bearing: without it 55.4% (`0206d1f0`), 38.5% (`ov000_021aaee4`), 5.8% (`ov002_02253458`), 63.5% (`0207e92c`), 49.0% (`02046254`), 58.0% (`020a56bc`), 4.0% (`0207df20`). `0208eb40` and `ov002_022b540c` are MMIO.
- 28 files pass callbacks as `(int)func_...`; 64 files declare a callee with empty `()`, every one with a comment (an improvement).
- `func_0204d284` and `0204d4b4` use `W/H/B(ptr, offset)` macros instead of a struct.

## Sample

50 by `Random(1020).sample` over the sorted added `.c` list (listed below); 10 retries by `Random(1021).sample` of the 56 N5 functions with an older parked row: ov002 `02242e50 02240650 021de940 0224d794 021f95f8 0220000c 02248b5c 0221af10 02251bb0 0222cc50`. All read against their `.s`: control flow is real source, externs agree with the callers' loaded registers, types are plausible. The int-as-pointer cases above are the only type defects found.

```text
02046254.legacy_sp3 020142b4 ov002_02226e8c ov002_022a6860 ov002_022158c0 ov002_0224b1e0 0207e3d4.legacy_sp3 ov002_021d81d4 ov002_022ac610 ov002_022517c0 ov002_021c9650 ov002_02200140 ov002_022172f0 ov002_0223529c ov002_022369c0 ov002_021cb174 ov002_021e1920 ov002_02216004 02019ce0 ov002_02222f08 0204ead0.legacy_sp3 02019af4 ov002_02251bb0 ov002_0229a98c ov002_022304d4 02084914.legacy_sp3 ov002_0221a240 ov002_0224b68c ov002_022705f8 0204d284.legacy_sp3 0203a950 0206504c.legacy_sp3 ov002_0220df58 ov002_022153bc 0203a194 ov002_02256108 ov002_0222d464 02005f2c ov002_022125e8 020a56bc.legacy 0207d78c.legacy_sp3 ov002_021d30c8 02044eec.legacy_sp3 ov002_022b3448 ov019_021b3f7c 0204d4b4.legacy_sp3 ov004_021cc49c ov002_021f4d78 ov000_021ab01c ov002_021bb068
```

## Patterns for the agent prompt

- Declare a parameter `int` when the original passes a player or side number; never cast it to `void *`.
- Never cast a function to a different signature to store it; fix its declaration.
- At 99.x% with one `add` word wrong, permute the order of the terms in the address sum before parking.

## Not checked

The 400 unread files; USA/JPN beyond the gate; the 26 corrected callee lists beyond the 25 diffs read.

## Verdict

The scope is exactly as claimed and the gate passes in all three regions, so every shipped function is byte-identical. Defects are type honesty, not fraud: 0 of 60 read files needed a body change, 6 had a typing defect. I trust the 400 unread functions at that rate and would merge f0a881170, with SHOULD FIX 1 and 2 as a follow-up.
