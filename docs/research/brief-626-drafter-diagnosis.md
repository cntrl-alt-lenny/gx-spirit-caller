# Brief 626 — cmatch_loop drafter diagnosis + fix

_Scaffolder investigation, 2026-07-20._

The b624 result was a real drafter failure, not a fastmatch scoring wall:
the same 30-candidate EUR probe produced 0 compilable candidates before the
fix. Six candidates failed inside m2c before a C draft existed; the remaining
24 reached MWCC and all failed there.

## Baseline

The baseline was run from the unmodified `origin/main` drafter, with the same
30 names, the same temporary delink gaps, and the same MWCC command used by
`cmatch_loop`. The compile-only confirmation was:

```text
origin/main drafter: m2c drafts 24/30, MWCC compiles 0/24, total 0/30
```

The six m2c failures were:

```text
func_ov013_021c9d60
func_ov013_021ca2b8
func_ov013_021ca42c
func_ov013_021ca70c
func_ov013_021ca7cc
func_ov013_021cb674
```

For a representative raw draft, MWCC reported the first concrete errors as:

```text
src\\overlay001\\func_ov001_021c9f24.c:1: declaration syntax error
src\\overlay001\\func_ov001_021c9f24.c:2: undefined identifier 's32'
src\\overlay001\\func_ov001_021c9f24.c:3: declaration syntax error
src\\overlay001\\func_ov001_021c9f24.c:5: illegal function definition
src\\overlay001\\func_ov001_021c9f24.c:14: undefined identifier 'u16'
```

The old `fastmatch` wrapper truncated this output after 15 combined lines,
usually showing MoltenVK startup text instead of the compiler diagnosis. It
now preserves the complete command output so future queue records retain the
actual MWCC signature.

## Failure Taxonomy

Counts are over the 24 candidates for which m2c emitted a C draft. A candidate
can occur in more than one source-shape category.

| Category | Candidates | Occurrences | Representative |
|---|---:|---:|---|
| m2c could not emit a draft | 6 of 30 | 6 | `func_ov013_021c9d60` |
| `?` placeholder types | 22 of 24 | 365 | `func_ov001_021c9f24` |
| missing `s32`/`u16`/other primitive aliases | 24 of 24 | n/a | `func_ov007_021b28c4` |
| unknown `.unkNNN` / `->unkNNN` aggregate access | 16 of 24 | 216 | `func_ov007_021b2694` |
| `void *` used as a field-bearing object | 11 of 24 | 77 | `func_ov007_021b25a0` |
| malformed raw-address member expressions | 5 of 24 | 49 | `func_ov001_021ca074` |
| unknown aggregate address dereferences | 6 of 24 | 11 | `func_ov001_021c9f24` |

The dominant recoverable class was the first-compile scaffold gap: the m2c
output is a comprehension draft and intentionally leaves uncertain types as
`?`, while the project compiler expects the local MWCC primitive aliases.
Once those placeholders were made legal, the next dominant error was the
same uncertainty represented as field access on an `int` or `void *`.

## Fix

`tools/cmatch_loop.py` now keeps the raw m2c skeleton in the dossier, but
passes a compile-only scaffold to MWCC:

- defines the six primitive aliases used by m2c output;
- replaces scalar `?` with `int` and pointer `? *` with a named scaffold
  pointer;
- synthesizes a `struct M2CUnknown` containing every observed `unkNNN` field;
- upgrades field-bearing `void *`/scalar declarations to that scaffold;
- makes m2c's raw-address member form explicit; and
- reads unknown aggregate pool expressions through an `int *` byte offset.

This deliberately improves the first compile probe only. It does not claim
that an inferred field type or offset is byte-correct, and it does not alter
the source tree or delinks.

The wrapper in `tools/fastmatch.py` now returns the complete MWCC diagnostic
instead of the first 15 lines. Pure tests cover placeholder replacement,
field scaffolding, aggregate dereference rewriting, and field deduplication.

## After Measurement

The exact same 30 names were staged again after the fix. The six m2c parse
failures remained m2c failures, while the 24 emitted drafts were sent through
the same MWCC compile target:

```text
origin/main drafter: 0/30 compilable
fixed drafter:       12/30 compilable (12/24 emitted C drafts)
compile-rate lift:   +40 percentage points
```

The remaining 12 emitted drafts still fail on genuine shape issues such as
large unknown aggregates, incomplete m2c expressions, or data declarations;
those now produce actionable compiler diagnostics instead of all collapsing
into the old placeholder syntax failure.

## Recommendation

**GO for the compile-scaffold fix.** It lifts the measured compile rate from
0% to 40% on the locked 30-candidate set and makes the remaining failures
classifiable. **NO-GO for automatic readable-C shipping.** Compilation is
only the first filter; fastmatch and the real gate still decide whether any
draft is a valid reconstruction.
