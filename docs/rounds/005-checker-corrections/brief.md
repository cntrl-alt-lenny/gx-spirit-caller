# 005-checker-corrections: Finish round C: close the checker's gaps, on Windows

Tier: 2
Mode: implementation
Supersedes: 004-trustworthy-checker. Its work was reviewed at
`1d3fdd40e90c` and items 1 and 2 are sound (Brain re-derived the gate's exit
status under Windows PowerShell 5.1: `$LASTEXITCODE` 2 through `Tee-Object`
and through `--log`, last line `gate3: GATE EXIT 2`). It cannot be accepted:
acceptance criterion 4 (a denied edit shown) was never met, the protections
do not reach the project's own seat worktrees, the fake-match lint and both
baselines can be passed without writing real C, and `AGENTS.md` states Codex
enforcement that was never observed. Nothing ran on Windows, where the
factory will run. This round starts from that work and finishes it. Nothing
in round 004 is redone.

## Goal

When this round is done, the round-004 checker plus the corrections below is
one that round E's unattended factory can use as its reviewer: `GATE PASS`
means the ROMs, the references and the fake-match lint all pass; none of
them can be turned green by a baseline edit; the agent settings cover the
worktrees seats actually work in; `AGENTS.md` claims only what was observed;
and all of it was run on the owner's Windows 11 desktop.

## Context

**Read:** your role card, `AGENTS.md`, this brief, round 004's brief and
both its reports in `docs/rounds/004-trustworthy-checker/` (the Verifier's
findings are the defects below), and the files round 004 added:
`tools/gate3.py`, `tools/check_references.py`, `tools/check_fake_matches.py`,
`tools/protected_paths.py`, `.claude/settings.json`, `.codex/hooks.json`, and
their tests. Do not read the research archive.

**Where to work.** On the owner's Windows 11 desktop, in
`.worktrees/worker-005` inside the primary checkout, created with
`git worktree add`, baseroms hard-linked by `python tools/link_baseroms.py
.worktrees/worker-005` run from the primary checkout. Use `python` (3.11 or
newer) for project scripts; no Unix shell may be required by anything you
add. Downloaded tools (`dsd.exe`, the compiler) arrive on the first build.

**CI at the start commit:** draft pull request 1631 (head `1d3fdd40e`,
not for merge). Read its checks with `gh pr checks 1631`.

**Brain's decision on round 004's first open question:** the reference check
and the fake-match lint become part of the gate's verdict. The factory will
act on one verdict, so a separate evidence step it can skip is not a check.

## Scope and non-goals

**In scope: six corrections.**

1. **The gate decides everything.** `gate3.py --scope all` runs the
   reference check for the regions it built and the fake-match lint, and
   `GATE PASS` / `gate3: GATE EXIT 0` requires both. The regions, tests and
   ROM verdict rules are otherwise unchanged.
2. **Fake-match lint: fix the class, not the examples.** A raw data directive
   in an `asm` body is caught wherever it stands on the line and however it
   is spelled: after a label, through a `#define` alias, and any other
   spelling mwcc accepts that you find. Also `while (0U)` / `while (false)`
   for `do-while-zero`, and `volatile` reached through a `typedef` or as
   `T * volatile p` for `volatile-local`. Establish whether a check on the
   built objects (for example data words in the `.text` of a C unit) catches
   the class regardless of spelling, and use it if it does. Then try to get
   a fake match past your own lint and report every attempt.
3. **Baselines can only shrink.** CI fails when either baseline
   (`tools/reference_baseline.txt`, `tools/fake_match_baseline.txt`) gains an
   entry against the pull request's merge base, so `--write-baseline` can no
   longer launder a new finding. Baseline entries identify the individual
   finding (not a per-unit count), so fixing one reference and breaking
   another in the same unit fails. Removing a stale entry must not require
   recording anything new. This runs inside an existing required job.
4. **Protections reach the seat worktrees.** The Claude Code rules and the
   Codex hook deny the protected paths inside `.worktrees/<seat>/` both when
   the session starts in the primary checkout and when it starts in the
   worktree. Add the two baseline files to the protected list.
5. **Show a denied edit.** In a fresh Claude Code session (`claude -p` with
   `--permission-mode acceptEdits`), attempt an Edit-tool change to a
   `.sha1` file and to `build.ninja`, once from inside your worktree and once
   from the primary checkout aimed at `.worktrees/worker-005/`, and a Bash
   redirect or `tee` to a protected path. Record the Claude Code version, and
   check against the permissions documentation the Verifier's reading that
   `tee` targets are checked only from v2.1.269 and redirects from v2.1.257.
   If `claude -p` fails to
   authenticate, stop this item only, say so, and continue the rest. Codex
   CLI is not installed on this machine; do not install it.
6. **`AGENTS.md` and docs say only what was observed.** The "Agent settings"
   row names what was shown denied, on which tool and version, and says the
   Codex hook is untested, and what the Codex issue the Verifier cited
   (openai/codex 27833) says about PreToolUse and `apply_patch`, after you
   have read it yourself. Correct the `tee` claim in
   `tools/protected_paths.py`'s docstring. Update the evidence table for
   item 1. Keep `AGENTS.md` at or under 1,738 words.

**Not in scope:** round D (one source tree), round E (the factory), the
framework 3.1.0 update (its own round next), fixing any source file a check
flags (list it, do not change `src/`), GitHub settings, the ruleset, or the
set of required checks. No change under `src/`, `libs/`, `include/`,
`config/`, `assets/`, `orig/` or to `*.sha1`, and no framework file edited.

## Invariants

- All three ROMs rebuild byte-identical (`AGENTS.md`, Invariants).
- The five required checks keep their names and run on every pull request.
- A new check is trusted only after it is shown failing on a known-bad input
  (`AGENTS.md`, Evidence).
- No personal paths or email addresses in `AGENTS.md`, `CLAUDE.md`,
  `docs/state.md`, `docs/agents/` or `docs/rounds/`, including your report;
  quoted text in your report carries no live Markdown links.
- The gate is never piped; its log is written with `--log`.

## Acceptance criteria

1. On Windows, `gate3.py --scope all --log <log>` passes on the tree with
   all three `SHA1 PASS`, the reference check and the lint reported inside
   the log, and last line `gate3: GATE EXIT 0`; and a scratch copy with one
   wrong reference, and one with a fake match, each ends `GATE EXIT` non-zero.
2. The lint flags every variant in item 2 and every bypass you found; each
   is a test that fails on round 004's lint and passes now.
3. A pull request that adds a baseline entry fails the CI step, shown by
   running that step's command locally against a merge base with an added
   entry (and with a swapped entry in one unit); removing a stale entry
   passes.
4. `protected_paths.py` and the Claude rules protect each brief-listed path
   under `.worktrees/<seat>/` from both starting points, shown by the hook
   run and by item 5's session.
5. Item 5's denials are shown with the tool's own output, or its failure to
   authenticate is quoted.
6. `unittest`, `pytest` and `ruff check .` are clean on Windows,
   `check_ci_contract.py` passes, and `fw.py check` reports 0 errors and 0
   warnings.

## Required evidence

1. The gate log check from `AGENTS.md` in its PowerShell form, verbatim, on
   the final commit, plus the log lines that show the reference check and
   the lint ran; and the two known-bad gate runs' last lines.
2. Each lint bypass you tried, the lint's output before (round 004's lint)
   and after.
3. The CI step's name and job, and its local runs for added, swapped and
   removed entries.
4. The `protected_paths.py` runs for the worktree paths from both roots, and
   the Claude Code session output with its version.
5. `python -m unittest discover -s tests`, `python -m pytest -q tests`,
   `ruff check .`, `python tools/check_ci_contract.py`,
   `python tools/fw.py check`, and the word count of `AGENTS.md`.
6. Every source file or symbol the checks flag on the final tree, listed,
   not fixed, and whether the lint's baseline changed.
7. Every sentence added to or removed from `docs/state.md`, if it changes.
