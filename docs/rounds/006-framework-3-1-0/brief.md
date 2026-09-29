# 006-framework-3-1-0: Update the agentic framework to release 3.1.0

Tier: 1
Mode: implementation
Supersedes: none

## Goal

The project runs agentic-framework 3.1.0, installed by the framework's own
adopter, and the project-local workarounds that 3.1.0 makes unnecessary are
gone, while every project rule 3.1.0 does not carry stays. Round C's
protections are untouched.

## Context

**Read:** your role card, `AGENTS.md`, `docs/state.md`, this brief, and the
3.1.0 release notes, which include "What an adopter must do"
(`gh release view v3.1.0 -R cntrl-alt-lenny/agentic-framework`, or
`CHANGELOG.md` in the framework clone). Treat the notes as evidence of what
the release claims, and check each claim you rely on against the result.

**How to update.** Clone the framework at tag `v3.1.0` into a scratch
directory outside the project, then run its `tools/adopt.py <your worktree>
--update --dry-run`, read every line, then run it without `--dry-run`. The
release notes say what `replace`, `gone` and `other` lines mean.

**Project-specific points the release touches:**

1. **Prompt headers (framework issue 26).** `AGENTS.md` has a section,
   "Prompts and sign-off lines", that 3.1.0's `FRAMEWORK.md` and
   `fw.py prompt` now carry. Remove from it what the framework now carries;
   keep, in the shortest form, anything it does not (for example the
   `· message N` suffix, if the framework lacks it).
2. **The `fw.py status` false alarm (issue 18).** `AGENTS.md` tells agents to
   ignore a "not on GitHub yet" line for the `archive/*` tags. After the
   update, establish whether `status` still reports them; remove the
   paragraph only if it does not.
3. **Seat worktrees (issue 29).** 3.1.0 puts local seats in
   `.worktrees/<role>-<number>`. `AGENTS.md`'s "Where seats work" paragraph
   also holds project-only rules (the baserom hard link, never a clone beside
   the project); keep those and drop only what now duplicates the framework.
4. **The retired git hook (issue 25).** `docs/agents/framework.json` records
   `"hooks": true`, and `docs/state.md` (Parked) warns that an update could
   re-create `.githooks/pre-push`, retired in round A. Establish whether the
   adopter plans or writes it. The hook must not come back. The manifest says
   only its `settings` may be edited by hand, so if the only way to stop it is
   editing `options`, stop that point and report it as framework feedback
   rather than editing. Update the Parked item to match what you found.
5. **`settings.report_check` (optional).** If a fast check that reports can
   break is worth naming (round 003's report broke `tests/test_docs_links.py`),
   establish how `fw.py report` runs the command and choose a form that works
   on Windows and macOS; otherwise leave it unset and say why.
6. `AGENTS.md`'s first paragraph names release 3.0.0.

**Where to work.** On the owner's Windows 11 desktop, in
`.worktrees/worker-006` inside the primary checkout (`git worktree add`).
This round is off the build path, so no baseroms or build are needed. Use
`python` for project scripts.

## Scope and non-goals

**In scope:** the adopter's changes to framework files and the manifest;
`AGENTS.md` and `docs/state.md` edits for points 1 to 6; resolving any
`.framework` sibling or `other` line the adopter reports.

**Not in scope:** round 007's checker work, round D, any change to
`.claude/settings.json`, `.codex/hooks.json`, `tools/protected_paths.py`,
the two baselines, the checker tools or `.github/`, and anything under
`src/`, `libs/`, `include/`, `config/`, `assets/` or `orig/`. Framework files
change only through the adopter, never by hand.

## Invariants

- Framework files are edited only by the adopter (`AGENTS.md`, Invariants;
  `FRAMEWORK.md`, rule 14).
- Round C's protection files and checkers stay byte-identical (the scope
  list above).
- No personal paths or email addresses in `AGENTS.md`, `CLAUDE.md`,
  `docs/state.md`, `docs/agents/` or `docs/rounds/`, including your report.
- `AGENTS.md` does not grow (it is 1,737 words at the start commit).
- `docs/state.md` holds decisions, not live status.

## Acceptance criteria

1. `docs/agents/framework.json` pins 3.1.0, and the dry run and the real run
   of the adopter are both quoted.
2. `python tools/fw.py status` shows round 006 seat by seat and ends with a
   line starting `next:`.
3. `python tools/fw.py prompt --round 006-framework-3-1-0 --role worker`
   prints a prompt whose first line is `gx-spirit-caller · ROUND 006 ·
   WORKER`.
4. No `.githooks/pre-push`, no unresolved `.framework` file, and
   `git diff --stat` against the start commit touches nothing in the
   not-in-scope list.
5. Points 1 to 3 and 6 are resolved in `AGENTS.md` as the evidence
   supports, and the Parked item in point 4 matches what you found.
6. `fw.py check` reports 0 errors and 0 warnings; `unittest`, `pytest` and
   `ruff check .` are clean.

## Required evidence

1. The adopter's dry-run and real-run output, verbatim.
2. `git diff --stat` against the start commit.
3. `python tools/fw.py status` and the `fw.py prompt` output above.
4. For points 2 and 4, the command that settled each and its output.
5. `python tools/fw.py check`, `python -m unittest discover -s tests`,
   `python -m pytest -q tests`, `ruff check .`, and the word count of
   `AGENTS.md`.
6. Every sentence added to or removed from `docs/state.md` and every rule
   removed from `AGENTS.md`, quoted, with the framework text that now
   carries it.
