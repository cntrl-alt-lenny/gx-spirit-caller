# Factory 1108 night: verifier review

Verdict: PASS

Reviewed `git diff origin/main 5245c7d47` (121 files: 55 added, 55 deleted, 11 modified).
No gate3 / ninja / fastmatch was run (Brain holds the compiler). Byte-identity is
therefore taken from the driver and the Brain gate, not re-verified here.

## Findings

1. NOTE - item 1, fake-match tricks: none found.
   - `python tools/check_fake_matches.py` exit 0: raw-data-directive 0, section-override 0,
     data-in-pragma-section 0, register-pin 0, do-while-zero 3, volatile-local 1 (baseline 4).
     The 4 hits are `src/*/overlay000/func_ov000_021ac*.c` and `src/main/func_02096040.legacy.c`,
     all pre-existing, none in this diff.
   - grep for `asm|pragma|while(0)|.word|.byte|register` over the 55 new files: no hits.
   - Every `volatile` in the new files is a pointer cast to a 0x04xxxxxx address (MMIO):
     func_0202abdc.c:15-30 (0x04000000/0x04001000), func_ov002_022a215c.c:50-54,
     func_ov004_021d3578.c:106-108, func_ov004_021da36c.c:42-113, func_ov010_021b7d60.c:15-37,
     func_ov019_021b52f0.c:22-24. All legitimate. No volatile local or volatile struct field.
   - `do {` uses (func_02024574.c:21, func_ov002_021c8e38.c:62, _0222a268:29, _0223c72c:42,
     _02250044:51, _022a215c:62, _022ab3e4:90,98) are real loops with real conditions.
   - `goto` in func_0202abdc.c (main_update / sub_update labels) and func_020a8d50.c (`invalid`
     error exit) are control flow shared between cases, not codegen tricks.

2. NOTE - item 2, names: no invented symbols. Scripted check of every `func_*`/`data_*` token and
   every `extern` declaration in the 55 files against config/eur/**/symbols.txt (22437 names) and
   all headers: zero unresolved (the lone `sub_update` hit is a goto label).
   `python tools/check_match_invariants.py --version eur`: exit 1 but "0 error(s), 13999 warning(s)";
   the 9 orphan_extern warnings are in ov006_core.h / ov020_core.h, untouched by this diff.

3. MINOR - src/overlay002/func_ov002_021d35fc.c (case 0, `p = func_ov002_021c93f0(..., data_ov002_022ce950.f814 = (u16)sourceKind, ...)`)
   and line 79 (`*(u16 *)&src`): a store folded into a call argument and a bitfield struct
   reinterpreted as u16. Semantically plausible (stores a real field, passes packed halfword),
   not a register/stack perturbation. Not blocking; a reader may find it odd.

4. NOTE - item 3, delinks: 55 `-`/`+` line pairs across 9 files (arm9 and ov002/004/006/010/011/012/013/019). Each pair
   swaps only the path (`.s` -> `.c`, with `.legacy` / `.legacy_sp3` infix preserved for 9 main
   files); the `start:`/`end:` lines are not in the diff, so unchanged. Every new .c has a
   delinks line; every deleted .s has one. `python tools/check_delink_dupes.py` exit 0 ("81 delinks.txt, no duplicate .text addresses").

5. MINOR - item 4, ledger: origin/main's attempts.tsv is an exact prefix of the new file
   (341 rows appended: 56 shipped, 285 parked). There are 56 shipped rows for 55 new .c files:
   func_02045d0c has a `shipped 100` row (factory-1108-M9) AND a later `parked
   matches-only-with-unjustified-volatile` row (factory-1108-integration), and its .s is
   unchanged vs main. The sequence is truthful history, but a consumer counting `shipped`
   rows will over-count by one. Row order, not the shipped row, is what marks the revert.
   `python tools/validate_attempts.py` exit 0 (only pre-existing shape-conflict notes).

6. NOTE - item 5, reference_baseline: 17 deleted lines, 0 added; each names a `.s` file deleted
   by this diff (func_02024574, 0202be4c, 020548f4 x3, 0207845c, 0207b250 x2, 02083dd8 x3,
   020a8d50 x2, ov002_021c8e38, ov004_021d3578, ov004_021da36c, ov011_021cabbc).
   Caveat for the gate: these were reloc-diff entries (missing-reloc / wrong-target); the new
   .c builds must be reloc-clean without a baseline entry. That is exactly what Brain's gate
   (per-region reloc compare) decides; not verifiable here.

7. NOTE - item 6, scope: all changed paths are under src/, config/, docs/ledger/attempts.tsv,
   or tools/reference_baseline.txt (scripted `git diff --name-only | grep -v` returned empty).

## Not covered

- Byte-identity / reloc cleanliness of the .c builds (needs compiler; deferred to Brain's gate).
- No fastmatch spot checks run.
