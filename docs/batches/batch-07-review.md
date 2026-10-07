# Batch 07: Verifier review

Reviewed commit: `4a276dcb9` on `worker/batch-07` (base `0cc273a7a`), in
`.worktrees/verifier-batch-07`, Windows, `python`. The Worker is a different
model (GPT-6.1 Sol), so every number in its report was re-run. Checkout needed
no lock repair. Commit `4a276dcb9` changes only `docs/batches/batch-07.md`
against `8517cc556` (the evidence commit): confirmed.

## Commands I ran

| Command | Exit | Real output |
|---|---|---|
| `git diff --stat 0cc273a7a...4a276dcb9` | 0 | 31 files: 14 new `src/main/*.legacy.c`, the same 14 `.s` deleted, `delinks.txt`, `attempts.tsv`, `batch-07.md`. `reference_baseline.txt` untouched. |
| `python tools/fastmatch.py eur` (14 files) | 0 | 14 lines `100.0%  OK  (resolved, N words ...)` (needs `ninja delink` first) |
| `python tools/gate3.py --scope all --log <outside>` (not piped) | 0 | `17181:[eur] SHA1 PASS`, `42779:[usa] SHA1 PASS`, `68378:[jpn] SHA1 PASS`, `68418:1330 passed, 15 skipped, 132 subtests passed in 42.82s`, `68421:GATE PASS`, `68422:gate3: GATE EXIT 0`. No SKIP. Also `check_references: OK`, `check_fake_matches: OK` |
| `check_delink_dupes.py` | 0 | `OK (81 delinks.txt, no duplicate .text addresses)` |
| `check_baseline_growth.py --base 0cc273a7a` | 0 | both baselines `0 added` |
| `validate_attempts.py` | 0 | `"rows": 2098, "errors": 0, "shape_conflicts": 66` |
| `progress.py --version eur` | 0 | `Natural-C: 426382 / 2385948`; 426,382 − 424,482 = **1,900 B** = sum of the 14 spans |
| `wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr 0x02090000 --max-addr 0x0209ffff` | 0 | `candidate 66`, `permanent 12` |
| Scratch: 14 files x 3 compilers (build.ninja flags, `objdump -d -r`) | 0 | table below |
| Scratch: volatile removed from `02093c90`, `02093d44` (x2), `02093ee0` | 0 | all four still identical to shipped, so none is a match lever (all are MMIO) |
| Scratch: original `func_02090728` declarator through `check_fake_matches.py --version eur` | 1 | `NEW: text-unit-without-function src/main/func_02090728.legacy.c` (reverted) |

## Pass one

- **Scope/routing.** `delinks.txt`: 28 lines differ, 14 pairs, each only the path line `.s:` to `.legacy.c:`. Block start = address and span = ledger `text_size` for all 14 (sum 1,900).
- **Tiers.** 2.0 differs for all 14, so `.legacy` is needed. sp3 differs for 13; `func_02090728` is identical under sp2p3 and sp3 (NOTE).
- **Ledger.** The base is a byte-identical prefix of head (224,769 B); no existing row changed. `693ddba3c` changed exactly 30 rows, only `park_class` `frame-epilogue` to `frame-shape`, all batch-07 rows. All parked `park_class` values are in the map's raw column. 35 addresses, none with a prior row; last row per address: 14 `shipped` (tier `legacy`), 21 `parked`. `func_02090330.s` is byte-identical to base, the baseline equals base, and its last row is `legacy parked unknown structural`. The 20 other parked `.s` files are untouched. Every parked function has default, legacy and sp3 rows except `func_02090330` (no sp3 row; the report says "not retried").
- **Honest C.** All 14 read. No asm, pragma, `register`, data word, `goto`, or do-while-zero. Logic follows the originals (`02092a5c` case 2 branch, `02093a44` loop, `02093c90` redundant compare chain, `02093d44` `!channel` test).
- **Helper declarations.** `Copy32`, `WaitByLoop`, `OS_DisableIrq`, `OS_RestoreIrq`, `func_020944a4` agree with the register use. `func_02092368` is `asm` and returns r0 = 0x82000001; the original caller does `and r0,#3; cmp #1`, so `unsigned int` is right. `func_02090728`: the typedef is only a declarator spelling.
- **Least-trusted three:** `02093d44` (offset spelled three ways, but volatile and shape are not levers; faithful), `02091c88` (invented `Thread` struct with `pad[0x64-8]`; `flag` at 0x64 matches the original), `02090728` (stride-12 byte arithmetic, same idiom as `OSi_PostIrqEvent`). No wrong reference or accidental match found.

## Findings

| Class | Where | What |
|---|---|---|
| SHOULD FIX | `docs/batches/batch-07.md` ("Not walked") | The objective covered 0x02090000-0x0209ffff. Only up to 0x020945f4 was walked; 66 candidates were never attempted ("optional extension walk was deferred"). No technical blocker is given. Brain should treat the objective as about 29% done. |
| NOTE | `func_02090728` vs `src/main/func_02094378.legacy.c:20` | The caller declares `int func_02090728(int)`, the definition returns a function pointer. Harmless on ARM; no TU sees both. Same for `func_02092a5c` (callers `int`/`unsigned`, returns `void *`) and `func_02090b00` (pointers passed as `int`, cast inside). |
| NOTE | `func_02091c88`, `02093a44` etc. | `func_02091c44` is cast to `unsigned int` to pass its address: a type disguise forced by the callee's declared `unsigned int`. |
| NOTE | `func_02090330` | No sp3 row. Also its link failure was gate-labelled INFRASTRUCTURE; a ledger class `structural` fits poorly. |
| NOTE | `func_02090728.legacy.c` | Worker's lint-defect claim **reproduced** (original declarator form fails `text-unit-without-function`). The tool defect is open for Brain. |
| NOTE | report vs mine | Report: `1342 passed, 3 skipped`; mine `1330 passed, 15 skipped` (same as batch 06 here, environment-dependent skips). Report's fastmatch lines show gap `func_020900a0.o`, mine `.legacy.o`: stale delink naming only; result 100% in both. |

No BLOCKER. No UNPROVEN CLAIM remains: every number and command in the report reproduced except the test counts above (explained).

## Compiler table

| File | 2.0 same? | sp3 same? | Verdict |
|---|---|---|---|
| 13 files | differs | differs | sp2p3 required |
| `func_02090728` | differs | identical | any 1.2 tier; sp2p3 not forced |

## Not checked

The 66 unwalked candidates, and whether the 12 "permanent" ones are truly permanent (`func_020905dc` cites P-15; I read three).

## Verdict

The 14 conversions are honest, byte-exact C, correctly routed, ledgered and gated (three ROMs pass, +1,900 B equals the spans). The rollback of `func_02090330` is exact. I found nothing that blocks merging what was delivered; the open point is scope, since two thirds of the requested range was never attempted. Confidence is high.
