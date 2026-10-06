# Batch 07 Worker summary

Resumed from `74a25e66c` in a fresh Worker session. The worktree had no modified tracked files and no untracked source drafts. Origin was fetched. The light-workflow override applies; no round ceremony or merge was performed.

Evidence commit: `8517cc5566f06e31562958fb69873f3060701099`. Worker delivery is complete for independent review; it is not accepted or merged. The full three-region gate passed at this commit.

The original address walk covered 35 eligible EUR main functions through 0x020945f4: 14 retained conversions and 21 functions left on original assembly. Fourteen natural-C conversions remain, totaling 1,900 B; func_02090330 was returned to its original assembly after a link failure. This session repaired the ledger classification and callback declaration, retried all 20 parked functions using mwcc 1.2/sp3, and withdrew func_02090330 after the gate exposed its undefined field-symbol references. No sp3 retry reached 100%; all 20 assembly files and routing blocks are restored exactly. No new function was converted this session. One provisional conversion was withdrawn.

## Matched functions

All 14 use `.legacy.c` (mwcc 1.2/sp2p3). For every entry except func_02090728, the original restores lr and returns with bx lr; the default compiler emits a different one-step return/frame shape. func_02090728 is a leaf whose original uses `ands r1, r0, #1`; the default uses `tst`. Ordinary local declaration order completed its legacy match. No inline assembly or register pins were introduced.

| Function | Size B | Default best % | Final legacy % |
|---|---:|---:|---:|
| func_020900a0 | 116 | 17.2 | 100.0 |
| func_0209015c | 112 | 0.0 | 100.0 |
| func_02090728 | 140 | 62.9 | 100.0 |
| func_02090b00 | 84 | 33.3 | 100.0 |
| func_02091584 | 96 | 8.3 | 100.0 |
| func_02091c88 | 112 | 32.1 | 100.0 |
| func_02092a5c | 236 | 0.0 | 100.0 |
| func_02093720 | 112 | 0.0 | 100.0 |
| func_0209393c | 104 | 0.0 | 100.0 |
| func_020939a4 | 124 | 83.9 | 100.0 |
| func_02093a44 | 136 | 61.8 | 100.0 |
| func_02093c90 | 180 | 2.2 | 100.0 |
| func_02093d44 | 132 | 54.5 | 100.0 |
| func_02093ee0 | 216 | 13.0 | 100.0 |

The existing conversions were committed individually before this session and recorded with tools/record_shipped.py. The callback-return typedef repair was scored at 100% before its own commit. The earlier func_02090330 repair history includes one below-100% intermediate commit. Its final C draft scored 100% as an object but did not link: the data_020c319a/data_020c319c markers have no independent definitions in the existing typed table. This session restored the exact original assembly, which uses data_020c3198+2/+4, instead of editing the table unit outside this batch. No history was rewritten.

## Attempted but not matched

Best measured score per tier, including this session and the prior handover. All rows below route to their original `.s`. func_02090330 is also listed as withdrawn after the ROM gate failed at link time despite its 100% object score. Scores describe the drafts tried; they do not establish a permanent compiler wall. This session appended 30 sp3 rows: 20 initial trials, nine compile-error draft repairs, and one additional struct-field address-fold trial. Unscored compile errors have `match_pct=unknown`; every function also has a compiled, scored sp3 trial. Failed drafts and detailed scores remain in git-ignored `build/batch-07/`, so their exact text is not a portable Git handover.

| Function | Size B | Default best % | sp2p3 best % | sp3 best % |
|---|---:|---:|---:|---:|
| func_02090330 | 128 | 0 | 100 (link failed) | not retried |
| func_020903d4 | 128 | 21.9 | 15.6 | 0 |
| func_02090690 | 76 | 31.6 | 63.2 | 31.58 |
| func_020906dc | 76 | 42.1 | 79 | 42.11 |
| func_020907b4 | 144 | 11.1 | 0 | 0 |
| func_02090b54 | 240 | 1.7 | 24.6 | 75 |
| func_02091f88 | 236 | 3.4 | 0 | 0 |
| func_0209226c | 108 | 17.9 | 17.9 | 66.67 |
| func_020929ac | 136 | 0 | 97.1 | 26.47 |
| func_02093014 | 112 | 34.5 | 92.9 | 92.86 |
| func_020930b0 | 176 | 0 | 0 | 2.27 |
| func_02093160 | 136 | 0 | 91.2 | 55.88 |
| func_020931f8 | 156 | 0 | 94.9 | 15.38 |
| func_02093684 | 156 | 10.3 | 28.2 | 53.85 |
| func_02093b00 | 240 | 0 | 1.7 | 1.41 |
| func_02093fb8 | 120 | 16.7 | 40 | 41.94 |
| func_02094030 | 124 | 29 | 41.9 | 53.12 |
| func_020940ac | 144 | 13.9 | 25 | 54.05 |
| func_0209423c | 116 | 6.9 | 79.3 | 41.38 |
| func_020942b0 | 200 | 0 | 9.8 | 6 |
| func_020945f4 | 148 | 62.2 | 48.6 | 15.79 |

The sp3 trials started with func_020929ac, func_020931f8, func_02093014, and func_02093160. The closest sp3 result was func_02093014 at 92.86%: its compiler folded `0x027e3000 + 0xfdc` into `0x027e3fdc`, changing the store operand and literal word. Using a local struct field produced the same two differences. The earlier sp2p3 near-matches remain documented by the ledger: func_020929ac 97.1%, func_020931f8 94.9%, func_02093014 92.9%, and func_02093160 91.2%.

## Skipped and remaining candidates

 This lists all remaining `.s` files of at most 256 B in 0x02090000–0x020945f4 that were not attempted. Already-C units and larger functions were outside the candidate walk.

| Function | Size B | Reason |
|---|---:|---|
| func_02090048 | 88 | Prior ledger attempt; excluded by --exclude-attempted |
| func_02090574 | 52 | Prior ledger attempt; excluded by --exclude-attempted |
| func_020905dc | 72 | Headroom tool permanent category; outside convertible_files |
| func_0209085c | 12 | Prior ledger attempt; excluded by --exclude-attempted |
| func_020908c0 | 48 | Prior ledger attempt; excluded by --exclude-attempted |
| func_02091768 | 172 | Prior ledger attempt; excluded by --exclude-attempted |
| func_02091c44 | 68 | Prior ledger attempt; excluded by --exclude-attempted |
| func_02092074 | 72 | Prior ledger attempt; excluded by --exclude-attempted |
| func_020922d8 | 76 | Headroom tool permanent category; outside convertible_files |
| func_02092324 | 68 | Headroom tool permanent category; outside convertible_files |
| func_0209240c | 180 | Prior ledger attempt; excluded by --exclude-attempted |
| func_0209256c | 168 | Prior ledger attempt; excluded by --exclude-attempted |
| func_02092748 | 112 | Prior ledger attempt; excluded by --exclude-attempted |
| func_0209286c | 44 | Headroom tool permanent category; outside convertible_files |
| func_02092898 | 52 | Headroom tool permanent category; outside convertible_files |
| func_020928cc | 28 | Headroom tool permanent category; outside convertible_files |
| func_020928e8 | 28 | Headroom tool permanent category; outside convertible_files |
| func_02092904 | 36 | Headroom tool permanent category; outside convertible_files |
| func_02092940 | 28 | Headroom tool permanent category; outside convertible_files |
| func_02092e90 | 116 | Headroom tool permanent category; outside convertible_files |
| func_02092f18 | 144 | Headroom tool permanent category; outside convertible_files |
| func_02092fa8 | 108 | Headroom tool permanent category; outside convertible_files |
| func_020933bc | 152 | Prior ledger attempt; excluded by --exclude-attempted |
| func_02093454 | 120 | Prior ledger attempt; excluded by --exclude-attempted |
| func_0209417c | 192 | Prior ledger attempt; excluded by --exclude-attempted |
| func_02094504 | 76 | Prior ledger attempt; excluded by --exclude-attempted |

**Not walked beyond the prior stop address.** All 66 remaining eligible candidates below were not attempted because the optional extension walk was deferred while this session completed the required repairs and acceptance checks. None has a batch-07 attempt row.

`func_020947d0`, `func_02094864`, `func_020948f0`, `func_02094e90`, `func_02094fe4`, `func_02095030`, `func_02095c48`, `func_02095d6c`.

`func_0209614c`, `func_02096f64`, `func_02097154`, `func_020972d4`, `func_02097528`, `func_020975f0`, `func_02097668`, `func_02097d60`.

`func_02097dc4`, `func_02097e5c`, `func_02097f20`, `func_02098088`, `func_0209815c`, `func_020981a0`, `func_02098628`, `func_020986c0`.

`FS_UnloadOverlay`, `func_020988a8`, `func_020989a8`, `func_02098c98`, `func_020991a4`, `func_020992d8`, `func_020996c8`, `func_02099ba8`.

`func_02099be8`, `func_0209a3f8`, `func_0209a4a4`, `func_0209aa84`, `func_0209ade4`, `func_0209af84`, `func_0209b0f4`, `func_0209b16c`.

`func_0209b55c`, `func_0209bcdc`, `func_0209bdc8`, `func_0209bea0`, `func_0209bf34`, `func_0209c034`, `func_0209c0dc`, `func_0209c31c`.

`func_0209c7dc`, `func_0209cd3c`, `func_0209cda4`, `func_0209d0f8`, `func_0209d150`, `func_0209d488`, `func_0209d4ec`, `func_0209d5e4`.

`func_0209db88`, `func_0209dde8`, `func_0209e124`, `func_0209e308`, `func_0209e3ac`, `func_0209e7f0`, `func_0209ecc8`, `func_0209f404`.

`func_0209f470`, `func_0209f8c8`.


The refreshed headroom command, `python3.13 tools/wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr 0x02090000 --max-addr 0x0209ffff --json`, exited 0 and returned `total_candidate: 66`, `total_permanent: 12`, `total_coercible: 1`, and `total_unknown: 65`. The optional new walk from func_020947d0 was not started.

## Repairs and tool defects

- `693ddba3c` changed only the 30 specified batch-07 raw park classes from `frame-epilogue` to the existing `frame-shape`. Every specified row was checked for the old class first. The old persisted `PROVISIONAL:unmapped` family cells were intentionally untouched under the exact-row instruction. Pytest passed immediately afterward. All newly parked attempts use raw classes already present in `tools/park_class_map.tsv`.
- `caf73b2f2` rewrote func_02090728's valid function-pointer-return declarator through a typedef. Fastmatch stayed 100%, and source fake-match lint passed. The lint does not recognize the original valid declarator form: a tool defect remains for Brain; no checker changes were made.
- `b27b86ae5` prematurely deleted the two baseline entries for func_02090330.s before the C conversion had passed the ROM gate. The subsequent assembly rollback restores only those exact pre-batch entries. The final baseline is byte-identical to the handover commit; no new baseline finding or allowance is introduced. Published history is preserved.
- `8129f02ed` appended all 30 sp3 retry events. The original recording-tool defect remains: `park_one.py` accepted an unmapped raw class and `validate_attempts.py` accepted that ledger while mapping tests failed. This batch repaired only the explicitly authorized rows; enforcing the mapping at recording time requires a separate tool change by Brain.

## Checks and evidence

Commands below used python3.13 in the Worker worktree at the evidence commit. Compiler, matcher and final test runs used `DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib:/usr/lib`, the gate also used `DYLD_LIBRARY_PATH=/opt/homebrew/lib`, and Wine used only this worktree's `.wine-lane`.

| Command | Exit | Real output |
|---|---:|---|
| `python3.13 tools/gate3.py --scope all --log ../gate-batch-07.log` | 0 | Three regional SHA1 PASS lines, reference/lint OK, pytest summary, GATE PASS and final GATE EXIT 0 below |
| `python3.13 tools/fastmatch.py eur` with all 14 paths below | 0 | Every file is `100.0% OK (resolved)`; complete output below |
| `python3.13 tools/check_delink_dupes.py` | 0 | `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)` |
| `python3.13 tools/validate_attempts.py` | 0 | `"rows": 2098`, `"errors": 0`, `"shape_conflicts": 66` |
| `python3.13 tools/check_match_invariants.py --version eur` | 1, advisory warnings | `Found 13999 issue(s): 0 error(s), 13999 warning(s).` |
| `python3.13 tools/check_fake_matches.py` | 0 | `text-unit-without-function 0`; `check_fake_matches: OK` |
| `python3.13 -m pytest -q tests` (gate) | 0 | `1342 passed, 3 skipped, 132 subtests passed in 132.16s (0:02:12)` |
| `python3.13 -m unittest discover -s tests` (serial, required environment) | 0 | `Ran 1345 tests in 133.390s`; `OK (skipped=3)` |
| `python3.13 -m ruff check .` | 0 | `All checks passed!` |
| `python3.13 tools/check_baseline_growth.py --base 74a25e66c` | 0 | Fake-match baseline 4 entries, reference baseline 5926 entries, both `0 added`; `check_baseline_growth: OK` |
| `python3.13 tools/progress.py --version eur` | 0 | Natural-C output below |

The final gate compared 32,903 units across EUR, USA and JPN:

```text
check_references: eur, usa, jpn: 32903 units compared; missing-reloc 5514, extra-reloc 0, wrong-target 412 (baseline entries 5926)
check_references: OK
[references] exit 0
check_fake_matches: raw-data-directive 0, data-in-text 0, section-override 0, data-in-pragma-section 0, text-unit-without-function 0, register-pin 0, do-while-zero 3, volatile-local 1 (baseline entries 4)
check_fake_matches: OK
[fake-matches] exit 0
```

The required macOS log check was run verbatim and exited 0:

```text
grep -nE "SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)" ../gate-batch-07.log
18067:[eur] SHA1 PASS
18109:[usa] SHA1 PASS
18151:[jpn] SHA1 PASS
18191:1342 passed, 3 skipped, 132 subtests passed in 132.16s (0:02:12)
18194:==================== GATE PASS ====================
18195:gate3: GATE EXIT 0
```

`tail -1 ../gate-batch-07.log` exited 0 and printed `gate3: GATE EXIT 0`. There is no regional SKIP, INFRASTRUCTURE ERROR, CLEAN-FAIL or SHA1 FAIL in the final gate. Both complete gate runs were unpiped and uninterrupted.

The final fastmatch command was `python3.13 tools/fastmatch.py eur src/main/func_020900a0.legacy.c src/main/func_0209015c.legacy.c src/main/func_02090728.legacy.c src/main/func_02090b00.legacy.c src/main/func_02091584.legacy.c src/main/func_02091c88.legacy.c src/main/func_02092a5c.legacy.c src/main/func_02093720.legacy.c src/main/func_0209393c.legacy.c src/main/func_020939a4.legacy.c src/main/func_02093a44.legacy.c src/main/func_02093c90.legacy.c src/main/func_02093d44.legacy.c src/main/func_02093ee0.legacy.c`, exit 0:

```text
[eur] func_020900a0 (func_020900a0.legacy.c, cc=legacy): 100.0%  OK  (resolved, 29 words, gap=build/eur/delinks/src/main/func_020900a0.o)
[eur] func_0209015c (func_0209015c.legacy.c, cc=legacy): 100.0%  OK  (resolved, 28 words, gap=build/eur/delinks/src/main/func_0209015c.o)
[eur] func_02090728 (func_02090728.legacy.c, cc=legacy): 100.0%  OK  (resolved, 35 words, gap=build/eur/delinks/src/main/func_02090728.o)
[eur] func_02090b00 (func_02090b00.legacy.c, cc=legacy): 100.0%  OK  (resolved, 21 words, gap=build/eur/delinks/src/main/func_02090b00.o)
[eur] func_02091584 (func_02091584.legacy.c, cc=legacy): 100.0%  OK  (resolved, 24 words, gap=build/eur/delinks/src/main/func_02091584.o)
[eur] func_02091c88 (func_02091c88.legacy.c, cc=legacy): 100.0%  OK  (resolved, 28 words, gap=build/eur/delinks/src/main/func_02091c88.o)
[eur] func_02092a5c (func_02092a5c.legacy.c, cc=legacy): 100.0%  OK  (resolved, 59 words, gap=build/eur/delinks/src/main/func_02092a5c.o)
[eur] func_02093720 (func_02093720.legacy.c, cc=legacy): 100.0%  OK  (resolved, 28 words, gap=build/eur/delinks/src/main/func_02093720.o)
[eur] func_0209393c (func_0209393c.legacy.c, cc=legacy): 100.0%  OK  (resolved, 26 words, gap=build/eur/delinks/src/main/func_0209393c.o)
[eur] func_020939a4 (func_020939a4.legacy.c, cc=legacy): 100.0%  OK  (resolved, 31 words, gap=build/eur/delinks/src/main/func_020939a4.o)
[eur] func_02093a44 (func_02093a44.legacy.c, cc=legacy): 100.0%  OK  (resolved, 34 words, gap=build/eur/delinks/src/main/func_02093a44.o)
[eur] func_02093c90 (func_02093c90.legacy.c, cc=legacy): 100.0%  OK  (resolved, 45 words, gap=build/eur/delinks/src/main/func_02093c90.o)
[eur] func_02093d44 (func_02093d44.legacy.c, cc=legacy): 100.0%  OK  (resolved, 33 words, gap=build/eur/delinks/src/main/func_02093d44.o)
[eur] func_02093ee0 (func_02093ee0.legacy.c, cc=legacy): 100.0%  OK  (resolved, 54 words, gap=build/eur/delinks/src/main/func_02093ee0.o)
```

An independent source-byte comparison printed `Restored assembly: 21/21 files byte-identical to batch base` for all retained parked functions against the starting commit; the reference baseline is byte-identical to the handover. `git status --short` was empty after all tests/checks.

### Earlier failures and repairs

The required ledger repair at `693ddba3c` was followed by pytest exit 0: `1330 passed, 15 skipped, 132 subtests passed in 10.89s`. Restoring m2c enabled more integration tests; the final gate exercised them and reduced the skipped count to 3.

The first complete gate at `8129f02edd346877f9ec21bef8cf14cc4a3a4d36` exited 2. Its log is retained locally as git-ignored `build/batch-07/gate-first.log`; it completed all regions and tests, without a pipe or interruption. Exact failure:

```text
mwldarm.exe: Undefined : "data_020c319a"
mwldarm.exe: Referenced from "func_02090330" in func_02090330.legacy.o
mwldarm.exe: Undefined : "data_020c319c"
mwldarm.exe: Referenced from "func_02090330" in func_02090330.legacy.o
mwldarm.exe: alert: Link failed.
```

Its required log check exited 0 and printed:

```text
25994:[eur] INFRASTRUCTURE ERROR
52014:[usa] SHA1 PASS
78035:[jpn] SHA1 PASS
78063:1342 passed, 3 skipped, 132 subtests passed in 128.33s (0:02:08)
78066:==================== GATE INFRASTRUCTURE ====================
78068:gate3: GATE EXIT 2
```

Commit `8517cc556` restores func_02090330.s exactly from the batch base, switches only that function's routing back, appends its integration-failure/rollback event, and reverses the premature baseline cleanup. No other function or table definition was changed. The rollback event has `match_pct=unknown` because it records a failed full-build attempt without a new numeric object score; its shape explicitly preserves `resolved-object-100-link-undefined-field-symbols`. The prior 100% object-score events are retained unchanged. The ledger disallows `parked` with numeric 100, so that distinction is made explicit rather than misreporting the measured score.

I initially ran unittest concurrently with the first gate and omitted the required library environment. The now-enabled build integration tests failed: `Ran 1345 tests in 235.194s`; `FAILED (failures=3, skipped=4)`, exit 1. The tracked files were restored; the complete first gate then exercised pytest with the correct environment, and the final standalone unittest run was serial with the correct environment and passed. No concurrent test/build result is used as final evidence.

An optional fastmatch query on the restored `.s` exited 2 with `[eur] func_02090330.s: WARNING — no functions in compiled .o`. That C-oriented query does not score this assembler object and is not used as proof. Exact source restoration and the completed three-ROM gate verify the rollback.


## Progress

At `8517cc5566f06e31562958fb69873f3060701099`, `python3.13 tools/progress.py --version eur` exited 0:

```text
Natural-C:        426382 / 2385948    bytes  (17.87%)
source: delinks.txt (approximate — run `ninja report` locally for objdiff-verified numbers)
```

Against the stated baseline of 424,482 B at `0cc273a7aed2c0367414776967cfba35ab0bab8a`, this is +1,900 B, equal to the 14 retained converted spans. The resume session itself removed 128 provisional natural-C bytes when func_02090330 failed to link. Other batches are not incorporated in this branch's figures.

## Limitations and question for Brain

The pinned git-ignored m2c helper was missing from both the main checkout and this worktree. The existing bootstrap module restored the pinned vendor copy locally at `19f2ddb22dcf5161c27b7eae62f142e697ae895f`; pycparser 3.00 was already installed. No project tool source or dependencies were edited. Every Wine compiler/build command uses this worktree's `.wine-lane`; no process was killed.

The assembly-only helper prototypes inherited from the prior session remain ABI-derived declarations, including Copy32, WaitByLoop, OS_DisableIrq, OS_RestoreIrq, func_020944a4 and func_02092368. No helper definition or other caller was edited. Existing natural-C helper definitions were used where available. Callback argument semantics and source-level API typing still require independent review; byte matching proves the compiled call ABI and ROM bytes, not the completeness of the API model.

No USA/JPN source port, symbol rename, shared-header change, tool change, or merge was made. Checks and baseline deletions apply to this batch branch only. Brain should review the delivered exact commit and separately triage the recorder mapping gap and callback-return lint gap. The gate also labels this deterministic unresolved-symbol source failure as INFRASTRUCTURE ERROR; that classification should be examined separately, not treated as an external outage. No blocking question remains. Future natural-C conversion of func_02090330 needs a canonical way to refer to the table fields without assuming the address-only markers are exported definitions; that belongs to Brain planning outside this batch.

The summary commit changes only this file. The branch is pushed for independent review, with no Worker acceptance or merge.
