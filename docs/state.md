# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-21 morning, post-#601 + #602 merge,
briefs 168 + 169 queued. Brain on Mac. **🎉 SHA1 FINAL GATE
PASSES** across all 3 regions (brief 140, PR #558) and
continues to hold after 14 post-SHA1 rounds. **🎉 First
path-2 production wave shipped** (brief 167): 6 ov004
`.rodata` claims at n=5; 4,464 bytes matched.
**🎉 Sub-5 state CONFIRMED REACHABLE** — `data_ov004_021e3de8`
demonstrably drops n=5 → n=3 (validates brief 160's
multi-block cascade hypothesis end-to-end). n=3 broke SHA1
on the new patcher boundary; brief 168 (cloud, queued)
closes it via same brief 164 walk-forward methodology. W7
patcher chain: 134 → 142 → 146 → 150 → 162 → 164 → **168
queued**.

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

- **PR #602 — decomper / brief 167 path-2 scale-up wave 1.**
  🔑 **First production wave of brief 164's walk-forward
  cluster detector.** 6 path-2 source claims kept on ov004
  `.rodata` at n=5; 4,464 bytes matched; 3-region SHA1 PASS.
  **🎉 Sub-5 state CONFIRMED REACHABLE**:
  `data_ov004_021e3de8` (band-1 slot with 3 veneer-target
  loads) dropped n from 5 → 3 — **first observed sub-5
  state** since brief 160 hypothesised the block-level
  cascade. Patcher broke SHA1 at n=3
  (`N_INFERENCE_OVERRIDES = {5: 8}` doesn't cover n=3);
  brief 168 (queued) extends coverage via same brief 164
  walk-forward methodology. Captured 9-veneer baseline
  target enumeration for brief 168+ tooling. Band-1 confirmed
  as only path to sub-5 (per brief 167 finding #5). Self-
  extend both gates met (86% yield + 4,464 B); further sub-
  5 claims gated on brief 168 patcher extension.
- **PR #601 — cloud / brief 166 generator label-kind fix.**
  Pattern 3 generator emits raw hex literals (`.word
  0xADDR`) for `kind:label(*)` cross-TU references; no
  `.extern` declaration. Closes brief 163's manual-patch
  gap on `data_020c7b44`. `_word_directive_for_target`
  helper centralises the label-vs-named branch.
  `sym_by_addr` upgraded from `dict[int, str]` to
  `dict[int, tuple[str, str]]` (name + kind). 2 new tests;
  suite 1836 → 1838. **Part 3 cross-verification**:
  regenerated brief 163's chunk and confirmed
  byte-functionally-identical to decomper's manual patch
  (only diff: trailing whitespace pre-existing pattern) —
  kept the hand-patched file to avoid cosmetic-churn
  commit. 3-region SHA1 PASS preserved (generator change
  is build-graph-invariant when no chunks regenerated).

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

**Decomper — one HIGH brief queued (cross-region cluster A apply):**

- **Brief 169 (HIGH, NEW)** — `decomper/cross-region-cluster-a-apply`.
  Highest-leverage cross-region wave on the backlog: port
  the 1,443 EUR cluster A `.bss` claims to USA + JPN.
  ~2,886 region-matches in one pass. Brief 116's region-
  config plumbing precedent applies. Cluster A is
  structural zero-fill (no per-region byte differences
  expected). Target ≥ 1,000 cross-region claims per region.

**Cloud — one MEDIUM brief queued (patcher n=3 extension):**

- **Brief 168 (MEDIUM, NEW)** — `cloud/patcher-n3-residual-fix`.
  Extend patcher low-n coverage to n=3 (and likely n=4, 2,
  1). Brief 167 reached n=3 for the first time via
  `data_ov004_021e3de8`; patcher broke SHA1 because
  `N_INFERENCE_OVERRIDES = {5: 8}` doesn't cover n=3. Same
  brief 164 walk-forward methodology applies. Opportunistic
  n=4/2/1 sampling if reachable from band-1 claims.
  Unblocks brief 170+ path-2 scale-up wave 2. W7 chain:
  134 → 142 → 146 → 150 → 162 → 164 → 168.

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
- **Cluster D-3** — complex nested struct arrays.
  **EFFECTIVELY CLOSED** post brief 163 wave 3 (9 chunks /
  ~12 KB shipped, including the 4.9 KB `data_020c7b44`
  mega). 4 waves total: brief 157 (9 / 6,664 B main) +
  brief 158 (12 / 5,852 B across 5 modules) + brief 161
  bonus (data_02101928 via brief 161 bundle-alias unblock)
  + brief 163 (9 / ~12 KB — 7 ov006 + 1 ov002 mid + 1 main
  mega). **~31 chunks / ~30 KB shipped to date.** Residue:
  2 hard candidates — `data_020c9694` (14.8 KB mega,
  deferred) + `data_020e0e70` (366 B, non-4-aligned size).
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

1. **Verify + merge decomper brief 169 PR** when it opens.
   Gate: 3-region `ninja sha1` PASS + 3-region 27/27 modules
   OK. ≥ 1,000 cross-region cluster A claims per region (USA
   + JPN). Watch the EUR baseline — must remain bit-identical
   (no regressions from any region-neutral source TU edits).
2. **Verify + merge cloud brief 168 PR** when it opens.
   Gate: 3-region SHA1 PASS preserved (current main n=9 +
   manual injection test at n=3). New regression test pins
   n=3 SHA1-PASSING behaviour. Watch for bonus low-n samples
   (n=4, 2, 1) if reachable from band-1 cascade.
3. **Scope brief 170+ candidates (queue after 168 + 169):**
   - **After brief 168 lands**: brief 170 = path-2 scale-up
     wave 2 at n=3 (decomper). Brief 167's band-1 enumeration
     is the candidate list.
   - **Cross-region cluster B / D-3 apply** — port the
     cluster B (~231) + cluster D-3 (~31) claims to USA +
     JPN. Similar leverage as brief 169.
   - **Cluster D-3 hard residue** (14.8 KB mega + 366 B
     non-aligned) — small cleanup.
   - **3 cluster B value=0 deferred candidates** — wave-2
     TU rewrite.
   - **Odd-aligned ov004 slot recipe** (brief 160 finding
     #4) — cautious decomper brief if scale-up needs it.
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
