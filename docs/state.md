# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-22 evening, post-#620/#621/#622/#623/#624
merge wave. Brain on Mac. **🎉 SHA1 FINAL GATE PASSES**
across all 3 regions (brief 140, PR #558) and continues to
hold after 22 post-SHA1 rounds. **🎉 Cross-region D-3 at
scale**: brief 178 (decomper, PR #620) shipped **74 cross-
region D-3 chunks** (247% of ≥30 target) via brief 177's
unified generator — 80,152 bytes of new region-specific data.
**🎉 Patcher Variant E shipped** (brief 180, PR #623):
`patch_ov004_veneers.py` gains map-driven layout
reconstruction; W7 chain extends 134 → 142 → 146 → 150 →
162 → 164 → 168 → 180. **Brief 181 cleanup wave** (decomper,
PR #624) closed cluster B size-1/2 cross-region residue +
cluster B value=0 EUR deferred + cluster D-3 366 B non-
aligned residue. Path-2 final wave (n=2 → n=0) **now
unblocked** by brief 180 — queued as brief 182.

## The headline — SHA1 PASS achieved (briefs 137 → 140)

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

**Open PRs: 0** once this brain-PR lands.

**Decomper — brief 182 queued (path-2 final wave, now
unblocked by brief 180):**

- **Brief 182 (HIGH, NEW)** — `decomper/path-2-final-wave-n2-to-n0`.
  Claim `data_ov004_021ded69` + `data_ov004_021e191c`
  via brief 173 Variant A (`__attribute__((aligned(1)))`
  extern + delinks entry). With brief 180's map-driven
  layout reconstruction now landed, the patcher handles
  the layout cascade and the source claims close path-2
  to its structural floor at n=0. Self-extend if other
  odd-aligned ov004 candidates surface. Critical:
  3-region SHA1 PASS preserved (current main n=2 +
  new n=0 floor).

**Scaffolder — no brief queued yet.** Candidates for
brief 183+ enumerated under *Next-brain TODO* below.
Scaffolder may pick up autonomous-work fill (per AGENTS.md
§ Scaffolder autonomous work) while brain scopes.

## Active clusters (post-SHA1 polish wavefront)

- **Cluster A** — `.rodata` (briefs 132 → 139 main run, then post-SHA1
  follow-up via 141). Largely drained.
- **Cluster B** — main `.data`. **FULLY CLOSED** post brief 181:
  true scalars 174/174 (brief 143), pointer pool 23/23 (brief 149),
  size-1/2 overlay 18/18 (brief 153), size-1/2 main 1/1 (brief 152),
  W6-rejected value=0 main 21/21 (brief 155 + brief 181 deferred
  drain), size-1/2 cross-region 6 ships (brief 181), W6-rejected
  cross-region 6 ships (brief 181). One in-scope skip:
  `data_ov002_022ccc2e` (odd-aligned, deferred to brief 183+
  with brief 180 recipe). Recipe locked across all known shapes.
- **Cluster C / D-1 / D-2** — ov004 sub-clusters. 31 `.data` syms
  (brief 141) + 14 `.rodata` syms at n=9 (brief 147) + 28
  `.rodata` syms (brief 151, 22.5 KB block included) = **73 total**.
  Veneer count n=9 lower bound — dropping below 9 requires
  reclassifying ARM-code-as-data symbols (brief 154 falsified
  the naive byte-pattern approach; brief 156 scaffolder spot-disasm
  recalibrates the heuristic).
- **Cluster D-3** — complex nested struct arrays.
  **EFFECTIVELY CLOSED** post brief 178 + 181. EUR run:
  brief 157 (9 / 6,664 B main) + brief 158 (12 / 5,852 B
  across 5 modules) + brief 161 bonus (data_02101928) +
  brief 163 (9 / ~12 KB) + brief 181 (`data_020e0e70`
  366 B → 544 B Pattern 3 chunk). Cross-region run:
  brief 178 (74 chunks / 80,152 bytes across USA + JPN —
  largest single brief). **~105 chunks / ~110 KB shipped
  to date.** Residue: 1 hard candidate — `data_020c9694`
  (14.8 KB mega, queued as brief 183+).
- **Cluster D** — `.bss`/zeros (briefs 130 + 142 framework).
  W7 patcher chain extends: 134 → 142 → 146 → 150 → 162 →
  164 → 168 → **180** (map-driven layout reconstruction).
  Path-2 final wave at n=0 queued as brief 182.

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

1. **Verify + merge decomper brief 182 PR** when it opens.
   Branch: `decomper/path-2-final-wave-n2-to-n0`. Gate:
   3-region `ninja sha1` PASS at n=0 floor (NEW gate) +
   n=2 baseline preserved bit-identical + 3-region 27/27
   modules OK. With brief 180's map-driven reconstruction
   live, the odd-aligned claims should ship cleanly per
   brief 179's empirical analysis. Closes the W7 chain at
   its structural floor.
2. **Scope brief 183+ candidates:**
   - **Cluster D-3 14.8 KB mega `data_020c9694`** —
     dedicated brief. Largest remaining D-3 residue;
     brief 181 explicitly deferred.
   - **Cluster C / D-1 / D-2 cross-region** — extend
     brief 177's `cross_region_chunk_extent.py` generator
     to non-D-3 patterns. Scaffolder may need to generalise
     the tool first (currently D-3-specialised); brief
     177's framework is the seed.
   - **`data_ov002_022ccc2e` odd-aligned size=2 claim** —
     brief 181 deferred (no nearby 4-aligned predecessor).
     With brief 180's recipe now live, this should be
     reachable. Small target but closes brief 181's only
     in-scope skip.
   - **`data_ov006_021ceae4` extent > 1024 B** — brief
     181 hit the safety cap. Either tighten the heuristic
     or run the brief 174/177 generator on the chunk
     specifically.
   - **Scaffolder autonomous-work fill** — candidates from
     prior research debt: C-23 MMIO register-base folding
     classification (brief 086 carryover), ov005
     placeholder-name warnings cleanup (sweep brief).
3. **Watch for any new wall hypotheses** in upcoming wave PRs.
   Standing rule since brief 084's "3 walls not 1" methodology
   lesson: pre-empt symptom-vs-mechanism classification by requesting
   a scaffolder codegen-sweep brief before any wall gets a P-N or C-N
   number. C-23 candidate (MMIO register-base folding) from brief 086
   remains pending scaffolder sweep classification.
4. **Pre-existing carryovers (unchanged):**
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings.
   - `match-invariants` not yet a required branch-protection check.

## Cross-machine handoff notes

User alternates brain between Windows PC and Mac. The role is tied to
the local machine (toolchain + baserom on disk), not to a specific
Claude session. State.md is the bridge. Standing conventions:

- **Working pattern:** brain reviews + merges autonomously; user
  receives the scaffolder / decomper messages afterward.
- **Verify command (Windows):** `python tools/configure.py eur &&
  ninja sha1 && python tools/configure.py usa && ninja sha1 && python
  tools/configure.py jpn && ninja sha1` — substitute `./dsd` and
  POSIX paths on Mac.
- **Memory per-machine:** Each side's `~/.claude/projects/...` memory
  doesn't follow. State.md is the bridge.
- **Worktrees:** see *Worktree convention* above; 3-worktree split is
  now standard.

## New agents?

No. Continuing with 4-slot setup (brain + decomper + scaffolder +
auto-progress-badge bot).
