# objdiff-cli v2.7.1 → v3.7.1 upgrade trial — feasibility report

**Trial provenance:** 2026-05-27 brain-spawned background agent in
isolated worktree. Sandboxed evaluation; no changes landed in the
main checkout.

**Verdict:** **upgrade-medium — wait until `objdiff_resolve_relocs.py`
is taught addend-aware stripping**, then upgrade.

## Headline numbers (EUR, full pipeline)

| Metric                  | v2.7.1 baseline | v3.7.1   | Δ        |
|-------------------------|----------------:|---------:|---------:|
| `matched_functions`     |            2134 |     1812 | **-322** |
| `complete_units`        |            2097 |     2097 |     0    |
| `fuzzy_match_percent`   |           6.53% |    2.19% | **-4.34**|
| `complete_code`         |         155908  |  155908  |     0    |
| `ninja sha1` (3-region) |              OK |       OK |    OK    |

**The regression is not real.** All 322 functions are still
byte-identical post-link (3-region SHA1 PASS confirms it). The
shift is in objdiff's strictness, not in the bytes.

## What changed in v3

- **v3.0.0-alpha.1 (#158)** — "Check relocation addends when
  diffing functions." This is the single biggest behaviour change.
  `objdiff_resolve_relocs.py` already strips relocs for `.s` /
  `.legacy*.c` ships, but v3 now also compares addends — and the
  delinked-orig vs our-build addends diverge for 322 `.s` units.
  320 of the 322 regressed units are brief 192 / 197's C-32
  hand-encoded BLs + dsd-emitted assembly TUs.
- **v3.6.0 #316** — "Significantly improve diffing performance
  and fix minor bug with bss section match percents." Improvement
  is real but swamped by the new addend-check strictness; net
  effect is the regression above. The bss-section fix was not
  measurable on this corpus.
- **v3.7.1 #342** — Adds `R_ARM_THM_PC8` and `R_ARM_THM_PC11`
  relocation support. **Not exercised** by current EUR build — no
  PC8/PC11 fixtures hit. Forward-looking value for C-31 (ARM
  Thumb interwork wall) if a pick ever bottlenecks specifically
  on these relocs.

## What still works (zero migration cost)

- Schema is identical at v3.7.1: top-level keys
  `measures/units/version`, all 12 measures keys, `version=2`.
- Downstream tools run unchanged:
  - `tools/progress.py`
  - `tools/generate_heatmap.py`
  - `tools/diff_reasons.py`
  - `tools/update_progress_badge.py`
  - `tools/ci_format_diff_reasons.py`
- One new optional field — `ReportItem.address` — ignored by all
  consumers.
- CLI: `report generate` adds optional `-c key=val` flag;
  existing flags identical.

## What breaks

- `matched_functions` drops ~15% as documented above.
- README progress badge falls 6.61% → 2.19% — cosmetic but loud,
  and `update_progress_badge.py` would auto-commit the regression
  on the next CI run.
- ARM panic on code-less ELFs (brief 187) **still present** in
  v3.7.1 — `tools/objdiff_filter_panic_units.py` is still required
  (objdiff issue #352, which we filed).

## What it would take to upgrade safely

**Single-line drop-in if we accept the regression:** change
`OBJDIFF_VERSION` in `tools/configure.py` (one line). All
schema-consuming tools work unchanged.

**To recover the 322 regressed ships:** teach
`tools/objdiff_resolve_relocs.py` to do addend-aware stripping
for all `.s` and `.legacy*.c` paths under v3's new comparison
rules. Estimated 20-60 LOC plus a research note. Two viable
sub-approaches:

1. Explicitly zero out resolved addends after the strip pass
   (simpler, may have side effects).
2. Match v3's new addend-aware comparison by replicating its
   addend-resolution logic in the resolver (more work, exact
   semantics).

## Sidecar invalidation gotcha

The trial revealed: cached `.resolved` sidecars in
`build/<region>/` are NOT invalidated by an objdiff version
bump. First `ninja report` after the upgrade reports stale
"skipped 2097 (already resolved)" until you `rm
build/<region>/*.resolved`. If we ever do the upgrade, the
resolver script (or `download_tool.py`) should bump a version
hash that invalidates the sidecars automatically.

## Recommendation

**Defer the upgrade.** Costs (visible badge regression + agent
brief explanations every round about why matched_functions
dropped) exceed benefits (forward-looking ARM Thumb-interwork
reloc support for unblocked picks).

**Trigger to revisit:**

1. A pick lands on the C-31 wall that the v3.7.1 reloc-type
   support would specifically unblock, OR
2. Scaffolder ships the resolver patch (~30 LOC) — at that
   point the upgrade becomes cost-free.

The resolver patch is a natural scaffolder brief candidate
(brief 240+ if/when prioritised over the C-42 mechanical drain).
Scope: read v3 release notes for the exact addend-comparison
semantics, patch `objdiff_resolve_relocs.py`, run side-by-side
metric comparison on EUR.

## See also

- [`objdiff-fuzzy-vs-complete-metric.md`](objdiff-fuzzy-vs-complete-metric.md) — the original investigation of why matched_functions under-counts under v2.7.1.
- objdiff issue #352 (we filed) — ARM panic on code-less ELFs, still open.
- objdiff issue #346 (closest open ticket to our reloc divergence) — multiple relocations at a single instruction not supported.
- objdiff PR #316 — bss-section + diffing-performance fix (in v3.6.0).
- objdiff PR #158 — addend-checking when diffing functions (in v3.0.0-alpha.1).
