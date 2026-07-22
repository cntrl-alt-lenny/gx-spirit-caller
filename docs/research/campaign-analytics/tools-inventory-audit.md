# Tools inventory audit

**Queue item:** `q-dead-tools`  
**Date:** 2026-07-22  
**Scope:** read-only inventory; no tool deleted or renamed.

## Result

This audit covers every tracked `tools/*.py` file in this checkout: **110 files** (`__init__.py` plus executable scripts). A file is mechanically `KEEP` when it has at least one reference from a workflow, test, non-generated documentation, another tool, or `build.ninja`. `UNREFERENCED` means none of those channels mention it. `SUPERSEDED-BY-X` is emitted only when an explicit tool-to-tool supersession statement exists; this pass found none.

The generated `docs/tools-index.md` is excluded from the documentation signal because it enumerates every tool by design. The audit still records the underlying docs/tests/workflow/tool references. The checkout has a generated `build.ninja`, so its cells are literal references found there; no missing build edge is inferred from `configure.py` source alone.

**Summary:** 109 referenced executable/package files, 0 unreferenced executable tools, 0 explicitly superseded. The extra row is the deliberate package boundary `tools/__init__.py`. Channel presence: `build:16,workflow:22,tests:101,docs:102,tools:83`.

## Audit table

| # | Tool | build.ninja | workflows | tests | docs* | other tools | Verdict |
|---:|---|---|---|---|---|---|---|
| 1 | `tools/__init__.py` | - | - | - | - | - | KEEP (package boundary) |
| 2 | `tools/analyze_symbols.py` | - | `.github/workflows/analyzer.yml`, `.github/workflows/match-invariants.yml`, +3 | `tests/test_analyze_symbols.py`, `tests/test_bulk_data_candidates.py`, +25 | `docs/decomp-workflow.md`, `docs/briefs/002-analyzer-bulk-groups.md`, +7 | `tools/bulk_data_candidates.py`, `tools/bulk_rename_candidates.py`, +29 | KEEP |
| 3 | `tools/asm_escape.py` | - | - | `tests/test_asm_escape.py`, `tests/test_batch_carve.py`, +1 | `AGENTS.md`, `docs/STATE-LOG.md`, +58 | `tools/batch_carve.py`, `tools/emit_data_blob.py`, +1 | KEEP |
| 4 | `tools/batch_carve.py` | - | - | `tests/test_batch_carve.py`, `tests/test_containment_check.py`, +1 | `docs/STATE-LOG.md`, `docs/briefs/CLOSED-LOG.md`, +60 | `tools/cmatch_loop.py`, `tools/configure.py`, +2 | KEEP |
| 5 | `tools/batch_sha1.py` | - | - | - | `docs/research/brief-619-cmatch-loop.md`, `docs/research/README.md`, +4 | `tools/cmatch_loop.py` | KEEP |
| 6 | `tools/build_master_ledger.py` | - | - | `tests/test_build_master_ledger.py` | `docs/briefs/CLOSED-LOG.md`, `docs/research/campaign-analytics/singleton-cmatch-queue.md` | - | KEEP |
| 7 | `tools/build_struct_bank.py` | - | - | `tests/test_build_struct_bank.py` | `docs/research/brief-609-struct-bank.md`, `docs/research/brief-613-struct-bank.md` | - | KEEP |
| 8 | `tools/bulk_data_candidates.py` | - | - | `tests/test_bulk_data_candidates.py` | `docs/research/improvement-swarm-2026-07-15-r5.md` | - | KEEP |
| 9 | `tools/bulk_rename_candidates.py` | - | - | `tests/test_bulk_rename_candidates.py` | `docs/decomp-workflow.md`, `docs/research/cascade-3-dryrun.md`, +4 | `tools/bulk_data_candidates.py`, `tools/cascade_apply.py` | KEEP |
| 10 | `tools/c42_family_hunter.py` | - | - | `tests/test_c42_family_hunter.py` | `docs/briefs/CLOSED-LOG.md`, `docs/research/brief-249-c42-drain-wave6-sibling-hunt.md`, +5 | - | KEEP |
| 11 | `tools/calcrom.py` | - | - | - | `docs/STATE-LOG.md`, `docs/briefs/CLOSED-LOG.md`, +4 | `tools/progress.py` | KEEP |
| 12 | `tools/cascade_apply.py` | - | - | `tests/test_cascade_apply.py` | `docs/decomp-workflow.md`, `docs/research/cascade-3-dryrun.md` | `tools/find_mega_cascades.py` | KEEP |
| 13 | `tools/check_delink_dupes.py` | - | - | `tests/test_check_delink_dupes.py` | `docs/STATE-LOG.md`, `docs/research/brief-561-foundation.md`, +5 | `tools/batch_carve.py`, `tools/gate3.py` | KEEP |
| 14 | `tools/check_match_invariants.py` | - | `.github/workflows/match-invariants.yml` | `tests/test_check_match_invariants.py`, `tests/test_ci_format_invariants.py` | `AGENTS.md`, `docs/decomp-workflow.md`, +87 | `tools/cascade_apply.py`, `tools/ci_format_invariants.py`, +2 | KEEP |
| 15 | `tools/ci_format_diff.py` | - | `.github/workflows/analyzer.yml` | `tests/test_ci_format_diff.py` | `docs/decomp-workflow.md` | `tools/ci_format_diff_reasons.py`, `tools/ci_format_worklist_diff.py` | KEEP |
| 16 | `tools/ci_format_diff_reasons.py` | - | - | `tests/test_ci_format_diff_reasons.py` | `docs/decomp-workflow.md`, `docs/research/objdiff-v371-upgrade-trial.md`, +2 | - | KEEP |
| 17 | `tools/ci_format_invariants.py` | - | `.github/workflows/match-invariants.yml` | `tests/test_ci_format_invariants.py` | `docs/decomp-workflow.md`, `docs/research/improvement-swarm-2026-07-15-r5.md` | `tools/ci_format_diff_reasons.py` | KEEP |
| 18 | `tools/ci_format_mega_cascades.py` | - | `.github/workflows/mega-cascades-diff.yml` | `tests/test_ci_format_mega_cascades.py` | - | `tools/ci_format_pattern_clusters.py` | KEEP |
| 19 | `tools/ci_format_pattern_clusters.py` | - | `.github/workflows/pattern-clusters-diff.yml` | `tests/test_ci_format_pattern_clusters.py` | - | - | KEEP |
| 20 | `tools/ci_format_rename_cascades.py` | - | `.github/workflows/cascades-diff.yml` | `tests/test_ci_format_rename_cascades.py` | - | `tools/ci_format_mega_cascades.py`, `tools/ci_format_pattern_clusters.py` | KEEP |
| 21 | `tools/ci_format_worklist_diff.py` | - | `.github/workflows/worklist-diff.yml` | `tests/test_ci_format_worklist_diff.py` | `docs/decomp-workflow.md` | `tools/ci_format_diff_reasons.py`, `tools/ci_format_rename_cascades.py` | KEEP |
| 22 | `tools/clean_macos_junk.py` | `build.ninja` | - | `tests/test_clean_macos_junk.py` | `CLAUDE.md`, `docs/briefs/138-clean-macos-junk-filter.md`, +3 | `tools/configure.py` | KEEP |
| 23 | `tools/cluster_b_bundle.py` | - | - | `tests/test_cluster_b_bundle.py`, `tests/test_cluster_b_bundle_gen.py` | `docs/decomp-workflow.md`, `docs/briefs/161-pattern3-subsumed-ref-resolution.md`, +4 | `tools/cluster_b_bundle_gen.py`, `tools/cross_region_chunk_extent.py` | KEEP |
| 24 | `tools/cluster_b_bundle_gen.py` | - | - | `tests/test_cluster_b_bundle_gen.py` | `docs/decomp-workflow.md`, `docs/briefs/174-bundle-extent-heuristic-generator.md`, +8 | `tools/cross_region_chunk_extent.py` | KEEP |
| 25 | `tools/cluster_c_pattern3_gen.py` | - | - | `tests/test_cluster_c_pattern3_gen.py` | `docs/decomp-workflow.md`, `docs/briefs/125-cluster-c-pattern3-generator.md`, +25 | `tools/cluster_b_bundle_gen.py`, `tools/cross_region_chunk_extent.py`, +1 | KEEP |
| 26 | `tools/cluster_wave_propagate.py` | - | - | `tests/test_cluster_wave_propagate.py` | `docs/briefs/016-cluster-prop-ov000.md` | `tools/tier_classifier.py` | KEEP |
| 27 | `tools/cmatch_loop.py` | - | - | `tests/test_cmatch_loop.py`, `tests/test_fastmatch.py` | `AGENTS.md`, `docs/research/brief-619-cmatch-loop.md`, +6 | - | KEEP |
| 28 | `tools/configure.py` | - | `.github/workflows/compile-check.yml`, `.github/workflows/tests.yml` | `tests/test_batch_carve.py`, `tests/test_claude_hooks.py`, +5 | `AGENTS.md`, `BUILD.md`, +164 | `tools/batch_carve.py`, `tools/batch_sha1.py`, +27 | KEEP |
| 29 | `tools/containment_check.py` | - | - | `tests/test_containment_check.py` | `docs/STATE-LOG.md`, `docs/briefs/CLOSED-LOG.md`, +19 | - | KEEP |
| 30 | `tools/cross_apply_libs_port.py` | - | - | `tests/test_cross_apply_libs_port.py` | `docs/briefs/073-per-region-cross-application.md`, `docs/briefs/075-cross-region-apply-existing-ports.md`, +13 | - | KEEP |
| 31 | `tools/cross_region_chunk_extent.py` | - | - | `tests/test_cross_region_chunk_extent.py` | `docs/decomp-workflow.md`, `docs/STATE-LOG.md`, +6 | `tools/cross_region_cluster_apply.py` | KEEP |
| 32 | `tools/cross_region_cluster_apply.py` | - | - | `tests/test_cluster_b_bundle_gen.py`, `tests/test_cross_region_chunk_extent.py`, +1 | `docs/decomp-workflow.md`, `docs/briefs/170-cross-region-cluster-bd3-apply-tooling.md`, +8 | `tools/cluster_b_bundle_gen.py`, `tools/cross_region_chunk_extent.py` | KEEP |
| 33 | `tools/data_symbol_sizes.py` | - | - | `tests/test_data_symbol_sizes.py` | `docs/decomp-workflow.md`, `docs/briefs/003-sinit-bulk-match.md`, +2 | `tools/bulk_data_candidates.py`, `tools/find_pattern_clusters.py` | KEEP |
| 34 | `tools/data_worklist.py` | - | - | `tests/test_data_worklist.py` | `docs/decomp-workflow.md`, `docs/briefs/114-data-worklist-v2.md`, +28 | `tools/bulk_data_candidates.py`, `tools/find_external_source.py` | KEEP |
| 35 | `tools/diff_reasons.py` | - | - | `tests/test_ci_format_diff_reasons.py`, `tests/test_diff_reasons.py` | `docs/decomp-workflow.md`, `docs/research/objdiff-v371-upgrade-trial.md`, +2 | `tools/ci_format_diff_reasons.py` | KEEP |
| 36 | `tools/download_tool.py` | `build.ninja` | - | `tests/test_get_platform.py` | `CLAUDE.md`, `docs/decomp-workflow.md`, +16 | `tools/asm_escape.py`, `tools/configure.py`, +3 | KEEP |
| 37 | `tools/emit_data_blob.py` | - | - | `tests/test_emit_data_blob.py` | `docs/research/brief-577-main-floor-autopsy.md`, `docs/research/brief-578-eur-datablob.md`, +3 | - | KEEP |
| 38 | `tools/export_matched_pairs.py` | - | - | `tests/test_export_matched_pairs.py` | `docs/research/brief-604-retriever-go.md`, `docs/research/brief-611-retriever-v2.md`, +1 | `tools/m2c_feed.py` | KEEP |
| 39 | `tools/external_obj.py` | - | - | `tests/test_external_obj.py`, `tests/test_port_external_source.py` | `docs/briefs/070-port-external-source-driver.md`, `docs/briefs/080-pokeheartgold-extension-research.md`, +3 | `tools/find_external_source.py`, `tools/port_external_source.py` | KEEP |
| 40 | `tools/family_hit_harness.py` | - | - | `tests/test_family_hit_harness.py` | `docs/research/brief-611-retriever-v2.md`, `docs/research/rnd-workflow-r8-2026-07-18.md` | `tools/retrieval_eval.py` | KEEP |
| 41 | `tools/fastmatch.py` | - | - | `tests/test_fastmatch.py` | `docs/research/brief-619-cmatch-loop.md`, `docs/research/brief-620-cmatch-scale-validation.md`, +8 | `tools/batch_sha1.py`, `tools/cmatch_loop.py` | KEEP |
| 42 | `tools/find_callsites.py` | - | - | `tests/test_find_callsites.py` | `docs/decomp-workflow.md`, `docs/briefs/004-trivial-stubs-wave.md`, +10 | `tools/scaffold_batch.py`, `tools/scratch_bundle.py` | KEEP |
| 43 | `tools/find_cascades.py` | - | `.github/workflows/cascades-diff.yml`, `.github/workflows/mega-cascades-diff.yml` | `tests/test_claude_slash_commands.py`, `tests/test_find_cascades.py`, +1 | `docs/decomp-workflow.md`, `docs/briefs/014-rename-cascade-pilot.md`, +4 | `tools/bulk_rename_candidates.py`, `tools/cascade_apply.py`, +4 | KEEP |
| 44 | `tools/find_duplicates.py` | - | - | `tests/test_find_duplicates.py` | `docs/decomp-workflow.md`, `docs/research/brief-582-c-ceiling-probe.md`, +5 | `tools/find_pattern_clusters.py`, `tools/next_targets.py`, +1 | KEEP |
| 45 | `tools/find_external_source.py` | - | - | `tests/test_find_external_source.py` | `docs/briefs/066-cross-project-source-research.md`, `docs/briefs/068-cross-project-byte-fingerprint-pass.md`, +8 | `tools/external_obj.py`, `tools/list_named_tier_callees.py`, +2 | KEEP |
| 46 | `tools/find_mega_cascades.py` | - | `.github/workflows/mega-cascades-diff.yml` | `tests/test_find_mega_cascades.py` | - | `tools/ci_format_mega_cascades.py` | KEEP |
| 47 | `tools/find_ov004_rodata_pointer_targets.py` | - | - | `tests/test_find_ov004_rodata_pointer_targets.py` | `docs/briefs/159-pattern3-section-flag-plus-reverse-lookup-tool.md`, `docs/briefs/160-ov004-rodata-veneer-trigger-claims.md`, +3 | - | KEEP |
| 48 | `tools/find_pattern_clusters.py` | - | `.github/workflows/pattern-clusters-diff.yml` | `tests/test_ci_format_pattern_clusters.py`, `tests/test_cluster_wave_propagate.py`, +1 | `docs/briefs/015-cluster-propagation-pilot.md`, `docs/briefs/016-cluster-prop-ov000.md`, +22 | `tools/c42_family_hunter.py`, `tools/ci_format_pattern_clusters.py`, +2 | KEEP |
| 49 | `tools/find_region_siblings.py` | - | - | `tests/test_find_region_siblings.py` | `docs/briefs/061-multi-region-porting-research.md`, `docs/briefs/064-multi-region-implementation.md`, +12 | `tools/cross_apply_libs_port.py`, `tools/emit_data_blob.py`, +4 | KEEP |
| 50 | `tools/find_shape_templates.py` | - | - | `tests/test_find_shape_templates.py` | `docs/briefs/025-ov006-tooling-followup.md`, `docs/briefs/027-cluster-prop-ov006-021b7ce0.md`, +10 | `tools/c42_family_hunter.py` | KEEP |
| 51 | `tools/gate3.py` | - | - | `tests/test_codex_agents_current.py` | `AGENTS.md`, `docs/STATE-LOG.md`, +23 | `tools/kickoff_lint.py`, `tools/scope_gate.py` | KEEP |
| 52 | `tools/generate_briefs_index.py` | - | `.github/workflows/generated-files-drift.yml` | `tests/test_generate_briefs_index.py`, `tests/test_generate_research_index.py` | `docs/briefs/README.md`, `docs/research/improvement-swarm-2026-07-15-r5.md` | `tools/generate_research_index.py` | KEEP |
| 53 | `tools/generate_heatmap.py` | `build.ninja` | `.github/workflows/progress-badge.yml` | `tests/test_generate_heatmap.py`, `tests/test_heatmap_delinks.py`, +1 | `docs/decomp-workflow.md`, `docs/research/improvement-swarm-2026-07-15-r5.md`, +2 | `tools/configure.py`, `tools/generate_progress_bars.py`, +1 | KEEP |
| 54 | `tools/generate_progress_bars.py` | - | `.github/workflows/progress-badge.yml` | - | `docs/research/brief-561-foundation.md`, `docs/research/brief-566-tooling-harden.md` | `tools/progress.py` | KEEP |
| 55 | `tools/generate_research_index.py` | - | `.github/workflows/generated-files-drift.yml` | `tests/test_generate_briefs_index.py`, `tests/test_generate_research_index.py` | `docs/STATE-LOG.md`, `docs/research/brief-516-cmatch-high-w9.md`, +11 | `tools/generate_briefs_index.py` | KEEP |
| 56 | `tools/generate_tool_index.py` | - | `.github/workflows/generated-files-drift.yml` | `tests/test_generate_tool_index.py` | `docs/briefs/018-cluster-tooling-upgrade.md`, `docs/briefs/021-markdownlint-cleanup.md`, +4 | `tools/generate_research_index.py` | KEEP |
| 57 | `tools/get_platform.py` | - | - | `tests/test_get_platform.py` | `CLAUDE.md`, `docs/briefs/026-wine-migration-prep.md`, +2 | `tools/asm_escape.py`, `tools/configure.py`, +2 | KEEP |
| 58 | `tools/install_git_hooks.py` | - | - | `tests/test_install_git_hooks.py` | `docs/decomp-workflow.md` | - | KEEP |
| 59 | `tools/kickoff_lint.py` | - | - | `tests/test_kickoff_lint.py` | `AGENTS.md`, `docs/research/rnd-workflow-r8-2026-07-18.md` | - | KEEP |
| 60 | `tools/list_named_tier_callees.py` | - | - | `tests/test_list_named_tier_callees.py` | `docs/research/improvement-swarm-2026-07-15-r5.md` | - | KEEP |
| 61 | `tools/m2c_bootstrap.py` | - | - | `tests/test_cmatch_loop.py`, `tests/test_m2c_feed.py` | `docs/research/brief-381-m2c-permuter.md`, `docs/research/brief-383-permuter-commutative-verdict.md`, +3 | `tools/m2c_feed.py` | KEEP |
| 62 | `tools/m2c_feed.py` | - | - | `tests/test_cmatch_loop.py`, `tests/test_m2c_feed.py` | `docs/briefs/CLOSED-LOG.md`, `docs/research/brief-274-coldre-feeder-and-ov002-band-map.md`, +25 | `tools/build_struct_bank.py`, `tools/cmatch_loop.py`, +2 | KEEP |
| 63 | `tools/m2ctx.py` | `build.ninja` | - | `tests/test_m2c_feed.py` | `docs/STATE-LOG.md`, `docs/briefs/CLOSED-LOG.md`, +11 | `tools/configure.py`, `tools/m2c_feed.py` | KEEP |
| 64 | `tools/naming_census.py` | - | - | `tests/test_naming_census.py` | - | - | KEEP |
| 65 | `tools/next_targets.py` | - | `.github/workflows/mega-cascades-diff.yml`, `.github/workflows/pattern-clusters-diff.yml`, +1 | `tests/test_next_targets.py`, `tests/test_predict_walls.py` | `docs/decomp-workflow.md`, `docs/STATE-LOG.md`, +34 | `tools/bulk_data_candidates.py`, `tools/bulk_rename_candidates.py`, +18 | KEEP |
| 66 | `tools/ninja_syntax.py` | - | - | - | - | `tools/configure.py`, `tools/requirements.txt` | KEEP |
| 67 | `tools/nitro_dict.py` | - | - | `tests/test_generate_research_index.py`, `tests/test_nitro_dict.py` | `docs/research/data-tier-scouting.md`, `docs/research/nitro-rename-suggestions-round2.md`, +3 | `tools/nitro_suggest_renames.py` | KEEP |
| 68 | `tools/nitro_suggest_renames.py` | - | - | `tests/test_claude_slash_commands.py`, `tests/test_generate_research_index.py`, +2 | `docs/decomp-workflow.md`, `docs/research/cascade-3-dryrun.md`, +6 | `tools/data_worklist.py`, `tools/find_cascades.py`, +2 | KEEP |
| 69 | `tools/objdiff_filter_panic_units.py` | `build.ninja` | - | `tests/test_objdiff_filter_panic_units.py`, `tests/test_objdiff_resolve_relocs.py`, +1 | `docs/decomp-workflow.md`, `docs/STATE-LOG.md`, +13 | `tools/configure.py`, `tools/objdiff_resolve_relocs.py`, +1 | KEEP |
| 70 | `tools/objdiff_resolve_relocs.py` | `build.ninja` | - | `tests/test_objdiff_resolve_relocs.py` | `docs/STATE-LOG.md`, `docs/briefs/CLOSED-LOG.md`, +18 | `tools/configure.py`, `tools/fastmatch.py`, +2 | KEEP |
| 71 | `tools/overlay_coupling.py` | - | - | `tests/test_overlay_coupling.py` | `docs/decomp-workflow.md`, `docs/briefs/003-sinit-bulk-match.md` | - | KEEP |
| 72 | `tools/parsers.py` | - | - | - | - | `tools/check_match_invariants.py`, `tools/cluster_wave_propagate.py`, +7 | KEEP |
| 73 | `tools/patch_arm_mapping_symbols.py` | `build.ninja` | - | `tests/test_patch_arm_mapping_symbols.py` | `docs/state.md`, `docs/briefs/CLOSED-LOG.md`, +8 | `tools/configure.py` | KEEP |
| 74 | `tools/patch_lcf_arm9_align.py` | `build.ninja` | - | `tests/test_patch_lcf_arm9_align.py` | `docs/briefs/039-objects-txt-legacy-patch.md`, `docs/briefs/058-windows-build-shell-fix.md`, +9 | `tools/configure.py`, `tools/patch_objects_legacy.py` | KEEP |
| 75 | `tools/patch_module_literals.py` | `build.ninja` | - | `tests/test_cluster_b_bundle_gen.py`, `tests/test_patch_module_literals.py` | `docs/briefs/155-cluster-b-size-1-2-main-wave.md`, `docs/briefs/161-pattern3-subsumed-ref-resolution.md`, +7 | `tools/cluster_b_bundle_gen.py`, `tools/configure.py`, +1 | KEEP |
| 76 | `tools/patch_objects_legacy.py` | `build.ninja` | - | `tests/test_patch_objects_legacy.py` | `docs/briefs/039-objects-txt-legacy-patch.md`, `docs/briefs/040-medium-tier-wave-2-retry.md`, +10 | `tools/configure.py` | KEEP |
| 77 | `tools/patch_ov004_veneers.py` | `build.ninja` | - | `tests/test_patch_ov004_veneers.py` | `CLAUDE.md`, `docs/STATE-LOG.md`, +25 | `tools/configure.py`, `tools/patch_module_literals.py` | KEEP |
| 78 | `tools/patch_rom_header_crc.py` | `build.ninja` | - | `tests/test_patch_rom_header_crc.py` | `CLAUDE.md`, `docs/briefs/140-sha1-final-gate.md`, +3 | `tools/configure.py` | KEEP |
| 79 | `tools/patch_section_align.py` | `build.ninja` | - | `tests/test_patch_section_align.py` | `docs/STATE-LOG.md`, `docs/briefs/039-objects-txt-legacy-patch.md`, +17 | `tools/configure.py`, `tools/containment_check.py`, +3 | KEEP |
| 80 | `tools/pattern_library.py` | - | - | `tests/test_pattern_library.py` | `docs/briefs/CLOSED-LOG.md`, `docs/research/cascade-3-scouting.md`, +1 | `tools/bulk_rename_candidates.py`, `tools/find_pattern_clusters.py`, +1 | KEEP |
| 81 | `tools/permute.py` | - | - | `tests/test_analyze_symbols.py`, `tests/test_permute.py`, +1 | `docs/decomp-workflow.md`, `docs/STATE-LOG.md`, +24 | `tools/diff_reasons.py`, `tools/m2c_bootstrap.py`, +1 | KEEP |
| 82 | `tools/permute_batch.py` | - | - | `tests/test_permute_batch.py` | `docs/STATE-LOG.md`, `docs/briefs/CLOSED-LOG.md`, +3 | - | KEEP |
| 83 | `tools/port_external_source.py` | - | - | `tests/test_libs_nitro_d5.py`, `tests/test_libs_nitro_d6a.py`, +1 | `docs/briefs/066-cross-project-source-research.md`, `docs/briefs/069-cross-project-bulk-port-wave-1.md`, +15 | - | KEEP |
| 84 | `tools/port_to_region.py` | - | - | `tests/test_port_to_region.py`, `tests/test_routing_suffixes.py` | `CLAUDE.md`, `docs/STATE-LOG.md`, +52 | `tools/batch_carve.py`, `tools/cross_apply_libs_port.py`, +4 | KEEP |
| 85 | `tools/predict_walls.py` | - | - | `tests/test_next_targets.py`, `tests/test_predict_walls.py` | `AGENTS.md`, `docs/STATE-LOG.md`, +43 | `tools/c42_family_hunter.py`, `tools/containment_check.py`, +1 | KEEP |
| 86 | `tools/progress.py` | `build.ninja` | `.github/workflows/match-invariants.yml`, `.github/workflows/progress-badge.yml`, +1 | `tests/test_batch_carve.py`, `tests/test_patch_objects_legacy.py`, +3 | `AGENTS.md`, `BUILD.md`, +36 | `tools/cmatch_loop.py`, `tools/configure.py`, +9 | KEEP |
| 87 | `tools/propagate_template.py` | - | `.github/workflows/pattern-clusters-diff.yml` | `tests/test_cluster_wave_propagate.py`, `tests/test_propagate_template.py` | `docs/briefs/006-easy-tier-heavies.md`, `docs/briefs/015-cluster-propagation-pilot.md`, +10 | `tools/bulk_rename_candidates.py`, `tools/ci_format_pattern_clusters.py`, +3 | KEEP |
| 88 | `tools/prune_worktrees.py` | - | - | `tests/test_prune_worktrees.py` | `docs/research/improvement-swarm-2026-07-09.md` | - | KEEP |
| 89 | `tools/rename_symbol.py` | - | `.github/workflows/cascades-diff.yml` | `tests/test_analyze_symbols.py`, `tests/test_cascade_apply.py`, +2 | `docs/decomp-workflow.md`, `docs/briefs/003-sinit-bulk-match.md`, +14 | `tools/cascade_apply.py`, `tools/check_match_invariants.py`, +8 | KEEP |
| 90 | `tools/retrieval_eval.py` | - | - | `tests/test_retrieval_eval.py` | `docs/research/brief-604-retriever-go.md`, `docs/research/brief-611-retriever-v2.md`, +2 | `tools/family_hit_harness.py`, `tools/m2c_feed.py` | KEEP |
| 91 | `tools/routing_suffixes.py` | - | - | `tests/test_port_to_region.py`, `tests/test_routing_suffixes.py` | `docs/state.md`, `docs/research/improvement-swarm-2026-07-15-r5.md`, +2 | `tools/objdiff_filter_panic_units.py`, `tools/port_to_region.py`, +1 | KEEP |
| 92 | `tools/scaffold_batch.py` | - | - | `tests/test_scaffold_batch.py` | `docs/briefs/006-easy-tier-heavies.md`, `docs/briefs/008-ov011-tail-call-wrappers.md`, +5 | - | KEEP |
| 93 | `tools/scope_gate.py` | - | - | `tests/test_scope_gate.py` | `AGENTS.md`, `docs/queue/codex-decomper.md`, +4 | - | KEEP |
| 94 | `tools/scratch_bundle.py` | - | - | `tests/test_claude_slash_commands.py`, `tests/test_scratch_bundle.py` | `docs/decomp-workflow.md`, `docs/research/brief-272-track2-coldre-accelerator-pilot.md`, +5 | `tools/m2c_feed.py`, `tools/pattern_library.py` | KEEP |
| 95 | `tools/sha1.py` | `build.ninja` | - | - | `CLAUDE.md`, `docs/research/brief-619-cmatch-loop.md`, +7 | `tools/batch_sha1.py`, `tools/cmatch_loop.py`, +1 | KEEP |
| 96 | `tools/sig_census.py` | - | - | `tests/test_routing_suffixes.py`, `tests/test_sig_census.py` | `docs/research/brief-569-sig-census.md`, `docs/research/improvement-swarm-2026-07-12-r4.md`, +2 | `tools/routing_suffixes.py` | KEEP |
| 97 | `tools/size_census.py` | - | - | `tests/test_batch_carve.py`, `tests/test_sig_census.py`, +1 | `docs/briefs/CLOSED-LOG.md`, `docs/research/brief-278-harvest-census-clusterA-map.md`, +16 | `tools/batch_carve.py`, `tools/build_master_ledger.py` | KEEP |
| 98 | `tools/sort_delinks.py` | - | - | `tests/test_batch_carve.py`, `tests/test_emit_data_blob.py` | `docs/briefs/CLOSED-LOG.md`, `docs/research/brief-389-ov002-s-lower-wave3.md`, +51 | `tools/batch_carve.py`, `tools/batch_sha1.py`, +1 | KEEP |
| 99 | `tools/strip_overlay_func_collisions.py` | - | - | - | `docs/briefs/CLOSED-LOG.md`, `docs/research/ov004-thunk-section-fix.md` | `tools/configure.py` | KEEP |
| 100 | `tools/stylea_c94_stub.py` | - | - | `tests/test_stylea_c94_stub.py` | `docs/briefs/CLOSED-LOG.md`, `docs/research/brief-264-overfire-stylea-family-recipes.md` | - | KEEP |
| 101 | `tools/suggest_coercion.py` | - | - | `tests/test_suggest_coercion.py` | `docs/briefs/062-diff-to-coercion-suggester.md`, `docs/briefs/081-single-region-hard-tier-resumption.md`, +10 | `tools/cmatch_loop.py` | KEEP |
| 102 | `tools/tier_classifier.py` | - | - | `tests/test_tier_classifier.py` | `docs/research/improvement-swarm-2026-07-15-r5.md` | - | KEEP |
| 103 | `tools/transform_dep.py` | - | `.github/workflows/compile-check.yml` | `tests/test_permute.py`, `tests/test_transform_dep.py` | `docs/briefs/058-windows-build-shell-fix.md`, `docs/briefs/096-permuter-wrapper.md`, +5 | `tools/configure.py`, `tools/permute.py` | KEEP |
| 104 | `tools/update_progress_badge.py` | - | - | `tests/test_progress.py`, `tests/test_update_progress_badge.py` | `docs/research/brief-561-foundation.md`, `docs/research/improvement-swarm-2026-07-15-r5.md`, +2 | `tools/generate_heatmap.py`, `tools/progress.py` | KEEP |
| 105 | `tools/vendor_external_sources.py` | - | - | `tests/test_find_external_source.py` | `docs/briefs/080-pokeheartgold-extension-research.md`, `docs/briefs/CLOSED-LOG.md`, +2 | `tools/find_external_source.py`, `tools/permute.py` | KEEP |
| 106 | `tools/verify.py` | - | - | `tests/test_verify.py` | `docs/briefs/CLOSED-LOG.md`, `docs/research/brief-286-ov002-core-header.md`, +1089 | `tools/fastmatch.py` | KEEP |
| 107 | `tools/wall_aware_headroom.py` | - | - | `tests/test_wall_aware_headroom.py` | `docs/queue/claude-decomper.md`, `docs/queue/claude-scaffolder.md`, +11 | - | KEEP |
| 108 | `tools/wine_link_lock.py` | `build.ninja` | - | `tests/test_wine_link_lock.py` | `AGENTS.md`, `CLAUDE.md` | `tools/batch_carve.py`, `tools/configure.py` | KEEP |
| 109 | `tools/work_queue.py` | - | - | `tests/test_work_queue.py` | `docs/queue/claude-decomper.md`, `docs/queue/claude-scaffolder.md`, +3 | - | KEEP |
| 110 | `tools/xmap_normalize.py` | - | - | - | `docs/briefs/CLOSED-LOG.md`, `docs/research/tooling/xmap-normalize.md` | - | KEEP |

## Review queue

- No executable tool is unreferenced under this scan. `tools/naming_census.py` has a test reference and historical research coverage, so it remains KEEP; the package boundary row is the only deliberately non-referenced file.
- No `SUPERSEDED-BY-X` row is asserted. Similar wording such as “use X instead” inside a tool’s domain-specific help was not treated as a deletion proof.
- The next action is human review of deliberately one-shot research utilities and any future explicit supersession claim. This item intentionally performs no deletion.

## Action follow-up (q-dead-tools-action)

Rechecking the current tree before deletion found the same result: **0
UNREFERENCED executable tools and 0 explicitly superseded tools**. The
package boundary `tools/__init__.py` remains intentional. Therefore this
follow-up removes **no files**; deleting a KEEP row would violate the audit's
mechanical rule.

The requested gate was attempted. `python -m pytest -q tests` reported
`11 failed, 2843 passed, 25 skipped, 55 subtests passed` — the known Windows
path-separator/tool-environment failures, with no deletion-related changes.
`python tools/configure.py eur` could not start because this build-free
worktree has no `orig\baserom_eur.nds`. The item is parked pending a
baserom-capable worktree; no build was forced.

## EUR-capable rerun (2026-07-22)

The action was re-run from `kb-types`, which has the EUR baserom. The
re-audit still found **0 UNREFERENCED executable tools** and **0 explicitly
superseded tools**, so the safe deletion count remains zero. The named build
check completed with `python tools/configure.py eur` followed by `ninja sha1`:

```text
gx-spirit-caller_eur.nds: OK
Verifying SHA-1 of orig\baserom_eur.nds...
  OK  (1da50df7c210fae96dc69b3825554b9ce13b4f75)
```

The required pytest rerun remains at 11 pre-existing Windows/path/tool-
environment failures, 2,848 passed, 20 skipped, and 55 subtests; no deletion
was made and no deletion-related failure exists.
