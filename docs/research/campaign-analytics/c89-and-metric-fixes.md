# C89 port residual and brace-aware progress metric

**Date:** 2026-07-31  
**Base:** `b4ca6bb9b` (`origin/main`)  
**Scope:** q-port-c89-declarations and q-progress-brace-nesting

## C89 declaration residual

The three remaining `D016C` compiler-error shapes are the same in USA and
JPN. Reading the six target `.s` files and the corresponding EUR-source
candidates used by `port_to_region.py` confirmed that the generated C declares
a local after executable statements:

| Target function | Target files | Declaration after executable code |
|---|---|---|
| `func_ov002_021b00a4` | `src/usa/overlay002/` and `src/jpn/overlay002/` | `unsigned short packed` follows the two guards and assignments |
| `func_ov002_021eab98` | `src/usa/overlay002/` and `src/jpn/overlay002/` | `char *row` follows the early `if`/`return` |
| `func_ov002_02280604` | `src/usa/overlay002/` and `src/jpn/overlay002/` | `int i` follows the result assignment and limit clamp |

This is a C89 declaration-order failure, not a byte-similarity failure. The
existing per-TU routing table in `tools/configure.py` already supplies
`-lang=c99` for `.c`, `.legacy.c`, `.legacy_sp3.c`, and `.thumb.c` TUs. The
queue history for q-c99-flag-hook records that flag as `.text`-neutral
(`1,106 SAME / 0 DIFF` across the tested tiers and regions), so no new
per-TU configuration edit was needed.

The targeted tool run accepted all six candidates, and `batch_port.py` gated
and committed all six:

| Region | Candidates | Port gate result |
|---|---:|---|
| USA | 3 | 3/3 SHA1 OK |
| JPN | 3 | 3/3 SHA1 OK |

Therefore `-lang=c99` is safe for this residual under the ROM gate. Hoisting
the declarations is unnecessary and would be a source reshape rather than a
fix for the already-supported compiler dialect.

## Brace-aware Typed-array metric

`tools/progress.py` now tracks C brace depth while ignoring comments and
character/string literals. The broad Typed-array tier only credits a matching
array declaration at depth zero; arrays inside structs, unions, enums, or
function bodies no longer credit the owning TU. A regression test covers both
a file-scope array and struct-field/function-local arrays.

Re-running `python tools/progress.py --version eur` on the same committed
delinks tier gives:

| Metric | Before | After | Delta |
|---|---:|---:|---:|
| Typed-array bytes | 158,304 / 4,776,528 (3.31%) | 154,844 / 4,776,528 (3.24%) | -3,460 bytes |

The queue note’s `1,216 + 544 + 32 = 1,792` bytes are the three largest
examples, not the full current-tree correction. The reproducible audit found
24 TUs and 3,460 bytes excluded; the other 21 TUs account for the remaining
1,668 bytes. Code and C-decompiled metrics are unchanged by this data-only
classification correction.

## Verification

- `python tools/check_activation_invariant.py`: function `.c` added 6,
  function `.s` deleted 6, delinks activations 6; `OK`.
- `python tools/gate3.py --scope all`: `[eur] SHA1 PASS`, `[usa] SHA1 PASS`,
  `[jpn] SHA1 PASS`.
- Whole-suite pytest: before `3135 passed, 16 skipped, 63 subtests`; after
  `3136 passed, 16 skipped, 63 subtests`.
