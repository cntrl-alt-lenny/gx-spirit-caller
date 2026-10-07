# Batch 12 Worker summary

Base `51fde3801`; final code commit `b03d7a6aa` (EUR main, 0x02090000-0x0209ffff). Not merged or accepted.

## Done

56 functions (7,608 B) now build from natural C: 49 `legacy` (1.2/sp2p3), 5 `legacy_sp3`, 2 `default`. The walk covered all 66 candidates from `wall_aware_headroom.py`, then each of the 12 confirmed-permanent files once; `func_020905dc` was mislabelled (plain MMIO C) and matched.

Tier evidence: every `legacy` original saves `lr` and returns with `ldmia; bx lr` (or `sub sp,#4`), which the default tier cannot emit (default best is under 100 in every row below). The `legacy_sp3` five: `func_02095d6c` (1.2-style `mvn`/pool constants where default folds adds), `func_02098088` (struct-by-value prologue), `func_0209bf34` (`ands r0,r3,#3`; default 97.3 emits `tst`), `func_0209d150` (one pool word per MMIO address; default folds the base), `func_0209db88` (variadic `sub sp,#4` frame).

Levers worth reuse: `T *const p = &global;` keeps the base in a callee-saved register in 1.2 (`c034`, `c31c`, `c7dc`, `cda4`, `d0f8`); mixing `p->` with direct global access in one function (`cda4`); reading a pointer parameter as an integer (`func_020989a8`); a callee's result returned implicitly (`func_0209ade4`); declaration-order permutations (`b55c`, `bdc8`, `91a4`).

Honesty: no asm, pins or raw data. `volatile` only on MMIO casts and on members the original re-reads (`func_020972d4`, `func_02097f20`, `func_020975f0`; removing it drops each below 100). Two unneeded qualifiers were removed in `b03d7a6aa`. Per-file declarations that differ from the callee's definition: `func_02096f64` (`func_020970a8` takes struct pointers), `func_0209cd3c` (`data_021026d8` as pointer; defined `int`), `func_020992d8` (`data_0210268c` as a 7-word struct; defined 6 words), `func_0209c7dc` (`func_0209c31c` takes a function pointer; defined `int`).

| Function | Bytes | Tier | Default best % | sp3 best % |
|---|---:|---|---:|---:|
| func_020905dc | 72 | legacy | 0 | 66.7 |
| func_02094864 | 140 | legacy | 0 | 42.9 |
| func_02094e90 | 88 | legacy | 0 | 90.9 |
| func_02094fe4 | 76 | legacy | 0 | 89.5 |
| func_02095030 | 112 | legacy | 0 | 92.9 |
| func_02095c48 | 128 | legacy | 53.1 | 93.8 |
| func_02095d6c | 116 | legacy_sp3 | 62.1 | 100 |
| func_0209614c | 220 | legacy | 16.4 | 20 |
| func_02096f64 | 160 | legacy | 25 | 90 |
| func_02097154 | 100 | legacy | 0 | 60 |
| func_020972d4 | 144 | legacy | 0 | 94.4 |
| func_020975f0 | 120 | default | 100 | - |
| func_02097668 | 152 | legacy | 10.5 | 10.5 |
| func_02097d60 | 100 | legacy | 0 | 92 |
| func_02097dc4 | 84 | legacy | 50 | 81 |
| func_02097e5c | 72 | legacy | 61.1 | 88.9 |
| func_02097f20 | 208 | legacy | 19.2 | 80.8 |
| func_02098088 | 124 | legacy_sp3 | 54.8 | 100 |
| func_0209815c | 68 | legacy | 88.2 | 88.2 |
| func_02098628 | 144 | legacy | 0 | 33.3 |
| func_020986c0 | 76 | legacy | 68.4 | 68.4 |
| FS_UnloadOverlay | 84 | legacy | 66.7 | 66.7 |
| func_020989a8 | 164 | legacy | 53.7 | 82.9 |
| func_02098c98 | 68 | legacy | 5.9 | 88.2 |
| func_020991a4 | 244 | legacy | 0 | 27.9 |
| func_020992d8 | 152 | legacy | 55.3 | 73.7 |
| func_020996c8 | 80 | default | 100 | - |
| func_0209a3f8 | 172 | legacy | 9.3 | 79.1 |
| func_0209a4a4 | 144 | legacy | 0 | 13.9 |
| func_0209aa84 | 240 | legacy | 0 | 18.3 |
| func_0209ade4 | 120 | legacy | 0 | 30 |
| func_0209af84 | 144 | legacy | 0 | 69.4 |
| func_0209b16c | 116 | legacy | 13.8 | 24.1 |
| func_0209b55c | 132 | legacy | 0 | 30.3 |
| func_0209bcdc | 136 | legacy | 0 | 14.7 |
| func_0209bdc8 | 216 | legacy | 5.6 | 77.8 |
| func_0209bea0 | 120 | legacy | 0 | 30 |
| func_0209bf34 | 148 | legacy_sp3 | 97.3 | 100 |
| func_0209c034 | 92 | legacy | 34.8 | 82.6 |
| func_0209c31c | 72 | legacy | 5.6 | 77.8 |
| func_0209c7dc | 244 | legacy | 6.6 | 62.3 |
| func_0209cd3c | 104 | legacy | 0 | 69.2 |
| func_0209cda4 | 256 | legacy | 0 | 75 |
| func_0209d0f8 | 88 | legacy | 54.5 | 54.5 |
| func_0209d150 | 160 | legacy_sp3 | 5 | 100 |
| func_0209d488 | 100 | legacy | 0 | 40 |
| func_0209d5e4 | 128 | legacy | 0 | 21.9 |
| func_0209db88 | 168 | legacy_sp3 | 4.8 | 100 |
| func_0209dde8 | 116 | legacy | 0 | 27.6 |
| func_0209e124 | 120 | legacy | 80 | 80 |
| func_0209e308 | 164 | legacy | 12.2 | 80.5 |
| func_0209e3ac | 164 | legacy | 19.5 | 80.5 |
| func_0209e7f0 | 224 | legacy | 53.6 | 58.9 |
| func_0209ecc8 | 256 | legacy | 12.5 | 17.2 |
| func_0209f404 | 108 | legacy | 92.6 | 92.6 |
| func_0209f8c8 | 60 | legacy | 0 | 86.7 |

## Checked

| Command | Exit | Output |
|---|---:|---|
| `fastmatch.py eur` on all 56 new `.c` | 0 | 56 lines `100.0%  OK` |
| `check_delink_dupes.py` | 0 | `OK (81 delinks.txt, no duplicate .text addresses)` |
| `validate_attempts.py` | 0 | `"rows": 2999`, `"errors": 0`, `"shape_conflicts": 66` (none new); no earlier row removed |
| `check_fake_matches.py` | 0 | `check_fake_matches: OK` |
| `python -m pytest -q tests` | 0 | `1339 passed, 6 skipped, 132 subtests passed` |
| `gate3.py --scope all`, unpiped, at `b03d7a6aa` | 0 | `[eur] SHA1 PASS`, `[usa] SHA1 PASS`, `[jpn] SHA1 PASS`, `1330 passed, 15 skipped`, `GATE PASS`, `gate3: GATE EXIT 0` |
| `progress.py --version eur` | 0 | Natural-C 464,790 to 472,398 B: +7,608 B, equal to the 56 matched sizes |

No `STALE` baseline line appeared; no baseline file was touched.

## Not checked

USA and JPN beyond the gate; the `legacy` tier for the five `sp3` matches and the 2 `default` matches (not needed); independent re-derivation of any match.

## Failed or blocked

Ledger defect for Brain: `FS_UnloadOverlay` matched (100%, gated), but `park_one.py` and `record_shipped.py` take the address from a `func_<addr>` file name and failed silently for it, so it has no ledger rows. My direct append (default 66.7, sp3 66.7, shipped, address 0x02098734) was denied, so I left the ledger alone. Brain decides whether to record it or revert the function.

Other notes: `func_02094864`'s default and sp3 rows carry swapped park classes (append-only). `func_0209c0dc` has three legacy rows (87.5, 92.2, 93.8); the last is the best. Early drafts scored higher than the ledger's final draft for `func_02097528` (default 90.0). No entry was a non-function and no match needed an undefined data label.

| Function | Bytes | Default % | sp3 % | legacy % | Residue |
|---|---:|---:|---:|---:|---|
| func_020922d8 | 76 | 0 | 0 | 0 | asm-int |
| func_02092324 | 68 | 5.9 | 5.9 | 5.9 | asm-int |
| func_0209286c | 44 | 0 | 0 | 0 | asm-int |
| func_02092898 | 52 | 0 | 0 | 0 | asm-int |
| func_020928cc | 28 | 0 | 0 | 0 | asm-int |
| func_020928e8 | 28 | 0 | 0 | 0 | asm-int |
| func_02092904 | 36 | 0 | 0 | 0 | asm-int |
| func_02092940 | 28 | 0 | 0 | 0 | asm-int |
| func_02092e90 | 116 | 0 | 0 | 0 | asm-int |
| func_02092f18 | 144 | 0 | 0 | 0 | asm-int |
| func_02092fa8 | 108 | 0 | 18.5 | 25.9 | asm-int |
| func_020947d0 | 148 | 4.9 | 0 | 0 | instruction-selection |
| func_020948f0 | 256 | 0 | 1.3 | 1.3 | instruction-selection |
| func_02097528 | 200 | 48 | 92 | 96 | call-arg-scheduling-residual |
| func_020981a0 | 136 | 0 | 38.2 | 44.1 | P-20-register-letter |
| func_020988a8 | 256 | 6.2 | 0 | 0 | pool-constant-caching-resistance |
| func_02099ba8 | 64 | 0 | 0 | 0 | mmio-const-materialization |
| func_02099be8 | 60 | 6.7 | 0 | 0 | mmio-const-materialization |
| func_0209b0f4 | 120 | 23.3 | 36.7 | 63.3 | P-36-pool-load-hoist |
| func_0209c0dc | 256 | 35.9 | 50 | 93.8 | P-36-pipeline-interleaving |
| func_0209d4ec | 112 | 3.6 | 3.6 | 3.6 | stack-slot-assignment-mismatch |
| func_0209f470 | 164 | 19.1 | 18.6 | 18.2 | P-36-pipeline-interleaving |

`func_0209d4ec` reaches 100% in `legacy` only through `*(volatile int *)&local`, a stack round-trip the original has but a volatile cast of a local is not honest, so it stays parked. The two `swpb` functions need `swpb`. `func_020988a8` needs two pool words for one symbol (symbols.txt alias). The eleven `asm-int` files need coprocessor or CPSR instructions.
