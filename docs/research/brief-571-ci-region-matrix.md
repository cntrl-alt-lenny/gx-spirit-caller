# Brief 571 — CI region metadata matrix

Date: 2026-07-13

## Scope

Two metadata-only gating workflows were extended from EUR-only to the
committed region matrix `[eur, usa, jpn]`:

- `.github/workflows/analyzer.yml`
  - `pr-tier-delta`: `analyze_symbols.py` now runs once per matrix version for
    both the base snapshot and PR diff.
  - `main-baseline`: analyzer integrity validation now runs once per region.
- `.github/workflows/match-invariants.yml`
  - `pr-invariants`: `check_match_invariants.py` now runs once per region.
  - `main-baseline`: invariant error validation now runs once per region.

The check commands and arguments are unchanged except for replacing the
hardcoded `eur` with `${{ matrix.version }}`. Matrix-specific temporary files
and PR comment markers prevent concurrent legs from overwriting each other.

## Blocking policy

- EUR: blocking, exactly as before (`continue-on-error: false`).
- USA/JPN: advisory (`continue-on-error: true`) because three known global
  name-drift errors predate this change.

## Validation

- YAML parsed successfully with PyYAML for both changed workflows.
- `git diff --check` passed.
- No build or runner execution was performed.
