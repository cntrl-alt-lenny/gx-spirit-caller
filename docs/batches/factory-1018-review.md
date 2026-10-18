# Factory 1018 review (Sol)

Reviewed commit f9395cae5 (brain/factory-1018, base c52a72d6b). Verifier worktree only; main checkout untouched.

## Commands

| Check | Result |
| --- | --- |
| diff scope | 44 A + 44 D + 4 M (three `delinks.txt`, `attempts.tsv`); only `src/overlay000/004/011`; each `.c` pairs with its own deleted `.s`; 88 delinks lines, all header flips |
| reverted four (021cb568, 021d1a38, 021d7118, 021d9ef0) | still `.s`; each has a `tool-anomaly` row (`fastmatch-100-but-reference-check-wrong-target`) |
| `validate_attempts.py` | exit 0; 0 base rows removed, 118 appended (48 shipped, 70 parked) |
| `check_fake_matches.py` | `check_fake_matches: OK` (exit 0) |
| `check_delink_dupes.py` | `OK (81 delinks.txt, no duplicate .text addresses)` |
| `gate3.py --scope all --log <outside>` | `[eur] [usa] [jpn] SHA1 PASS`, `check_references: OK`, `1330 passed, 15 skipped`, `GATE PASS`, `gate3: GATE EXIT 0` |
| `progress.py --version eur` | Natural-C 585,122 B (base 580,654): +4,468 = 5,312 shipped-row bytes minus 844 for the four reverted, exactly |
| fastmatch, all 44 files | 44/44 `100.0% OK` |

## Findings

No BLOCKER.

**SHOULD FIX**
- `func_ov000_021acdcc.c:3-4`: `volatile` on `x`/`y` is unnecessary. With `volatile` removed the file is still 100.0% (fastmatch). The lint only flags volatile locals, so this member form passes it. It is a fake-match idiom, not a needed lever.
- `func_ov004_021ca0a4.c:5,10`: calls `func_0201e800` through a cast function pointer to hide a wrong one-argument declaration. Declaring `(void *, int)` (as `func_020299c4.c` and `func_ov000_021ad49c.c` do) and calling it directly is 100.0%.
- `func_ov000_021aa840.c`: three `goto`s. A `switch` with `case 1: case 2: case 3:` is 100.0%. (Plain `if (a||b||c)` is 18.2%, so the shape matters, the goto does not.)
- `func_ov011_021cd700.c:17`, `021cef38.c:16`, `021d0bb0.c:2-4`: five K&R `()` declarations hiding real arity (`func_ov011_021ce324` has a 3-int prototype in `include/game/prototypes.h`). `extern int func_ov006_021b3804(int,int,int,int)` is 100.0%; `()` is not needed.

**NOTE**
- `func_ov011_021cd1fc.c:19`, `021cd268.c:20`: reads `data_ov011_021d334a[-114]`, `[-40]`, `[-113]`, a neighbour symbol plus a negative offset into `data_ov011_021d32d8`'s table (334a = 32d8 + 0x72). The original asm does the same, and using `data_ov011_021d32d8[offset]` gives 0.0%, so it is match-forced, but it is the pattern the four reverted functions broke on.
- `func_ov000_021ab6ec.c`/`021ab740.c`: `unsigned address = (unsigned)data...` pointer laundering is needed (direct use: 13.6%). Honest but odd.
- `func_ov004_021d44cc.c`: `flag` shuffling; my tidier version scored 8.7%.
- Bitfield-as-byte structs with anonymous padding; the same symbol gets a different struct in each file (`data_ov000_021c7530` four layouts, `data_ov011_021d4000` about eight). `func_ov004_021d7854.c` sizes `list0[80]`/`list1[15]` only to reach offsets 0xac and 0xca.
- `func_ov004_021d05f4.c` uses raw MMIO addresses with proper `volatile u16 *`; fine.
- Stale rows: the four reverted functions keep a `shipped` row in `attempts.tsv` beside the `tool-anomaly` row.
- No constant arithmetic, `asm`, `#pragma`, `register` or section tricks in any file.

## Parked retries

The two top parks (`021ca03c` 90.9%, `021d2c64` 90.0%) each hold a `bl` into a shared overlay base that `relocs.txt` lists as `module:none`, with no ov011 symbol. C cannot express it (wall C-32); not retried. `021ca0ac` (66.7%) is the same. `func_ov004_021d1308` (81.8%): I tried 13 shapes (local, pointer-first, order, `unsigned`, struct buffer). Every one stays at 81.8%, the same two register letters (`r3`/`ip`) swapped; no match, so likely a register-allocation wall.

## Sol vs night-1 Sonnet

Fewer arithmetic constants (zero versus five-plus) and one `goto` file versus five. Heavier use of bitfield structs and pointer casts; K&R `()` externs are new. Wrong-signature externs persist in both.

## Not checked

JPN/USA behaviour beyond gate3; field naming; whether `021cd1fc` and `021cd268` could match another way.

## Verdict

The gate and my own fastmatch agree: all 44 functions match, the diff is scoped exactly as claimed, and the byte gain equals the shipped sizes. The four reverted functions are correctly back on `.s`. Defects are readability and honesty, not match fraud: one needless `volatile`, one cast hiding a wrong prototype, a few gotos and `()` declarations. I would merge, with the `volatile` removal as the first follow-up.
