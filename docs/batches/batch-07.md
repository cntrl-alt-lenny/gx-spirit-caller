Codex desktop — model `gpt-6.1-sol` — reasoning effort `medium`.

Batch 07 is **BLOCKED**, not accepted. Started from `0cc273a7aed2c0367414776967cfba35ab0bab8a`; code and ledger evidence below are at `1846dc51c3167b5b79032cc3acfde2cf0b320097`.

Walked EUR main in address order through **0x020945f4**: 35 eligible functions attempted, 15 at resolved fastmatch 100%, 20 parked. The 15 provisional C conversions total **2,028 B**. No merge, ports, renames, shared headers, tool edits or baseline edits. Every tier tried has a ledger row; repeated same-tier retries append extra rows.

**Blockers and question for Brain.** I chose the unmapped park class `frame-epilogue` for 30 default-tier rows. `park_one.py` accepted the rows and `validate_attempts.py` reports zero errors, but both test runners fail three mapping tests. This is my recording error, and also a preflight validation gap: the recording tool does not enforce the mapping invariant checked by the tests. The batch forbids both editing existing rows and changing tools, so I cannot repair this within its boundaries.

Brain: may I correct only these 30 newly added batch-07 rows to the existing reviewed `frame-shape` mapping, in a new commit, preserving all earlier ledger rows and Git history, then resume acceptance repairs? Rows: 1989, 1991, 1993, 1997, 1999, 2005, 2007, 2009, 2011, 2013, 2015, 2019, 2021, 2025, 2027, 2029, 2031, 2033, 2035, 2037, 2039, 2041, 2043, 2045, 2047, 2049, 2051, 2053, 2055, 2057.

The source-only fake-match lint also reports `text-unit-without-function` for `func_02090728.legacy.c`. It has a valid C function-pointer-return definition, `void (*func_02090728(unsigned int mask))(int)`, compiled by mwcc and measured at 100%. The checker fails to recognize this declarator form. I stopped this function and report the defect; no checker patch or workaround has been made. It remains provisional C on the blocked branch.

**Provisional matches (fastmatch only; no completed ROM gate).** All are `.legacy.c` / mwcc 1.2 sp2p3. Each was first compiled as plain `.c`. For every entry except func_02090728, the original restores lr then uses bx lr, whereas the default emits a one-step return or a different frame/tail shape. func_02090728 is a leaf: its original uses `ands r1, r0, #1`; the default uses `tst`. Reordering the ordinary local declarations completes its legacy match. No sp3 tier was tried.

| Function | Size B | Default best % | Final legacy % |
|---|---:|---:|---:|
| func_020900a0 | 116 | 17.2 | 100.0 |
| func_0209015c | 112 | 0.0 | 100.0 |
| func_02090330 | 128 | 0.0 | 100.0 |
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

Each initial match has its own commit. `func_02090330` has subsequent single-function reference repairs: the first symbol change scored 75% and was mistakenly committed before inspection; the final byte-offset spelling restores 100% at the evidence commit and uses the original `data_020c319a` / `data_020c319c` symbols. The two old `.s` baseline entries have **not** been pruned: the interrupted gate never reached its reference check.

**Attempted but not matched.** Best observed percentage per tier, including retries. These 20 functions and their routing are back on the original `.s` exactly. Most legacy failures are recorded as the broad `structural` class; it is not a claim that a permanent compiler wall was proven.

| Function | Size B | Default best % | Legacy best % |
|---|---:|---:|---:|
| func_020903d4 | 128 | 21.9 | 15.6 |
| func_02090690 | 76 | 31.6 | 63.2 |
| func_020906dc | 76 | 42.1 | 79.0 |
| func_020907b4 | 144 | 11.1 | 0.0 |
| func_02090b54 | 240 | 1.7 | 24.6 |
| func_02091f88 | 236 | 3.4 | 0.0 |
| func_0209226c | 108 | 17.9 | 17.9 |
| func_020929ac | 136 | 0.0 | 97.1 |
| func_02093014 | 112 | 34.5 | 92.9 |
| func_020930b0 | 176 | 0.0 | 0.0 |
| func_02093160 | 136 | 0.0 | 91.2 |
| func_020931f8 | 156 | 0.0 | 94.9 |
| func_02093684 | 156 | 10.3 | 28.2 |
| func_02093b00 | 240 | 0.0 | 1.7 |
| func_02093fb8 | 120 | 16.7 | 40.0 |
| func_02094030 | 124 | 29.0 | 41.9 |
| func_020940ac | 144 | 13.9 | 25.0 |
| func_0209423c | 116 | 6.9 | 79.3 |
| func_020942b0 | 200 | 0.0 | 9.8 |
| func_020945f4 | 148 | 62.2 | 48.6 |

Closest residuals: func_020929ac has one commutative ADD operand-order difference at 97.1%; func_020931f8 has a load/store scheduling swap at 94.9%; func_02093014 folds a literal base plus offset at 92.9%; func_02093160 differs in the low-word increment register/scheduling at 91.2%. Failed draft scores were measured locally; the drafts are not committed, so the ledger alone does not let another checkout reproduce them.

**Skipped in the walked address range.** This lists all remaining `.s` files of at most 256 B in 0x02090000–0x020945f4 that were not attempted. Already-C units and larger functions were outside the candidate walk.

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

**Not walked after the stop address.** All 66 remaining eligible candidates below were not attempted because the session stopped for acceptance and is now blocked. None has a batch-07 attempt row.

`func_020947d0`, `func_02094864`, `func_020948f0`, `func_02094e90`, `func_02094fe4`, `func_02095030`, `func_02095c48`, `func_02095d6c`.

`func_0209614c`, `func_02096f64`, `func_02097154`, `func_020972d4`, `func_02097528`, `func_020975f0`, `func_02097668`, `func_02097d60`.

`func_02097dc4`, `func_02097e5c`, `func_02097f20`, `func_02098088`, `func_0209815c`, `func_020981a0`, `func_02098628`, `func_020986c0`.

`FS_UnloadOverlay`, `func_020988a8`, `func_020989a8`, `func_02098c98`, `func_020991a4`, `func_020992d8`, `func_020996c8`, `func_02099ba8`.

`func_02099be8`, `func_0209a3f8`, `func_0209a4a4`, `func_0209aa84`, `func_0209ade4`, `func_0209af84`, `func_0209b0f4`, `func_0209b16c`.

`func_0209b55c`, `func_0209bcdc`, `func_0209bdc8`, `func_0209bea0`, `func_0209bf34`, `func_0209c034`, `func_0209c0dc`, `func_0209c31c`.

`func_0209c7dc`, `func_0209cd3c`, `func_0209cda4`, `func_0209d0f8`, `func_0209d150`, `func_0209d488`, `func_0209d4ec`, `func_0209d5e4`.

`func_0209db88`, `func_0209dde8`, `func_0209e124`, `func_0209e308`, `func_0209e3ac`, `func_0209e7f0`, `func_0209ecc8`, `func_0209f404`.

`func_0209f470`, `func_0209f8c8`.

**Checks at `1846dc51c3167b5b79032cc3acfde2cf0b320097`.** Commands use python3.13; the gate and fastmatch inherit `DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib:/usr/lib`.

| Command | Exit | Real output |
|---|---:|---|
| `tools/fastmatch.py eur <all 15 new C files>` | 0 | 15 × `100.0% OK (resolved)`; final func_02090330 is 32 words |
| `tools/check_delink_dupes.py` | 0 | `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)` |
| `tools/check_match_invariants.py --version eur` | 1 | `Found 13999 issue(s): 0 error(s), 13999 warning(s).` |
| `tools/validate_attempts.py` | 0 | `"rows": 2067`, `"errors": 0`, `"shape_conflicts": 66`; 80 new rows cover 35 addresses |
| `-m pytest -q tests` | 1 | `3 failed, 1327 passed, 15 skipped, 132 subtests passed in 11.46s` |
| `-m unittest discover -s tests` | 1 | `Ran 1345 tests in 20.970s`; `FAILED (failures=3, skipped=15)` |
| `-m ruff check .` | 0 | `All checks passed!` (`ruff` console command is absent from PATH; the python3.13 module is installed) |
| `tools/check_fake_matches.py` | 1 | `NEW: text-unit-without-function src/main/func_02090728.legacy.c: delinks.txt gives this unit .text; it defines no function`; `check_fake_matches: FAIL` |
| `tools/progress.py --version eur` | 0 | `Natural-C: 426510 / 2385948 bytes (17.88%)`; source: delinks.txt, approximate |

The three failing tests in both runners are `test_appended_rows_do_not_break_mapping_invariant`, `test_every_ledger_value_has_a_reviewed_mapping`, and `test_unmapped_free_text_fails_loudly` in `test_normalise_park_class.py`. They all identify `frame-epilogue`; no tests or mappings were changed.

`python3.13 tools/gate3.py --scope all --log ../gate-batch-07.log` was run without a pipe. After discovering the ledger blocker, I interrupted only my gate and its own ninja process (PIDs 23961 and 24002, parent/child confirmed). The gate had built 1471 of 12575 EUR steps; it was making progress, not hung. Exit **130**. The required macOS log check:

```text
grep -nE "SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)" ../gate-batch-07.log
11382:gate3: GATE EXIT 130
```

`tail -1 ../gate-batch-07.log` also prints `gate3: GATE EXIT 130`. There is no EUR/USA/JPN SHA1 PASS, no gate pytest result, and no GATE PASS. No byte-identical ROM claim is made; full reference/object lint checks are unverified. The standalone tests above do not substitute for the ROM gate.

Natural-C before: **424,482 B (17.79%)**, measured with `tools/progress.py --version eur` at the starting commit. After: **426,510 B (17.88%)** at the evidence commit, +**2,028 B**, equal to the 15 converted function spans. This is this branch’s figure; other batches were not incorporated.

**Other limits and setup.** The supplied main checkout was found under Dev/GitHub; AGENTS.md, all three baseroms and the requested origin remote were confirmed. Rosetta and wine prerequisites exited 0. The downloaded arm-binutils runtime check initially failed with missing `@rpath/libzstd.1.dylib`; setting the fallback path to the existing Homebrew and system libraries made objdump run. No software was installed and no tools were patched. Wine was warmed only in this worktree’s `.wine-lane` prefix; no global process kill was used.

Natural-C callees such as func_020909d0, func_02093dc8, func_02096228, func_02096434, func_020938f8 and func_01ff86c4 use their existing definitions’ prototypes. Assembly-only helpers have incomplete declarations in their `.c` files; my call declarations follow the original register ABI. These include Copy32, WaitByLoop, OS_DisableIrq, OS_RestoreIrq, func_020944a4 and func_02092368 (whose asm definition says void although this original caller consumes r0). This distinction needs explicit review against the prompt’s prototype requirement. No existing definitions or callers were changed.

The summary commit changes only this document. Branch `worker/batch-07` is pushed for Brain’s blocked-work handoff, not for acceptance or merge.
