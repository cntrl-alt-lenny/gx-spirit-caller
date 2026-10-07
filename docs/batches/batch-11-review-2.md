# Batch 11: Verifier review

Reviewed commit: `812860643` on `worker/batch-11` (base `de2fe9f34`), in
`.worktrees/verifier-batch-11`, Windows 11, `python`. The Worker was the same
model, so I re-ran everything. Pass one was done before opening
`docs/batches/batch-11.md`. The Worker's evidence commit is `37a92acee`; the
only later commit (`812860643`) changes `docs/batches/batch-11.md` alone
(`git diff --stat 37a92acee 812860643`: 1 file).

## Commands I ran myself

| Command | Exit | Real output |
|---|---|---|
| `git diff --stat de2fe9f34...812860643` | 0 | 141 files: 69 `.c` added, the same 69 `.s` deleted, `delinks.txt`, `attempts.tsv`, `batch-11.md`. No baseline, tool or test file. |
| `python tools/fastmatch.py eur <the 69 .c>` (after `configure.py eur`) | 0 | 69 lines `100.0%  OK  (resolved, ...)` |
| My script: base vs head `delinks.txt` | 0 | 28,180 lines both; exactly 69 differ, each `.s:` to `.c:` (or `.legacy[_sp3].c:`) on the path line, same stem. |
| `python tools/gate3.py --scope all --log <outside worktree>`, not piped, run 3 | 0 | `55:[eur] SHA1 PASS`, `97:[usa] SHA1 PASS`, `224:[jpn] SHA1 PASS`, `264:1330 passed, 15 skipped, 132 subtests passed in 25.47s`, `267:==== GATE PASS ====`, `268:gate3: GATE EXIT 0`. AGENTS.md PowerShell log check, verbatim: no `SKIP`, no `STALE`. |
| (inside the gate) | 0 | `check_references: ... wrong-target 411 (baseline entries 5925)`, `check_references: OK`, `check_fake_matches: OK` (`do-while-zero 3, volatile-local 1`, unchanged) |
| `python tools/check_delink_dupes.py` | 0 | `OK (81 delinks.txt, no duplicate .text addresses)` |
| `python tools/check_match_invariants.py --version eur` | 1 | `0 error(s), 13999 warning(s)` |
| `python tools/validate_attempts.py` | 0 | `"rows": 2576, "errors": 0, "shape_conflicts": 66` |
| `python tools/progress.py --version eur` | 0 | `Natural-C: 458130`; 458,130 - 448,234 = 9,896 B = sum of the 69 ledger sizes |
| `python tools/wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr 0x02080000 --max-addr 0x0208ffff` | 0 | `candidate EUR .s remaining: 0`, `confirmed-permanent: 0`, `excluded by attempts ledger: 1015` |
| My script: base `.s` blocks of 256 B or less in range | 0 | 138 = 91 this batch + 47 with earlier ledger rows (finding 4) |
| Scratch compiles outside the repo, resolved compare against the delinked original | 0 | findings 1-4, 7 |

Gate history: run 1 ended `INFRASTRUCTURE ERROR` for usa and jpn (`mwccarm.exe:
Operation not permitted`, `.ninja_lock` denied); run 2 resumed from saved state
and printed `SKIP` for eur and jpn; run 3 (state file removed) is the clean one
above. Cause: `.worktrees/verifier-batch-11` already existed and a second
Verifier session was using it at the same time (its three commits on
`verifier/batch-11` appeared mid-run), so we shared one build directory. The
commits it added change only `docs/batches/batch-11-review.md`, so every
build-path file I tested equals `812860643`. I left its review untouched and
pushed mine to `verifier/batch-11-second`, from a worktree of my own.

## Pass one

| Check | Result |
|---|---|
| Honest C | All 69 read. No asm, pragma, `register`, data word, `goto`. One `volatile` (`func_02084e0c`, a global, finding 5). Hardware addresses (`0x04000400`, `0x04000240`...) are literals because the originals' pools hold raw words; the reference check passes. |
| Tiers | I compiled every file under 2.0/sp1p5, 1.2/sp2p3 and 1.2/sp3 with the build's flags. Default 18: 100 at default. sp3 40: default tops at 94.4, so a legacy tier is required; 38 fail sp2p3, `func_0208cb88` and `func_0208ea74` also pass sp2p3 (either suffix is right). legacy 11: default and sp3 both below 100, sp2p3 required. Four default files (`020827ec`, `02085888`, `02085a74`, `020865d0`) pass all three. |
| Ledger | Base is a byte-identical prefix; 209 rows appended, 11 columns, no CRLF. 69 shipped (latest row `shipped 100`, tier equals file suffix), 22 parked with three tier rows each. Every parked `park_class` is in the raw column of `park_class_map.tsv`; shipped rows use `n/a` like earlier batches. The 22 `.s` files are untouched and still routed. Earlier-tier scores for shipped functions match my recomputation (e.g. `0x020873fc` default 94.44). |
| Callee declarations | Differences from the callee's definition: arity: `func_02087e2c` (2 args, def 1), `func_020897ec` (1, def 4), `func_02097f10` (3, def 4), `Fill32` and `func_020944ec` (3, def `(void)`), `func_020807fc` (unprototyped). Width: `func_02080114` and `func_020800b8` declared `u16`, defined `u32`. Names and `void *` against struct types are cosmetic. Each call site matches at 100% resolved, so it follows the original's registers; the definitions may be what is wrong. |

## Findings

| # | Class | Where | What is wrong, and how it fails |
|---|---|---|---|
| 1 | SHOULD FIX | `func_0208f4c8`, parked 84.0 `scheduling-order` | Plain C matches 100% at 1.2/sp2p3. The sibling `func_0208f38c.legacy.c` already shows it: `func_02093dc8` takes an argument, so the original's `r0` holds `data_0210249c`. Declare `func_02093dc8(int)`, call `func_02093dc8(data_0210249c)`; the "scheduling" residue is `r0`/`r1` swapped. 100 B. |
| 2 | SHOULD FIX | `func_02088874`, parked 80.3 `register-numbering-permutation-cascade` | Plain C matches 100% at sp3. The callees take their `r0` argument: `func_0208738c(s->f28)`, `func_020873cc(s->f20)`, `func_02087328(s->f2c)`; `func_02095030(f24, f28, en ? 1 << f2c : 0, 0)`; `en = f2c >= 0`; `do {} while (func_020924c0(data_021a520c,0,0))`. 244 B. |
| 3 | SHOULD FIX | `func_02081ae0`, parked 76.9 `store-order` | Matches 100% at sp3 with the branch written the other way round: `if (bits < n) { ...refill, recurse... } else { k = bits - n; r = cur >> k; s->bits = k; }`. Same 104 B function, wrong class. |
| 4 | SHOULD FIX | range coverage | 138 candidates exist; the batch attempted 91. The other 47 have rows from older sweeps, so `--exclude-attempted` hid them and the summary says "91 candidates". I tried the three I picked first, all high parks with the same defect: `0x02089f60` (160 B, was 95.0), `0x0208771c` (116 B, 93.1), `0x020879a4` (88 B, 90.9). Each matches 100% at sp3 once callee arguments are passed (`func_020897fc(e, n+0x20, b, c, d)`, `func_02087790(n)`, `func_020950d4(f3c, 0xffff, p->f1c)`). 364 B; the other 44 are untested. |
| 5 | NOTE | `func_02084e0c.c` | `volatile int data_021a4824` only defeats CSE; `func_02084fe0` declares the same symbol plain. The lint is lexical and misses a global. A plain draft gives CSE'd loads (nested form) or predication (`&&` form). The Worker refused `volatile` on MMIO reads in `0208df94`/`0208e014`, where it is the honest form, so two standards apply. Brain should pick one. |
| 6 | NOTE | `batch-11.md` callee list | Omits `Fill32`, `func_020944ec`, and the two `u16`/`u32` widths above. |
| 7 | UNPROVEN CLAIM | `batch-11.md`, `func_02084360` "needs `data_021021f0`" | Not needed. A cast of `data_021021ec` plus 4 compiles to reloc `data_021021ec+0x4`, the original's. The park stands only because registers differ (my draft: 18.8 default). |
| 8 | UNPROVEN CLAIM | `batch-11.md`, `func_0208b1ac`, `func_0208b1c8` | Both are `.thumb` in the original, but only ARM-mode drafts are in the ledger, so 21.4/13.3 and 0.0 say nothing. "`.thumb.c` is the same compiler" is true of the binary, not of the output. My `#pragma thumb on` draft of `0208b1ac` scores 13.3, so I cannot say it is unmatchable. |
| 9 | UNPROVEN CLAIM | `batch-11.md` "tried 4+ variants each"; log `gate-batch-11.log` | Drafts and log are not in the repo. Findings 1-3 refute the stated cause for three of the ten. |

## What I could not check

The 19 other parks and 44 other skipped candidates; USA and JPN beyond the
gate; the Worker's own gate log; Thumb matchability.

## Verdict

The 69 conversions are honest, match at 100% under a tier I confirmed each
needs, and the gate, routing, ledger prefix, baselines and the 9,896 B
progress arithmetic all check out. I would merge them. The batch is not
complete: three parked functions (448 B) match in plain C, and three of
three older parks I sampled outside the batch's 91 do too, so "walls" in this
range are mostly wrong callee arities or branch polarity, not compiler limits.
The Worker should ship findings 1-4 and append corrective rows; Brain should
decide finding 5. No BLOCKER: nothing shipped is wrong. Confidence high on the
shipped set, medium on how many other parks share these mistakes.
