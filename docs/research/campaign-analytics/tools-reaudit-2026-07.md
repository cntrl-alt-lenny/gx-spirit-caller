# Tools re-audit - non-circular classification (2026-07-22)

**Scope.** All **110** tracked `tools/*.py` files, classified from repository evidence at this snapshot. This replaces the earlier inventory pass that treated any docs/tests mention as "live". No tool was moved, deleted, or renamed by this audit.

## Result

| Class | Count | Mechanical meaning |
|---|---:|---|
| CORE | 39 | Directly on `build.ninja`, a CI workflow, or the gate/merge flow (`gate3.py`, `scope_gate.py`, `work_queue.py`). |
| ACTIVE-CAMPAIGN | 27 | Named in a current queue surface or in a brief report committed from 2026-06-22 through 2026-07-22. |
| OCCASIONAL | 24 | Not core/active, but imported or invoked by another runtime tool; retain for on-demand support until a successor is proven. |
| HISTORICAL | 20 | No build/CI/queue/recent-brief/runtime-import signal; retained only because old docs/tests or package structure still refer to it. |
| REPLACE/DELETE | 0 | No explicit successor or duplicate was evidenced, so nothing is proposed for removal on this pass. |

The "last 30 days" window is calendar-anchored to 2026-07-22 (2026-06-22 inclusive). A brief counts only when the exact `tools/<name>.py` appears in that report. Tests and old reports are shown as evidence, but do not by themselves promote a file to ACTIVE-CAMPAIGN. The table's `runtime-imports` count is the only signal used for OCCASIONAL; this is the anti-circular tie-break.

## Classification table

| Tool | Class | Operational evidence | Last meaningful change |
|---|---|---|---|
| `tools/__init__.py` | OCCASIONAL | runtime-imports:1; docs:2 | 2026-07-22 / 8535a514 / add shared tools parser facade |
| `tools/analyze_symbols.py` | CORE | CI:5; brief30:571-ci-region-matrix; runtime-imports:8; tests:2; docs:10 | 2026-05-22 / b0ee19b5 / brief 189: first-wave wall pre-emption — audit + top-3 notes + next_targets refresh (#635) |
| `tools/asm_escape.py` | ACTIVE-CAMPAIGN | brief30:655-main-sweep,650-ov002-sweep,651-wall-tooling,640-wall-audit; runtime-imports:3; tests:3; docs:12 | 2026-07-19 / 5c58da17 / asm_escape: fix generate_whole() base_addr for already-named functions |
| `tools/batch_carve.py` | ACTIVE-CAMPAIGN | brief30:619-cmatch-loop,608-wineprefix-spike,600-startup-block,596-carve-census-autopsy; runtime-imports:4; tests:2; docs:23 | 2026-07-19 / 973ccc35 / Brief 614: wire per-worktree WINEPREFIX lanes (608 -> GO) |
| `tools/batch_sha1.py` | ACTIVE-CAMPAIGN | brief30:619-cmatch-loop; runtime-imports:1; docs:6 | 2026-06-30 / a13cc1db / feat(tooling): add batch_sha1 amortized confirm + harden fastmatch objdump errors |
| `tools/build_master_ledger.py` | HISTORICAL | tests:1; docs:3 | 2026-07-17 / cc34db1a / Playlist 599: ledger provenance and state hygiene |
| `tools/build_struct_bank.py` | ACTIVE-CAMPAIGN | brief30:609-struct-bank,613-struct-bank; tests:1; docs:1 | 2026-07-19 / 14cc1cf7 / Brief 613: scale ov002 struct-bank mining |
| `tools/bulk_data_candidates.py` | HISTORICAL | tests:1; docs:2 | 2026-04-26 / 21bbec96 / Add tools/bulk_data_candidates.py - data-tier sibling finder (#223) |
| `tools/bulk_rename_candidates.py` | OCCASIONAL | runtime-imports:2; tests:1; docs:9 | 2026-05-22 / 72ad5329 / Brain: rename cloud agent → scaffolder (in-repo; worktree deferred) (#622) |
| `tools/c42_family_hunter.py` | HISTORICAL | tests:1; docs:3 | 2026-05-28 / 9d4335cb / brief 251: productionize c42_family_hunter + C-42 drain wave 7 — 29 .c, tool + test (#729) |
| `tools/calcrom.py` | OCCASIONAL | runtime-imports:1; docs:6 | 2026-05-28 / 77a01145 / brief 241: C-42 deferred drain (7 picks) + cluster scout + calcrom canon (#713) |
| `tools/cascade_apply.py` | OCCASIONAL | runtime-imports:1; tests:1; docs:3 | 2026-04-24 / eece1aed / Add tools/cascade_apply.py — atomic batch renames from a decisions file (#190) |
| `tools/check_delink_dupes.py` | ACTIVE-CAMPAIGN | brief30:601-reland,597-small-tier-sweep,561-foundation; runtime-imports:2; tests:1; docs:7 | 2026-07-16 / 861bc5fb / Brief 585: CLOSED-LOG backfill and cold-start fixes |
| `tools/check_match_invariants.py` | CORE | CI:1; brief30:571-ci-region-matrix; runtime-imports:4; tests:2; docs:19 | 2026-07-22 / 8535a514 / add shared tools parser facade |
| `tools/ci_format_diff.py` | CORE | CI:1; runtime-imports:2; tests:1; docs:3 | 2026-04-27 / 2b305cd4 / Pin UTF-8 on stdout for emoji-emitting CI formatters (#233) |
| `tools/ci_format_diff_reasons.py` | HISTORICAL | tests:1; docs:6 | 2026-04-23 / 1a295e1e / Add tools/ci_format_diff_reasons.py: before/after delta renderer (#109) |
| `tools/ci_format_invariants.py` | CORE | CI:1; runtime-imports:1; tests:1; docs:4 | 2026-04-27 / 2b305cd4 / Pin UTF-8 on stdout for emoji-emitting CI formatters (#233) |
| `tools/ci_format_mega_cascades.py` | CORE | CI:1; runtime-imports:1; tests:1; docs:1 | 2026-04-27 / 2b305cd4 / Pin UTF-8 on stdout for emoji-emitting CI formatters (#233) |
| `tools/ci_format_pattern_clusters.py` | CORE | CI:1; tests:1; docs:1 | 2026-04-27 / 31def5cb / Rebase #234 + #236 onto main (regenerate tools-index) (#239) |
| `tools/ci_format_rename_cascades.py` | CORE | CI:1; runtime-imports:2; tests:1; docs:2 | 2026-04-27 / 2b305cd4 / Pin UTF-8 on stdout for emoji-emitting CI formatters (#233) |
| `tools/ci_format_worklist_diff.py` | CORE | CI:1; runtime-imports:2; tests:1; docs:3 | 2026-04-23 / f5138c11 / ci_format_worklist_diff: utf-8 stdout reconfigure for Windows cp1252 (#95) |
| `tools/clean_macos_junk.py` | CORE | build.ninja; runtime-imports:1; tests:1; docs:6 | 2026-05-18 / 52041957 / brief 138: 🔑 .DS_Store filter — 99.995% SHA1-gap closure (100K → 5 bytes / 3 regions) (#555) |
| `tools/cluster_b_bundle.py` | OCCASIONAL | runtime-imports:2; tests:2; docs:7 | 2026-05-20 / b383789d / brief 161: bundle alias helper + data_02101928 worked example end-to-end (#593) |
| `tools/cluster_b_bundle_gen.py` | ACTIVE-CAMPAIGN | brief30:541-wall-autopsy; runtime-imports:1; tests:1; docs:10 | 2026-05-22 / f585dbdc / brief 185: cluster B bundle cap raise 1024 → 4096 + ov006 worked example (#630) |
| `tools/cluster_c_pattern3_gen.py` | ACTIVE-CAMPAIGN | brief30:569-sig-census; runtime-imports:3; tests:1; docs:24 | 2026-05-21 / 215faf0f / brief 166: generator emits raw hex for kind:label refs, no .extern (#601) |
| `tools/cluster_wave_propagate.py` | OCCASIONAL | runtime-imports:1; tests:1; docs:2 | 2026-07-22 / 8535a514 / add shared tools parser facade |
| `tools/cmatch_loop.py` | ACTIVE-CAMPAIGN | brief30:626-drafter-diagnosis,620-cmatch-scale-validation,619-cmatch-loop; tests:2; docs:5 | 2026-07-20 / 12975c49 / Brief 632: re-land cmatch draft compile scaffold |
| `tools/configure.py` | CORE | CI:2; queue:codex-scaffolder; brief30:641-final47,640-wall-audit,629-main-readable-c-batch,620-cmatch-scale-validation; runtime-imports:29; tests:7; docs:116 | 2026-07-19 / 973ccc35 / Brief 614: wire per-worktree WINEPREFIX lanes (608 -> GO) |
| `tools/containment_check.py` | ACTIVE-CAMPAIGN | brief30:562-cmatch-w2,536-cmatch-final8,535-hard-re,534-containment-fix; tests:1; docs:7 | 2026-07-16 / f2412c28 / test: enforce documentation link targets |
| `tools/cross_apply_libs_port.py` | HISTORICAL | tests:1; docs:16 | 2026-05-14 / ffa0c9cd / brief 079: D1 v2 overlay-prefix rename + D2 v2 reloc-mask offset fix (#463) |
| `tools/cross_region_chunk_extent.py` | OCCASIONAL | runtime-imports:1; tests:1; docs:9 | 2026-05-21 / a23c58c0 / brief 177: unified chunk-extent generator — unblocks cross-region D-3 + multi-symbol chunks (#618) |
| `tools/cross_region_cluster_apply.py` | OCCASIONAL | runtime-imports:1; tests:2; docs:9 | 2026-05-22 / bad8881f / brief 184: cluster C / D-1 / D-2 cross-region subcommands (#629) |
| `tools/data_symbol_sizes.py` | OCCASIONAL | runtime-imports:1; tests:1; docs:5 | 2026-04-21 / 7aa2f884 / Add ruff + markdownlint CI and fix preexisting findings (#32) |
| `tools/data_worklist.py` | OCCASIONAL | runtime-imports:2; tests:1; docs:32 | 2026-05-17 / bc7debf0 / brief 123: data_worklist v3 byte-pattern refinement — 4-byte sub-shapes (#531) |
| `tools/diff_reasons.py` | OCCASIONAL | runtime-imports:1; tests:1; docs:4 | 2026-05-22 / 72ad5329 / Brain: rename cloud agent → scaffolder (in-repo; worktree deferred) (#622) |
| `tools/download_tool.py` | CORE | build.ninja; brief30:538-usajpn-ov002-drain-w1; runtime-imports:5; tests:1; docs:15 | 2026-06-08 / 7b7db41a / decomper: stand up the permuter on WSL — lane validated + download_tool .tar.gz fix (brief 379) (#903) |
| `tools/emit_data_blob.py` | ACTIVE-CAMPAIGN | brief30:577-main-floor-autopsy,578-eur-datablob; tests:1; docs:3 | 2026-07-15 / 1ea3d12a / fix(asm_escape): 3 whole-function verify-fail bugs from brief-563 main floor autopsy |
| `tools/export_matched_pairs.py` | ACTIVE-CAMPAIGN | brief30:604-retriever-go,611-retriever-v2; runtime-imports:1; docs:3 | 2026-07-22 / b34660ca / refactor: migrate two symbol readers to parser facade |
| `tools/external_obj.py` | OCCASIONAL | runtime-imports:1; tests:1; docs:5 | 2026-05-14 / 15a3b85f / brief 080: pokeheartgold extension feasibility + profile registry (#465) |
| `tools/family_hit_harness.py` | ACTIVE-CAMPAIGN | brief30:611-retriever-v2; docs:2 | 2026-07-18 / 76ec198c / Brief 611: validate retriever and add symbol ranking |
| `tools/fastmatch.py` | ACTIVE-CAMPAIGN | brief30:626-drafter-diagnosis,631-drafter-match,620-cmatch-scale-validation,619-cmatch-loop; runtime-imports:2; tests:1; docs:7 | 2026-07-20 / 12975c49 / Brief 632: re-land cmatch draft compile scaffold |
| `tools/find_callsites.py` | OCCASIONAL | runtime-imports:2; tests:1; docs:11 | 2026-04-22 / a94181fa / find_callsites: add --caller-depth N for multi-hop caller expansion (#93) |
| `tools/find_cascades.py` | CORE | CI:2; runtime-imports:6; tests:3; docs:10 | 2026-04-23 / 4f9df5d1 / Add tools/find_cascades.py — predict tier promotions from renames (#132) |
| `tools/find_duplicates.py` | ACTIVE-CAMPAIGN | brief30:593-ceiling-r3,586-ceiling-r2,582-c-ceiling-probe; runtime-imports:3; tests:1; docs:7 | 2026-04-21 / d9f4017c / Rebase of #49 onto main + fix unused Counter import (#56) |
| `tools/find_external_source.py` | OCCASIONAL | runtime-imports:4; tests:1; docs:10 | 2026-05-13 / 20231a91 / brief 068: cross-project byte-fingerprint pipeline (#432) |
| `tools/find_mega_cascades.py` | CORE | CI:1; runtime-imports:1; tests:1; docs:1 | 2026-04-24 / 5683c091 / Add tools/find_mega_cascades.py — transitive-closure cascade finder (#207) |
| `tools/find_ov004_rodata_pointer_targets.py` | HISTORICAL | tests:1; docs:6 | 2026-05-22 / 72ad5329 / Brain: rename cloud agent → scaffolder (in-repo; worktree deferred) (#622) |
| `tools/find_pattern_clusters.py` | CORE | CI:1; runtime-imports:4; tests:1; docs:22 | 2026-05-22 / 72ad5329 / Brain: rename cloud agent → scaffolder (in-repo; worktree deferred) (#622) |
| `tools/find_region_siblings.py` | ACTIVE-CAMPAIGN | brief30:597-small-tier-sweep,578-eur-datablob; runtime-imports:3; tests:1; docs:13 | 2026-07-22 / b34660ca / refactor: migrate two symbol readers to parser facade |
| `tools/find_shape_templates.py` | OCCASIONAL | runtime-imports:1; tests:1; docs:11 | 2026-05-07 / d6f6690b / tools/find_shape_templates: opcode-sequence template surfacer (brief 025) (#304) |
| `tools/gate3.py` | CORE | merge-flow; queue:claude-decomper,claude-scaffolder,codex-scaffolder; brief30:662-family-sweep,661-main-unknown-probe,655-main-sweep,654-ov002-sweep; runtime-imports:2; tests:1; docs:14 | 2026-07-22 / 62664d41 / chore: green baseline lint and document protection proposal |
| `tools/generate_briefs_index.py` | CORE | CI:1; runtime-imports:1; tests:1; docs:3 | 2026-05-10 / 2225e9cd / tools: balanced-truncation in generate_briefs_index (#356) |
| `tools/generate_heatmap.py` | CORE | build.ninja; CI:1; runtime-imports:2; tests:2; docs:5 | 2026-07-22 / 8535a514 / add shared tools parser facade |
| `tools/generate_progress_bars.py` | CORE | CI:1; queue:codex-scaffolder; brief30:566-tooling-harden,561-foundation; runtime-imports:1; docs:1 | 2026-07-13 / c05fd46a / tools: fix C-feedback loop gap + C% metric ceiling (brief 566) |
| `tools/generate_research_index.py` | CORE | CI:1; brief30:629-main-readable-c-batch,620-cmatch-scale-validation,521-cmatch-main,524-lever-verification; runtime-imports:1; tests:1; docs:3 | 2026-05-22 / 72ad5329 / Brain: rename cloud agent → scaffolder (in-repo; worktree deferred) (#622) |
| `tools/generate_tool_index.py` | CORE | CI:1; brief30:609-struct-bank; runtime-imports:1; tests:1; docs:6 | 2026-06-01 / 2302d689 / Brief 290 — .s escape-hatch generator + canonicalisation-residue class size (#789) |
| `tools/get_platform.py` | HISTORICAL | tests:1; docs:5 | 2026-06-07 / 9a328f0e / brief 369: port the Mac-only .s/permuter lane to Windows (tooling spike) (#893) |
| `tools/install_git_hooks.py` | HISTORICAL | tests:1; docs:4 | 2026-04-23 / 72851195 / Add pre-push git hook + install_git_hooks.py (catch #135-class drift) (#154) |
| `tools/kickoff_lint.py` | HISTORICAL | tests:1; docs:3 | 2026-07-18 / 22608f41 / R&D r8: orchestration-layer findings + kickoff_lint pre-send gate |
| `tools/list_named_tier_callees.py` | HISTORICAL | tests:1; docs:2 | 2026-05-14 / 491f30aa / list_named_tier_callees: enumerate upstream + local API surface (#435) |
| `tools/m2c_bootstrap.py` | ACTIVE-CAMPAIGN | brief30:604-retriever-go; runtime-imports:1; tests:2; docs:3 | 2026-06-08 / 4293260d / decomper: vendor m2c + validate the m2c→permuter pipeline on WSL (brief 381) (#905) |
| `tools/m2c_feed.py` | ACTIVE-CAMPAIGN | brief30:604-retriever-go,609-struct-bank,619-cmatch-loop,613-struct-bank; runtime-imports:4; tests:1; docs:9 | 2026-07-22 / 62664d41 / chore: green baseline lint and document protection proposal |
| `tools/m2ctx.py` | CORE | build.ninja; brief30:609-struct-bank; runtime-imports:2; tests:1; docs:7 | 2026-06-12 / 76591fc3 / kind:data carve harness (brief 406): constraint dissolved — preflight classifier, 12 parked ships, Thumb fix (#938) |
| `tools/naming_census.py` | HISTORICAL | docs:1 | 2026-07-17 / 9409ffa5 / Brief 595: naming and matched-pair corpus campaign |
| `tools/next_targets.py` | CORE | CI:3; runtime-imports:5; tests:2; docs:38 | 2026-07-22 / 8535a514 / add shared tools parser facade |
| `tools/ninja_syntax.py` | OCCASIONAL | runtime-imports:1; docs:1 | 2026-04-20 / 06bb8c66 / Scaffold dsd-based decomp project (round-trip, no source yet) |
| `tools/nitro_dict.py` | OCCASIONAL | runtime-imports:1; tests:2; docs:8 | 2026-04-23 / 5a49cac3 / Add NitroSDK dict + rename suggester (tools/nitro_dict + nitro_suggest_renames) (#97) |
| `tools/nitro_suggest_renames.py` | OCCASIONAL | runtime-imports:4; tests:4; docs:12 | 2026-05-22 / 72ad5329 / Brain: rename cloud agent → scaffolder (in-repo; worktree deferred) (#622) |
| `tools/objdiff_filter_panic_units.py` | CORE | build.ninja; brief30:499-c-match-med; runtime-imports:3; tests:1; docs:15 | 2026-07-22 / 62664d41 / chore: green baseline lint and document protection proposal |
| `tools/objdiff_resolve_relocs.py` | CORE | build.ninja; brief30:569-sig-census,560-cmatch-vram,499-c-match-med; runtime-imports:4; tests:1; docs:14 | 2026-05-25 / 3b6a7a88 / brief 206: objdiff resolve-relocs harness — fix matched_functions under-counting (#659) |
| `tools/overlay_coupling.py` | HISTORICAL | tests:1; docs:3 | 2026-04-21 / 3b9dd753 / overlay_coupling: add --loads mode (#39) |
| `tools/parsers.py` | HISTORICAL | docs:2 | 2026-07-22 / 8535a514 / add shared tools parser facade |
| `tools/patch_arm_mapping_symbols.py` | CORE | build.ninja; brief30:499-c-match-med; runtime-imports:1; tests:1; docs:9 | 2026-05-25 / 36dedf7c / brief 212: $d/$a rewriter audit + pass-2 trailing collapse (#668) |
| `tools/patch_lcf_arm9_align.py` | CORE | build.ninja; runtime-imports:2; tests:1; docs:14 | 2026-05-17 / dcd41089 / brief 131: ov004 ALIGNALL(2) Phase 1 — 95% byte-diff reduction, queue brief 132 for veneers (#543) |
| `tools/patch_module_literals.py` | CORE | build.ninja; brief30:529-cmatch-ov; runtime-imports:3; tests:2; docs:8 | 2026-05-18 / 765a1408 / brief 134: 🔑 ov004 Phase 3 binary patch — 26/27 baseline UNLOCKED (EUR 27/27) (#549) |
| `tools/patch_objects_legacy.py` | CORE | build.ninja; runtime-imports:1; tests:1; docs:12 | 2026-07-22 / 8535a514 / add shared tools parser facade |
| `tools/patch_ov004_veneers.py` | CORE | build.ninja; brief30:529-cmatch-ov; runtime-imports:2; tests:1; docs:24 | 2026-05-23 / 7867c321 / brief 194: .legacy.c cascade wall (C-33) — patcher cap revision + classifier + diagnostic (#643) |
| `tools/patch_rom_header_crc.py` | CORE | build.ninja; brief30:600-startup-block; runtime-imports:1; tests:1; docs:5 | 2026-05-18 / 5fa50034 / brief 140: 🎉 SHA1 FINAL GATE — `ninja sha1` PASSES for EUR + USA + JPN (#558) |
| `tools/patch_section_align.py` | CORE | build.ninja; runtime-imports:5; tests:1; docs:20 | 2026-05-25 / 1b2aafab / brief 208: literal-tail trim trap (C-36) — patcher fix + classifier + worked example (#663) |
| `tools/pattern_library.py` | OCCASIONAL | runtime-imports:3; tests:1; docs:6 | 2026-05-22 / 72ad5329 / Brain: rename cloud agent → scaffolder (in-repo; worktree deferred) (#622) |
| `tools/permute.py` | OCCASIONAL | runtime-imports:3; tests:3; docs:20 | 2026-05-23 / 63c5d3c2 / Brain: matched_functions recovery (+198) + macOS permuter fixes + housekeeping (#650) |
| `tools/permute_batch.py` | HISTORICAL | tests:1; docs:5 | 2026-05-23 / 7f03e33b / brief 196: permuter batch wrapper — wraps tools/permute.py for worklist + budget driving (#644) |
| `tools/port_external_source.py` | HISTORICAL | tests:2; docs:18 | 2026-05-14 / 91eb8d30 / test cleanup: clear 24 pre-existing Windows-host failures (#475) |
| `tools/port_to_region.py` | ACTIVE-CAMPAIGN | brief30:662-family-sweep,597-small-tier-sweep,579-cmatch-ov,569-sig-census; runtime-imports:5; tests:1; docs:30 | 2026-07-22 / 62664d41 / chore: green baseline lint and document protection proposal |
| `tools/predict_walls.py` | ACTIVE-CAMPAIGN | brief30:640-wall-audit; runtime-imports:3; tests:2; docs:24 | 2026-05-29 / 87c6c2df / brief 260: global-ptr-chase = C-39g (coercible) + refine StyleA/C-23 cues (#744) |
| `tools/progress.py` | CORE | build.ninja; CI:3; queue:codex-decomper,codex-scaffolder; brief30:619-cmatch-loop,615-honest-metric,600-startup-block,596-carve-census-autopsy; runtime-imports:10; tests:5; docs:32 | 2026-07-19 / 7ba8125f / Brief 615: honest-metric dashboard columns |
| `tools/propagate_template.py` | CORE | CI:1; runtime-imports:5; tests:2; docs:14 | 2026-04-23 / 08d930ee / Fix propagate_template.py cross-module no-op bug (PR #122 followup) (#133) |
| `tools/prune_worktrees.py` | HISTORICAL | tests:1; docs:3 | 2026-07-08 / e35d9a76 / Add tools/prune_worktrees.py — cap ephemeral claude-NNN worktrees |
| `tools/rename_symbol.py` | CORE | CI:1; queue:codex-decomper; runtime-imports:10; tests:3; docs:21 | 2026-07-20 / c7b7d17c / Brief 627: dsd-sig naming DB + apply |
| `tools/retrieval_eval.py` | ACTIVE-CAMPAIGN | brief30:604-retriever-go,619-cmatch-loop,611-retriever-v2; runtime-imports:1; docs:2 | 2026-07-18 / 76ec198c / Brief 611: validate retriever and add symbol ranking |
| `tools/routing_suffixes.py` | OCCASIONAL | runtime-imports:1; tests:1; docs:5 | 2026-07-17 / cb9793b7 / Brief 587: Thumb-tier recovery + per-module C% |
| `tools/scaffold_batch.py` | HISTORICAL | tests:1; docs:8 | 2026-07-22 / 8535a514 / add shared tools parser facade |
| `tools/scope_gate.py` | CORE | merge-flow; queue:codex-decomper,codex-scaffolder; tests:1; docs:7 | 2026-07-22 / 8535a514 / add shared tools parser facade |
| `tools/scratch_bundle.py` | OCCASIONAL | runtime-imports:2; tests:2; docs:10 | 2026-05-22 / 72ad5329 / Brain: rename cloud agent → scaffolder (in-repo; worktree deferred) (#622) |
| `tools/sha1.py` | CORE | build.ninja; brief30:620-cmatch-scale-validation; runtime-imports:1; docs:4 | 2026-04-20 / 06bb8c66 / Scaffold dsd-based decomp project (round-trip, no source yet) |
| `tools/sig_census.py` | ACTIVE-CAMPAIGN | brief30:569-sig-census; runtime-imports:1; tests:1; docs:4 | 2026-07-22 / 8535a514 / add shared tools parser facade |
| `tools/size_census.py` | ACTIVE-CAMPAIGN | brief30:597-small-tier-sweep,600-startup-block,596-carve-census-autopsy; runtime-imports:1; tests:2; docs:7 | 2026-07-17 / 00493178 / Brief 596: census autopsy + P-1 probe |
| `tools/sort_delinks.py` | ACTIVE-CAMPAIGN | brief30:578-eur-datablob,485-usajpn-main-sdrain-chunk1,483-usajpn-main-sdrain-driftfix,482-ov002-lower-batchcarve; runtime-imports:3; tests:2; docs:5 | 2026-06-09 / 59f443e5 / fix(ruff): drop redundant "r" mode arg in sort_delinks.py (UP015) (#916) |
| `tools/strip_overlay_func_collisions.py` | OCCASIONAL | runtime-imports:1; docs:3 | 2026-05-18 / 286815ea / brief 132: ov004 Phase 2 symbol-scoping — NO FLIP; empirical model + brief 133-B plan (#546) |
| `tools/stylea_c94_stub.py` | HISTORICAL | tests:1; docs:2 | 2026-05-29 / 651a208f / brief 264: lock the over-fire StyleA helper-family recipe templates (#750) |
| `tools/suggest_coercion.py` | ACTIVE-CAMPAIGN | brief30:619-cmatch-loop,593-ceiling-r3,586-ceiling-r2,582-c-ceiling-probe; runtime-imports:1; tests:1; docs:10 | 2026-05-13 / e7fff5b1 / brief 062: suggest_coercion.py — rule engine over objdiff JSON (#422) |
| `tools/tier_classifier.py` | HISTORICAL | tests:1; docs:2 | 2026-04-30 / 8d7e8251 / Add tools/tier_classifier.py - operationalize #246/#255 analysis (#263) |
| `tools/transform_dep.py` | CORE | CI:1; brief30:608-wineprefix-spike; runtime-imports:2; tests:2; docs:7 | 2026-05-14 / 91eb8d30 / test cleanup: clear 24 pre-existing Windows-host failures (#475) |
| `tools/update_progress_badge.py` | ACTIVE-CAMPAIGN | brief30:561-foundation; runtime-imports:2; tests:2; docs:4 | 2026-05-13 / 87f48f7e / Brain: multi-region README badges + 3 cloud tools-investment briefs (061/062/063) (#411) |
| `tools/vendor_external_sources.py` | OCCASIONAL | runtime-imports:2; tests:1; docs:5 | 2026-05-22 / 72ad5329 / Brain: rename cloud agent → scaffolder (in-repo; worktree deferred) (#622) |
| `tools/verify.py` | ACTIVE-CAMPAIGN | brief30:524-lever-verification,518-cmatch-high-w10; runtime-imports:1; tests:1; docs:1080 | 2026-06-05 / 0089460f / scaffolder: main easy-tier wave 2 — 15 picks (tri-compile) + canonical tools/verify.py (brief 351) (#869) |
| `tools/wall_aware_headroom.py` | ACTIVE-CAMPAIGN | queue:claude-decomper,claude-scaffolder,codex-decomper; brief30:661-main-unknown-probe,655-main-sweep,654-ov002-sweep,650-ov002-sweep; tests:1; docs:10 | 2026-07-22 / 208e21c1 / fix(wall_aware_headroom): distinguish coercible/permanent/unknown/no-marker |
| `tools/wine_link_lock.py` | CORE | build.ninja; runtime-imports:2; tests:1; docs:3 | 2026-07-19 / 973ccc35 / Brief 614: wire per-worktree WINEPREFIX lanes (608 -> GO) |
| `tools/work_queue.py` | CORE | merge-flow; queue:claude-decomper,claude-scaffolder,codex-decomper; brief30:651-wall-tooling; tests:1; docs:1 | 2026-07-22 / 62664d41 / chore: green baseline lint and document protection proposal |
| `tools/xmap_normalize.py` | HISTORICAL | docs:3 | 2026-07-03 / 74ba0c5e / tools: xMAP normalizer + verified objdiff #352 cherry-pick (no build, no cargo) |

## HISTORICAL candidates and proposed archive migration

The 20 historical candidates are:

- `build_master_ledger.py`, `bulk_data_candidates.py`, `c42_family_hunter.py`, `ci_format_diff_reasons.py`, `cross_apply_libs_port.py`
- `find_ov004_rodata_pointer_targets.py`, `get_platform.py`, `install_git_hooks.py`, `kickoff_lint.py`, `list_named_tier_callees.py`, `naming_census.py`
- `overlay_coupling.py`, `parsers.py`, `permute_batch.py`, `port_external_source.py`, `prune_worktrees.py`, `scaffold_batch.py`
- `stylea_c94_stub.py`, `tier_classifier.py`, `xmap_normalize.py`

This is a proposal, not an action. Migration checklist:

1. Freeze the table and review each candidate's imports, command-line entry points, and reproducibility value.
2. Move only an agreed batch to `tools/archive/`, preserving history; update runtime imports and any exact-path references.
3. Keep a compatibility shim only where a current caller needs it; otherwise update the caller and tests to the archived path.
4. Regenerate `docs/tools-index.md` and the research index, then run the link test and the relevant unit tests.
5. Run the repository's normal configuration/merge gate for any batch that touches build or runtime imports; this audit itself performed no build.
6. Delete only after one full campaign cycle proves the archive copy and documented replacement are sufficient.

## REPLACE/DELETE review

No candidate met the evidence bar for this class. The audit found no explicit "successor", "duplicate of", or "superseded by" relationship strong enough to recommend deletion. The next pass should treat any proposed replacement as a separate, reviewed change.

## Reproducibility notes

- Commands used were read-only repository mining plus `git log`; no `tools/` source or build input was changed.
- The queue status transition is separate from this classification document and is included in the item PR so the queue remains self-chaining.
