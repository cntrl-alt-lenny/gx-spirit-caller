# Factory 1108 night: verifier review

Verdict: PASS

Reviewed `git diff origin/main 5245c7d47` (121 files: 55 added, 55 deleted, 11
modified). No gate3, ninja or fastmatch run (Brain held the compiler), so
byte-identity rests on the driver and Brain's gate.

## Findings

1. NOTE - fake-match tricks: none. `check_fake_matches.py` exit 0; its 4 hits
   are pre-existing files outside this diff. No `asm`, `pragma`, `while(0)`,
   raw directives or `register` in the 55 new files. Every `volatile` is a
   cast to a 0x04xxxxxx MMIO address (func_0202abdc, ov002_022a215c,
   ov004_021d3578, ov004_021da36c, ov010_021b7d60, ov019_021b52f0). The `do`
   loops and `goto`s are real control flow.
2. NOTE - names: a scripted check of every `func_*`/`data_*` token and
   `extern` against config/eur/**/symbols.txt and the headers found none
   unresolved. `check_match_invariants.py --version eur`: 0 errors.
3. MINOR - `src/overlay002/func_ov002_021d35fc.c`: a store folded into a call
   argument in case 0, and `*(u16 *)&src` at line 79 reading a bitfield struct
   as a halfword. Plausible semantics, not a codegen perturbation.
4. NOTE - delinks: 55 line pairs, each swapping only the path; start/end lines
   untouched. `check_delink_dupes.py` exit 0.
5. MINOR - ledger: main's attempts.tsv is an exact prefix (341 rows appended:
   56 shipped, 285 parked). func_02045d0c has a `shipped` row then a later
   `parked matches-only-with-unjustified-volatile` row for its revert; a
   consumer counting `shipped` rows over-counts by one. `validate_attempts.py`
   exit 0.
6. NOTE - reference baseline: 17 lines deleted, 0 added, each naming a `.s`
   this diff deletes. Whether the new `.c` builds are reloc-clean is for the
   gate.
7. NOTE - scope: every changed path is under src/, config/,
   docs/ledger/attempts.tsv or tools/reference_baseline.txt.

## Not covered

- Byte-identity and reloc cleanliness (needs the compiler; Brain's gate).
- No fastmatch spot checks.

## Brain note after review

The gate on 5245c7d47 passed SHA-1 for all three regions and pytest, but the
reference check reported 16 NEW lines on 10 of the new `.c` files. They are
the relocation differences main already carried for those functions' `.s`
files: same kinds, offsets and symbols, except func_02024574's missing-reloc
moving from `.text+0x70` (old `.s` line) to `.text+0x6c`. func_ov002_021c8e38's
line is gone for good. Brain re-keyed the 16 lines to the `.c` paths (17
deleted, 16 added, net -1) at cd33b6fc6; no new defect is admitted, and the
inherited symbol-attribution defects stay listed for a follow-up.
