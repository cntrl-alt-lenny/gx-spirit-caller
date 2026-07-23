# objdiff-cli v2.7.1 → v3.7.3 feasibility

**Queue item:** `q-objdiff-v3`  
**Date:** 2026-07-22  
**Scope:** feasibility only; this item does not change the pinned version.

## Decision

**NO-GO for an immediate pin bump. GO for a staged migration trial.** The
existing v2.7.1 pin must remain until the project runs two small A/B probes
against the same built unit: the report-generation probe and the direct
`diff --format json` probe. The release binary itself is healthy, and the
v3.7.3 release contains upstream PR #359, which fixes the ARM
no-mapping-symbols index error that motivated the old panic workaround. That
does not prove this project's raw objects are safe, nor does it prove the
v3.7.x one-shot diff schema remains consumable by our coercion and edit-hook
code.

The previous v3.7.1 trial is an important compatibility warning: on a full
EUR corpus, `complete_units`, `complete_code`, and the three-region SHA-1
gate stayed stable, but v3's stricter relocation-addend comparison reduced
`matched_functions` by 322 and reduced `fuzzy_match_percent` materially. A
v3.7.3 bump may therefore be byte-safe while still changing headline
objdiff metrics. Treat that metric drift as a migration result to quantify,
not as evidence that shipped bytes regressed.

## What was checked here

This is a build-free `kb-map` worktree: it has no baserom, no generated
`build/<region>` tree, and no project `objdiff.json` or `objdiff.json.raw` to
feed to the CLI. `ninja` is installed (1.13.2), but that is not enough to run
the report pipeline. No pin, source, config, or tool file was changed.

The Windows x86_64 release asset was downloaded outside the repository and
launched successfully:

```text
objdiff-cli-windows-x86_64.exe 3.7.3
SHA-256 933BC75FDC526EF7149534B74282EFC3E02DC0F1010512ACCB5463E68F68E07F
```

The release page lists the expected Windows, macOS, and Linux CLI assets and
records PR #359 as “ARM: Fix index out of bounds error when there are no
mapping symbols”:

- [objdiff v3.7.3 release](https://github.com/encounter/objdiff/releases/tag/v3.7.3)
- [upstream PR #359](https://github.com/encounter/objdiff/pull/359)

## Compatibility inventory

The queue description's ten-consumer count mixes report consumers, pipeline
writers, and direct-diff consumers. The practical migration inventory is:

| Surface | In-repo users | v3.7.3 risk | Required action |
|---|---|---|---|
| `report.json` measures and per-function records | `tools/progress.py`, `tools/generate_heatmap.py`, `tools/diff_reasons.py`, `tools/ci_format_diff_reasons.py`, `tools/calcrom.py`, `tools/update_progress_badge.py` | Low for the fields currently read (`complete_units`, `matched_functions`, `fuzzy_match_percent`, code/data measures); high for metric interpretation because relocation/addend behavior changed in v3 | Generate old/new reports from the same filtered `objdiff.json`; compare measures and bucket deltas before accepting a new baseline |
| Report pipeline and pre-processors | `tools/configure.py`, `tools/objdiff_filter_panic_units.py`, `tools/objdiff_resolve_relocs.py`, `tools/patch_arm_mapping_symbols.py` | Medium: v3 accepts the existing project JSON shape at the documented minimum version, but the resolver's addend assumptions are exactly where v3.7.1 changed behavior | Keep the three rewrite steps for the trial; invalidate cached `.resolved` sidecars; inspect raw and filtered runs separately |
| Direct diff JSON | `.claude/hooks/post_edit.py`, `tools/suggest_coercion.py` | High: v3.0 removed this mode and v3.7.0 restored it with a breaking structured-output change | Run a golden one-unit probe with both binaries; assert the hook's `left.sections[0].match_percent` path and run `suggest_coercion.py --json` on v3 output |
| Scope/health reporting | `tools/scope_gate.py`, `tools/gate3.py`, and CI/report wiring | Medium-low: these gate the surrounding artifacts and counts rather than depending on a new v3-only field | Re-run the normal report and gate commands after the A/B comparison; do not use a green SHA-1 alone as proof of report compatibility |

The report JSON contract is favorable at the structural level: v3.7.3 keeps
the existing report version and the fields consumed by the report tools, with
an additive address field. The risk is semantic (the differ's scoring and
relocation treatment), not an observed missing key. The direct `diff` JSON
contract is a separate, unresolved risk and must not be inferred from report
JSON compatibility.

## Panic filter: case (a) versus case (b)

`tools/objdiff_filter_panic_units.py` has two independent jobs:

1. **Case (a), code-less ARM objects:** drop units that would trigger the
   upstream ARM index-underflow panic. PR #359 directly targets this class.
   After the v3.7.3 raw-object report probe succeeds on a representative
   code-less unit and a complete region report has no panic, this branch may
   be retired. Until then, leave it enabled; the current worktree cannot
   prove the fix against this corpus.
2. **Case (b), absent routing-tier objects:** drop planned `.legacy` and
   `.legacy_sp3` units whose target object does not exist yet. This is our
   source/routing state, not the upstream ARM bug, so **case (b) stays** after
   the v3 migration.

The filter should therefore be split conceptually, even if the first bump
keeps the existing script intact: validate v3 against raw input for case (a),
then preserve the routing-tier filter for case (b).

## Migration order

1. Preserve a v2.7.1 EUR report and the current progress metrics as the
   baseline. Do not update badges or documentation baselines yet.
2. On a build-capable worktree, download v3.7.3 beside—not over—the pinned
   `objdiff-cli`. Run `report generate` against the existing filtered
   `objdiff.json`, then run it against `objdiff.json.raw` (or a one-unit raw
   fixture). Record panic/no-panic, `complete_units`, `complete_code`,
   `matched_functions`, `matched_code`, and `fuzzy_match_percent`.
3. Delete or move stale `*.resolved` sidecars before the v3 report run. The
   resolver's output is version-sensitive; “already resolved” must not hide
   an A/B difference.
4. Run the same one shipped unit through v2.7.1 and v3.7.3 direct diff JSON.
   Assert the post-edit hook's exact match-percent path and parse the output
   through `tools/suggest_coercion.py --json`. If either fails, update those
   consumers before any pin bump.
5. If the probes pass, change the pin in a separate migration PR, regenerate
   all three regional reports, review metric deltas, and run the normal
   explicit region gates. Keep the old report available for comparison.
6. Only after a raw report is clean may a follow-up remove panic-filter case
   (a). Retain case (b), its tests, and the routing suffix behavior.

## Gate result for this item

The requested local gate was run after the report was added:

```text
python -m pytest -q tests
11 failed, 2843 passed, 25 skipped, 55 subtests passed in 16.34s
```

The failures are pre-existing Windows/build-environment assumptions in
`test_cluster_c_pattern3_gen.py`, `test_cmatch_loop.py`,
`test_cross_region_cluster_apply.py`, `test_m2c_feed.py`,
`test_objdiff_resolve_relocs.py`, and `test_patch_ov004_veneers.py`; the new
research note also makes the existing generated-index test report a stale
`docs/research/README.md`. No production file was changed to mask them. The
v3 report/diff probes are explicitly deferred to a build-capable checkout.

## Sources in this checkout

## EUR-capable rerun (2026-07-22)

This item was re-run from the EUR-capable `kb-types` checkout. The build
pipeline can configure and reproduce the EUR ROM: `python tools/configure.py
eur` followed by the explicitly scoped `ninja sha1` completed with
`gx-spirit-caller_eur.nds: OK`. That removes the prior missing-baserom
blocker, but it does not change the feasibility verdict: the requested
`python -m pytest -q tests` gate remains red on the existing Windows/path/tool
environment assumptions (11 failed, 2,848 passed, 20 skipped, 55 subtests).
No pin or production source was changed. The v3 report-generation and direct
diff A/B probes remain a separate migration trial, so the pin stays at
v2.7.1 and panic-filter case (a) stays enabled.

- [`tools/configure.py`](../../tools/configure.py) — current `OBJDIFF_VERSION`
  pin and report pipeline.
- [`tools/objdiff_filter_panic_units.py`](../../tools/objdiff_filter_panic_units.py)
  — case (a)/(b) workaround and routing-tier filtering.
- [`tools/objdiff_resolve_relocs.py`](../../tools/objdiff_resolve_relocs.py)
  — relocation sidecar rewrite used before report generation.
- [`docs/research/objdiff-v371-upgrade-trial.md`](objdiff-v371-upgrade-trial.md)
  — empirical v3.7.1 metric/regression trial.
- [`docs/research/rnd-swarm-r6-partial.md`](rnd-swarm-r6-partial.md) — prior
  source-level v3.7.3 schema and consumer inventory; its unverified build
  steps remain open and are not silently counted as completed here.
