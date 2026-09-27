<!-- fw-report
round: 003-housekeeping-research-and-tools
role: worker
branch: worker/003-housekeeping-research-and-tools
head: 8add4efd64d29ef4ea33b435b3a0fcb449a4b600
os: macOS 27.0
python: 3.9.6
written: 2026-09-27T18:17:42Z
-->
## Verified

All at commit `8add4efd6` (branch `worker/003-housekeeping-research-and-tools`)
unless stated; the start commit is `454935356` (the round's brief on `main`).
Commands run on macOS (arm64, Rosetta 2, Wine), `python3.13`.

- **Three-region gate passes** — `python3.13 tools/gate3.py --scope all > <scratch>/gate3-8add4efd6.log 2>&1`
  (log outside the checkout, no pipe; process exit 0), then the `AGENTS.md`
  log check verbatim:
  `grep -nE "SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)" gate3-8add4efd6.log`

  ```text
  27841:[eur] SHA1 PASS
  54274:[usa] SHA1 PASS
  80299:[jpn] SHA1 PASS
  80326:1241 passed, 14 skipped, 41 subtests passed in 8.99s
  80329:==================== GATE PASS ====================
  ```

  No `SKIP`, `INFRASTRUCTURE` or `CLEAN-FAIL` line. The first launch stopped at
  preflight because this fresh clone had no `./dsd`; I ran
  `python3.13 tools/download_tool.py dsd v0.11.0 --path ./dsd` (exit 0,
  `ds-decomp-cli 0.11.0`) as the gate's message says and relaunched.
- **Build graph unchanged** — `python3.13 tools/configure.py <region>` for
  `eur`, `usa`, `jpn` at `454935356` and again at `8add4efd6` (all exit 0),
  each `build.ninja` copied with the checkout root replaced by `<ROOT>`, then
  `cmp` → exit 0 for all three:
  `eur build.ninja IDENTICAL`, `usa build.ninja IDENTICAL`, `jpn build.ninja IDENTICAL`.
- **Ledger byte-identical after the move** —
  `cmp <(git show 454935356:docs/research/campaign-analytics/attempts.tsv) <(git show HEAD:docs/ledger/attempts.tsv)` → exit 0;
  the same for `attempts-schema.md` → exit 0. Git records both as `R100`.
- **Ledger validator at the new path** — `python3.13 tools/validate_attempts.py` → exit 0,
  `"rows": 1886, "errors": 0` (66 shape-conflict notes, which do not fail it;
  unchanged from the start commit). CI's `drift-check` now runs it (see Changed).
- **unittest** — `python3.13 -m unittest discover -s tests` → exit 0:
  `Ran 1255 tests in 8.313s` / `OK (skipped=16)`.
- **pytest** — `python3.13 -m pytest -q tests` → exit 0:
  `1239 passed, 16 skipped, 41 subtests passed in 8.13s`.
- **ruff** — `python3.13 -m ruff check .` (ruff 0.15.14; no `ruff` on PATH) → exit 0, `All checks passed!`.
- **markdownlint** — `npx markdownlint-cli2` with the CI globs → `Linting: 31 files` /
  `Summary: 0 issues in 0 files`.
- **CI contract** — `python3.13 tools/check_ci_contract.py` → exit 0,
  `OK: all 5 required check(s) resolve to a job that runs on every pull request.`
  The five required jobs (`Python (ruff)`, `Markdown (markdownlint-cli2)`,
  `drift-check`, `unittest`, `configure-windows`) keep their names and
  unfiltered `pull_request` triggers.
- **Test import parity** — `python3.13 tools/check_test_imports.py` → exit 0,
  `scanned 53 test modules; violations=0` (both lines).
- **Framework check** — `python3 tools/fw.py check` → `0 error(s), 0 warning(s)`.
- **Matching loop intact** — `python3.13 tools/cmatch_loop.py --help` → exit 0;
  `python3.13 -m pytest -q tests/test_cmatch_loop.py` → `58 passed, 9 skipped, 4 subtests passed`.
  `cmatch_loop.py` is unchanged.
- **Archive completeness** — `git diff --name-only --diff-filter=D 454935356 HEAD`
  lists 7,018 deleted paths; `git cat-file -e archive/pre-redesign-2026-09-23:<path>`
  succeeded for every one (0 missing). The two moved ledger files are renames,
  not deletions.
- **Links** — a checker using `tests/test_docs_links.py`'s parser over every
  tracked `*.md` → exit 0, `checked 31 tracked Markdown files; 0 missing link target(s)`.
  Shown red first: with `docs/state.md` restored to the start commit it reported
  `docs/state.md -> decomp-workflow.md` and exit 1.
- **Word counts** — `wc -w docs/compiler-quirks.md AGENTS.md docs/state.md` →
  `1417`, `1495`, `779`. Every quirk cites a path that exists at the tag
  (`git cat-file -e` on all 8 cited files → OK).
- **Out-of-scope paths untouched** —
  `git diff --stat 454935356 HEAD -- src libs include config assets orig '*.sha1' docs/agents tools/fw.py tests/test_framework.py .claude/agents .claude/commands/status.md`
  → empty. No file named in `build.ninja` changed (the four edited tools are
  ledger tools; see Changed).

### Tools table

58 kept, 89 removed, out of 147 entries tracked in `tools/` at the start commit
(`__pycache__/` is untracked and ignored). "Build" means the file is named in
all three generated `build.ninja` files. Kept set = the import closure (AST) of
the build tools, `gate3.py`, `cmatch_loop.py`, every script a kept workflow
runs, the ledger tools and the `AGENTS.md`/`BUILD.md` steps; string references
from kept tools to removed ones were each read and are docstrings or comments,
not invocations. "At tag" means `git cat-file -e` found it at
`archive/pre-redesign-2026-09-23`.

| # | Entry | Status | User and evidence, or reason |
|---:|---|---|---|
| 1 | `__init__.py` | kept | package marker: kept tests import `tools.<name>` (e.g. `tests/test_family_hit_harness.py:5`) |
| 2 | `analyze_symbols.py` | kept | imported by `check_match_invariants.py:56`, `parsers.py:33-36`, `cross_region_aliases.py:32` (gate, loop, ledger, port) |
| 3 | `asm_escape.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 4 | `asm_void_counter.py` | removed | named only in the PR template's non-blocking report section (removed with it); at tag |
| 5 | `audit_callsite_arity.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 6 | `audit_ledger_contradictions.py` | removed | reads the ledger for analysis only; not a writer or validator; at tag |
| 7 | `batch_carve.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 8 | `batch_port.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 9 | `batch_sha1.py` | kept | matching loop: run by `cmatch_loop.py:1021`; imported by `validate_attempts.py` (`_c_to_s_rel`) |
| 10 | `build_master_ledger.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 11 | `build_struct_bank.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 12 | `bulk_data_candidates.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 13 | `bulk_rename_candidates.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 14 | `c42_family_hunter.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 15 | `calcrom.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 16 | `cascade_apply.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 17 | `check_activation_invariant.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 18 | `check_ci_contract.py` | kept | **close call.** Brief-named step; enforces `.github/required-checks.txt` (its header names it); now listed in `BUILD.md` Tools as the step after a workflow change. Not run by CI |
| 19 | `check_delink_dupes.py` | kept | gate: `gate3.py:394-396`; `AGENTS.md` Evidence (delinks row) |
| 20 | `check_match_invariants.py` | kept | CI: `match-invariants.yml` (both jobs); gate `gate3.py:318-319` (opt-in); `AGENTS.md` Evidence |
| 21 | `check_park_class_drift.py` | removed | reads the ledger for analysis only; not a writer or validator; at tag |
| 22 | `check_prototypes_provenance.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 23 | `check_test_imports.py` | kept | CI: `tests.yml` step "Check unittest import + collection parity" |
| 24 | `ci_format_diff.py` | removed | only formatted a pull-request comment for a removed comment-only job; at tag |
| 25 | `ci_format_diff_reasons.py` | removed | only formatted a pull-request comment for a removed comment-only job; at tag |
| 26 | `ci_format_invariants.py` | removed | only formatted a pull-request comment for a removed comment-only job; at tag |
| 27 | `ci_format_mega_cascades.py` | removed | only formatted a pull-request comment for a removed comment-only job; at tag |
| 28 | `ci_format_pattern_clusters.py` | removed | only formatted a pull-request comment for a removed comment-only job; at tag |
| 29 | `ci_format_rename_cascades.py` | removed | only formatted a pull-request comment for a removed comment-only job; at tag |
| 30 | `ci_format_worklist_diff.py` | removed | only formatted a pull-request comment for a removed comment-only job; at tag |
| 31 | `clean_macos_junk.py` | kept | build (`build.ninja`, all three regions, names `tools/clean_macos_junk.py`) |
| 32 | `cluster_b_bundle.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 33 | `cluster_b_bundle_gen.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 34 | `cluster_c_pattern3_gen.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 35 | `cluster_wave_propagate.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 36 | `cmatch_loop.py` | kept | matching loop (root) |
| 37 | `configure.py` | kept | build (writes `build.ninja`); gate `gate3.py:267`; CI `compile-check.yml`, `tests.yml` configure-windows |
| 38 | `containment_check.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 39 | `corpus` | kept | folder: `matched-pairs-{eur,usa,jpn}.jsonl` kept (read by `m2c_feed.py:248-249` `default_corpus_path`); `master-ledger.jsonl` **removed** (only reader was `build_master_ledger.py`; at tag) |
| 40 | `cross_apply_libs_port.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 41 | `cross_region_aliases.json` | kept | read by `cross_region_aliases.py:37` (`BLOCKLIST_PATH`) |
| 42 | `cross_region_aliases.py` | kept | imported by `port_to_region.py:97` |
| 43 | `cross_region_chunk_extent.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 44 | `cross_region_cluster_apply.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 45 | `data_symbol_sizes.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 46 | `data_worklist.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 47 | `declperm.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 48 | `diff_reasons.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 49 | `download_tool.py` | kept | build (`build.ninja`, all three regions, names `tools/download_tool.py`); gate preflight message `gate3.py:202`; CI `compile-check.yml` cache key |
| 50 | `emit_data_blob.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 51 | `eur_frontier_census.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 52 | `export_matched_pairs.py` | kept | imported by `m2c_feed.py:71` (loop) |
| 53 | `external_obj.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 54 | `family_hit_harness.py` | kept | **close call.** Lazily imported by `retrieval_eval.py:125-129`, but only on `retrieval_eval`'s own evaluation CLI path, which `m2c_feed` (needs only `BM25`) never reaches; its default inputs were under `docs/research/` |
| 55 | `fastmatch.py` | kept | imported by `cmatch_loop.py:100` (loop); `BUILD.md` hand-matching step 4 |
| 56 | `field_exposure_census.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 57 | `field_producer_finder.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 58 | `find_callsites.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 59 | `find_cascades.py` | removed | only user was the removed cascades-diff.yml, /cascade; at tag |
| 60 | `find_duplicates.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 61 | `find_external_source.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 62 | `find_mega_cascades.py` | removed | only user was the removed mega-cascades-diff.yml; at tag |
| 63 | `find_ov004_rodata_pointer_targets.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 64 | `find_pattern_clusters.py` | removed | only user was the removed pattern-clusters-diff.yml; at tag |
| 65 | `find_region_siblings.py` | kept | imported by `port_to_region.py:1592` |
| 66 | `find_shape_templates.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 67 | `fingerprint_signal_evidence.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 68 | `fix_delink_suffixes.py` | kept | gate: `gate3.py:401-403` |
| 69 | `fw.py` | kept | framework file (not edited); CI: new drift-check step "Framework check" |
| 70 | `gate3.py` | kept | gate (root) |
| 71 | `gen_prototypes.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 72 | `generate_heatmap.py` | kept | build (`build.ninja`, all three regions, names `tools/generate_heatmap.py`); CI `progress-badge.yml` |
| 73 | `generate_progress_bars.py` | kept | CI: `progress-badge.yml` "Regenerate progress visuals" |
| 74 | `generate_research_index.py` | removed | generator for docs/research/README.md, removed; at tag |
| 75 | `generate_tool_index.py` | removed | generator for docs/tools-index.md, removed; at tag |
| 76 | `generate_walls_index.py` | removed | generator for a docs/research walls index, removed; at tag |
| 77 | `get_platform.py` | kept | imported by `configure.py:29`, `fastmatch.py:115` |
| 78 | `ledger_analytics.py` | removed | reads the ledger for analysis only; not a writer or validator; at tag |
| 79 | `link_baseroms.py` | kept | `AGENTS.md` Working rules (step to give a checkout its baseroms); `docs/machine-setup.md` step 2 |
| 80 | `list_named_tier_callees.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 81 | `m2c_bootstrap.py` | kept | **close call.** Loop setup: `cmatch_loop` calls `m2c_feed.run_m2c`, which needs `tools/_vendor/m2c/m2c.py` that only this tool creates (`m2c_feed.py:77`, error text at `m2c_feed.py:345`); `tests/test_cmatch_loop.py:41` names it as a prerequisite |
| 82 | `m2c_feed.py` | kept | imported by `cmatch_loop.py:101` (loop) |
| 83 | `m2c_gap_coverage.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 84 | `m2ctx.py` | kept | build (`build.ninja`, all three regions, names `tools/m2ctx.py`); run by `m2c_feed.py:78,232` |
| 85 | `main_shape_reclassify.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 86 | `naming_census.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 87 | `next_targets.py` | removed | only user was the removed worklist-diff.yml, mega-cascades-diff.yml, /scratch; at tag |
| 88 | `ninja_syntax.py` | kept | imported by `configure.py:27` |
| 89 | `nitro_dict.py` | removed | only user was the removed `/suggest` command; at tag |
| 90 | `nitro_suggest_renames.py` | removed | only user was the removed `/suggest` command; at tag |
| 91 | `normalise_park_class.py` | kept | ledger: imported by `park_one.py:32` |
| 92 | `objdiff_filter_panic_units.py` | kept | build (`build.ninja`, all three regions, names `tools/objdiff_filter_panic_units.py`) |
| 93 | `objdiff_resolve_relocs.py` | kept | build (`build.ninja`, all three regions, names `tools/objdiff_resolve_relocs.py`); imported by `fastmatch.py:107` |
| 94 | `overlay_coupling.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 95 | `park_class_map.tsv` | kept | read by `normalise_park_class.py:18` (`MAP_PATH`) |
| 96 | `park_one.py` | kept | ledger writer (parks an attempt) |
| 97 | `parsers.py` | kept | imported by `validate_attempts.py:31`, `wall_aware_headroom.py:75`, `export_matched_pairs.py:12`, `generate_heatmap.py:35`, `check_match_invariants.py:57` |
| 98 | `patch_arm_mapping_symbols.py` | kept | build (`build.ninja`, all three regions, names `tools/patch_arm_mapping_symbols.py`) |
| 99 | `patch_lcf_arm9_align.py` | kept | build (`build.ninja`, all three regions, names `tools/patch_lcf_arm9_align.py`) |
| 100 | `patch_module_literals.py` | kept | build (`build.ninja`, all three regions, names `tools/patch_module_literals.py`) |
| 101 | `patch_objects_legacy.py` | kept | build (`build.ninja`, all three regions, names `tools/patch_objects_legacy.py`) |
| 102 | `patch_ov004_veneers.py` | kept | build (`build.ninja`, all three regions, names `tools/patch_ov004_veneers.py`) |
| 103 | `patch_rom_header_crc.py` | kept | build (`build.ninja`, all three regions, names `tools/patch_rom_header_crc.py`) |
| 104 | `patch_section_align.py` | kept | build (`build.ninja`, all three regions, names `tools/patch_section_align.py`) |
| 105 | `pattern_library.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 106 | `permute.py` | removed | permuter helper; named only in `docs/decomp-workflow.md` (removed) and `permuter_settings.toml` comments; at tag |
| 107 | `permute_batch.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 108 | `pool_freshness.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 109 | `port_census.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 110 | `port_external_source.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 111 | `port_harvest.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 112 | `port_refusal_taxonomy.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 113 | `port_to_region.py` | kept | **close call.** `AGENTS.md` Working rules and `BUILD.md` Conventions name it as how USA/JPN ports are made; `state.md` says the ports are finished and round D replaces the per-region trees |
| 114 | `predict_walls.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 115 | `progress.py` | kept | build (`build.ninja`, all three regions, names `tools/progress.py`); imported by `cmatch_loop.py:102`; `AGENTS.md` (the one progress number) |
| 116 | `propagate_template.py` | removed | only user was the removed pattern-clusters-diff.yml; at tag |
| 117 | `record_shipped.py` | kept | ledger writer (records a shipped attempt) |
| 118 | `rename_symbol.py` | kept | `AGENTS.md` Evidence (symbol renames, `--cascade`) |
| 119 | `requirements.txt` | kept | CI: every kept workflow `pip install -r tools/requirements.txt`; `BUILD.md` Quick start |
| 120 | `retrieval_eval.py` | kept | imported by `m2c_feed.py:72` (`BM25`) |
| 121 | `roi_per_lane.py` | removed | reads the ledger for analysis only; not a writer or validator; at tag |
| 122 | `routing_suffixes.py` | kept | imported by `batch_sha1.py:59`, `m2c_feed.py:73`, `objdiff_filter_panic_units.py:89`, `port_to_region.py:99` |
| 123 | `scaffold_batch.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 124 | `scope_gate.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 125 | `scratch_bundle.py` | removed | only user was the removed `/scratch` command; at tag |
| 126 | `semantic_contradiction_check.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 127 | `sha1.py` | kept | build (`build.ninja`, all three regions, names `tools/sha1.py`) |
| 128 | `sig_census.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 129 | `signatures` | removed | folder read only by `nitro_dict`/`nitro_suggest_renames`/`scratch_bundle` (removed); at tag |
| 130 | `size_census.py` | kept | imported by `wall_aware_headroom.py:74` |
| 131 | `sort_delinks.py` | kept | imported by `batch_sha1.py:368` |
| 132 | `strip_overlay_func_collisions.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 133 | `stylea_c94_stub.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 134 | `suggest_coercion.py` | kept | imported by `cmatch_loop.py:103` (loop) |
| 135 | `tier_classifier.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 136 | `touch_stamp.py` | kept | build (`build.ninja`, all three regions, names `tools/touch_stamp.py`) |
| 137 | `transform_dep.py` | kept | build (`build.ninja`, all three regions, names `tools/transform_dep.py`) |
| 138 | `update_progress_badge.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 139 | `validate_attempts.py` | kept | ledger validator; CI drift-check "Validate attempts ledger"; imported by `park_one.py:33` |
| 140 | `vendor_external_sources.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 141 | `verify.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 142 | `verify_composed_group.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 143 | `wall_aware_headroom.py` | kept | imported by `validate_attempts.py:32`, `park_one.py:34` (ledger) |
| 144 | `wall_catalog_check.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 145 | `wall_prefilter.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |
| 146 | `wine_link_lock.py` | kept | build (`build.ninja`, all three regions, names `tools/wine_link_lock.py`) |
| 147 | `xmap_normalize.py` | removed | no user among build, gate, loop, CI, ledger or AGENTS.md/BUILD.md steps; at tag |

### Test accounting

`python3.13 -m pytest --collect-only -q tests`: **3,408** ids at `454935356`,
**1,255** at `8add4efd6`. **2,153 removed, 0 added.** 86 whole files removed,
plus one method in a kept file. No test of a kept tool was removed or edited
except the path changes listed under Changed.

| Removed from | Ids | Subject (removed) |
|---|---:|---|
| `test_asm_escape.py` | 81 | `asm_escape.py` |
| `test_asm_void_counter.py` | 4 | `asm_void_counter.py` |
| `test_audit_callsite_arity.py` | 25 | `audit_callsite_arity.py` |
| `test_audit_ledger_contradictions.py` | 11 | `audit_ledger_contradictions.py` |
| `test_batch_carve.py` | 72 | `batch_carve.py` |
| `test_batch_port.py` | 42 | `batch_port.py` |
| `test_build_master_ledger.py` | 1 | `build_master_ledger.py` |
| `test_build_struct_bank.py` | 26 | `build_struct_bank.py` |
| `test_bulk_data_candidates.py` | 28 | `bulk_data_candidates.py` |
| `test_bulk_rename_candidates.py` | 33 | `bulk_rename_candidates.py` |
| `test_c42_family_hunter.py` | 28 | `c42_family_hunter.py` |
| `test_cascade_apply.py` | 17 | `cascade_apply.py` |
| `test_check_activation_invariant.py` | 7 | `check_activation_invariant.py` |
| `test_check_park_class_drift.py` | 4 | `check_park_class_drift.py` |
| `test_check_prototypes_provenance.py` | 3 | `check_prototypes_provenance.py` |
| `test_ci_format_diff.py` | 20 | `ci_format_diff.py` |
| `test_ci_format_diff_reasons.py` | 29 | `ci_format_diff_reasons.py` |
| `test_ci_format_invariants.py` | 15 | `ci_format_invariants.py` |
| `test_ci_format_mega_cascades.py` | 13 | `ci_format_mega_cascades.py` |
| `test_ci_format_pattern_clusters.py` | 12 | `ci_format_pattern_clusters.py` |
| `test_ci_format_rename_cascades.py` | 15 | `ci_format_rename_cascades.py` |
| `test_ci_format_worklist_diff.py` | 29 | `ci_format_worklist_diff.py` |
| `test_claude_slash_commands.py` | 11 | the `/cascade`, `/scratch`, `/suggest` command files (tools `find_cascades`, `scratch_bundle`, `nitro_suggest_renames`) |
| `test_cluster_b_bundle.py` | 16 | `cluster_b_bundle.py` |
| `test_cluster_b_bundle_gen.py` | 28 | `cluster_b_bundle_gen.py` |
| `test_cluster_c_pattern3_gen.py` | 53 | `cluster_c_pattern3_gen.py` |
| `test_cluster_wave_propagate.py` | 16 | `cluster_wave_propagate.py` |
| `test_containment_check.py` | 29 | `containment_check.py` |
| `test_cross_apply_libs_port.py` | 34 | `cross_apply_libs_port.py` |
| `test_cross_region_chunk_extent.py` | 15 | `cross_region_chunk_extent.py` |
| `test_cross_region_cluster_apply.py` | 47 | `cross_region_cluster_apply.py` |
| `test_data_symbol_sizes.py` | 24 | `data_symbol_sizes.py` |
| `test_data_worklist.py` | 113 | `data_worklist.py` |
| `test_declperm.py` | 11 | `declperm.py` |
| `test_diff_reasons.py` | 28 | `diff_reasons.py` |
| `test_emit_data_blob.py` | 25 | `emit_data_blob.py` |
| `test_eur_frontier_census.py` | 9 | `eur_frontier_census.py` |
| `test_external_obj.py` | 30 | `external_obj.py` |
| `test_field_exposure_census.py` | 4 | `field_exposure_census.py` |
| `test_field_producer_finder.py` | 6 | `field_producer_finder.py` |
| `test_find_callsites.py` | 24 | `find_callsites.py` |
| `test_find_cascades.py` | 21 | `find_cascades.py` |
| `test_find_duplicates.py` | 16 | `find_duplicates.py` |
| `test_find_external_source.py` | 41 | `find_external_source.py` |
| `test_find_mega_cascades.py` | 22 | `find_mega_cascades.py` |
| `test_find_ov004_rodata_pointer_targets.py` | 19 | `find_ov004_rodata_pointer_targets.py` |
| `test_find_pattern_clusters.py` | 38 | `find_pattern_clusters.py` |
| `test_find_shape_templates.py` | 40 | `find_shape_templates.py` |
| `test_fingerprint_signal_evidence.py` | 26 | `fingerprint_signal_evidence.py` |
| `test_gen_prototypes.py` | 25 | `gen_prototypes.py` |
| `test_generate_research_index.py` | 26 | `generate_research_index.py` (also imported `nitro_dict`/`nitro_suggest_renames`) |
| `test_generate_tool_index.py` | 17 | `generate_tool_index.py` |
| `test_generate_walls_index.py` | 4 | `generate_walls_index.py` |
| `test_ledger_analytics.py` | 5 | `ledger_analytics.py` |
| `test_libs_nitro_d5.py` | 10 | `port_external_source.py` vendored-identifier scanner |
| `test_libs_nitro_d6a.py` | 6 | `port_external_source.py` vendored-identifier scanner |
| `test_list_named_tier_callees.py` | 23 | `list_named_tier_callees.py` |
| `test_m2c_gap_coverage.py` | 22 | `m2c_gap_coverage.py` |
| `test_main_shape_reclassify.py` | 6 | `main_shape_reclassify.py` |
| `test_naming_census.py` | 2 | `naming_census.py` |
| `test_next_targets.py` | 32 | `next_targets.py` |
| `test_nitro_dict.py` | 37 | `nitro_dict.py` |
| `test_nitro_suggest_renames.py` | 59 | `nitro_suggest_renames.py` |
| `test_overlay_coupling.py` | 14 | `overlay_coupling.py` |
| `test_pattern_library.py` | 27 | `pattern_library.py` |
| `test_permute.py` | 76 | `permute.py` |
| `test_permute_batch.py` | 36 | `permute_batch.py` |
| `test_pool_freshness.py` | 7 | `pool_freshness.py` |
| `test_port_census.py` | 7 | `port_census.py` |
| `test_port_external_source.py` | 72 | `port_external_source.py` |
| `test_port_harvest.py` | 3 | `port_harvest.py` |
| `test_port_refusal_taxonomy.py` | 17 | `port_refusal_taxonomy.py` |
| `test_predict_walls.py` | 125 | `predict_walls.py` |
| `test_propagate_template.py` | 35 | `propagate_template.py` |
| `test_roi_per_lane.py` | 4 | `roi_per_lane.py` |
| `test_routing_suffixes.py` (file kept) | 1: `TestConformance::test_sig_census` | `sig_census.py` (only that method; the rest of the file tests kept `routing_suffixes`) |
| `test_scaffold_batch.py` | 22 | `scaffold_batch.py` |
| `test_scope_gate.py` | 17 | `scope_gate.py` |
| `test_scratch_bundle.py` | 28 | `scratch_bundle.py` |
| `test_semantic_contradiction_check.py` | 4 | `semantic_contradiction_check.py` |
| `test_sig_census.py` | 34 | `sig_census.py` |
| `test_stylea_c94_stub.py` | 9 | `stylea_c94_stub.py` |
| `test_tier_classifier.py` | 18 | `tier_classifier.py` |
| `test_update_progress_badge.py` | 28 | `update_progress_badge.py` |
| `test_verify.py` | 10 | `verify.py` |
| `test_verify_composed_group.py` | 21 | `verify_composed_group.py` |
| `test_wall_catalog_check.py` | 3 | `wall_catalog_check.py` |

### Compiler-quirks candidates left out

- T-3 third routing tier: shipped; the two tier entries cover it.
- T-4 overlay function symbol promotion: folded into the `Undefined: "func_<addr>"` entry.
- C-12 and C-16 (`asm void` + `nofralloc` thunks): narrow thunk shapes.
- C-2/C-2a, C-9 to C-11, C-13, C-14, C-18 to C-21, C-25, C-28, C-30, C-33 to C-46,
  C-48 to C-51, C-54, C-58 to C-70, C-72, C-74 to C-87: single-shape source recipes;
  `codegen-walls.md` at the tag stays the lookup. Not each read in full.
- P-walls other than P-4, P-11, P-15 and P-41: documented dead ends, covered by
  the "stop after a few tries" rule in the register entry.
- P-6, P-7, P-8, P-10: retired or superseded by C-entries.
- `-O0` giving the two-step epilogue: not matchable (spills arguments); noted inline.
- Global `-nointerworking`: rejected (breaks ov002); noted inline as a "never".
- `matched_functions` under-count before brief 206: resolved; folded into the objdiff entry.
- `dsd check symbols` noise (`ov004-check-symbols-diagnosis.md`): dsd behaviour, not a compiler quirk.
- `.DS_Store` stripping and ROM header CRCs: build steps handle them; no matching impact.
- ov004 odd-aligned data residue and other data carving: parked data work, not code matching.
- Machine-wide link serialisation and the GPTK Wine migration: host setup, in `BUILD.md`/`docs/machine-setup.md`.
- Imported SM64DS levers (`reshape-recipes/imported-sm64ds*.md`): several refuted, the rest unverified on this game.

## Not verified

- **CI itself was not run.** The edited workflows (`generated-files-drift.yml`
  with its new `python tools/fw.py check` step, `match-invariants.yml`) were
  checked only by `check_ci_contract.py`, reading, and running their commands
  locally. Whether `fw.py check` behaves the same on the GitHub runner
  (Python 3.11, full-history checkout) is unknown until the pull request runs.
- markdownlint ran as `markdownlint-cli2` v0.23.3 via `npx`, not the pinned
  CI action v18.
- `configure-windows` and `compile-check` (Windows) were not run; nothing they
  use changed.
- `docs/setup/windows-build-speed.md` was not re-checked for accuracy against
  a Windows machine; it has no links or tool references this round broke.
- The compiler-quirks entries summarise the cited documents; I did not
  re-derive any quirk by compiling, and did not read `codegen-walls.md` end to end.

## Changed

- `docs/ledger/attempts.tsv`, `docs/ledger/attempts-schema.md`: moved from
  `docs/research/campaign-analytics/` (byte-identical).
- `tools/park_one.py`, `tools/validate_attempts.py`, `tools/wall_aware_headroom.py`,
  `tools/normalise_park_class.py`: ledger path constant only.
- `tests/test_park_one.py`, `tests/test_record_shipped.py`,
  `tests/test_validate_attempts.py`, `tests/test_wall_aware_headroom.py`: ledger path only.
- `tests/test_routing_suffixes.py`: removed `TestConformance::test_sig_census` (subject `sig_census.py`, removed).
- `.gitattributes`: the `merge=union` line now names `docs/ledger/attempts.tsv`.
- `.github/workflows/generated-files-drift.yml`: `drift-check` keeps its name
  and unfiltered trigger; the tools-index and research-index steps are replaced
  by "Framework check" (`python tools/fw.py check`); the ledger step stays.
- `.github/workflows/match-invariants.yml`: removed the Markdown-format and
  PR-comment steps and `pull-requests: write`; on error the job now prints the
  findings in its log. It still fails on error-severity issues.
- Removed workflows (comment- or label-only): `analyzer.yml` (its PR job only
  commented; its main-push job ran `analyze_symbols.py --no-outputs`, which
  `match-invariants.yml`'s main-push job already exercises by importing it —
  a judgement call), `cascades-diff.yml`, `mega-cascades-diff.yml`,
  `pattern-clusters-diff.yml`, `worklist-diff.yml`, `labeler.yml`; also
  `.github/labeler.yml` and `.github/scripts/upsert-pr-comment.sh` (no user left).
- `.github/pull_request_template.md`: removed the `asm_void_counter.py` section
  and a link into `docs/research/`.
- `.claude/commands/cascade.md`, `scratch.md`, `suggest.md`: removed with their tools.
- `tools/`: 88 scripts and `tools/signatures/` removed, and
  `tools/corpus/master-ledger.jsonl`; see the tools table. 86 test files removed.
- `docs/research/` (whole), `docs/decomp-workflow.md`, `docs/tools-index.md`,
  and `.ignore` (its one line ignored `docs/research/c-match-prep/`): removed.
- `docs/compiler-quirks.md`: new, 1,417 words, 17 entries.
- `BUILD.md`: toolchain row links the quirks page instead of two research
  files; new "Matching one function by hand" steps and a "Tools" table; the
  Wine-migration link became a tag path.
- `AGENTS.md`: "Where to look" points at `BUILD.md`, `docs/compiler-quirks.md`
  and `docs/ledger/attempts.tsv`, and says the research corpus is at the tag.
- `docs/machine-setup.md`: the Wine-migration link became a tag path.
- `docs/state.md`, every sentence changed:
  - Removed: "**Tool defects reported 2026-09-08, not re-checked:** `pool_freshness.py --module` returning an empty pool for a spelling it does not know, and `m2ctx.py` needing a `gcc` the Windows PC lacks. Re-verify in rounds C and E."
  - Added: "**Tool defect reported 2026-09-08, not re-checked:** `m2ctx.py` needing a `gcc` the Windows PC lacks. Re-verify in rounds C and E."
  - Removed: "Build and toolchain: [`BUILD.md`](../BUILD.md); the matching guide: [`docs/decomp-workflow.md`](decomp-workflow.md)."
  - Added: "Build, toolchain and how to match a function: [`BUILD.md`](../BUILD.md); compiler quirks: [`docs/compiler-quirks.md`](compiler-quirks.md)."
  - Removed: "The attempts ledger is `docs/research/campaign-analytics/attempts.tsv`, checked by `tools/validate_attempts.py`; round B decides its final home."
  - Added: "The attempts ledger is [`docs/ledger/attempts.tsv`](ledger/attempts.tsv), checked by `tools/validate_attempts.py`."

## Open questions

- **Close calls kept for Brain to decide** (marked in the table):
  `check_ci_contract.py` (brief-named, not previously an `AGENTS.md`/`BUILD.md`
  step; I added it to the `BUILD.md` Tools table), `port_to_region.py` (ports are
  finished and round D replaces the trees), `m2c_bootstrap.py` (setup for the
  loop's m2c draft), `family_hit_harness.py` (reachable only through
  `retrieval_eval`'s own CLI; its default inputs were under `docs/research/`,
  so that CLI no longer runs with defaults, and `retrieval_eval.py`'s `--sig`
  default also points into `docs/research/`).
- **Runtime strings that still point into `docs/research/`**:
  `suggest_coercion.py` prints anchors into `docs/research/codegen-walls.md`
  in the hints `cmatch_loop` attaches. I left them because round E owns the
  loop's behaviour; they now name a file that exists only at the tag.
- **Not in scope, left as found:** `permuter_settings.toml` comments name the
  removed `tools/permute.py`; a `.gitignore` comment names the removed
  `vendor_external_sources.py`; generated-file headers in `src/` and `include/`
  name removed generators (those paths are out of scope); the PR template still
  asks to commit `assets/progress-heatmap.svg`, which CI now publishes on
  `progress-visuals`.
- `tools/requirements.txt` was not pruned; some packages may now serve only
  removed tools.
- The gate's pytest counts (1241 passed, 14 skipped) differ from my earlier
  bare `pytest -q tests` run (1239 passed, 16 skipped), both 1,255 ids; two
  tests skipped before the build and ran after it. I did not identify which.
