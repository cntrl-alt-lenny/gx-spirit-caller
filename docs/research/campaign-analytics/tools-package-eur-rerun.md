# Tools package rerun in `kb-types`

Queue item: `q-tools-package`. The shared `tools/parsers.py` facade and its
first migration batch are already present in `origin/main`; this rerun verifies
them from the EUR-capable worktree rather than repeating the code change.

## Migrated readers

The facade is used by `check_match_invariants.py`,
`cluster_wave_propagate.py`, `export_matched_pairs.py`, `generate_heatmap.py`,
`next_targets.py`, `patch_objects_legacy.py`, `scaffold_batch.py`,
`scope_gate.py`, and `sig_census.py`. The follow-up batch also migrated the
canonical symbol reader into `find_region_siblings.py` and
`export_matched_pairs.py`. Direct `python tools/<name>.py` entry points and
`build.ninja` rules remain unchanged.

## EUR rerun

`python tools/configure.py eur` completed, and the explicitly scoped
`ninja sha1` gate completed with:

```text
gx-spirit-caller_eur.nds: OK
Verifying SHA-1 of orig\baserom_eur.nds...
  OK  (1da50df7c210fae96dc69b3825554b9ce13b4f75)
```

The required `python -m pytest -q tests` gate remains red on the pre-existing
Windows/path/tool-environment baseline: 11 failed, 2,848 passed, 20 skipped,
55 subtests. No migration-related failure was observed, so the item remains
parked until the stated green pytest gate is available.

## Reopened queue rerun (2026-07-23)

The reopened item was rechecked after the research index gained additional
reports: pytest now reports **12 failed, 2,847 passed, 20 skipped, 55
subtests**, with the extra failure being the generated research-index
freshness check. `python tools/configure.py eur` followed by `ninja sha1`
still completes and verifies the original EUR SHA-1. No parser migration
failure was found; the item remains parked pending `q-green-pytest`.
