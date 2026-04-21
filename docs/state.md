# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-21 morning, after the overnight merge wave
(10 PRs) brought main to `bf1e978`. cntrl_alt_lenny authorised cloud
to refresh this file directly since after the PR #24 split it was
still showing yesterday's pre-merge state.

**Baseline:** `ninja rom` succeeds, `./dsd.exe check modules` reports
24/27 OK. ARM9 main / DTCM / overlay 4 still fail — expected,
placeholder-symbol artifacts per CLAUDE.md, not caused by agent work.

**Matched function count:** 17 (unchanged since 2026-04-20). All in
overlay 5: 12 × 4-byte `bx lr` stubs plus 5 easy-tier leaves from
PR #11 (`021ab0fc`, `021ac9c8`, `021acacc`, `021acad4`, `021ad048`).
Decomper hasn't opened a match PR this cycle — brief 003 (`__sinit`
bulk) is scoped and waiting for pickup.

## Merged overnight (in landing order)

Brain confirmed wave order: 28 → 30 → 31 → 29 → 27 → 33 → 32 → 23 →
24 → 25. Main tip: `bf1e978`.

- **PR #28** — `.editorconfig`. Cross-editor tab / newline / charset
  defaults so mixed PC/Mac/web sessions don't whitespace-thrash.
- **PR #30** — `.github/PULL_REQUEST_TEMPLATE.md` + structured issue
  templates. Review handoffs now follow a consistent shape.
- **PR #31** — `tools/generate_briefs_index.py` + seeded
  `docs/briefs/README.md`. Briefs have an auto-regenerated index.
- **PR #29** — `.github/workflows/labeler.yml` + `.github/labeler.yml`
  (cloud). Auto-labels every PR by `area:*` path family and
  `agent:*` head-branch prefix. Self-bootstrapping `gh label create`.
- **PR #27** — `tests/test_analyze_symbols.py`, 56-test unittest
  suite + `tests.yml` workflow (cloud). Pins analyzer behaviour
  against schema drift; runs in ~80ms.
- **PR #33** — `tools/update_progress_badge.py`. README progress
  badge now refreshes from `progress.py` output on every main push.
- **PR #32** — ruff + markdownlint CI, plus preexisting findings
  fixed (brain). Found 5 "unused" imports in PR #27's test file that
  are actually smoke-imports verifying the public API surface —
  interaction-only issue; fix in-flight as PR #34.
- **PR #23** — `.github/workflows/analyzer.yml` + `tools/ci_format_diff.py`
  + analyzer `--against` / `--diff-json` flags (cloud). Posts a
  tier-delta comment on every PR vs `main`. Upserts so the timeline
  isn't spammed.
- **PR #24** — split State of play out of `AGENTS.md` into
  `docs/state.md` (cloud). AGENTS.md: 339 → 253 lines.
- **PR #25** — Cloud autonomous-work policy (cloud). Formalises what
  cloud may ship unbriefed (tools/, CI, docs, analyzer changes) vs
  what needs a brief (libs/nitro/, libs/runtime/).

## Closed without merging

- **PR #26** — wiki seed attempt. Near-verbatim duplicate of
  `CLAUDE.md`; brain closed it rather than maintain two drifting
  sources of truth. Reopen as a "CLAUDE.md → wiki generator" (script
  that publishes one-way) if we revisit.

## In flight

- **PR #34** — `claude-brain/lint-fix-test-smoke-imports`. Ruff F401
  waiver for the test file's intentional smoke-imports. Narrow fix;
  brain's own follow-up to PR #32 / #27 interaction.
- **`claude-pc` → brief 003.** `__sinit` bulk match ready to pick up.
  `docs/briefs/003-sinit-bulk-match.md` has the scope: match one
  `0x2c`-byte `__sinit_*` in a passing overlay, propagate to its 43
  same-(module,size) siblings via `tools/rename_symbol.py`. No PR
  yet — decomper hasn't started this cycle.
- **`claude-cloud`** — autonomy is now formal per PR #25. Docs
  restructure + CI + tools/analyzer-improvements all unbriefed-OK.
  `libs/nitro/` and `libs/runtime/` still need briefs.

## Next-brain TODO

1. Merge PR #34 (your own F401 waiver). One-line fix, no functional
   impact — self-merge when cntrl_alt_lenny is AFK per AGENTS.md.
2. When `claude-pc` ships its first brief-003 PR, the analyzer's
   tier-delta comment (PR #23) should light up automatically — spot-
   check the first one looks sensible. Re-run `analyze_symbols.py
   --diff` locally to cross-verify.
3. Stale remote branch to clean:
   - `claude-pc/ov005-easy-tier` (PR #11 merged). Cloud's sandbox
     gets HTTP 403 on `git push --delete`; any PC session or the
     GitHub UI can delete in one click.
4. If brief-003's first match uncovers a real `nn_hook_ctor_list` or
   similar `libs/runtime/sinit.c` need, scope that as brief 004 for
   cloud. Until it surfaces, no speculative libs/ work.
5. The `claude/*` (no agent suffix) branches in recent remote
   fetches — `claude/improve-wiki-formatting-YhqJP`,
   `claude/add-editorconfig` — came from GitHub's built-in Claude
   integration, not our named agents. They land as normal PRs; keep
   an eye on whether they respect AGENTS.md scope.

## New agents?

Still no. Brain + decomper + cloud slot-split is holding under
~24 merged PRs in the first full working day. Reopen the question if:
- Asset pipelines (graphics / audio) become a decomp target — likely
  a dedicated `asset-pc` agent at that point.
- PR review latency becomes the bottleneck (brain backlogged) — at
  which point a second brain-class agent on a different machine
  could help, per the existing handoff-is-stateless design.
