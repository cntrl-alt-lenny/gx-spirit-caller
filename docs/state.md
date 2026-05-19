# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-19 morning, post-#572 + #573 merge, briefs
149 + 150 queued. Brain on Mac. **🎉 SHA1 FINAL GATE PASSES** across
all 3 regions (brief 140, PR #558) and continues to hold after 4
more post-SHA1 rounds. Current wavefront is **post-SHA1 polish** —
cluster B (B-true scalars drained 174/~180; B-pointer recipe locked
in brief 148), ov004 `.rodata` (3 reproducer shapes proven in brief
147), and incremental W7 patcher generalisation (134 → 142 → 146 →
150-queued).

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

- **PR #572 — decomper / brief 147 ov004 `.rodata` retry.**
  14 ov004 `.rodata` claims across all three shapes proven
  (Pattern 1 .c / Pattern 1 .s / Pattern 3 chunk). Brief 144's
  auto-`.extern` emission verified turnkey. **Brief 146 patcher
  fix validated at n=9**: NO_TERMINATOR path engaged correctly,
  3-region SHA1 PASS preserved + 3-region 27/27 OK.
  **Empirical patcher limit surfaced**: bisection found
  veneer_count < 9 triggers a NEW boundary — mwldarm continues
  emitting WITH_TERMINATOR shape at very low n while brief 146's
  n-inference defaults to NO_TERMINATOR, causing the byte-detect
  vs n-inference disagreement → safety check fires (correctly!).
  Decomper shipped 14 (under ≥20 target) without forcing the
  6 candidates that would have broken SHA1. Brief 150 below
  closes this last patcher boundary.
- **PR #573 — cloud / brief 148 cluster B pointer pool.**
  Research brief, three deliverables: (1) survey of 23 cluster B
  pointer candidates at `docs/research/cluster-b-pointer-pool.md`;
  (2) recipe locked: `extern char <pointee>; void *<slot> =
  &<pointee>;` (same shape as brief 121 / 130 D-1 wave 2) — 3
  worked examples covering 3 edge cases (unclaimed pointee /
  claimed-with-typed-array pointee / code-pointer) all SHA1 PASS
  in 3 regions; (3) size-1 spot-check FAILED with naive `unsigned
  char data_X = 0xAB;` (mwcc default 4-byte section alignment ≠
  orig byte-tight emission, 1308 byte diff). 3 size-1 workaround
  sketches filed for brief 149 stretch falsification: `.s` recipe,
  `__attribute__((aligned(1)))`, or group-claim bundling.

## In flight (post this brain-PR)

**Open PRs: 0** once this brain-PR lands.

**Decomper — one HIGH brief queued (recipe locked):**

- **Brief 149 (HIGH, NEW)** — `decomper/cluster-b-wave-3-pointer-apply`.
  Apply cloud's brief 148 pointer recipe to the remaining ~20
  cluster B pointer candidates. Recipe is locked: `extern char
  <pointee>; void *<slot> = &<pointee>;` (same shape as brief
  121 / 130 D-1 wave 2). Target ≥ 15 claims. Stretch: falsify
  exactly one of cloud's 3 size-1/2 workaround sketches (.s
  recipe / aligned(1) attribute / group-claim bundling). Self-
  extend gate unchanged.

**Cloud — one MEDIUM brief queued (patcher boundary):**

- **Brief 150 (MEDIUM, NEW)** — `cloud/patcher-low-n-with-terminator`.
  Close the low-n WITH_TERMINATOR boundary surfaced in brief 147.
  Brief 146 generalised the patcher for `0 < n < 86` as NO_TERMINATOR,
  but bisection found mwldarm continues emitting WITH_TERMINATOR
  at very low n (n=2 / n=7 broken; n=9 OK). Two options: (A —
  recommended) degrade n-inference from hard-check to warn, trust
  byte-detection truth alone; (B) recalibrate n-based heuristic
  against byte-detection at multiple n values. Decomper's brief
  147 funnel recommended Option A. Tests pin behaviour at n ∈ {0,
  2, 7, 9, 43, 86}.

## Active clusters (post-SHA1 polish wavefront)

- **Cluster A** — `.rodata` (briefs 132 → 139 main run, then post-SHA1
  follow-up via 141). Largely drained.
- **Cluster B** — main `.data`. **True scalars drained** after brief
  143 wave 2 (cumulative 174 claims / 696 bytes). **Pointer recipe
  locked** by brief 148 (cloud) — `extern char ... void *... = &...`
  shape, 3 worked examples shipped + 20 candidates remaining for
  brief 149 (decomper) to apply. ~14 size-1/2 candidates blocked
  on mwcc alignment recipe — 3 workaround sketches for brief 149
  stretch falsification. ~21 W6-rejected (unaligned or zero-valued)
  candidates remain — separate research (BSS handling).
- **Cluster C / D-1 / D-2** — ov004 sub-clusters. Brief 141 sweep
  shipped 31 `.data` syms. Brief 147 shipped 14 `.rodata` syms
  across 3 shapes at n=9. **Patcher empirical limit n<9 surfaced**
  (brief 147 funnel) — closes in brief 150 (cloud), unblocks brief
  151+ ov004 `.rodata` wave 2.
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

1. **Verify + merge decomper brief 149 PR** when it opens. Gate:
   3-region `ninja sha1` PASS + 3-region 27/27 modules OK. ≥ 15
   cluster B pointer claims via brief 148's locked recipe. Watch
   the optional size-1/2 stretch — if any of cloud's 3 sketches
   works, capture it; if all 3 fail, scope a follow-up alignment
   brief.
2. **Verify + merge cloud brief 150 PR** when it opens. Gate:
   3-region SHA1 PASS preserved + tests pin n ∈ {0, 2, 7, 9, 43, 86}.
   Watch the choice between Option A (degrade n-inference to warn,
   trust byte-detection alone) and Option B (recalibrate n-based
   heuristic). Either should preserve the historical n=86 bit-for-
   bit SHA1 PASS.
3. **Scope brief 151 (decomper) once brief 150 lands** — ov004
   `.rodata` wave 2 to ship the additional ~6 sub-cluster candidates
   brief 147 had to leave on the table when the patcher safety check
   fired. Plus deeper sub-cluster drain from brief 141's sweep table.
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
