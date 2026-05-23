# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-23 evening, post-#647/#648 + this brain-PR.
Brain on Mac. **🎉 ~200 PREVIOUSLY-INVISIBLE MATCHES RECOVERED.**
This brain-PR's matched_functions investigation found that brief 187's
`objdiff_filter_panic_units.py` was silently dropping every `.legacy.c`
unit (~200 of them) because dsd emits objdiff.json entries with bare
`.o` paths even for `.legacy.c` sources, while mwcc produces
`.legacy.o`. The filter's "missing file" branch swallowed them all.
Fixed by rewriting target/base paths using `source_path` as the
authoritative routing signal. **Current metrics (post-fix):**
`matched_code_percent 1.7190 %` (was 1.4102 %, +0.3084), `matched_
functions 1628 / 9801 (16.61 %)` (was 1430, **+198 functions**),
`complete_units 1613 / 2479` (+198), `fuzzy_match_percent 1.4584 %`.

**Strategic context:** Brief 198 returned "permuter not viable for
Cluster B + E" (0/9 converged); brief 199 closed C-23 wall with a
sharp insight that "C-23 + StyleA stacked" is actually one wall.
Next round splits along brief 198's data: brief 200 (scaffolder)
investigates the 480-500 plateau as a shared codegen mechanism;
brief 201 (decomper) does manual decomp.me iteration on the 3
closest-score picks (220-315 range — within manual reach).

**Two open lanes:** brief 200 (scaffolder codegen-sweep) + brief 201
(decomper decomp.me iteration). See § *In flight* below.

## The current headline — 10-brief pivot validation arc (briefs 188 → 197)

The pivot from scaffold to code decomp landed cleanly. 10 briefs
shipped against the post-SHA1 resumption queue + wall taxonomy:

| Brief | Agent | Result | Headline |
|---|---|---|---|
| 188 | decomper | 5/12 trivial ships | First code-decomp brief in 39 briefs |
| 189 | scaffolder | Wall classifier shipped | `predict_walls.py` foundation |
| 190 | decomper | 10/25 easy ships | +0.0093 % matched_code; 4 wall clusters surfaced |
| 191 | scaffolder | C-31 wall closed | Recipe + classifier + 100% detection |
| 192 | scaffolder | C-32 wall closed | Recipe + classifier + 16-pick ov011 scan |
| 193 | decomper | 0/15 medium-easy | Surfaced Cluster E + F mechanisms |
| 194 | scaffolder | C-33 wall closed | Per-section modal-deviation patcher cap |
| 195 | decomper | **8/8 recipe drain** | 100% recipe-locked throughput |
| 196 | scaffolder | Permuter wrapper shipped | 9-pick worklist + outcome schema |
| 197 | decomper | **13/13 ov011 C-32 drain** | Above target + Track B documented |

**Three named walls (C-31/C-32/C-33)** now have locked recipes +
classifier detection in `tools/predict_walls.py`. The post-pivot
methodology has a steady cadence: decomper either drains recipe-
locked picks (briefs 195/197 averaged 95% throughput) or surfaces
wall mechanisms when something new fires (briefs 188/190/193); the
scaffolder converts wall mechanisms into recipes (briefs 191/192/194)
or builds pipeline infrastructure (briefs 187/189/196).

**The unsolved problem:** `matched_functions` has NOT moved since
brief 190. Briefs 195 + 197 shipped 21 `.s` files (which tick
`complete_units` but not `matched_functions`); the C-source matches
brief 188 + 190 produced were small and the well of "trivially
matchable" picks ran dry. Brief 198 is the strategic bet that
permuter can crack the Cluster E / B picks where mwcc-shape
iteration is the bottleneck. Outcome answer due next round.

## The previous headline — pivot from scaffold to code decomp (briefs 182 → 187)

Three pivot-enabler briefs closed the W7 patcher chain at n=0 + revived
`ninja report` (objdiff-verified metrics) + published the 52-pick
curated queue. See PR #634 for the brain-PR that captured the pivot.

## The previous headline — SHA1 PASS achieved (briefs 137 → 140, 2026-05-13)

Mac brain's last full arc closed the SHA1 gap:

1. **Brief 137** — scoped the gap (99.995% was `.DS_Store` noise across
   the extract; 3-brief unlock plan).
2. **Brief 138** — `.DS_Store` filter shipped (100K → 5 bytes / 3 regions).
3. **Brief 139** — cluster A wave 4 + Pattern 3 wave 2 (305 effective
   candidates).
4. **Brief 140 — 🎉🎉🎉 `ninja sha1` PASSES** for EUR + USA + JPN. First
   byte-identical ROM rebuild across all 3 regions. **This is the
   `CLAUDE.md` final-gate criterion.**

Subsequent briefs (141 → 148) ran the post-SHA1 polish wave: ov004
cluster sweep (brief 141), 3-region 27/27 module baseline canonicalised
(brief 136 → 141), patcher generalisation for variable veneer counts
(brief 142 — `n ∈ [0, 86]`), first post-SHA1 decomp wave (brief 143 —
cluster B opened with 60 + 114 true scalars across two waves), Pattern
3 generator extern emission fix (brief 144), ov004 `.rodata` cluster
wave BLOCKED (brief 145) → patcher ctor-terminator detection (brief
146) → ov004 `.rodata` retry shipped 14 syms across 3 shapes (brief
147), cluster B pointer pool survey + recipe (brief 148).

## SHA1 PASS is now the floor

Every PR going forward must preserve 3-region `ninja sha1` PASS:

```
ninja sha1  # EUR — must say "OK"
python tools/configure.py usa && ninja sha1  # USA — must say "OK"
python tools/configure.py jpn && ninja sha1  # JPN — must say "OK"
```

This supersedes the old "24/27 module check" gate. If a PR drops any
region from PASS → FAIL, it does not merge. Cloud and decomper both
verify 3-region SHA1 PASS pre-PR; brain re-verifies pre-merge.

## Today's merges (just-landed)

- **Brain-PR (this one) — matched_functions fix + macOS permuter
  workarounds + housekeeping.** 🎉 **+198 matched_functions recovered.**
  Three-part PR. (1) `objdiff_filter_panic_units.py` was silently
  dropping every `.legacy.c` unit because dsd emits objdiff.json
  entries with bare `.o` paths while mwcc produces `.legacy.o` —
  filter's "missing file" branch swallowed them. New
  `_legacy_suffix_from_source` + `_rewrite_path_for_legacy` helpers
  reconcile the two using `source_path` as the authoritative routing
  signal. `matched_code_percent 1.4102 → 1.7190` (+0.3084), function
  count 1430 → 1628. (2) `tools/permute.py` macOS workarounds folded
  in: `expected_disasm_path` scans the tree-mirroring layout when the
  flat path is absent (was symlink-required); `install_permuter_deps`
  detects PEP 668 externally-managed-environment refusal and auto-
  creates `.venv_permuter/` then patches `sys.path` so the venv's
  deps import in-process (no re-exec). (3) AGENTS.md + state.md
  closing brief 198 + 199, queueing brief 200 + 201. 2073 → 2088
  tests (+15 new objdiff filter tests; +5 permute fixes covering
  flat/mirror/PEP668 cases).
- **PR #648 — decomper / brief 198 permuter wave 0/9 converged.**
  🔬 Strategic finding: permuter isn't the right tool for Cluster
  B + E walls. Phase 1 wrote 9 `.c` stubs (gitignored from delinks
  — artifacts only). Phase 2 ran `permute_batch.py` with
  120s/1800s/4-thread budget — all picks hit budget; best scores
  220 → 590. **5 picks plateaued at 480–500** (E-12/13/14 +
  B-22/B-24 — shared codegen mechanism, brief 200 scope). 3 picks
  at 220-315 (E-07/E-08/B-08 — manual-iteration reach, brief 201
  scope). 1 pick at 590 with 53 variants (B-18 — hardware-register-
  fold per brief 190, deferred). Real-world macOS workarounds
  documented (`.venv_permuter` + disasm path symlinks) — folded
  into this brain-PR as proper fixes.
- **PR #647 — scaffolder / brief 199 C-23 wall closed.** 🎯 Pick #5
  (`func_02096434`, 0x6c) shipped clean as `.legacy.c`. **Key
  insight: C-23 + StyleA "stacked walls" from brief 193 is ONE wall
  with ONE recipe** (sub-sp + Style A epilogue is the natural mwcc
  1.2/sp2p3 shape for this call layout). Classifier expanded with
  4 new C-23 signals beyond brief 086's MMIO range: DTCM kernel,
  duplicate refs, clustered pool, contiguous-pool false-positive
  doc. Surfaced 4 more C-23 candidates for brief 200+ drain
  (`OSi_PostIrqEvent`, `func_02021b38`, `func_02093dc8` + pick #5
  shipped). Constant-folding trap documented: naive `*(int *)
  (base + offset)` folds even at `.legacy.c` tier — keep base +
  offset separate in source. 2068 → 2073 tests.

### Earlier this round (#635 → #646 from previous brain-PR)

- **PR #645 — decomper / brief 197 Track A 13/13 + Track B documented.**
  🎉 **13 of 13 ov011 C-32 picks ship via brief 192's locked recipe**
  (above ≥ 10 target). 5.6 KB `.text` across 13 functions, 30 hand-
  encoded cross-overlay BLs. `/tmp/c32_emit.py` helper automated `.s`
  generation from orig bytes — sidesteps transcription error across
  thousands of instructions. Track B 0/2 lands on brief 193 pick #2
  re-attempt: `.legacy.c` builds cleanly (brief 194's Cluster F fix
  empirically confirmed) but is structurally different from orig;
  `.c` (mwcc 2.0) closest variant is do-while form with 14 residual
  diffs (reg-allocator preference — escalates to brief 198+ permuter).
  Surfaces C-15 prediction caveat: `mvn #0` in orig doesn't always
  mean mwcc 1.2. `complete_units` 1415 → 1428. 3-region SHA1 PASS +
  27/27 OK.
- **PR #644 — scaffolder / brief 196 permuter batch wrapper.** 🎯
  `tools/permute_batch.py` wraps brief 098's single-shot permuter
  for worklist-driven batch use with budgets + threads + structured
  results JSON (match / no_match / timeout / stub_missing /
  import_failed / budget_exhausted). 9-pick worklist for Cluster B +
  E published. Dry-run finding: 9/9 picks `stub_missing` — the actual
  gap is between "skip during decomp wave" and "drive permuter
  against the result," NOT permuter viability. **Brief 198 (decomper)
  closes the gap by writing the stubs.** 2032 → 2068 tests (+36).
- **PR #643 — scaffolder / brief 194 C-33 wall + patcher cap revision.**
  🎯 Brilliant diagnostic move: brief 193's "+64 byte cascade" turned
  out to be a *virtual LCF accounting artifact*, not a physical shift.
  120 TU sections all shifted by the same +64-to-+68 magnitude (modal
  100% consensus on `.text` and `.data`). New `_section_modal_shifts()`
  measures deviation from PER-SECTION modal; absolute cap fires only
  when a TU moves INDEPENDENTLY from its section's bulk. Unblocks ALL
  `.legacy.c` > 0x50 routing — substantial mid-tier work. Honest
  worked-example caveat: fix unblocks the BUILD pipeline but byte-
  matching brief 193's affected picks is Cluster E permuter territory.
  +1150/-15, 2032/2032 tests (+20).
- **PR #642 — decomper / brief 195 recipe drain 8/8 ships.** 🎉
  **100% recipe-locked throughput.** Drained all C-31 + C-32 locked
  picks from briefs 191/192: 4 cluster-A cross-overlay BL picks +
  4 mwldarm interwork picks. `.s` files per recipes. One mwasmarm-
  dialect snag fixed inline (`lsl`/`lsr` aren't standalone mnemonics
  in ARM mode). `complete_units` 1407 → 1415.
- **PR #640 — decomper / brief 193 medium-easy 0/15.** 🔬 Pivot's
  first wash brief but high diagnostic yield. Two new wall clusters
  documented: **Cluster E (mwcc reg-alloc + scheduling drift)** —
  5 picks affected, permuter territory; **Cluster F (`.legacy.c`
  cascade)** — 3 picks affected, forward-progress blocker for ALL
  `.legacy.c` > 0x50 (closed by brief 194). Pick #19 correctly flagged
  as mis-tagged in brief 190's queue.
- **PR #639 — scaffolder / brief 192 C-32 cross-overlay BL wall.**
  🎯 Recipe + classifier + worked example. ov011/ov012/ov013
  functions with `bl <hardcoded VA>` to shared-base-range addresses;
  dsd emits orig bytes with NO `R_ARM_PC24` reloc. Recipe: `.s` with
  hand-encoded BL `.word`. Worked example: `func_ov011_021d2c64.s`
  (40 B). Three shared-base ranges documented. Full ov011 scan found
  12 additional C-32 hits (brief 197 drained them). +763 LOC, 2012
  tests.
- **PR #638 — scaffolder / brief 191 C-31 mwldarm interwork wall.**
  🎯 Recipe + classifier + worked example. `ldr rN, [pc, …]; bx rN;
  .word target` pattern causes multi-KB cascade when source-claimed
  (mwldarm re-emits veneers when its native slots are user-claimed).
  Empirical repro: 158,713 B (59.2%) divergence with 19,693 runs.
  Recipe: `.s` with `.thumb` directive (NOT `.thumb_func`). Three
  shape signatures classified. 100% detection on all 5 brief-188
  affected picks. +588 LOC, 2005 tests.
- **PR #637 — decomper / brief 190 easy-bucket 10/25 ships.** ✅
  `matched_code_percent` +0.0093% (5.5× brief 188's delta). +6
  matched_functions. Four new wall clusters surfaced from skipped
  picks (3 became named walls in briefs 191/192/194; 1 became
  Cluster E for permuter).
- **PR #636 — decomper / brief 188 first code-decomp wave.** 🎉
  **First code-decomp brief in 39 briefs.** 5/12 trivial picks
  ship; matched_code +0.0017%, matched_functions +4 — **first
  positive metric movement since SHA1 PASS at brief 140.** Per-pick
  wall classification surfaced C-31 mwldarm interwork (5 of 7
  skipped) + 2 epilogue orphans.
- **PR #635 — scaffolder / brief 189 wall pre-emption classifier.**
  🎯 `tools/predict_walls.py` (480 LOC) — disasm-based wall
  classifier. Project-wide tally: C-1 3,980 / StyleA 2,074 / C-15 869
  / C-22 286 / P-9 225 / C-24 212 (out of 9,849 scanned). Top-3 wall
  research notes shipped. `next_targets.py:reason` now emits
  `[walls: ...]`. Foundation that briefs 191/192/194 extended.
- **PR #634 — brain / housekeeping for 182-187 pivot capture.**
  AGENTS.md + state.md captured the W7 closure + post-SHA1 scaffold
  done declaration. Fixed `python` → `python3` in Stop hook (silent
  failure on Mac since macOS ships no plain `python`).

### Earlier (PR #629 → #633 from the previous brain-PR — see PR #634 body)

- **PR #633 — scaffolder / brief 187 code-decomp resumption prep.**
  🎉 **Pivot enabler shipped.** Three-part single PR. (1) Diagnosed
  `ninja report` panicking with `index out of bounds` at
  `objdiff-core/src/arch/arm.rs:130:29`; root cause: `.text` sections
  with no `STT_FUNC` symbol coverage OR target `.o` missing (`.legacy`/
  `.legacy_sp3` routing tiers with no C source yet).
  `tools/objdiff_filter_panic_units.py` drops 1,096 / 3,330 affected
  units via direct ELF parsing (no `pyelftools` dep); ninja report
  succeeds in ~0.2 s. **First post-filter metrics:**
  `matched_code_percent = 1.40 %`, `matched_functions = 1,420 / 9,608
  (14.78 %)`, `complete_units = 1,381 / 2,234`. Upstream
  [objdiff#352](https://github.com/encounter/objdiff/issues/352)
  filed with backtrace + 1020-byte base64 ELF reproducer + suggested
  fix direction. (2) `docs/research/code-decomp-resumption-queue.md`
  — 52-pick curated queue (12 trivial + 25 easy + 15 medium-easy),
  ranked easiest-first. (3) `docs/decomp-workflow.md` refreshed with
  the "Code-decomp resumption — the post-scaffold playbook" section:
  routing decision tree, scratch flow, permuter staging, 3-region
  SHA1 PASS as headline gate. Brain pushed MD012 fix (commit 38ec1e2,
  3 spots — triple-blank before bucket tables in the queue doc).
  1973/1973 tests, 3-region SHA1 PASS preserved.
- **PR #632 — decomper / brief 182 W7 chain CLOSED for EUR.**
  🎉 **Both odd-aligned EUR ov004 `.rodata` claims ship via
  brief 173 Variant A.** `data_ov004_021ded69` (8,780 B `.rodata`
  `[0x021ded69..0x021e0fb5)`) + `data_ov004_021e191c` (1,173 B
  `[0x021e191c..0x021e1db1)`), both `__attribute__((aligned(1)))
  const unsigned char[N]`. Total: 9,953 new EUR bytes. n=2 → n=0.
  **W7 chain: 134 → 142 → 146 → 150 → 162 → 164 → 168 → 180 → 183
  → 186 → 182 CLOSED for EUR.** USA + JPN cross-region attempted +
  reverted: extending the USA/JPN claim to absorb the inner
  `data_ov004_021e1b9d` placeholder produces a +36 B `.rodata`
  cascade well over brief 180's `MAX_SHIFT_BYTES = 4` cap, not
  absorbed by the 20-byte `.ctor` pad. Deferred indefinitely per
  pivot discipline. Self-extend survey: 35 odd-aligned ov004 data
  symbols total, 1 shipped, 34 remain. 3-region SHA1 PASS (EUR at
  n=0, USA + JPN baseline preserved) + 27/27 modules + 0
  match-invariants errors.
- **PR #631 — scaffolder / brief 186 patcher gap closure.**
  🎯 **Two parser gaps closed in `tools/patch_ov004_veneers.py`
  from the decomper's brief 182 diagnosis.** Gap A — TU trailing
  range lost when last symbol has size=0: new
  `_MAP_SECTION_BOUNDARY_RE` parses `OV<NN>_<SECTION>_START/END`
  markers; per-TU `built_end_va` extends to next TU's start (or
  section END for trailing TU); defensive `max()` semantic — never
  shrinks. Gap B — `.ctor` shift defaulted to 0 instead of
  inheriting from `.init`: fallback uses most recent `.init` TU's
  shift when own `shift_candidate` is None AND no prior `.ctor`
  TU exists. Real-data confirmed on EUR map: `.ctor` shift now +24
  (was 0), `_dsd_gap@ov004_24.o (.text) built_end_va` now extends
  to next TU start. +256/-0, 4 new tests (1969 → 1973), 3-region
  SHA1 PASS at n=2 baseline.
- **PR #630 — scaffolder / brief 185 cluster B cap raise.**
  🎯 **`max_bundle_bytes` raised 1024 → 4096 + `data_ov006_021ceae4`
  worked example.** Diagnosis: bundle MUST end at a 4-aligned named
  symbol; no intermediate one exists between `0x021ceae4` and
  `0x021cef74` (1168 B away). Tightening predicate (option a)
  structurally infeasible — chose option b: raise cap + new
  `max_inner_symbols = 16` per-cluster guardrail. New
  `render_bundle_s_bytewise` emitter for byte-granular .s with
  `.global` labels at non-4-aligned offsets. Worked example:
  `data_ov006_021ceae4.s` (USA + JPN ov006, byte-identical
  cross-region). 1956 → 1969 tests. Research note at
  `docs/research/cluster-b-bundle-cap-raise.md`. 3-region SHA1
  PASS preserved.
- **PR #629 — scaffolder / brief 184 C / D-1 / D-2 cross-region
  subcommands.** 🎯 **`adjust_chunk_extent` is already cluster-
  agnostic; this brief wires three new subcommands.**
  `cmd_c_strings` (Pattern 3 `.s` via `cluster_c_pattern3_gen.
  generate_chunk`), `cmd_d1_tables` (bespoke `extern char <p>;` +
  `void *<a>[N] = { &p, ... }`), `cmd_d2_tables` (Pattern 3 `.s`
  with `--section data`). Each follows existing `cmd_b_*` shape
  (load region context → enumerate → adjust extent → emit). EUR
  dry-run smoke totals: 1855 emit / 741 skip across the three
  subcommands. 1937 → 1956 tests (+19). Pure tools work — no source
  ships; decomper's brief 188+ owns the apply at scale (deferred
  per pivot — brief 188 is code decomp, not data apply). 3-region
  SHA1 PASS preserved.

### Earlier this round (PRs #622 → #624 from the previous brain-PR)

- **PR #622 — brain / cloud→scaffolder rename + extended
  cleanup.** Two-commit PR: initial in-repo rename (agent
  files, AGENTS.md table, CI labeler, tools docstrings)
  + extended cleanup commit that drops all forward-facing
  `cloud` references in `AGENTS.md`, `docs/state.md`,
  `docs/decomp-workflow.md`, `.claude/agents/scaffolder.md`
  (History section removed), and `tests/test_generate_research_index.py`
  fixtures. Preserved (intentional): 5 factual branch-name
  references to `cloud/patcher-variant-e-2byte-pool-shift`
  (real git artifact), generic `cloud LLM session` in
  brain-runs-locally rationale, `iCloud-share` in
  onboarding. Suite 1904/1904 + EUR SHA1 PASS.
- **PR #621 — scaffolder / brief 179 Variant E
  FALSIFIED.** 🔬 1–3 byte veneer-pool shift model
  disproven via empirical reproduction on EUR
  `data_ov004_021ded69` Variant A. Actual root cause:
  multi-segment `.rodata` layout cascade (+0/+1/+2/+4
  across 4 TU boundaries, absorbed by 16-vs-20 `.ctor`-pad
  delta). Pure pool-shift detection — even with
  `MAX_SHIFT_BYTES = 3` — cannot close SHA1. Ships ONLY
  the research note (`docs/research/ov004-odd-aligned-
  layout-cascade.md`) + brief 180 reformulation spec; no
  patcher / source / delinks changes. 3-region SHA1 PASS
  preserved at n=2.
- **PR #620 — decomper / brief 178 cross-region D-3 at
  scale.** 🎉 **74 cross-region D-3 chunks** shipped (37
  USA + 37 JPN, 247% over ≥30 target). 80,152 bytes of
  new region-specific data (40,076 per region). Per-
  region per-module: 18 main + 6 ov002 + 11 ov006 + 1
  ov007 + 1 ov021. Method: brief 177's
  `cross_region_chunk_extent.py` for extent adjustment +
  **recursive split-around-pre-existing-TUs pass** to
  maximize coverage (13 → 37 per region). 3-region SHA1
  PASS + 27/27 modules preserved. Brain pushed drift-
  check regen fix on rebase.
- **PR #623 — scaffolder / brief 180 patcher Variant E
  proper.** 🎉 **W7 chain extends to brief 180.** Four
  pieces: (1) dropped `veneer_count > 0` gate on load-
  rewrite + ARM-BL re-encode passes; (2) `--map` CLI arg
  plumbed through `rom_config` rule; (3) map-driven per-
  TU layout reconstruction (~558 LOC) with
  `parse_link_map_ov004` + `_layout_reconstruct` (per-TU
  bounds, not per-symbol — sidesteps the ~21 KB gap-
  marker stranding); (4) `MAX_SHIFT_BYTES = 4` cap.
  **Brain caught a routing-order bug** on first verify
  pass: parser raised on shift > 4 BEFORE the
  `_is_orig_shape` idempotence guard ran, breaking n=2
  production. Scaffolder picked Option A (move cap out
  of parser into `_layout_reconstruct`) and shipped the
  fix in commit adc44f6 + 4 new regression tests. Suite
  1930 → 1934. 3-region SHA1 PASS preserved at n=2.
  Brief 182 (decomper path-2 final wave dropping n=2 →
  n=0) now unblocked.
- **PR #624 — decomper / brief 181 cluster B residue +
  cluster D-3 small-residue cleanup.** Bridge wave while
  brief 180 was in flight. Three sub-targets in one PR:
  (1) cluster B size-1/2 + odd-aligned cross-region —
  3 bundles per region × USA + JPN = 6 ships + ov002
  bonus; (2) 3 cluster B value=0 EUR deferred (W6-
  rejected wave-2 rewrite) — 2 main rewrites absorbing
  3 placeholders + bonus cross-region absorbing 6 more
  across USA + JPN; (3) cluster D-3 `data_020e0e70`
  (366 B → 544 B Pattern 3 chunk absorbing
  `data_020e0fde`). Bytes: EUR 556, USA 148, JPN 148.
  3-region SHA1 PASS + 27/27 modules preserved.
  Skipped: `data_ov006_021ceae4` (>1024 B safety cap),
  `data_ov002_022ccc2e` (odd-aligned, needs brief 180
  recipe — now unblocked), `data_020c9694` 14.8 KB
  D-3 mega (separate brief).

- **PR #617 — decomper / brief 176 cluster B residue at
  scale.** ✅ **Brief 174 generator validated at scale.**
  32 cluster B residue claims shipped across USA + JPN
  (16 each); 14 main + 1 ov004 + 1 ov006 per region.
  **🎉 Brief 170 ov006 sub-pool RESOLVED** — brief 170
  reported a 32-byte `.data` ordering shift; brief 172
  didn't resolve; brief 174's more conservative bundle
  extents now ship cleanly (`data_ov006_021ce9e0` lands
  in this wave). Apply funnel: 30 worklist → skip 14
  (size=2/1 + odd-aligned + worked + overlap) → apply
  16. Self-extend both gates met (53% yield, 500+ B per
  region). Residue 16 (size-1/2 + odd-aligned) deferred
  to brief 180+. **3-region SHA1 PASS + 27/27 OK
  preserved.**
- **PR #618 — scaffolder / brief 177 unified chunk-extent
  generator.** 🎉 New `tools/cross_region_chunk_extent.py`
  generalises brief 174's bundle heuristic to multi-symbol
  Pattern 3 chunks. **3-phase algorithm**: Phase A lowers
  start LEFT to absorb predecessor; Phase B raises end
  RIGHT iteratively for inner extents; Phase C validates
  4-aligned + named-symbol + non-zero. **Brief 175's
  headline failure REPRODUCES + ships**: target
  `[0x021cca88, 0x021ccd08)` → adjusted
  `[0x021cca68, 0x021ccf68)` (1280 B). 2 worked examples
  shipped — USA + JPN ov006 (1280 B each) + USA main
  (816 B). 15 new tests; suite 1889 → 1904. Brain pushed
  F401 ruff fix + manual delinks.txt merge conflict
  resolution (both PRs touched same files; additive
  merge).

- **PR #578 — decomper / brief 151 ov004 .rodata wave 2.** ✅
  **28 source-level claims** (40% over ≥ 20 target). Per-shape:
  25 Pattern 1 .c (`.data` strings, brief 141 orphan recovery —
  the .c files were already in the working tree but were never
  wired into delinks.txt), 2 D-1 dispatch tables, and 1 Pattern 3
  mega chunk at `0x02200f18..0x02206738` covering a 22.5 KB
  block with 2 symbols. Total: 23,432 bytes. 3-region SHA1 PASS +
  27/27 OK preserved. **BONUS NOT MET**: couldn't drop ov004's
  veneer count `n` below 9 — investigation showed remaining
  candidates are ARM-code symbols misclassified as `data` in
  `symbols.txt`. Brief 154 (scaffolder, queued) takes the
  reclassification research as the next step.
- **PR #579 — scaffolder / brief 152 cluster B size-1/2 workarounds.**
  ✅ **Workaround #3 PASSES; workaround #2 FALSIFIED with root-
  cause diagnosis.** Empirical finding: `arm9.lcf`'s
  `ALIGNALL(2)` directive (not mwcc) is the alignment-cascade
  culprit — the `.o` reports `Algn 2**0` correctly, but mwldarm
  re-aligns every section to 4 bytes at link time, padding 3
  bytes after a 1-byte section. Workaround #3 (bundle the size-
  1/2 slot + zero-pad neighbours into `unsigned int[N]` covering
  the deduced range to the next named symbol) sidesteps the
  cascade. Worked example shipped: `data_021020b4` (16-int
  bundle, 64 bytes). 3-region SHA1 PASS + 1784/1784 tests.
  Research note at `docs/research/cluster-b-size-1-2-recipe.md`.
  Recipe ready for brief 153 (decomper) to drain.
- **PR #575 — decomper / brief 149 cluster B wave 3.** ✅
  **Cluster B pointer pool fully drained**: 20 of 20 remaining
  candidates shipped via brief 148's locked recipe. 8 data-pointer
  singletons + 4 code-pointer singletons + two 4-element + one
  3-element fn-ptr "table" + one ov004 (bss pointee). **3-region
  SHA1 PASS + 27/27 OK preserved.** Notable empirical correction:
  **REJECTED brief 148's bundling-into-array hand-off** — checked
  `relocs.txt`, found each table slot is referenced by name from
  other code, so bundling would break per-slot symbol identity.
  All 20 shipped as singletons. **Size-1 workaround #1 (.s with
  explicit `.byte`) FALSIFIED** — same 1308 byte / 32-byte
  cascade as brief 148's naive .c attempt; mwasmarm respects the
  same LCF section-alignment cascade as mwcc. Workarounds #2 +
  #3 deferred to brief 152. Self-extend gate: yield 100% PASS,
  bytes-matched FAIL (80 B vs ≥250 B — pointers are 4 B). Brief
  closes after wave 1.
- **PR #576 — scaffolder / brief 150 low-n WITH_TERMINATOR.** Option
  A shipped (recommended): `_fix_ctor_and_pad`'s byte-detection
  is now the authoritative truth source; n-inference is an
  informational hint via stderr note on disagreement, not a
  fatal error. **Patcher accepts any `n ∈ [0, 86]` cleanly.**
  `expected_output_size_for` gains optional `ctor_pad_net`
  parameter that takes precedence over n-inference; `main()`
  passes the byte-detected truth into the YAML `code_size`
  rewrite. 8 new tests (`TestLowNWithTerminator` +
  `TestExpectedOutputSizeForCtorPadNet`) pin brief 147's n=2 +
  n=7 failing cases under brief 150 + assert stderr note
  semantics. **Test suite 1784/1784.** **3-region `ninja sha1`
  PASS preserved bit-for-bit at the historical n=86 case.**
  Cloud honestly documented test-scope limits: end-to-end smoke
  via an arbitrary source claim couldn't drop `n` below 9
  because suppression depends on the slot being an ov002
  cross-overlay pointer target — reverse-lookup tool is brief
  151+ territory. **Brief 134 → 142 → 146 → 150 patcher chain
  complete** — W7 mitigation now fully general.

## In flight (post this brain-PR)

**Open PRs: 0** once this brain-PR lands. Both agents have just
received the brief 200 / 201 kickoffs:

**Scaffolder — brief 200 in flight:**

- **Brief 200 (HIGH, NEW)** — `scaffolder/permuter-plateau-codegen-sweep`.
  Codegen-sweep on the 480-500 permuter plateau from brief 198.
  Per brief 084's "3 walls not 1" methodology, treat the 5 picks
  (E-12/13/14, B-22, B-24) that bottomed out at the same score
  band as evidence of ONE shared mechanism, not 5 separate walls.
  Three deliverables: side-by-side disasm survey across the 5
  picks (what diverges in the closest permuter variants?),
  hypothesis + classification (new C-N if a shared mechanism
  surfaces), best-effort recipe + worked example. Research-first
  brief — outcomes vary; classification IS the deliverable.

**Decomper — brief 201 in flight:**

- **Brief 201 (HIGH, NEW)** — `decomper/decomp-me-iteration-best-scores`.
  Manual decomp.me iteration on brief 198's 3 closest-score picks:
  E-07 (`func_02023f7c`, best 220), E-08 (`func_02026fd8`, best 230),
  B-08 (`func_0205da2c`, best 315). Permuter got within manual reach
  but couldn't close — decomp.me + objdiff's source-shape iteration
  is the next tool. Bar: ≥ 1 of 3 ships — **first matched_functions
  increment via decomp.me workflow.** 3-of-3 is the dream. Even 0
  with documented residuals would inform whether the 220-315 score
  range is genuinely closable by hand.

## Active clusters (post-pivot reality)

**The scaffold phase is officially DONE.** Cluster work is no
longer the primary axis; the project is now grinding C source
against the curated function queue. Cluster status snapshot
retained below for handoff context but cluster-side residue is
intentionally DEFERRED per pivot discipline — if any cluster
residue actively blocks a code-decomp brief, file as a brief 190+
followup; do NOT pre-emptively grind it.

- **Cluster A** — `.rodata`. Largely drained pre-SHA1; brief 141
  closed the ov004 sweep. **DEFERRED (no remaining open work
  surfacing in code-decomp wave 1).**
- **Cluster B** — main `.data`. **FULLY CLOSED** post brief 181 +
  185 (`data_ov006_021ceae4` worked example shipped under the
  raised 4096-byte cap). Single residue: `data_ov002_022ccc2e`
  (odd-aligned size=2, no nearby 4-aligned predecessor) —
  DEFERRED.
- **Cluster C / D-1 / D-2** — ov004 sub-clusters. 73 EUR syms
  shipped pre-pivot. Brief 184 wired the cross-region apply
  subcommands (EUR dry-run smoke 1855 / region). **Cross-region
  apply at scale is DEFERRED** — would be a follow-on to brief 178
  if revived, but pivot discipline says no.
- **Cluster D-3** — nested struct arrays. **EFFECTIVELY CLOSED**
  post brief 178 + 181 (~105 chunks / ~110 KB shipped). Single
  residue: `data_020c9694` 14.8 KB mega — DEFERRED.
- **Cluster D** — `.bss`/zeros. **W7 patcher chain CLOSED for EUR**
  via brief 182 (134 → 142 → 146 → 150 → 162 → 164 → 168 → 180 →
  183 → 186 → 182). USA + JPN cross-region of brief 182's two
  claims hit a +36 B cascade exceeding `MAX_SHIFT_BYTES = 4`;
  reverted, deferred indefinitely. 34 of 35 odd-aligned ov004 data
  symbols remain unclaimed — DEFERRED.

## Code-decomp resumption (post-pivot active work)

**Canonical metric:** `matched_code_percent` from
`build/eur/report.json` (objdiff-verified). As of brief 187 baseline:

| Metric | Value | Notes |
|---|---|---|
| matched_code_percent | **1.40 %** | objdiff-verified; was 0.70 % via delinks-approx (undercount) |
| matched_functions | **1,420 / 9,608 (14.78 %)** | early-project tier waves left a healthier base than the byte-% suggests |
| complete_units | **1,381 / 2,234** | post-filter (1,096 units dropped by brief 187's panic filter) |

**Resumption queue:** [docs/research/code-decomp-resumption-queue.md](docs/research/code-decomp-resumption-queue.md)
— 52 picks across trivial (12) / easy (25) / medium-easy (15).
Brief 188 is grinding the trivial bucket; brief 190+ picks up
easy + medium-easy once brief 189's wall pre-emption lands.

**Resumption playbook:** [docs/decomp-workflow.md](docs/decomp-workflow.md)
§ "Code-decomp resumption — the post-scaffold playbook" (NEW in
brief 187). Routing decision tree, scratch flow, permuter staging,
3-region SHA1 PASS as headline gate.

## Worktree convention — isolation per agent, two equivalent mechanisms

Each agent runs in its own worktree to prevent parallel-session
interference that bit briefs 138 + 140 earlier. **AGENTS.md is the
canonical spec** (worktree-convention section there now covers both
mechanisms — updated in this brain-PR). Two mechanisms are
equivalent:

- **Mac convention (manual sibling worktrees):** `~/Dev/spirit-caller/brain`,
  `~/Dev/spirit-caller/decomper`, `~/Dev/spirit-caller/scaffolder`
  — three named siblings under one parent, set up once via `git worktree
  add`. Each has its own `orig/` baseroms. Adopted during the
  SHA1-milestone arc; PR #564 documented this in state.md.
- **Windows convention (Claude Code automatic sandboxes):** Claude
  Code creates per-session worktrees inside `.claude/worktrees/<auto-
  name>/` for each agent. No manual setup. They share the main
  checkout's `orig/` baseroms. Side-effect: `gh pr merge --delete-
  branch` may fail to clean up the local branch while the agent
  session is active — harmless, server-side merge still succeeds.

Brief 142's clean scaffolder-side work + brief 143's clean decomper-side work
were the validation that worktree separation (either mechanism) is
sufficient.

## Brain-pattern locked

- **Self-merge by default.** Brain reviews + merges autonomously per
  cntrl_alt_lenny's stated working pattern. User gets the scaffolder /
  decomper messages afterward, doesn't gate each merge.
- **PR-URL deliverable.** Every agent message MUST end with "push the
  branch, run `gh pr create`, reply with the PR URL." Brain verifies
  origin before claiming review-ready; PRs missing from origin → ask
  user to nudge the agent rather than silently waiting.
- **Verify gate is now 3-region SHA1 PASS** (was 24/27 module check
  before brief 140). For tools-only PRs that don't touch the build
  path, EUR-only SHA1 PASS is sufficient evidence.

## Next-brain TODO

1. **Verify + merge brief 200 PR** (scaffolder codegen-sweep on
   480-500 plateau) when it opens. Branch:
   `scaffolder/permuter-plateau-codegen-sweep`. Tools + docs +
   possibly 1 worked example. EUR-only SHA1 PASS sufficient if
   no source ships; full 3-region if a worked example lands.
   Read the disasm-survey table carefully — that's the deliverable
   even if no recipe emerges. Look for whether the 5 picks DO
   share a mechanism or whether they happened to plateau at the
   same band coincidentally.
2. **Verify + merge brief 201 PR** (decomper decomp.me iteration)
   when it opens. Branch: `decomper/decomp-me-iteration-best-scores`.
   3-region SHA1 PASS required for each shipped match. **Headline
   event to watch: `matched_functions` increments via the decomp.me
   workflow** — first since the new measurement (1628 baseline).
   Even 0 ships with documented residuals is informative.
3. **Scope brief 202+ based on brief 200 + 201 outcomes:**
   - **If brief 200 surfaces a shared C-34/P-N wall:** brief 202
     (decomper) writes worked examples for 1-2 of the plateau picks
     using the new recipe. Brief 203 (scaffolder) refines the
     classifier with detection.
   - **If brief 200 finds 5 separate sub-walls:** brief 202
     (scaffolder) picks the most common sub-wall and produces a
     focused recipe; brief 203 (decomper) drains.
   - **If brief 201 ships ≥ 2 of 3:** brief 202 (decomper) scales
     decomp.me iteration to more picks from the queue at similar
     score ranges. Brief 203 (scaffolder) builds decomp.me upload
     automation to multiply throughput.
   - **If brief 201 ships 0:** the 220-315 score range isn't manually
     closable either. Different mechanism needed for the wider
     Cluster B + E family — could be a permuter-library-with-hints
     expansion or a deeper mwcc-2.0 reg-allocator investigation.
4. **Scope brief 203+ scaffolder candidates** to keep ready:
   - **C-24 wall** (predicated cascade research from brief 103):
     pending classifier upgrade, same shape as C-23/C-31/C-32/C-33
   - **Brief 197's mis-tagged C-15 prediction caveat** — `mvn #0`
     isn't always mwcc 1.2 routing; refine the C-15 predictor
   - **Decomp.me scratch upload automation** — productivity
     multiplier (becomes high-priority if brief 201 succeeds)
   - **Permuter library / hint expansion** — if brief 200's
     codegen-sweep reveals reg-alloc hint patterns, codify them
   - **C-23 candidates from brief 199's survey** (`OSi_PostIrqEvent`,
     `func_02021b38`, `func_02093dc8`) — recipe is locked; quick
     decomper drain when convenient
5. **Deferred indefinitely (per pivot discipline):**
   - `data_020c9694` 14.8 KB D-3 mega
   - `data_ov002_022ccc2e` odd-aligned size=2
   - 34 remaining odd-aligned ov004 data symbols (brief 182
     self-extend pool)
   - USA + JPN cross-region apply of brief 182's claims (+36 B
     cascade exceeds `MAX_SHIFT_BYTES = 4`)
   - Cluster C / D-1 / D-2 cross-region apply at scale (brief
     184 wired the subcommands; never run)
   - Brief 190 Cluster D (predicated saturation chains, 3-4 picks)
     — waits for a C-1 saturation recipe or permuter coverage
   - Brief 188 epilogue orphans (2 picks) — likely linker-emitted
     scaffolding or dead code
   - These items are NOT lost. If a code-decomp brief actively
     blocks on one, file the followup it deserves; otherwise
     leave them.
6. **Pre-existing carryovers (unchanged):**
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings.
   - `match-invariants` not yet a required branch-protection check.
7. **Known infrastructure state:**
   - Agent-inbox hook fix landed in PR #634 but agent sessions
     started BEFORE that PR will continue to silently fail (Claude
     Code reads `.claude/settings.json` once at session start).
     Inbox populates from next FRESH session start onward — brain
     should mention "exit your previous session" explicitly in
     kickoffs until it stops being a problem.
   - CI comment-upsert workflows hardened in PR #641 (shared
     `.github/scripts/upsert-pr-comment.sh`, REST-only, 3-retry,
     fail-soft). `pr-tier-delta` and 5 sibling workflows no longer
     fail on transient API 401s.
   - `objdiff_filter_panic_units.py` fixed to handle `.legacy.c`
     paths properly (this brain-PR). dsd emits `.o` paths; mwcc
     produces `.legacy.o` / `.legacy_sp3.o`. Filter now rewrites
     via `source_path` as the authoritative routing signal.
     **+198 matched_functions previously invisible** were the
     immediate recovery; the fix permanently closes the gap for
     all future `.legacy.c` ships.
   - `tools/permute.py` macOS workarounds folded in (this brain-PR):
     PEP 668 externally-managed-environment fallback auto-creates
     `.venv_permuter/` and patches `sys.path` in-process; disasm
     path resolver scans the tree-mirroring layout (`disasm/src/
     <path>/func_<addr>.s`) when the flat layout is absent.
     Brief 198's symlink workarounds no longer needed.

## Cross-machine handoff notes

User alternates brain between Windows PC and Mac. The role is tied to
the local machine (toolchain + baserom on disk), not to a specific
Claude session. State.md is the bridge. Standing conventions:

- **Working pattern:** brain reviews + merges autonomously; user
  receives the scaffolder / decomper messages afterward.
- **Verify command (Windows):** `python tools/configure.py eur &&
  ninja sha1 && python tools/configure.py usa && ninja sha1 && python
  tools/configure.py jpn && ninja sha1`. **On Mac substitute `python3.13`**
  (macOS ships no plain `python`; `/usr/bin/python3` is Apple's 3.9.6
  which lacks `match` statements — `tools/configure.py` requires 3.11+
  per CLAUDE.md). POSIX paths and `./dsd` instead of `dsd.exe`.
- **Memory per-machine:** Each side's `~/.claude/projects/...` memory
  doesn't follow. State.md is the bridge.
- **Worktrees:** see *Worktree convention* above; 3-worktree split is
  now standard.

## New agents?

No. Continuing with 4-slot setup (brain + decomper + scaffolder +
auto-progress-badge bot).
