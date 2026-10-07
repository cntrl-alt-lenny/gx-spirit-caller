# Batch 08: Verifier review

Reviewed commit: `2d5abe23a` on `worker/batch-08` (base `44ee15fdc`). Reviewed
in `.worktrees/verifier-batch-08`, Windows 11, `python`. The checkout finished
without a lock. The Worker was the same model as me, so I re-ran everything.

## Commands I ran myself

| Command | Exit | Real output |
|---|---|---|
| `git diff --name-status 44ee15fdc...2d5abe23a` | 0 | 47 `src/main/*.c` added, the same 47 `.s` deleted, plus `delinks.txt`, `attempts.tsv`, `reference_baseline.txt`, `batch-08.md`. Nothing else. |
| `python tools/gate3.py --scope all --log <outside worktree>` (not piped) | 0 | `26919:[eur] SHA1 PASS`, `52517:[usa] SHA1 PASS`, `78116:[jpn] SHA1 PASS`, `78156:1330 passed, 15 skipped, 132 subtests passed in 25.92s`, `78159:==================== GATE PASS ====================`, `78160:gate3: GATE EXIT 0` (PowerShell `Select-String` check from AGENTS.md; no `SKIP`) |
| (inside the gate) | 0 | `check_references: ... 32903 units compared; missing-reloc 5514, extra-reloc 0, wrong-target 407 (baseline entries 5921)`, `check_references: OK`; `check_fake_matches: OK` (`register-pin 0, do-while-zero 3, volatile-local 1`) |
| `python tools/fastmatch.py eur <the 47 new files>` | 0 | 47 lines, all `100.0%  OK  (resolved, ...)`, `cc=2.0` |
| `python tools/progress.py --version eur` | 0 | `Natural-C: 454842 / 2385948 bytes (19.06%)`; 454,842 - 448,234 = **6,608 B** = sum of the 47 delinks spans |
| `python tools/validate_attempts.py` | 0 | `"rows": 2447`, `"errors": 0` |
| `python tools/check_delink_dupes.py` | 0 | `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)` |
| `python tools/check_fake_matches.py` | 0 | `check_fake_matches: OK` |
| `python tools/check_match_invariants.py --version eur` | 1 | `Found 13999 issue(s): 0 error(s), 13999 warning(s).` (warnings only) |
| `wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr 0x02000000 --max-addr 0x0200ffff` | 0 | `TOTAL candidate EUR .s remaining: 0`, `TOTAL confirmed-permanent: 13` |
| My scripts over `delinks.txt`, the ledger, the sources | 0 | see Pass one |
| Scratch variants of `func_0200fd1c` and `func_02003d98` through fastmatch (files restored with `git checkout`) | 1 | see Pass one |

## Pass one

| Check | Result |
|---|---|
| Scope | Only the allowed files changed. |
| Routing | 47 lines differ in `delinks.txt`, each a `.s:` to `.c:` path line, nothing else; 28,180 lines before and after. All 47 are plain `.c` (default tier). Every block's span equals its ledger `text_size`. |
| Honest C | Read all 47. No `volatile`, `asm`, `pragma`, `register`, `goto`, `#if`, raw data word or do-while-zero. |
| Ledger | 80 rows appended = 47 shipped + 11 parked x 3 tiers. The base is a byte-identical prefix (261,808 B), no CRLF, 11 columns. None of the 58 addresses had a prior row. The latest row per address is its real state. Every park_class is in the raw column of `park_class_map.tsv` and none carries `PROVISIONAL:`. |
| Parked | The 11 `.s` files and their blocks are not in the diff, so they are back on `.s` exactly. |
| Baseline | 4 lines deleted, all `wrong-target` for the `.s` of `func_0200a19c`, `0200a204`, `0200a26c`; no line added, and no remaining line names a deleted `.s`. |
| Candidates | 79 `.s` blocks of 256 B or less in range: 58 this batch, 8 with earlier rows, 13 confirmed-permanent (10 BIOS-style stubs, `func_02000950`, `func_020009fc`, `func_02000a78`). |
| Gate commit | `936fe90fd..2d5abe23a` changes only `batch-08.md`. |

**Callee declarations that differ from the definition** (my script over `src/` and `libs/`):

| Caller declares | Definition | Register use |
|---|---|---|
| `void(void)` for `func_02003c68`, `func_02003ac0`, `func_02003f1c`, `func_02003e98`, `func_0208fdf0`, `func_0208fe58` | takes arguments | Address taken only; no call. |
| `func_02004ef4(ptr, ..., void *fn)` | seven `int` | Same registers and stack slot. |
| `Copy32`, `Fill32`, `func_0209448c`, `func_020944a4`, `func_02094550` with arguments | `asm void(void)` | Caller sets r0-r2; asm bodies read them. |
| `func_02001ef4`, `func_02001d0c`, `func_02001d84`, `func_02001d98`, `func_02098388`, `func_02006b4c`, `func_02038ad4`, `func_02097ff0`, `func_020a9950` | pointer or `int` swaps | Same register; return type differs only where the result is unused or stored. |
| `Task_PostLocked` returns `void *`, `Task_InvokeLocked(int)` | `int`, `void *` | Same r0. |
| `func_02006e28`: `unsigned func_0207d3ac(int, unsigned)` | EUR is `.s`; only the USA/JPN ports have a `void(void *, ...)` C definition | Matches the EUR `.s`: r0 heap pointer, r1 size, returns r0. |

All follow the original's registers.

**Attacks on the three I trusted least**

1. `func_0200fd1c`: the dead `if (s != 0)` inside `if (s == 0)` cannot be removed. Without it fastmatch gives 0.0% (18 words against 26). The original `.s` has the same unreachable `cmp ip,#0; beq` test, so behaviour is unchanged (NOTE).
2. `func_02003d98`: replacing `base = 0` plus `if (base == 0)` with `default: return` drops to 4.7%. The original has `mov r5, #0` at entry, so the code mirrors the binary.
3. `func_0200c79c`: `e == 0` after pointer plus index looks pointless, but the original has `adds r1, r1, r3; moveq r0, #0`. Entry size 0x58 agrees with the layout.

## Findings

- [NOTE] `src/main/func_0200fd1c.c:35` - dead `if (s != 0)` (above); needed to match and present in the original binary, but a codegen lever, not intent. A comment would help.
- [NOTE] `src/main/func_02003d98.c:5` - `stride` and `kind` are uninitialised on the `base == 0` path; that path returns before use. No effect on bytes.
- [NOTE] `docs/ledger/attempts.tsv` - `func_02005a60` (0.0 in all tiers, 3 attempts) and the 0.0 rows for `func_02000d4c` and `func_02006a38` read like placeholders; `batch-08.md` gives no reason for `func_02005a60`. No effect on outcome.
- [NOTE] `func_02009e9c.c`, `func_02009f50.c`, `func_0200a928.c` - raw byte offsets (`p[0x156d]`) from `data_02104f4c`; reason stated, bytes proven by fastmatch.
- [UNPROVEN CLAIM] `batch-08.md`: "func_02006a38 ... needs a second symbol alias in `symbols.txt`". `symbols.txt:11214` already has `data_02104f1c_alias` at the same address and `func_020071c4.c` uses it. I did not draft the function, so I cannot say it matches with the alias; the stated blocker is at least not "alias missing".
- [UNPROVEN CLAIM] "120 and 24 declaration-order variants" (`func_02007104`, `func_020059b0`), "one extra register shifts every word" (`func_020055b4`), "2.0 emits ldm/stm for a struct copy" (`func_02000cc4`, `0d0c`, `0d4c`): no drafts committed, not reproduced.

Zero BLOCKERs and zero SHOULD FIX.

## Not verified

- Whether any of the 11 parked functions would match with more work.
- Field names and struct layouts: bytes are proven, names are the Worker's.
- USA and JPN: through the gate only; no USA/JPN file changed.
- `ruff` and `python -m unittest discover`: not run (the gate's pytest ran; no tool file changed).

## Verdict

The 47 conversions are real. They are plain C with no fake-match construct I could find, each is 100% under fastmatch, the three-ROM gate passes at this exact commit, routing changes only the 47 path lines, the ledger is append-only and valid with all three tiers per parked function, and the Natural-C gain (6,608 B) equals the matched sizes. I found no BLOCKER and no SHOULD FIX. Confidence is high on bytes, routing and ledger, moderate on field names, and low on whether the 11 parked functions are truly out of reach; the `func_02006a38` reason deserves a second look.
