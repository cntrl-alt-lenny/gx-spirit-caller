# `objdiff-cli` ARM crash + project-local filter workaround

**Brief:** 187 Part 1 (scaffolder). Diagnoses the upstream
`objdiff-core` ARM-arch panic that blocks `ninja report` on this
project, ships a project-local filter as a workaround, and links
the upstream issue.

## TL;DR

- `objdiff-cli report generate` panics with `index out of bounds:
  the len is 0 but the index is 18446744073709551615` at
  `objdiff-core/src/arch/arm.rs:130:29` on ARM ELF objects that
  have a non-empty `.text` section but **no `STT_FUNC` symbol
  covering it**.
- Real-data shape on spirit-caller: ~20 affected units, all
  delinked `_dsd_gap@main_*` TUs whose `.text` contains real
  instruction bytes but only `STT_SECTION` / `STT_OBJECT` symbols
  point into it.
- A separate ~1000-unit class of unmatched `.legacy`/`.legacy_sp3`
  routing-tier units fails with `No such file or directory`
  because their target `.o` doesn't exist yet — same blocking
  effect (`ninja report` exits non-zero, `report.json` never
  written).
- **Workaround:** `tools/objdiff_filter_panic_units.py` drops
  both classes before invoking `objdiff-cli report generate`.
  Chained into the `objdiff_report` ninja rule via
  `tools/configure.py`. Idempotent.
- **Upstream issue:**
  [encounter/objdiff#352](https://github.com/encounter/objdiff/issues/352).
  Real fix belongs there; the filter is a stopgap until the
  upstream patch lands.

## Diagnosis

### Reproduction

Running `ninja report` (or `./objdiff-cli report generate -p .
-o build/eur/report.json -d` directly) on the EUR-configured
project surfaces the panic deterministically:

```text
thread '<unnamed>' panicked at objdiff-core/src/arch/arm.rs:130:29:
index out of bounds: the len is 0 but the index is 18446744073709551615
stack backtrace:
   0: _rust_begin_unwind
   1: core::panicking::panic_fmt
   2: core::panicking::panic_bounds_check
   3: <objdiff_core::arch::arm::ObjArchArm as objdiff_core::arch::ObjArch>::process_code
   4: objdiff_core::diff::code::process_code_symbol
   5: objdiff_core::diff::diff_objs
   6: objdiff_cli::cmd::report::report_object
   ...
```

The `18446744073709551615` is `usize::MAX` — a `0_usize - 1`
underflow somewhere in the code-symbol iteration. The crash
fires before `report.json` gets written.

### Bisection

Used a per-unit binary search against `objdiff.json` to identify
the failing inputs. Two distinct failure modes contribute:

1. **`.text` exists with content but no `STT_FUNC` symbol
   covers it** (the actual upstream panic). Affects ~20 units.
   Example minimal ELF (`_dsd_gap@main_181.o`):

   ```text
   .text   size=0x86  (134 bytes of ARM code)
   .data   size=0x108 (real data, `STT_OBJECT` symbols)
   symtab:
     [3] func_02000c44  shndx=0 (external reference, NOT in .text)
     [4] data_020c3bc0  shndx=2 (.data), STT_OBJECT, size 0xe8
     ... 4 more data_ symbols ...
   ```

   `.text` carries delinked code bytes, but no `STT_FUNC` symbol
   ever names that code — only an external reference to
   `func_02000c44` exists. `objdiff-core`'s ARM arch processor
   tries to iterate code symbols inside `.text`, the iteration
   is empty, downstream indexing underflows → panic.

2. **`.text` exists with content but only `STT_OBJECT` symbols
   cover it.** Example: `_dsd_gap@main_202.o` with a `BuildInfo`
   data blob (size 0xcc) placed in `.text` by mwldarm. Same
   crash — `STT_OBJECT` typed symbols in `.text` don't count as
   addressable code for the ARM arch processor.

3. **Missing `.o` files for unmatched routing-tier units.**
   Affects ~1000 units. `objdiff.json` lists every planned
   `.legacy`/`.legacy_sp3` compile (Style A epilogue +
   `1.2/sp3` per-TU routing); until those gain C source no `.o`
   is produced. `objdiff-cli` fails to open the missing target
   with `Failed to open ./.../<unit>.o — No such file or
   directory`. Distinct error class (exits with rc=1, not a
   panic) but same end effect: blocks report generation.

## Workaround — `tools/objdiff_filter_panic_units.py`

Reads `objdiff.json`, walks each unit, and drops the unit if
either:

- its `target_path` `.o` doesn't exist (case 3), or
- the `.o`'s `.text` section has no `STT_FUNC` symbol with
  `st_size > 0` and `st_shndx == .text_section_idx` (cases 1
  + 2 combined).

ELF parsing is direct `struct.unpack` (no `pyelftools` dep).
Idempotent: re-running on an already-filtered file is a no-op.
Wired into the `objdiff_report` ninja rule via
`tools/configure.py` so `ninja report` chains the filter
automatically.

Real-data outcome on EUR n=2 main:

- Total units in objdiff.json (post-`dsd objdiff`): 3330
- Dropped by filter:
  - Case 3 (missing `.o`): 1076 units (mostly unmatched
    `.legacy`/`.legacy_sp3`).
  - Case 1/2 (no `STT_FUNC` covering `.text`): 20 units (all
    `_dsd_gap@main_*` TUs in the 181-202 index range).
- Kept: 2234 units.
- `ninja report` succeeds in ~0.2 s and writes
  `build/eur/report.json` end-to-end.

First post-filter metrics (the canonical objdiff-verified
numbers brief 187 needed):

| Measure | Value |
|---|---|
| `matched_code` | 33,268 / 2,377,060 bytes |
| `matched_code_percent` | **1.40 %** |
| `matched_functions` | 1,420 / 9,608 |
| `matched_functions_percent` | **14.78 %** |
| `complete_units` | 1,381 / 2,234 |

The 1.40 % objdiff number is the right floor for measuring
code-decomp progress; `tools/progress.py`'s 0.70 % approximation
(delinks-based) lower-bounds the same quantity but is less
precise. Brief 187 Part 2's curated queue and brief 188+'s
match waves should track the objdiff number.

## Upstream issue

[encounter/objdiff#352](https://github.com/encounter/objdiff/issues/352):
*"Panic: index out of bounds in ARM arch process_code on ELF
with no STT_FUNC symbols in .text"*. Filed with the panic
backtrace, both failure-mode classifications, a minimal
1020-byte base64-encoded ELF reproducer, and a suggested fix
direction (`if symbols.is_empty() { return Ok(()); }` guard at
the head of `process_code` for the ARM arch).

When the upstream fix lands and the project bumps `objdiff-cli`,
the filter still works for case 3 (missing routing-tier `.o`s)
— that's a different problem that should be revisited once the
code-decomp wave (brief 188+) starts shipping C source and the
missing-`.o` count starts dropping.

## Why filter instead of pre-generate stub `.o`s

A near alternative for case 3 is to emit empty `.o` stubs for
every planned `.legacy`/`.legacy_sp3` unit so the missing-file
errors stop. We chose the filter approach because:

1. The filter is a single 230-LOC Python tool with no build-
   graph dependencies beyond `objdiff.json` + the `.o` files
   that already exist.
2. Stub `.o`s would force objdiff-cli to attempt diffing
   against zero-byte targets, which is meaningless work + would
   distort the `total_units` / `complete_units` ratios.
3. As C source ships for those units, their entries naturally
   re-appear in the report — the filter only drops what's
   currently un-buildable.

## See also

- [`tools/objdiff_filter_panic_units.py`](../../tools/objdiff_filter_panic_units.py) —
  the filter.
- [`tools/configure.py`](../../tools/configure.py) — `objdiff_report`
  rule chains the filter.
- [`docs/research/code-decomp-resumption-queue.md`](code-decomp-resumption-queue.md)
  — brief 187 Part 2 (uses the unblocked report.json for
  candidate ranking).
- [`docs/decomp-workflow.md`](../decomp-workflow.md) — brief
  187 Part 3 (refreshed workflow that assumes `ninja report`
  works).
- Upstream issue: [encounter/objdiff#352](https://github.com/encounter/objdiff/issues/352).
