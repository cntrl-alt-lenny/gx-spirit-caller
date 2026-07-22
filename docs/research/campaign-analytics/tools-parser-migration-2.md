# Tools parser migration 2

Snapshot: 2026-07-22. This follow-up continues the shared
`tools/parsers.py` facade without changing any build-graph entry point.

## Migrated readers

Two remaining duplicate `symbols.txt` readers now use the canonical
`parse_symbols_file(path, module)` parser:

| Tool | Former local reader | Compatibility preserved |
|---|---|---|
| `tools/find_region_siblings.py` | local regex parser returning `(addr, size, name, mode)` | yes; the adapter returns the same tuple shape |
| `tools/export_matched_pairs.py` | local text parser returning `(name, mode, addr, size)` | yes; `collect()` receives the same row fields |

Both remain directly executable with `python tools/<name>.py`; no
`build.ninja` rule or script entry point changed. The canonical parser now
owns the grammar, including comments and the repository's function-symbol
variants.

## Gate result

- `python -m ruff check .` — passed.
- Targeted export tests — 4 passed.
- Full `python -m pytest -q tests` — `11 failed, 2843 passed, 25 skipped,
  55 subtests passed`; the failures are the known Windows path-separator
  and missing-tool/environment baseline, with no migration-related failure.
- `python tools/configure.py eur` — unavailable because this build-free
  `kb-map` worktree has no `orig\baserom_eur.nds`.

The specialized readers in `batch_carve.py`, `calcrom.py`, and
`cross_region_cluster_apply.py` remain separate because their return models
include carve-specific or relocation-specific semantics rather than the
canonical symbol/delinks record. They are not silently rewritten in this
small batch.

## Continuation rerun (2026-07-22)

The remaining delinks readers were migrated through compatibility adapters:

| Tool | Former local reader | Compatibility preserved |
|---|---|---|
| `tools/calcrom.py` | local `delinks.txt` parser with `ranges` keys | yes; the adapter maps canonical `sections` to the legacy `ranges` view |
| `tools/cross_region_cluster_apply.py` | local section/TU scanner | yes; the adapter rebuilds the existing `DelinksMap` (`sections`, `claims`, and `tu_paths`) |

Both tools remain directly executable and no `build.ninja` entry point changed.
The canonical parser now handles all four migrated reader surfaces in this
facade work (the two symbol readers above plus these two delinks readers).

From `kb-types`, `python tools/configure.py eur` followed by the explicitly
scoped `ninja sha1` completed with `gx-spirit-caller_eur.nds: OK` and the
original EUR SHA-1 verified. The full pytest rerun remains at 11 pre-existing
Windows/path/tool-environment failures, 2,848 passed, 20 skipped, and 55
subtests; no parser-migration failure was observed.
