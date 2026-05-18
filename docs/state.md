# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-18, post-#565 + #566 merge, brief 146 queued
(cloud patcher-fix). Brain back on Windows after the long Mac stretch
that ran briefs 087 → 145. **🎉 SHA1 FINAL GATE PASSES** across all 3
regions as of brief 140 (PR #558) — the project's original goal is
achieved. Current wavefront is **post-SHA1 polish** (cluster work +
patcher generalisation + Pattern 3 tooling) — work that doesn't move
SHA1 (it's already green) but improves byte-coverage discipline and
makes future ROM-rebuild contributions safer.

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

- **PR #565 — cloud / brief 144** (Pattern 3 generator extern emission
  fix). Closes long-standing generator gap surfaced in briefs 135 +
  139: `tools/cluster_c_pattern3_gen.py` now emits `.extern` decls
  automatically for every `.word <name>` reference not locally defined.
  Removes per-chunk hand-edits (1-5 externs were manually added on
  every Pattern 3 wave to date — 14 chunks). +12 tests
  (`TestCollectExternalRefs` + `TestGenerateChunkExternEmission`),
  1770/1770 suite. 3-region `ninja sha1` PASS preserved.
- **PR #566 — decomper / brief 145 (BLOCKED writeup)**. Decomper
  hit a residual bug in brief 142's patcher generalisation:
  `_fix_ctor_and_pad` still assumes a fixed 16-byte input shape, but
  at `n < 86` mwldarm emits only 12 bytes (no `WRITEW(0)`
  terminator). Patcher over-reads by 4 bytes → output is 4 bytes
  short → SHA1 fails. **0 source-level claims shipped.** Decomper
  filed [`docs/research/ov004-rodata-patcher-blocker.md`](research/ov004-rodata-patcher-blocker.md)
  with the diagnostic, math, and recommended fix shape. Baseline
  preserved (EUR `ninja sha1` PASS); no broken source-side changes
  shipped. Correct way to handle a blocker — characterise + file
  research note + don't break SHA1.

## In flight (post this brain-PR)

**Open PRs: 0** once this brain-PR lands.

**Cloud — one HIGH brief queued:**

- **Brief 146 (HIGH, NEW)** — `cloud/patcher-ctor-terminator-detection`.
  Fix the residual bug in `tools/patch_ov004_veneers.py` that brief
  145 surfaced. Two-part: detect ctor terminator presence (bytes 4-7
  of post-splice ctor region == zero → 16-byte shape; non-zero → 12-byte
  shape); set `fix_end` accordingly. Update
  `expected_output_delta_for(n)` for variable net delta. Tests pin
  output size + first-100-byte hash for `n ∈ {86, 9, 0}`. Critical:
  3-region SHA1 PASS must hold for both n=86 (historical case) AND
  n<86 (new case with one representative ov004 `.rodata` claim).

**Decomper — parked:**

- **Brief 147 (HIGH, QUEUED — gated on brief 146)** — retry of brief
  145. Ship ≥ 20 ov004 `.rodata` cluster claims (Pattern 1 .c +
  Pattern 1 .s + Pattern 3 chunks via brief 125 generator). Brain
  scopes the full brief once brief 146 lands.

## Active clusters (post-SHA1 polish wavefront)

- **Cluster A** — `.rodata` (briefs 132 → 139 main run, then post-SHA1
  follow-up via 141). Largely drained.
- **Cluster B** — 60 true scalars opened in brief 143 (PR #561); wave 1
  done. Wave 2/3 self-extends pending decomper next slot.
- **Cluster C / D-1 / D-2** — ov004 sub-clusters (brief 141 sweep). 31
  symbols. Ready for source-level claims once brief 146 fixes the
  patcher.
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

1. **Verify + merge cloud brief 146 PR** when it opens. Gate:
   3-region `ninja sha1` PASS for n=86 historical case AND n<86 new
   case (decomper's research note has the reproducer). Watch for any
   regression of the 1770+ test suite.
2. **Scope brief 147** (decomper retry of brief 145) once 146 lands.
   Same target as 145 (≥ 20 ov004 `.rodata` cluster claims) but now
   with a working patcher. Decomper's PR #566 body lists three
   confirmed reproducer shapes (Pattern 1 .c, Pattern 1 .s, Pattern 3
   chunk) — all should now ship cleanly.
3. **Watch for any new wall hypotheses** in upcoming wave PRs.
   Standing rule since brief 084's "3 walls not 1" methodology
   lesson: pre-empt symptom-vs-mechanism classification by requesting
   a cloud codegen-sweep brief before any wall gets a P-N or C-N
   number. C-23 candidate (MMIO register-base folding) from brief 086
   was the last one of these; nothing new in the recent waves.
4. **Pre-existing carryovers (unchanged):**
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
