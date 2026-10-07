# Batch 13 ? Worker

## Done

Walked all 66 candidates in address order, then retried all seven confirmed-permanent entries. Of 73 entries, 22 matched (2,644 B), 50 functions were parked after three measured tiers, and one was not a function. Each match has its own commit. The final code/ledger commit is `3299777a7`; starting commit is `51fde3801`. No merge or baseline edits.

All shipped files scored 100% with `python tools/fastmatch.py eur`. Suffixes select default 2.0, SP3 1.2/sp3, or SP2P3 1.2/sp2p3. For every non-default file, its exact shipped source was separately compiled under default 2.0 and differed. ?LR/BX? means the original restores LR then executes `bx lr`; default emits a PC restore. SP3 retains the original separate `lsl; ands` mask test and halfword increment/compare scheduling; default uses `tst` and different scheduling.

| Function (`func_` prefix) | Bytes | Tier | Original evidence; exact-source default score |
|---|---:|---|---|
| `020a06b0` | 108 | SP2P3 | LR/BX; 22.22% DIFF |
| `020a071c` | 112 | SP2P3 | LR/BX; 0.0% DIFF |
| `020a078c` | 200 | SP2P3 | LR/BX; 24.0% DIFF |
| `020a10e8` | 68 | SP2P3 | LR/BX; 52.94% DIFF |
| `020a112c` | 184 | SP2P3 | LR/BX; 30.43% DIFF |
| `020a2bf0` | 132 | SP2P3 | LR/BX; 54.55% DIFF |
| `020a34e0` | 252 | SP2P3 | LR/BX; 0.0% DIFF |
| `020a3654` | 96 | default | ? |
| `020a37e0` | 80 | SP2P3 | LR/BX; 75.0% DIFF |
| `020a3ac0` | 60 | SP2P3 | LR/BX; 73.33% DIFF |
| `020a3d34` | 256 | SP2P3 | LR/BX; 45.31% DIFF |
| `020a5a34` | 96 | SP3 | LSL/ANDS and increment scheduling; 20.83% DIFF |
| `020a5e04` | 100 | SP2P3 | LR/BX; 0.0% DIFF |
| `020a6170` | 128 | SP2P3 | LR/BX; 3.12% DIFF |
| `020a6444` | 208 | SP2P3 | LR/BX; 3.85% DIFF |
| `020a6d54` | 60 | default | ? |
| `020a95a0` | 68 | default | ? |
| `020aac30` | 84 | default | ? |
| `020ab0c4` | 108 | default | ? |
| `020b005c` | 32 | default | ? |
| `020b044c` | 64 | default | ? |
| `020b17ac` | 148 | default | ? |

Parked scores below are maxima among real trials for each tier. All parked assembly and routing were restored exactly. These results establish attempted coverage, not permanent impossibility. ? marks the seven confirmed-permanent CPSR functions. The three divide entries were also tried, despite shared-entry assembly structure.

| Function | Bytes | Default % | SP3 % | SP2P3 % |
|---|---:|---:|---:|---:|
| `020a09c8` | 132 | 6.06 | 33.33 | 33.33 |
| `020a1c48` | 252 | 31.75 | 25.4 | 74.6 |
| `020a1f7c` | 176 | 22.22 | 21.74 | 21.74 |
| `020a202c` | 212 | 1.89 | 5.66 | 84.91 |
| `020a2100` | 220 | 3.64 | 36.36 | 1.72 |
| `020a2394` | 132 | 3.03 | 6.06 | 6.06 |
| `020a26f0` | 148 | 0 | 0 | 0 |
| `020a33a8` | 132 | 0 | 39.39 | 57.58 |
| `020a4180` | 120 | 0 | 3.33 | 3.33 |
| `020a5458` | 104 | 38.46 | 66.67 | 66.67 |
| `020a54c0` | 124 | 6.45 | 9.68 | 54.84 |
| `020a553c` | 164 | 0 | 31.71 | 34.15 |
| `020a55e0` | 116 | 0 | 51.72 | 51.72 |
| `020a5a94` | 176 | 0 | 15.91 | 86.36 |
| `020a5c80` | 136 | 0 | 0 | 0 |
| `020a6514` | 236 | 20.34 | 28.81 | 28.81 |
| `020a6924` | 172 | 11.63 | 11.63 | 55.81 |
| `020a6a28` | 108 | 25.93 | 59.26 | 96.3 |
| `020a6a94` | 104 | 0 | 61.54 | 69.23 |
| `020a6ce0` | 104 | 50 | 3.7 | 3.57 |
| `020a6dc4` | 136 | 23.53 | 38.89 | 36.84 |
| `020a7268` | 136 | 17.65 | 35.29 | 33.33 |
| `020a72f0` | 120 | 3.23 | 5.71 | 5.41 |
| `020a7480` | 176 | 0 | 0 | 0 |
| `020a96fc` | 104 | 88.46 | 88.46 | 41.38 |
| `020aadf8` | 200 | 0 | 0 | 0 |
| `020ac37c` | 224 | 40.68 | 44.07 | 43.33 |
| `020acca0` | 152 | 73.68 | 31.58 | 38.46 |
| `020aed64` | 64 | 81.25 | 0 | 0 |
| `020aedcc` | 112 | 48.28 | 32.14 | 35.71 |
| `020b0390` | 108 | 33.33 | 22.22 | 22.22 |
| `020b048c` | 204 | 27.45 | 0 | 0 |
| `020b0afc` | 224 | 5.36 | 5.36 | 3.33 |
| `020b0bdc` | 224 | 3.57 | 0 | 0 |
| `020b10e0` | 168 | 33.33 | 0 | 0 |
| `020b1854` | 112 | 6.9 | 5.71 | 5.71 |
| `020b18f0` | 104 | 0 | 0 | 0 |
| `020b1d80` | 140 | 2.7 | 0 | 0 |
| `020b2978` ? | 152 | 0 | 0 | 0 |
| `020b2a10` ? | 164 | 0 | 0 | 0 |
| `020b2ab4` ? | 156 | 0 | 0 | 0 |
| `020b2b50` ? | 140 | 0 | 0 | 0 |
| `020b2bdc` ? | 140 | 2.17 | 0 | 0 |
| `020b2c68` ? | 92 | 0 | 4.35 | 4.35 |
| `020b2cc4` ? | 92 | 0 | 4.35 | 4.35 |
| `020b30e4` | 132 | 0 | 0 | 0 |
| `020b3648` | 16 | 0 | 0 | 0 |
| `020b3808` | 12 | 0 | 0 | 0 |
| `020b3814` | 60 | 0 | 0 | 0 |
| `020b41f8` | 80 | 20 | 0 | 0 |

| Skipped entry | Evidence |
|---|---|
| `func_020a9914.s`, 8 B | Only `add sp, sp, #0x10` and `ldmia sp!, {r3-r11,pc}`: trailing epilogue, no function prologue. |

Per-file callee declarations differing from the callee definition (addresses abbreviate `func_` names):

| Caller(s) | Local declaration versus definition; original evidence |
|---|---|
| `020a06b0`, `020a078c` | `0209dd30(int,unsigned short,int,int,...)` versus four fixed parameters; original passes six/seven arguments. |
| `020a071c` | `0209dd30(int,unsigned short,...)` versus four fixed parameters; original passes three. |
| `020a078c`, `020a34e0` | `020944a4(const void*,void*,int)` versus assembly C declaration `void(void)`; original uses r0?r2. |
| `020a34e0` | `0209448c(int,void*,int)` versus assembly C declaration `void(void)`; original uses r0?r2. |
| `020a2bf0` | `02097f10(int,int,int)` versus four ints; fourth parameter is ignored. |
| `020a37e0`, `020a3ac0` | `020a35dc(int,int)` versus `(unsigned short,unsigned short)`; original passes words, callee stores halfwords. |
| `020a5e04` | `WaitByLoop(int)` versus assembly C declaration `void(void)`; original sets r0=1. |
| Parked `020a1c48`, `020a553c`, `020a55e0`, `020a6514` | `OS_DisableIrq():int` and `OS_RestoreIrq(int)` versus assembly C declarations `void(void)`; CPSR return/restore in assembly. |
| Parked `020a33a8` | `020944a4` three arguments versus assembly C declaration `void(void)`. |
| Parked `020a7268`, `020a72f0` | `020a71e4(int,int,int):int`, `020a724c(int,int):int` versus void-return definitions; original consumes vtable-dispatch r0. |
| Parked `020b41f8` | `020b41d4():unsigned char` versus assembly C declaration `void(void)`; original consumes r0. |
| Parked `020a96fc` | Local buffer data `char*` versus `020a95a0` buffer's `unsigned char*`; identical pointer layout. |

Assembly-only callees have no C type definition; declarations follow register use. No definition was found for `02093a20` or `020a6d90`; their callers were still tried in all tiers. Globals were tried directly and through pointers before parking.

## Checked

| Command / audit | Exit | Observed output |
|---|---:|---|
| `python tools/fastmatch.py eur <all 22 new C files>` at `3299777a7` | 0 | All 22: `100.0% OK (resolved, ... gap=... .o)` |
| `python tools/check_delink_dupes.py` | 0 | `OK (81 delinks.txt, no duplicate .text addresses)` |
| `python tools/validate_attempts.py` | 0 | `rows: 3013`; `errors: 0`; `shape_conflicts: 66` (existing) |
| `python tools/check_fake_matches.py` | 0 | `check_fake_matches: OK`; baseline entries 4 |
| `python tools/check_match_invariants.py --version eur` | 1 | `Found 13999 issue(s): 0 error(s), 13999 warning(s)` |
| `python -m pytest -q tests` at final code commit | 0 | `1329 passed, 16 skipped, 132 subtests passed in 54.56s` |
| Exact shipped-source default-compiler proof | 0 | All 14 non-default sources `DIFF`; scores in matched table |
| `python tools/progress.py --version eur` at `51fde3801` / `3299777a7` | 0 / 0 | `Natural-C: 464790 / 2385948 bytes (19.48%)` / `467434 / 2385948 bytes (19.59%)`; delta 2644 = matched sizes |
| Coverage / scope / append-only audit | 0 | 73/73, missing/extra none; 244 numeric rows appended, original ledger prefix unchanged; valid raw park classes; 22 owned routing path lines; baselines unchanged; all parks restored |
| `python tools/wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr 0x020a0000 --max-addr 0x020bffff --json` | 0 | `total_candidate: 1`; only `func_020a9914.s`, 8 B |
| `python tools/gate3.py --scope all --log <external gate-batch-13.log>` at `3299777a7`, unpiped/uninterrupted | 0 | `[eur] SHA1 PASS`; `[usa] SHA1 PASS`; `[jpn] SHA1 PASS`; `1330 passed, 15 skipped, 132 subtests passed in 20.85s`; `GATE PASS`; last line `gate3: GATE EXIT 0` |
| PowerShell log check from AGENTS.md verbatim, same log | 0 | Lines 26765/52363/77962: region SHA1 PASS; 78002: pytest summary; 78005: GATE PASS; 78006: GATE EXIT 0; no region SKIP |
| Gate reference / fake-match checks | 0 / 0 | `32903 units compared; missing-reloc 5514, extra-reloc 0, wrong-target 406 (baseline entries 5920)`; `check_references: OK`; `check_fake_matches: OK` |
| `python -m unittest discover -s tests` (captured subprocess) | 0 | `Ran 1345 tests in 48.073s`; `OK (skipped=15)` |
| `python -m ruff check .` | 0 | `All checks passed!` |
| `python tools/fw.py check` | 0 | `0 error(s), 16 warning(s)`; existing prose-cap warnings only |

The gate log is outside the checkout at `../gate-batch-13.log`. Its PowerShell filter was:

```powershell
Select-String -Pattern 'SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)' <log>
```

## Not checked

Further refinements of parked functions, semantic naming and inferred structure layouts. USA/JPN receive no new C ports; their ROMs are checked by the gate. No merge or Verifier review performed.

## Failed or blocked

The initial review-revision block was resolved by Brain's correction to `51fde3801`. A draft MWCC lexical error (`0x43e-`) was corrected with whitespace before measuring. No placeholder scores were recorded. The full gate passed; no STALE lines, undefined-label failures or unresolved block remain. The advisory invariant check exits 1 on existing warnings, with zero errors.
