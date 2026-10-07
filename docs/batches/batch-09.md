# Batch 09: Worker summary

Scope: EUR main functions matched only as `.s`, 256 bytes or less, never
attempted, in 0x02010000-0x0201ffff. `wall_aware_headroom.py
--exclude-attempted --max-size 256 --min-addr 0x02010000 --max-addr 0x0201ffff`
listed 43 candidates (41 unknown plus 2 without a marker), func_02010a98
through func_0201ff2c. I attempted all 43 in address order and skipped none.

- 23 now match at 100% in C, one commit each, all on the default tier (`.c`).
- 20 are back on `.s` exactly; each tier tried has its own `parked` row.

Not in the list: func_0201d47c, which the tool marks confirmed-permanent
(wall P-18). I did not attempt it.

## Matched (23 functions, 2,948 B)

All ship as `.c` (mwcc 2.0). No function needed a non-default tier, so there is
no tier evidence to give: the default tier matched on its own for each, and per
the brief I did not compile the 1.2 tiers for them.

| Function | Size | Function | Size |
|---|---|---|---|
| func_02010a98 | 112 | func_02019858 | 64 |
| func_02010eb8 | 204 | func_02019ea4 | 240 |
| func_02011178 | 108 | func_0201a32c | 92 |
| func_02011a94 | 88 | func_0201a84c | 212 |
| func_02011b9c | 208 | func_0201aabc | 56 |
| func_02017afc | 228 | func_0201af80 | 92 |
| func_020139fc | 60 | func_0201b648 | 72 |
| func_02018be8 | 244 | func_0201ddac | 136 |
| func_02018ecc | 96 | func_0201f138 | 100 |
| func_02018fbc | 120 | | |
| func_02019184 | 72 | | |
| func_0201942c | 104 | | |
| func_02019494 | 148 | | |
| func_02019538 | 92 | | |

## Attempted, not matched (20)

Scores are the fastmatch score per tier, from the ledger rows. Order is
default, `.legacy_sp3.c`, `.legacy.c`.

| Function | Size | Scores | Cause |
|---|---|---|---|
| func_02011620 | 104 | 11.5, 7.1, 6.9 | 2.0 frame is right; scheduling and one instruction differ |
| func_02011688 | 100 | 72.0, 72.0, 72.0 | register letters for index/sin/cos |
| func_020116ec | 96 | 70.8, 16.0, 16.0 | same family as 11688 |
| func_02012454 | 80 | 50.0, 0.0, 0.0 | r4/r5 swap |
| func_020124a4 | 80 | 85.0, 0.0, 0.0 | scratch register for the mla operands |
| func_020124f4 | 108 | 77.8, 0.0, 0.0 | parameter saved later than in the original |
| func_020125ac | 112 | 71.4, 3.3, 3.2 | base register r0 vs r2 |
| func_02019a58 | 116 | 13.8, 3.3, 3.2 | whole-function register rotation (original never uses r0) |
| func_0201a044 | 116 | 51.7, 17.2, 17.2 | load order; 24 declaration orders tried |
| func_0201a134 | 60 | 53.3, 0.0, 0.0 | register letters |
| func_0201b504 | 204 | 68.6, 29.4, 29.4 | register rotation; 24 declaration orders tried |
| func_0201bf80 | 52 | 92.3, 92.3, 78.6 | cross-overlay `bl`, see below |
| func_0201c1bc | 36 | 88.9, 88.9, 70.0 | cross-overlay `bl` |
| func_0201c1e0 | 68 | 94.1, 0.0, 0.0 | cross-overlay `bl` |
| func_0201d620 | 148 | 18.9, 10.5, 2.5 | original keeps `(x & 0xff) << 8` as `and` plus `lsl`; mine becomes a shift pair |
| func_0201e4cc | 236 | 96.6, 0.0, 0.0 | one scratch register, r0 vs r1 |
| func_0201ef90 | 256 | 96.9, 15.4, 14.9 | same r0 vs r1 choice in an `a && b` guard |
| func_0201f4d4 | 148 | 56.8, 2.7, 10.8 | the 4/6/5 compare chain is merged into a range test; stack-arg `stmia` |
| func_0201f874 | 224 | 94.6, 0.0, 0.0 | `movs r0,#0` and loop-exit branch shape |
| func_0201ff2c | 108 | 7.1, 3.7, 3.7 | original does `stmia sp,{r1,r3}` for the two stack args; 2.0 emits two `str` |

The 1.2 tiers score near zero wherever the original pushes `r3` as padding and
pops with a single `pop {..., pc}`: that is the 2.0 frame
(`docs/compiler-quirks.md`).

### Cross-overlay calls (func_0201bf80, func_0201c1bc, func_0201c1e0)

Each original ends in a hand-encoded `.word 0xeb......`, a `bl` into overlay
space (0x021b3130 and 0x021b3004). No `symbols.txt` names those addresses, so
C cannot emit the call. With a placeholder callee the only differing word is
that `bl`, which is why they score 88.9 to 94.1%. Class
`C-32-cross-overlay-bl`. They need a symbol name, which is outside this batch.

### One recurring plateau

func_0201e4cc and func_0201ef90 both stop at one scratch register: in an
`a != 0 && b != 0` guard the original loads the first operand into r1, mine
into r0. Several guard spellings did not change it. It is the documented P-20
register-letter class.

## Skipped entries

None, except func_0201d47c, which the tool does not list (confirmed
permanent, wall P-18). No listed entry was a non-function.

## Per-file callee declarations

None needed in the shipped files. One note for the Verifier:
`src/main/func_02011aec.c` declares `func_02011a94` as `int (void)`, while the
original takes its argument from r0 left by the previous call. My new
`func_02011a94` is `int func_02011a94(int value)`. They are separate TUs and
link; I did not touch that file.

## Checks

Last code commit: e41c75986. This summary is the only change after it.

- `python tools/fastmatch.py eur <file>` on each of the 23 new C files:
  100.0% OK each (the shipping script re-ran it before every commit).
- `python tools/check_delink_dupes.py`, exit 0: `OK (81 delinks.txt, no
  duplicate .text addresses)`.
- `python tools/validate_attempts.py`, exit 0, `"errors": 0` (it prints
  shape-conflict notes for older ov002 rows, none from this batch).
- `python tools/check_fake_matches.py`, exit 0: `OK`, `do-while-zero 3,
  volatile-local 1 (baseline entries 4)`, unchanged.
- `python tools/check_match_invariants.py --version eur`, exit 1 with `0
  error(s), 13999 warning(s)`. Exit 2 would mean errors; there are none.
- `python -m pytest -q tests`, exit 0: `1330 passed, 15 skipped, 132 subtests
  passed`.
- `python tools/gate3.py --scope all --log gate-batch-09.log`, not piped.
  PowerShell log check from `AGENTS.md`:

```text
55:[eur] SHA1 PASS
25653:[usa] SHA1 PASS
51252:[jpn] SHA1 PASS
51292:1330 passed, 15 skipped, 132 subtests passed in 19.33s
51295:==================== GATE PASS ====================
51296:gate3: GATE EXIT 0
```

  The gate's own lines: `check_references: eur, usa, jpn: 32903 units
  compared; missing-reloc 5514, extra-reloc 0, wrong-target 410 (baseline
  entries 5924)`, then `check_references: OK`; and `check_fake_matches: OK`.
- `python tools/progress.py --version eur`: Natural-C 451,182 B, from the
  starting 448,234 B. The gain is 2,948 B, which equals the sum of the 23
  matched functions' sizes.

## Limitations and for the Verifier

- **Ledger error, mine:** the `legacy` row for func_02011620 says 0.0%, but
  that compile scored 6.9%. I passed the wrong value and the ledger is
  append-only, so I did not edit it. The row's class (`epilogue-shape`) is
  still the right reason.
- Several parked functions have more than one `default` or `legacy_sp3` row,
  because I tried a second draft; each row carries the score of the draft in
  place at the time (func_02011620 has two `default` rows, 0.0 and 11.5).
- func_02019494 first used `data_020b5ab8 + 0x30`, which made the reference
  check report `wrong-target`. It now refers to `data_020b5ae8`, which the
  original names, and I deleted its one line in
  `tools/reference_baseline.txt` (deletion only, for the replaced `.s`).
  `check_references` reports no new entries.
- `goto` is used in func_02017afc (the only spelling that matched), and
  bitfield casts at fixed offsets appear in several files, as the
  neighbouring matched files already do. No inline asm, no `volatile`, no
  do-while-zero.
- Only EUR source changed; the gate passes all three regions.

## Fixes after review

Code commit under test: `6a45624b8`.

- (1) func_0201ef90 (256 B): shipped as `.c`, 100%. The helper calls now pass
  two arguments, as their definitions take. The locals needed the order
  `x8, x4, t20[9], t0c[5]` (24 orders tried, 6 matched).
- (2) func_0201d47c (56 B): shipped as `.c`, 100%. Not a wall.
- (3) func_0201f874: not matched. Reading `data_02191f40` directly scores
  42.9%: the original has a `movs r0,#0` after `bl func_02093bfc` that no
  honest spelling produced (passing the value to `func_0209e4f8`, which takes
  no argument, did get it but is a lie about the callee). Parked,
  `P-36-cmp-vs-movs-canonicalization`.
- (4) func_0201e4cc (236 B): shipped as `.c`, 100%, better than the review's
  "park stands". With `s->f1c` as the second argument and `data` assigned
  before `pad`, the last diff goes.
- (5) func_02011620: row appended, legacy 6.9.
- (6) Audit of the other parks against callee definitions in `src/main`.
  Retried func_020124f4 (77.8, unchanged; the callee `func_02011aec` is
  defined `void` but the original uses its result, declared `int` locally),
  func_020125ac (71.4, unchanged) and func_0201a134 (second argument is the
  constant 1; 53.3 became 80.0, class `P-36-instruction-scheduling`). The
  rest call `.s` callees (unknown signatures), or agree with their callee, or
  are the cross-overlay `bl` cases.

Not done: the `func_02011aec` declaration mismatch is left alone; the
`movs` in func_0201f874 is unsolved.

| Check | Exit | Real output |
|---|---|---|
| fastmatch on the 3 new `.c` | 0 | three lines `100.0%  OK` |
| `check_delink_dupes.py` | 0 | `OK (81 delinks.txt, no duplicate .text addresses)` |
| `validate_attempts.py` | 0 | `"rows": 2459`, `"errors": 0` |
| `check_fake_matches.py` | 0 | `OK` |
| `pytest -q tests` | 0 | `1330 passed, 15 skipped, 132 subtests passed` |
| `gate3.py --scope all` | 0 | `13157:[eur] SHA1 PASS`, `13199:[usa] SHA1 PASS`, `13241:[jpn] SHA1 PASS`, `13284:GATE PASS`, `13285:gate3: GATE EXIT 0`; no `SKIP`, no `STALE` |
| `progress.py --version eur` | 0 | Natural-C 451,730; gain 3,496 B = 2,948 + 256 + 56 + 236 |
