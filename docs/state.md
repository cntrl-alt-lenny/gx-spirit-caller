# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-18 evening, post-#569 + #570 merge, briefs
147 + 148 queued. Brain on Windows. **🎉 SHA1 FINAL GATE PASSES**
across all 3 regions as of brief 140 (PR #558) — the project's
original goal is achieved. Current wavefront is **post-SHA1 polish**
(cluster work + patcher generalisation + Pattern 3 tooling) — work
that doesn't move SHA1 (it's already green) but improves byte-coverage
discipline and makes future ROM-rebuild contributions safer.

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

Subsequent briefs (141 → 145) ran the post-SHA1 polish wave: ov004
cluster sweep (brief 141), 3-region 27/27 module baseline canonicalised
(brief 136 → 141), patcher generalisation for variable veneer counts
(brief 142 — `n ∈ [0, 86]`), first post-SHA1 decomp wave (brief 143 —
cluster B opened with 60 true scalars), Pattern 3 generator extern
emission fix (brief 144 — PR #565, just merged), ov004 `.rodata`
cluster wave (brief 145 — PR #566, **BLOCKED** on residual patcher bug).

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

## Today's merges

- **PR #569 — decomper / brief 143 cluster B wave 2.** 114 true
  scalars in main `.data`, 100% yield, 456 bytes drained. Self-
  extend authorisation from wave 1 cleared trivially. 3-region
  `ninja sha1` PASS preserved + 3-region 27/27 modules OK. Cluster
  B true scalars effectively drained at size=4 W6-eligible; ~35-50
  candidates remain in size-1/2 + pointer + W6-rejected sub-pools
  (gating dependency: brief 148 below).
- **PR #570 — cloud / brief 146 patcher ctor-terminator detection.**
  Fixes the residual bug in `tools/patch_ov004_veneers.py` that
  blocked brief 145. Two-path `_fix_ctor_and_pad`: WITH_TERMINATOR
  (n=86, +8 net, preserves historical SHA1 PASS bit-for-bit) and
  NO_TERMINATOR (0 < n < 86, +12 net, new). **Notable: cloud
  empirically corrected the brief's recommended discriminator
  byte offset** — brief said bytes 4-7, but those are zero in both
  cases; cloud used bytes 12-15 where the `.LZN` data marker
  differs from zero pad. Pinned with a dedicated test. Unblocks
  ov004 `.rodata` source-level work.
- **PR #567 (earlier today) — brain / brief 146 doc + state.md
  refresh post-SHA1.** Caught state.md up from brief 086 (where
  Windows brain left off in the previous session) to current main.
- **PR #568 (earlier today) — brain / worktree docs fix.** AGENTS.md
  + state.md now document both worktree mechanisms (Mac manual
  sibling worktrees vs Windows Claude Code automatic sandboxes).
- **PR #565 (earlier today) — cloud / brief 144 Pattern 3 generator
  extern emission fix.** Removes per-chunk hand-edits for every
  future Pattern 3 wave (14 chunks shipped to date had manual
  `.extern` lines). 1770/1770 tests post-merge.
- **PR #566 (earlier today) — decomper / brief 145 BLOCKED writeup.**
  Diagnosed the patcher bug brief 146 now fixes. No source-side
  changes shipped (correct discipline — characterise + file
  research note + don't break SHA1).

## In flight (post this brain-PR)

**Open PRs: 0** once this brain-PR lands.

**Decomper — one HIGH brief queued (now unblocked):**

- **Brief 147 (HIGH, NEW)** — `decomper/ov004-rodata-cluster-wave-retry`.
  Retry of brief 145, now unblocked by brief 146. Ship ≥ 20 ov004
  `.rodata` cluster claims across Pattern 1 .c, Pattern 1 .s, and
  Pattern 3 chunks (via brief 125 generator + brief 144's auto-
  `.extern` emission). All three reproducer shapes decomper used to
  diagnose brief 145's bug should now ship clean. Self-extend gate
  unchanged (≥40% yield + ≥250 B).

**Cloud — one MEDIUM brief queued (research):**

- **Brief 148 (MEDIUM, NEW)** — `cloud/cluster-b-pointer-typedef-research`.
  Survey cluster B's remaining ~10-20 pointer slots, classify the
  pointee for each, choose a recipe (probably typed-pointer `.c` or
  `.word <name>` in `.s`), and ship 1-3 worked examples with 3-region
  SHA1 PASS to validate. Optional cheap side: spot-check `unsigned
  char` / `unsigned short` recipes for the ~14 size-1/2 candidates.
  Unblocks cluster B wave 3 (which would be **brief 149 (decomper)**,
  scoped after this lands).

## Active clusters (post-SHA1 polish wavefront)

- **Cluster A** — `.rodata` (briefs 132 → 139 main run, then post-SHA1
  follow-up via 141). Largely drained.
- **Cluster B** — main `.data`. **True scalars drained** after brief
  143 wave 2 (cumulative 174 claims / 696 bytes). ~35-50 candidates
  remain in size-1/2 + pointer + W6-rejected sub-pools, gated on
  brief 148 cloud recipe research.
- **Cluster C / D-1 / D-2** — ov004 sub-clusters (brief 141 sweep). 31
  symbols. **NOW UNBLOCKED** by brief 146; brief 147 is the wave
  that ships them.
- **Cluster D** — `.bss`/zeros (briefs 130 + 142 framework). Continuing
  via the variable-veneer-count patcher post-146.

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

1. **Verify + merge decomper brief 147 PR** when it opens. Gate:
   3-region `ninja sha1` PASS + 3-region 27/27 modules OK. ≥ 20 ov004
   `.rodata` claims expected; mix of Pattern 1 .c, Pattern 1 .s, and
   Pattern 3 chunks (via brief 144's now-turnkey generator).
2. **Verify + merge cloud brief 148 PR** when it opens. Smaller gate:
   3-region SHA1 PASS on the 1-3 worked-example claims + new research
   note markdownlint clean. Watch the recipe choice — if cloud picks
   `.word <name>` in `.s` (cluster A precedent), confirm it works
   cleanly in `.data` context too.
3. **Scope brief 149 (decomper cluster B wave 3)** once brief 148
   lands. Apply cloud's recipe to the remaining ~10-20 pointer
   candidates + ~14 size-1/2 scalars. Likely splittable into two
   waves if the recipes differ.
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
