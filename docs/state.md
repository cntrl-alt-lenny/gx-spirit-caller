# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-20 afternoon, post-#589 + #590 merge,
briefs 160 + 161 queued. Brain on Mac. **🎉 SHA1 FINAL GATE
PASSES** across all 3 regions (brief 140, PR #558) and continues
to hold after 10 post-SHA1 rounds. **D-3 wave 2 shipped 12
chunks across 5 modules (main + ov002 + ov006 + ov007 + ov021)
/ 5,852 bytes / 50% yield**. **Reverse-lookup tool landed**
(brief 159 Part 2): 4001 ov002→ov004 `.rodata` references
across 219 distinct slots — path-2 infrastructure now in place
for n<9 ov004 drain without reclassification risk. **New
structural collision surfaced** (brief 158): Pattern 3 chunks
need to reference subsumed placeholders inside brief 155
bundle TUs; brief 161 (cloud, queued) ships the bundle-alias
fix.

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

- **PR #589 — decomper / brief 158 cluster D-3 wave 2.** ✅
  **12 chunks across 5 modules** (main + ov002 + ov006 + ov007
  + ov021) / 5,852 bytes. **First wave with overlay reach**
  (wave 1 was main-only). Yield gate ≥40% MET (12/24=50%),
  bytes gate trivially met. Brief 144 auto-`.extern` worked
  on overlay chunks too. **Structural collision surfaced**:
  `data_02101928` skipped because its `.word data_021017f4`
  ref can't resolve — `data_021017f4` is a subsumed
  placeholder inside brief 155's bundle TU. 3 workaround
  sketches filed for brief 161 (cloud, queued). Created
  `extract/eur/arm9/arm9_ovNNN.bin` symlinks for ov002/6/7/21
  (generator's expected path didn't match actual layout —
  also brief 161 cleanup candidate). 3-region SHA1 PASS +
  27/27 OK preserved. Wave 1 closes; brief 161 wave 3
  scope = remaining ~12 + 3 deferred (subsumed-ref + 14.8 KB
  mega + 4.9 KB).
- **PR #590 — cloud / brief 159 generator flag + reverse-
  lookup tool.** ✅ **Part 1**: `--section {auto,rodata,data}`
  flag added to `cluster_c_pattern3_gen.py`. Auto-detect via
  `_parse_section_header()` reads delinks.txt section table to
  pick the section covering `[start, end)`. Default `auto`,
  falls back to `rodata` for back-compat. 5 new tests.
  **Part 2**: `tools/find_ov004_rodata_pointer_targets.py`
  enumerates ov002 relocs into ov004's `.rodata` range.
  **Empirical result against EUR**: 4001 cross-overlay refs
  across 219 distinct ov004 slots. 19 new tests.
  Top-referenced: `data_ov004_021e2b15` (363 refs).
  **Critical observation**: `data_ov004_021e2efc` (brief
  154's known-fail) has 153 refs — has BOTH byte coherence
  AND cross-overlay pressure, yet kind-flipping broke SHA1.
  Confirms brief 156's "byte coherence ≠ SHA1 safety" finding:
  the two signals together still aren't sufficient. SHA1
  gate remains authoritative. **Path-2 infrastructure
  shipped** (orthogonal-to-byte-coherence); brief 160
  (decomper) tests the hypothesis with per-slot claims.
  Suite 1808/1808. Brain pushed F541 + MD022 lint fixes.

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
  `symbols.txt`. Brief 154 (cloud, queued) takes the
  reclassification research as the next step.
- **PR #579 — cloud / brief 152 cluster B size-1/2 workarounds.**
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
- **PR #576 — cloud / brief 150 low-n WITH_TERMINATOR.** Option
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

**Decomper — one HIGH brief queued (path-2 worked examples):**

- **Brief 160 (HIGH, NEW)** — `decomper/ov004-rodata-veneer-trigger-claims`.
  First production use of brief 159 Part 2's reverse-lookup
  tool. Pick 3-5 high-reference ov004 `.rodata` slots from
  `docs/research/ov004-rodata-pointer-targets.md`, claim each
  as a Pattern 1 `.c`, **per-slot SHA1 round-trip** to observe
  whether veneer count drops by 1. **Path-2 hypothesis test**
  (orthogonal-to-byte-coherence — symbol stays `data`-kinded;
  no lcf re-emission shift). Outcome determines brief 162+
  shape (scale-up if validated, alternative pivot if not).

**Cloud — one MEDIUM brief queued (subsumed-ref bundle fix):**

- **Brief 161 (MEDIUM, NEW)** — `cloud/pattern3-subsumed-ref-resolution`.
  Fix the structural collision brief 158 surfaced. Pattern 3
  chunks need to reference subsumed placeholders hidden
  inside brief 155's bundle TUs. Sketch 2 chosen (cleanest):
  bundle TUs export inner placeholders via `.global` aliases
  at correct offsets. Convert `data_021017f0` bundle as
  worked example; optionally ship `data_02101928` Pattern 3
  chunk end-to-end. 1-2 regression tests pinning the new
  shape.

## Active clusters (post-SHA1 polish wavefront)

- **Cluster A** — `.rodata` (briefs 132 → 139 main run, then post-SHA1
  follow-up via 141). Largely drained.
- **Cluster B** — main `.data`. **EFFECTIVELY CLOSED**: true scalars
  174/174 (brief 143), pointer pool 23/23 (brief 149), size-1/2
  overlay 18/18 (brief 153), size-1/2 main 1/1 (brief 152), W6-
  rejected (value=0 size=4) main 18/21 (brief 155). 3 deferred
  W6-rejected candidates remain (sit between already-claimed
  wave-2 single-int TUs; wave-2 rewrite needed). Recipe locked
  for both bundle-with-zero-pad and bundle-with-value=0 shapes.
- **Cluster C / D-1 / D-2** — ov004 sub-clusters. 31 `.data` syms
  (brief 141) + 14 `.rodata` syms at n=9 (brief 147) + 28
  `.rodata` syms (brief 151, 22.5 KB block included) = **73 total**.
  Veneer count n=9 lower bound — dropping below 9 requires
  reclassifying ARM-code-as-data symbols (brief 154 falsified
  the naive byte-pattern approach; brief 156 cloud spot-disasm
  recalibrates the heuristic).
- **Cluster D-3** — complex nested struct arrays. **Wave 1
  shipped 9 chunks / 6,664 bytes (brief 157, main-only); wave
  2 shipped 12 chunks / 5,852 bytes across 5 modules (brief
  158, main + ov002/6/7/21)**. 21 / 33 base candidates drained
  in 2 waves; ~12 remain plus 3 deferred (subsumed-ref
  collision `data_02101928` — unblocked by brief 161 cloud
  bundle-alias fix; mega `data_020c9694` 14.8 KB +
  `data_020c7b44` 4.9 KB).
- **Cluster D** — `.bss`/zeros (briefs 130 + 142 framework). Continuing
  via the W7 patcher (now fully general 134 → 142 → 146 → 150).

## Worktree convention — isolation per agent, two equivalent mechanisms

Each agent runs in its own worktree to prevent parallel-session
interference that bit briefs 138 + 140 earlier. **AGENTS.md is the
canonical spec** (worktree-convention section there now covers both
mechanisms — updated in this brain-PR). Two mechanisms are
equivalent:

- **Mac convention (manual sibling worktrees):** `~/Dev/gx-spirit-
  caller`, `~/Dev/gx-spirit-caller-decomper`, `~/Dev/gx-spirit-caller-cloud`
  — three siblings at the same depth, set up once via `git worktree
  add`. Each has its own `orig/` baseroms. Adopted during the
  SHA1-milestone arc; PR #564 documented this in state.md.
- **Windows convention (Claude Code automatic sandboxes):** Claude
  Code creates per-session worktrees inside `.claude/worktrees/<auto-
  name>/` for each agent. No manual setup. They share the main
  checkout's `orig/` baseroms. Side-effect: `gh pr merge --delete-
  branch` may fail to clean up the local branch while the agent
  session is active — harmless, server-side merge still succeeds.

Brief 142's clean cloud-side work + brief 143's clean decomper-side work
were the validation that worktree separation (either mechanism) is
sufficient.

## Brain-pattern locked

- **Self-merge by default.** Brain reviews + merges autonomously per
  cntrl_alt_lenny's stated working pattern. User gets the cloud /
  decomper messages afterward, doesn't gate each merge.
- **PR-URL deliverable.** Every agent message MUST end with "push the
  branch, run `gh pr create`, reply with the PR URL." Brain verifies
  origin before claiming review-ready; PRs missing from origin → ask
  user to nudge the agent rather than silently waiting.
- **Verify gate is now 3-region SHA1 PASS** (was 24/27 module check
  before brief 140). For tools-only PRs that don't touch the build
  path, EUR-only SHA1 PASS is sufficient evidence.

## Next-brain TODO

1. **Verify + merge decomper brief 160 PR** when it opens. Gate:
   3-region `ninja sha1` PASS + 3-region 27/27 modules OK on
   all kept claims. 3-5 high-reference slots tried; per-
   candidate report with PASS+drop / PASS+no-drop / FAIL.
   Outcome determines brief 162+ scope (scale-up vs alternative
   pivot).
2. **Verify + merge cloud brief 161 PR** when it opens. Gate:
   3-region SHA1 PASS preserved + regression tests pin bundle-
   alias shape. Optional `data_02101928` end-to-end ship
   validates the unblock.
3. **Scope brief 162+ candidates (queue after 160 + 161):**
   - **If brief 160 path-2 validates**: scale-up wave claiming
     dozens of high-reference slots (decomper).
   - **If brief 160 path-2 fails**: pivot to path 1 (cautious
     reclassification with per-candidate SHA1 gate per brief
     156 hand-off) OR mega-array work (30 KB main).
   - **If brief 161 lands**: D-3 wave 3 brief (decomper) to
     ship `data_02101928` + the 3 deferred mega/subsumed
     candidates.
   - **Cross-region cluster A apply** — port 1443 EUR cluster
     A symbols to USA + JPN.
   - **3 cluster B value=0 deferred candidates** — needs wave-2
     TU rewrite of adjacent single-int TUs.
   - **Cross-region cluster A apply** — port 1443 EUR cluster A
     symbols to USA + JPN.
   - **Cluster D-3 via Pattern 3 generator** — ~20 complex
     nested structs.
4. **Watch for any new wall hypotheses** in upcoming wave PRs.
   Standing rule since brief 084's "3 walls not 1" methodology
   lesson: pre-empt symptom-vs-mechanism classification by requesting
   a cloud codegen-sweep brief before any wall gets a P-N or C-N
   number. C-23 candidate (MMIO register-base folding) from brief 086
   remains pending cloud sweep classification.
5. **Pre-existing carryovers (unchanged):**
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings.
   - `match-invariants` not yet a required branch-protection check.

## Cross-machine handoff notes

User alternates brain between Windows PC and Mac. The role is tied to
the local machine (toolchain + baserom on disk), not to a specific
Claude session. State.md is the bridge. Standing conventions:

- **Working pattern:** brain reviews + merges autonomously; user
  receives the cloud / decomper messages afterward.
- **Verify command (Windows):** `python tools/configure.py eur &&
  ninja sha1 && python tools/configure.py usa && ninja sha1 && python
  tools/configure.py jpn && ninja sha1` — substitute `./dsd` and
  POSIX paths on Mac.
- **Memory per-machine:** Each side's `~/.claude/projects/...` memory
  doesn't follow. State.md is the bridge.
- **Worktrees:** see *Worktree convention* above; 3-worktree split is
  now standard.

## New agents?

No. Continuing with 4-slot setup (brain + decomper + cloud +
auto-progress-badge bot).
