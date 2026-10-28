# Factory night 7 review (Sol and Terra, 222 functions)

Reviewed commit 68f960d85 (verifier/factory-1027-night, base c912cc30f). Verifier worktree only; no `src/` edit is committed. Lanes G1-G12 and G14 merged; G8 and G12 shipped 0.

## Commands

| Check | Result |
| --- | --- |
| diff scope | 222 A `.c`, 222 D `.s` (same directory and function each, scripted; legacy suffix normalised), 61 M. Only `src/`, 17 `delinks.txt`, `attempts.tsv` and `reference_baseline.txt` change. 222 `.s:` lines became `.c:` lines and nothing else moved in `config/` (scripted); the flipped names equal the added files. No `symbols.txt`, `fake_match_baseline.txt` or `.sha1` touched. 42 existing `src` files are modified (below). Shipped per lane: G1 22, G2 14, G3 14, G4 9, G5 33, G6 25, G7 3, G9 3, G10 4, G11 93, G14 2 |
| baseline diff | exactly 12 `missing-reloc` lines deleted, all for `func_ov002_021dbf98.s`; 0 added (5903 to 5891) |
| `validate_attempts.py` | exit 0, `"errors": 0`, 12745 rows. Main's 11412 rows are an unchanged prefix (numstat 1333 added, 0 deleted); +1333 rows (228 shipped, 1105 parked) |
| `check_fake_matches.py` / `check_delink_dupes.py` | `OK` (exit 0, `do-while-zero 3, volatile-local 1`, baseline entries 4, unchanged) / `OK (81 delinks.txt, no duplicate .text addresses)` (exit 0) |
| `check_match_invariants.py --version eur` | exit 1, `Found 13999 issue(s): 0 error(s), 13999 warning(s)` (placeholder names, same as night 6) |
| `progress.py --version eur` | Natural-C **1,516,374** B (**63.55%**), asm-C 4,420 unchanged. Base c912cc30f measured the same way: 1,368,394 (57.35%). Delta 147,980 = sum of the 222 ledger sizes (scripted, one `shipped` row per new file) |
| `ninja sha1` (EUR, fresh configure) | exit 0, `gx-spirit-caller_eur.nds: OK`. Not the gate; Brain's three-region gate stands |
| `fastmatch.py eur` | all 222 new `.c`: exit 0, 222 of 222 `100.0%`. All 42 modified `.c`: exit 0, 42 of 42 `100.0%` |
| grep of 222 new `.c` | 0 `asm`, `#pragma`, `register`, `while(0)`, `goto`, raw data, section attributes. 9 files hold a `union` (below). 23 hold `volatile` (below) |

The 6 other `shipped` rows (`func_020667e8`, `func_0207b250`, `func_02083dd8`, `func_020b0778`, `func_ov006_021c9efc`, `func_ov006_021ca6f4`) are driver reverts; all six are still `.s`.

## Findings

**BLOCKER:** none.

**SHOULD FIX 1:** `src/main/func_0209c8d0.legacy.c` line 2, the `Context` typedef only exists for a `(Context *)p` cast. Its `volatile` is not needed. Before: `typedef struct { int *buffer; int command; char pad[0x10c]; volatile u32 flags; } Context;` After: `typedef struct { int *buffer; int command; char pad[0x10c]; u32 flags; } Context;` Verified: `func_0209c8d0 ... 100.0%  OK`. The `volatile` on `Core.flags` (line 6) must stay: 17.3% without.

**SHOULD FIX 2:** `src/overlay006/func_ov006_021b8544.c` line 55. Before: `category = func_ov006_021b9c98((int)base, (u16)(s[1]|(*(volatile u8 *)s<<8)));` After: `category = func_ov006_021b9c98((int)base, (u16)(s[1]|(*s<<8)));` Verified: `func_ov006_021b8544 ... 100.0%  OK`. The `volatile` on line 47 (`while (*(volatile u8 *)s)`) is needed: 27.0% without, also with `while (s[0])`.

Both together, applied then reverted: both `100.0%  OK`.

**NOTE: the other six listed `volatile` files, each tried without it.**

| File | Without `volatile` | Judgement |
| --- | --- | --- |
| `func_02056884` (`Owner.count`) | 67.6% | documented repeated-load lever (decrement, then test the stored value) |
| `func_020751e4.legacy` (`extern volatile u16 data_02101ec4[]`) | 50.9%; `p[0]`/`p[1]` spelling 49.1% | repeated-load lever on a constant table, not MMIO; the source comment says so |
| `func_02097848.legacy` (`Node.flags`, `Context.flags`) | 41.4% both, 64.9% Node only, 41.4% Context only | both needed; IRQ-shared flags inside `OS_DisableIrq` brackets, plausibly real |
| `func_02097af0.legacy` (both `flags`) | 4.8% both, 8.7% / 6.3% singly | both needed; same IRQ-shared structure |
| `func_ov004_021cb9e4` (`layers(volatile u32 *reg)`) | 0.9% | every caller passes 0x04000000 or 0x04001000: real MMIO |
| `func_ov007_021b22d8` (`volatile Display *` at 0x4001000) | 44.4% | real MMIO (cast of a 0x04 address) |

No `volatile` outside those eight files is anything but a cast of a 0x04xxxxxx address (scripted: every other hit matches `0x0?4[0-9a-f]{6}`).

**NOTE: other greps.** Sums such as `+ 0x868 + 0x30` are struct stride plus field offset into `data_ov002_022cf16c`, never an address. The 9 unions are bitfield words or a byte swap or a struct overlay; none overlays a parameter. Tracked classes continue: 16 files with `(int)func_xxx` casts, 7 with `(int)&`, 19 with `f()` declarations, 64 with `unusedN` parameters. `data_ov002_022cf16c` has 8 different local types across G11 files (`char[]` in 40); later it needs one shared declaration.

## G11 sample (check 5)

93 shipped of 124 functions tried. `Random(1027)` of the 93, 18 read in full; all honest game logic, no trick. Seen:

```text
ov002_022583b4 ov002_021e8bc4 ov002_02263dec ov002_0224a618 ov002_021c2c54 ov002_0225406c ov002_021b1d84 ov002_021ea2b4 ov002_02204380 ov002_02262804 ov002_0224eeac ov002_02252014 ov002_02256f38 ov002_02275938 ov002_02212d98 ov002_02216dd0 ov002_02224cf4 ov002_0221b804
```

Oddities, none a trick: `func_ov002_02252014` reuses parameter `unused` as scratch and holds `(int)&data` in an `int`; `func_ov002_021b1d84` uses one symbol as `char *` and as a struct; the pack `((side<<31)&0x80000000)|((x<<16)&0x1f0000)|id` is in 7 files (an inlined helper, worth a macro).

Why the jump (ledger, scripted): all 93 had earlier rows, median prior best 36.2%, 51 below 50%, so not near misses. 90 were tried before at the same tier, so it is not a tier change. Prior park classes were mostly `reg-alloc`. 82 of the 93 use a 32-bit card-word bitfield struct (`id:13`, flag, pad, index) and 17 index a struct array by `[player & 1]` instead of `char *` plus `(player & 1) * 0x868`. I cannot see the lane prompt; my reading is that these two shapes unlock the register-allocation parks as a class, and one lane on one overlay lets neighbours' types compound.

## Not checked

The other 204 new files by eye; USA and JPN; the lane prompts.

## Verdict

Scope, ledger, baseline, ROM rebuild and all 264 touched units are clean. I would merge 68f960d85; SHOULD FIX 1 and 2 can follow.
