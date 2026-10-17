# Batch 12 Verifier review

Reviewed commit `59323d1e9` on `worker/batch-12` (base `51fde3801`, last code commit `b03d7a6aa`; the final commit only adds `docs/batches/batch-12.md`). Pass one was done from the diff before the Worker's doc was opened.

## Commands

| Command | Exit | Real output |
|---|---:|---|
| `git diff --name-status 51fde3801...59323d1e9` | 0 | 56 `.s` deleted, 56 `.c` added (55 `func_*`, `FS_UnloadOverlay`), only delinks, ledger and batch doc modified; no `.s` modified |
| `fastmatch.py eur` on all 56 new `.c` | 0 | 56 lines, all `100.0%  OK` |
| delinks diff, normalised by extension | 0 | 56 swapped pairs, nothing else changed |
| `validate_attempts.py` | 0 | `"rows": 2999`, `"errors": 0`; base 2770 + 230 appended, no line removed |
| `check_fake_matches.py` | 0 | `check_fake_matches: OK`; `register-pin 0`; no `asm` or `.word` in any new file |
| `gate3.py --scope all --log <outside>` | 0 | `[eur] SHA1 PASS`, `[usa] SHA1 PASS`, `[jpn] SHA1 PASS`, `GATE PASS`, last line `gate3: GATE EXIT 0` |
| `progress.py --version eur` | 0 | Natural-C 472,398 B; 472,398 - 464,790 = 7,608 |
| `wall_aware_headroom.py --json ... 0x02090000-0x0209ffff` | 0 | 84 `.s` of 256 B or less remain |

Gain check: the 55 `func_*` sizes from the ledger sum to 7,524; adding `FS_UnloadOverlay` (84 B, symbols.txt `size=0x54`) gives 7,608, an exact match. Latest ledger row per function is `shipped` for all 55 and `parked` for all 22 others; none is mislabelled.

Tier check: I recompiled six functions at the default tier. Results match the ledger exactly: `bf34` 97.3 (`tst` where the original has `ands`), `815c` 88.2, `f404` 92.6, `e124` 80.0, `d150` 5.0, `db88` 4.8. Tier choices are justified.

## Findings

| # | Class | Where | Issue |
|---|---|---|---|
| 1 | SHOULD FIX | `docs/ledger/attempts.tsv`, `FS_UnloadOverlay` | Confirmed no row in base or head. Needs: addr `0x02098734`, module `main`, text_size 84, tier `legacy`, result `shipped`, match 100, park_class `n/a`, plus default and sp3 parked rows at 66.7 per the doc. |
| 2 | SHOULD FIX | `func_020992d8.legacy.c:1` | `Desc` is 7 words but `data_0210268c` is `unsigned int[6]` (24 B). The original does `ldmia` 4 + 3, so it copies 7 words and reads one word past the symbol. The extern is a type that only makes the bytes line up. Fix the data definition or its size, not the extern. |
| 3 | NOTE | `func_0209c7dc.legacy.c:5` | Passes a function pointer to `func_0209c31c`, which is defined `(int a)` in this same batch. Give the definition the real pointer type. |
| 4 | NOTE | `func_0209cd3c.legacy.c`, `func_02096f64.legacy.c` | `data_021026d8` is defined `int` but used as `Hdr *`. `func_020970a8` is defined `(void*, int, int)` but called with `Out *`. The per-file types look real (0x027ffe00 is a RAM address); the definitions should be updated. |
| 5 | SHOULD FIX | coverage | 62 of the 84 remaining `.s` have no batch-12 row (listed below). All have older rows, but 42 have fewer than three tiers recorded, so "all three tiers" was not met for them. The doc's "all 66 candidates" counts only never-attempted functions. |

Finding 5 detail: the 42 with fewer than three tiers are `02090048 02090330 02090574 0209085c 020908c0 02091768 02091c44 02092074 0209240c 0209256c 02092748 020933bc 02093454 0209417c 02094504 020947b8 02095418 020960ac 02097004 0209703c 02097258 02097364 02097a4c 02098038 020990e0 0209a000 0209a1b8 0209a884 0209a8d0 0209b298 0209b384 0209b448 0209c280 0209cc90 0209d018 0209d438 0209d69c 0209d788 0209ea24 0209f720 0209f7fc 0209f904`. `0209085c` is a linker veneer, so it is not a C candidate. The other 20 have all three tiers recorded.

Volatile check: `volatile` on `func_020975f0` is honest. The parked `func_02097528` original has the same `str [r5,#0x40]; ldr [r5,#0x40]; str [r5,#0x3c]` re-read.

## My own attempts

- `func_02097528` (parked, legacy 96%): three source shapes, all 6.0%. The original keeps `ands; movne; moveq; cmp` and mwcc folds my flag variable. Not matched.
- `func_02099ba8`: two shapes (word copies, struct assignment), 0.0%. Not matched.
- `func_0209d788` (no batch row): default 85.7 (`tst` vs `ands`), legacy and sp3 28.6. Not matched. No wall is claimed broken.

## Pass two (Worker doc)

- Disclosed declarations (`02096f64`, `0209cd3c`, `020992d8`, `0209c7dc`) match findings 2 to 4; the Worker was honest about them.
- "Each of the 12 confirmed-permanent files once": 11 permanent files have rows plus `020905dc`; the tool now lists 16 permanent, and `02090574`, `020908c0`, `02098038`, `0209a1b8`, `0209f904` have no batch row. UNPROVEN CLAIM.
- "All 66 candidates walked": see finding 5; true only for never-attempted functions.
- Doc says `gate3` and pytest (1339 passed) ran at `b03d7a6aa`; my gate at `59323d1e9` passed, and the two commits differ only by the doc. I did not rerun pytest.
- The FS_UnloadOverlay ledger defect is real (finding 1); the Worker's account of the tool failure is unchecked.

## Not checked

Pytest. Hand-checking of all 56 types against callees; I sampled the four declared differences plus `bf34` and `a3f8` against their `.s`. USA and JPN beyond the gate.

## Verdict

No blockers. All 56 matches are real C, byte-exact at 100%, correctly tiered, gate-clean on three regions, and the +7,608 B gain is exact. Before acceptance, Brain should add the missing `FS_UnloadOverlay` ledger rows (1), fix the `data_0210268c` size lie (2), and decide whether the 42 under-tried functions (5) are a follow-up batch. Items 3 and 4 are definition cleanups that can ride along.
