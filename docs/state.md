# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-19 evening, post-#582 merge + #581 HOLD,
brief 155 queued (decomper main size-1/2 drain). Brain on Windows.
**🎉 SHA1 FINAL GATE PASSES** across all 3 regions (brief 140, PR
#558) and continues to hold after 7 post-SHA1 rounds. Cluster B
size-1/2 overlay portion drained (brief 153, 6 bundles / 1560 B);
main portion (~13 candidates) queued as brief 155. Cloud's brief
154 PARTIAL — survey clean but worked-example reclassification
broke EUR SHA1, awaiting cloud revert.

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

- **PR #582 — decomper / brief 153 cluster B size-1/2 wave.** ✅
  **6 multi-symbol `.s` bundles** covering **1560 bytes** across
  ov002 (2 bundles) + ov006 (4 bundles), absorbing 34 placeholder
  neighbours. **Critical recipe adaptation:** decomper discovered
  brief 152's `.c` recipe FAILS on overlays — `tools/patch_module_
  literals.py` runs post-link on `arm9.bin` ONLY, not on overlays,
  so `.c`-bundled absorbed placeholders' `kind:load` relocs
  resolve to `0x00000000` on overlay link. First attempt dropped
  EUR SHA1 PASS → FAIL with 194 byte diffs in ov006. Adapted to
  Pattern-3-style multi-symbol `.s` chunks where each absorbed
  placeholder gets its own `.global` label; doesn't contradict
  brief 149's `.s` falsification (that was a single-symbol 1-byte
  chunk; the cascade is a section-size-not-multiple-of-4 issue,
  not a per-directive issue). 100% yield, 3-region SHA1 PASS,
  27/27 OK preserved.

### Holds (NOT merged this round)

- **PR #581 — cloud / brief 154 ov004 reclassification.** 🚧
  **HELD — EUR SHA1 PASS → FAIL on worked example.** Survey
  itself (`docs/research/ov004-rodata-misclassification-
  survey.md`, 622 candidates with confidence ratings) is clean.
  The 1 HIGH-confidence worked example — reclassify
  `data_ov004_021e2efc` from `data(any)` to `function(arm,
  size=0x0, unknown)` — broke EUR SHA1 from `1da50df7…b4f75` to
  `d83c6d20…fd3087`. Per brief 154's own success criterion
  ("if a reclassification causes a SHA1 break, the candidate
  was wrong; revert + lower confidence"), the candidate fails.
  Cloud needs to revert the `symbols.txt` edit, downgrade
  `0x021e2efc` from HIGH to MEDIUM in the survey + note the
  SHA1-break observation, and re-push the PR with just the
  survey + downgrade. Survey research itself is high-value;
  the worked-example failure is a self-falsifying data point
  the survey now incorporates.

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

**Decomper — one HIGH brief queued (main size-1/2 completer):**

- **Brief 155 (HIGH, NEW)** — `decomper/cluster-b-size-1-2-main-wave`.
  Apply brief 152's locked `.c` recipe (`unsigned int[N]` bundle)
  to drain cluster B's ~13 remaining MAIN-module size-1/2
  candidates. Critical: use the `.c` form (not brief 153's `.s`
  adaptation) — `patch_module_literals.py` resolves
  `kind:load` literals correctly on `arm9.bin`. Self-extend gate
  unchanged. Single-wave brief expected.

**Cloud — recovery on PR #581 (not a new brief):**

- Cloud has unfinished work on **PR #581 (brief 154 PARTIAL)** —
  revert the `symbols.txt` worked-example edit, update the
  survey doc to downgrade `0x021e2efc` confidence + note the
  SHA1-break observation as a self-falsifying data point, and
  re-push for re-verify. Survey-only re-ship preserves the 410-
  line research; brain merges once SHA1 PASS is confirmed.
  No new brief queued for cloud this round — finish #581 first.

## Active clusters (post-SHA1 polish wavefront)

- **Cluster A** — `.rodata` (briefs 132 → 139 main run, then post-SHA1
  follow-up via 141). Largely drained.
- **Cluster B** — main `.data`. **True scalars drained** (brief 143
  cumulative 174 claims / 696 bytes). **Pointer pool drained
  20/20** (brief 149) — recipe `extern char <pointee>; void *<slot>
  = &<pointee>;` is locked. **Size-1 workaround #1 (.s) falsified**
  (brief 149). Brief 152 (cloud, queued) tries workarounds #2 +
  #3 on the ~14 size-1/2 residue. ~21 W6-rejected (unaligned or
  zero-valued) candidates remain — separate BSS-handling research.
- **Cluster C / D-1 / D-2** — ov004 sub-clusters. 31 `.data` syms
  (brief 141) + 14 `.rodata` syms at n=9 (brief 147) = **45 total**.
  Brief 151 (decomper, queued) ships the ~6 deferred candidates +
  cluster A `.bss` (39 candidates from brief 141 sweep) + deeper
  drain.
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

1. **Verify + merge decomper brief 151 PR** when it opens. Gate:
   3-region `ninja sha1` PASS + 3-region 27/27 modules OK. ≥ 20
   ov004 source-level claims. At least one claim should drop `n`
   below 9 (validates brief 150 end-to-end on real source). Watch
   the patcher stderr note in the PR funnel — its appearance is
   expected and not a failure.
2. **Verify + merge cloud brief 152 PR** when it opens. Gate:
   3-region SHA1 PASS preserved + new research findings in
   markdownlint-clean note. Watch which workaround (if any)
   locks — that determines brief 153 shape.
3. **Scope brief 153+ candidates (queue after 151 + 152):**
   - **If brief 152 locks a size-1/2 recipe**: brief 153 =
     decomper cluster B size-1/2 wave (~13 candidates).
   - **If brief 152 falsifies all 3 workarounds**: brief 153 =
     cloud investigation into LCF script edits / mwcc flag survey.
   - **Cluster B value=0 (BSS handling)**: ~21 W6-rejected
     candidates — separate research.
   - **30 KB main mega-array** (`data_020b6ec4`) — biggest
     deferred Pattern 1 mega.
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
