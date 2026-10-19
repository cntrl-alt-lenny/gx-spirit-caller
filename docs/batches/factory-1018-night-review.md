# Factory night 2 review (Sol, 471 functions)

Reviewed commit 63f469813 (brain/factory-1018-night, base 743434fec). Gate re-run at 75d3b3cd9, Brain's later commit that restores 5 baseline lines. Verifier worktree only.

## Commands

| Check | Result |
| --- | --- |
| diff scope | 471 A `.c`, 471 D `.s` (each `.c` is the name its own delinks line flips to, including `.legacy`/`.legacy_sp3`), 21 delinks, `attempts.tsv`, `reference_baseline.txt`, 19 M `.c`. 942 delinks lines, all `.s:` to `.c:` flips of exactly the shipped set |
| the 19 M files | only added `int unusedN` parameters to existing callee definitions, no body change |
| `validate_attempts.py` | exit 0, `errors: 0`; base rows unchanged and first (5081 to 6124); +1043 rows (475 shipped, 568 parked) |
| reverted four (`0203e610`, `0206b0c4`, `020548f4`, `02008ac8`) | still `.s`; each has a `tool-anomaly` row |
| `check_fake_matches.py` / `check_delink_dupes.py` | `OK` (exit 0) / `OK (81 delinks.txt, no duplicate .text addresses)` |
| gate3 at 63f469813 | `[eur] [usa] [jpn] SHA1 PASS`, pytest `1330 passed`, **check_references FAIL**: 5 NEW wrong-target (`0203e610` x1, `020548f4` x3, `0206b0c4` x1), `GATE EXIT 1` |
| gate3 at 75d3b3cd9 | three SHA1 PASS, `check_references: OK`, `1330 passed, 15 skipped`, `GATE PASS`, `gate3: GATE EXIT 0` |
| `progress.py --version eur` | Natural-C **705,934** (base 585,122), C-decompiled 717,730 (base 589,542) |

## Findings

**SHOULD FIX 1 (resolved by 75d3b3cd9).** Removing 8 "STALE" baseline lines was wrong for 5: the three functions were reverted to `.s`, so their lines were still needed. Brain restored them.

**SHOULD FIX 2: Natural-C undercounted by 7,376 B.** Expected 585,122 + 128,188 shipped = 713,310; got 705,934. C-decompiled rose by exactly 128,188, so the bytes exist but 29 files (7,376 B) land in asm-C. `progress.py:368` classifies any `\basm\b` as asm-C and these files only say `extern asm void OS_RestoreIrq(int)` (13 files) or `extern asm void func_020944a4()` (10) and similar in a declaration. Verified fix: `sed 's/^extern asm /extern /'` is 100.0% (fastmatch) on `func_0203251c`, `func_ov008_021abba0`, `func_0207b888.legacy`. Not tested on the other 26.

**SHOULD FIX 3: int passed as pointer.** `func_ov002_02212e9c.c` `(void *)side` with `void *arg0` prototype; `func_ov002_0220a328.c` `(void *)self->player` into `func_ov002_022536e8(void *self,...)`. Declaring `int` and dropping the casts is 100.0% in both files. The callee definition in `src` has the same wrong `void *` type.

**NOTE**
- 59 files declare a callee with empty `()` (67 declarations; `func_ov002_021ca2b8` in 13 files, whose definition has 4 parameters). `func_ov002_0220d1c4.c` documents why ("original caller supplies only r0"); the rest do not. Not changed.
- All 8 non-hardware `volatile` sites are needed: removing it gives 18.5% (`0206c8ac`), 73.8% (`0209e524`), 62.8% (`0207e238`), 8.2% (`0209d288`), 18.6% (`020a591c`), 48.6% (`0206ca4c`), 43.7% (`ov002_02244fe4`). Honest levers on the legacy compilers.
- `func_02036590.c` declares `func_02036584` as `int`; it is `void`. `func_ov016_021b5390.c` falls off a `switch` end. `goto` in 5 files, not attacked.
- No inline asm bodies, `#pragma`, `register`, raw data or section attributes in any new file.

## Sample

50 files by `random.Random(1019).sample` over the sorted added list:

```text
02036590
ov002_021f0478
0209c680.legacy
020659ac.legacy_sp3
ov008_021abba0
ov000_021ac098
ov002_0221e194
ov002_02267df4
ov002_022426a4
ov002_02293f10
020a5f8c.legacy
ov016_021b5284
ov008_021aceac
ov016_021b5390
ov002_021df4d8
ov008_021afc2c
ov002_0220a328
ov002_0220d1c4
ov002_021d50fc
ov002_021bb2cc
020a591c.legacy
ov002_021bb444
02066ee0.legacy_sp3
ov008_021ab3ac
ov002_0228083c
ov002_021fab74
ov002_02215080
0203df88.legacy_sp3
0208a09c.legacy_sp3
ov015_021b2514
ov002_0221e030
ov002_021d6258
ov010_021b2280
ov002_0222812c
ov002_0222904c
0203d9c4.legacy_sp3
ov015_021b23f4
0206ca4c.legacy
ov002_02231a3c
0207b888.legacy
ov002_02264a00
0208d2bc.legacy
ov009_021ac458
ov002_0223b5cc
ov002_02212e9c
ov002_022325f8
02081988.legacy_sp3
ov002_0221baa4
ov002_022a7e00
ov019_021b45fc
```

Every `.extern` in the original `.s` is a symbol the `.c` uses (the one exception, `Task_Invoke`, is declared and called). Control flow reads as real source (state-machine switches, loops, RC4-style byte loops); I saw no shape bent beyond mwcc quirks.

## Parked retries (not matched)

- `func_ov002_02256e1c` (97.2% parked): my draft scored 85.9%; loop counter and `side` land in swapped registers (r7/r9). Ten shapes: 74.7 to 85.9%.
- `func_ov002_02222cac` (97.6%): my draft scored 42.2 to 54.2%; the prologue differs (`{r3,lr}` against `{r4,lr}`).

## Patterns for the agent prompt

- No `asm` in extern declarations of non-asm callees.
- Fix a prototype instead of casting `int` to `void *`.
- Comment every deliberate empty `()` declaration.

## Not checked

The 421 unread files; 26 of the 29 `extern asm` files; USA/JPN beyond the gate.

## Verdict

At 75d3b3cd9 the gate passes, the diff is scoped exactly as claimed, and all 471 functions pass the gate's SHA1 and reference checks. Defects are classification and honesty, not match fraud. I trust the 421 unread functions at the sampled rate: 0 of 50 needed a body change. I would merge 75d3b3cd9, with the `extern asm` cleanup first.
