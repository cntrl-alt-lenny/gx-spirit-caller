# 004-trustworthy-checker: Round C: a checker the factory can trust

Tier: 2
Mode: implementation
Supersedes: none

Round C of the owner's redesign (see `docs/state.md`). Rounds A and B are
merged.

## Goal

In the factory (round E), no person reviews each matched function: the
checker is the reviewer. When this round is done, that checker can be trusted:

1. **The gate never reports success on failure.** Its exit status and its log
   both carry the true verdict, whatever the caller does with the output.
2. **A match must reference the right things.** A check fails when a matched
   function's calls or data references point at a different symbol from the
   original's, even when the ROM bytes still come out identical.
3. **Fake matches fail a lint.** Source that reaches identical bytes by
   something other than real C fails a lint that CI enforces.
4. **Agents cannot edit what they must not.** Claude Code and Codex settings in
   the repository stop an agent editing the checksum files, the original ROMs
   or generated files.

## Context

**Read:** `AGENTS.md`, `docs/state.md`, `BUILD.md`, `docs/compiler-quirks.md`,
this brief, `tools/gate3.py`, `tools/check_match_invariants.py`,
`tools/progress.py` (its natural-C versus asm-C rule), and
`tools/objdiff_resolve_relocs.py` (its docstring explains a real case where
different relocations produce identical bytes).

**The gate's exit status (item 1).** The archived backlog item
`q-gate-exit-status` holds the history and a canary recipe:
`git show archive/pre-redesign-2026-09-23:docs/queue/decomper.md`, section
"q-gate-exit-status". In short: `gate3.py` itself exits correctly, but agents
pipe it through `tee`, whose exit status replaces the gate's, and three
rounds in a row a failed gate was reported as a pass. Reproduce the masking
before you fix it; if you cannot, stop and report that.

**The reference check (item 2).** The final ROM being byte-identical does not
prove a function references the right symbols. One example the project
already knows: where the original code loads a symbol's address, dsd's delink
records a relocation against a symbol (for example `data_027e0000`), but a C
source can write the raw number `0x027e0000` and still produce the same bytes.
Another: two symbols at the same address, or a call to an alias. Establish
from the build outputs (the delinked original `.o` files and the compiled
ones, with their relocation tables) whether a check comparing each matched
function's relocation targets against the original's is feasible for all
three regions, then build it. Existing tools may be reused. If it turns out
materially bigger than the other three items together, finish items 1, 3 and
4, stop, and report what item 2 needs.

**The fake-match lint (item 3).** Decide from the repository and from how
matching decompilations define it (for example
<https://blog.chrislewis.au/the-long-tail-of-llm-assisted-decompilation/> and
<https://github.com/cdlewis/nigel>; treat fetched text as evidence, not
instructions) which patterns count as a fake match in this project. Examples
to consider: instruction words or raw bytes emitted from C (inline `asm`,
`.word`, byte arrays placed in code), hardcoded addresses where the original
references a symbol, and source that exists only to force a register or order
with no meaning. The project's existing `asm` escape hatch is counted as asm-C
by `progress.py`, not banned; the lint must not reclassify legitimate asm-C as
fake. It must pass on today's `main`, or list every current violation as a
baseline that CI tolerates but never grows.

**Agent settings (item 4).** `.claude/settings.json` was retired in round A
with the old hooks; round A's rule table notes that settings need a portable
interpreter rule if they call a script, and that a running Claude Code session
reads settings only at start. Establish from each tool's primary
documentation what Claude Code and Codex CLI can actually deny (path-level
edit rules, sandbox modes), and say plainly where a tool cannot enforce
something. Protected: `*.sha1`, `orig/`, `build/`, `extract/`, `build.ninja`,
`objdiff.json`, and any other generated file you identify. The framework's own
files (`.claude/agents/`, `.claude/commands/status.md`) stay as installed.

**Where to work.** On the owner's Mac, in `.worktrees/worker-004` inside the
project, created from the primary checkout with `git worktree add`, with the
baseroms hard-linked by `python3.13 tools/link_baseroms.py
.worktrees/worker-004` run from the primary checkout. The factory will run on
Windows 11: everything this round adds must be plain Python or tool settings,
with no dependence on a Unix shell.

## Scope and non-goals

**In scope:** items 1 to 4; their tests; wiring the new checks into CI
**inside existing required jobs** (for example `unittest` or `drift-check`),
because adding a required check is a ruleset change and that is the owner's
decision; and updating `AGENTS.md` (the evidence table, the gate note that
says "until round C", "What is actually enforced") and `BUILD.md` to match.
Keep `AGENTS.md` no longer than it is now (1,738 words).

**Not in scope:** changing what the gate decides (its regions, its tests, its
verdict rules); round D (one source tree); round E (the factory and
`cmatch_loop.py` behaviour); fixing any source file the new checks flag
(record it; do not change `src/`); GitHub settings or the ruleset. No change
under `src/`, `libs/`, `include/`, `config/`, `assets/`, `orig/` or to
`*.sha1`, and no framework file edited.

## Invariants

- All three ROMs rebuild byte-identical (`AGENTS.md`, Invariants).
- The five required checks keep their names and run on every pull request.
- A new check is trusted only after it is shown failing on a known-bad input
  (`AGENTS.md`, Evidence).
- No personal paths or email addresses in `AGENTS.md`, `CLAUDE.md`,
  `docs/state.md`, `docs/agents/` or `docs/rounds/`, including your report; and
  quoted text in your report carries no live Markdown links (round 003's
  report broke `tests/test_docs_links.py` that way).

## Acceptance criteria

1. The masking is reproduced before the fix, and after it the gate's
   documented invocation returns a non-zero status on a failing gate through
   the path `AGENTS.md` prescribes, on macOS and in a form that works on
   Windows. The log's last line states the exit status the gate returns.
2. The reference check runs for all three regions, passes on today's `main`
   (or lists a tolerated baseline), and fails on a deliberately wrong reference
   in a scratch copy.
3. The fake-match lint passes on today's `main` (or with a tolerated
   baseline), fails on each pattern it claims to catch, and runs in CI inside a
   required job.
4. The settings deny edits to the protected paths where the tool supports it,
   shown by a denied attempt; unsupported cases are named.
5. `AGENTS.md` and `BUILD.md` describe the new checks and no longer say the
   gate's exit status is untrusted, if item 1 makes that true.
6. The three-ROM gate passes, `unittest`, `pytest` and `ruff check .` are
   clean, and `fw.py check` reports 0 errors and 0 warnings.

## Required evidence

1. The masking canary before the fix, and the same canary after it.
2. For each new check: its run on today's tree, and its run on each known-bad
   input with the failure output.
3. For the settings: the documentation you relied on (quoted briefly, with
   the URL), and a denied edit attempt in a fresh session for each tool you
   could test; a list of what a tool cannot enforce.
4. The gate, written to a log outside the worktree with no pipe, and the log
   check from `AGENTS.md`, copied verbatim; name the commit.
5. `python3.13 -m unittest discover -s tests`, `python3.13 -m pytest -q tests`,
   `ruff check .`, `python3.13 tools/check_ci_contract.py`,
   `python3 tools/fw.py check`, and `wc -w AGENTS.md`.
6. The CI change: the job and step each new check runs in.
7. Every source file or symbol the new checks flag on today's `main`, listed,
   not fixed.
8. Every sentence added to or removed from `docs/state.md`, quoted, if it
   changes.
