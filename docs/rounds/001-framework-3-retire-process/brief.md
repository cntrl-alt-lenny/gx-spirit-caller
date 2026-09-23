# 001-framework-3-retire-process: Move to framework 3.0.0 and retire the old process

Tier: 2
Mode: implementation
Supersedes: none

This is round A of the owner's redesign (A to E, below). Round B (research
corpus and the tools cut) is a separate round that starts after this one is
merged.

## Goal

When this round is done:

1. The project runs agentic-framework 3.0.0, installed by the framework's own
   `tools/adopt.py --update`, with all seven "What an adopter must do" steps
   of the 3.0.0 CHANGELOG carried out.
2. `AGENTS.md` is the single entry point: about 1,500 words, declaring
   `Merge rule: owner-approves`, pointing at `docs/agents/FRAMEWORK.md`, and
   holding every project rule that is still in force.
3. `CLAUDE.md` is only a pointer to `AGENTS.md`.
4. `docs/state.md` is within 1,000 words and records the owner's decisions
   of 2026-09-23 (below).
5. The old process is gone from `main`: the old framework files, the Codex
   and Claude seat files and hooks, the guard scanners, and the retired state
   and log documents. Everything removed stays retrievable from the tag
   `archive/pre-redesign-2026-09-23`.
6. Nothing about the build changes: all three ROMs still rebuild
   byte-identical.

## Context

**Read:** the framework's `framework/FRAMEWORK.md`, `framework/roles/worker.md`
and the `3.0.0` section of its `CHANGELOG.md` (from your framework clone until
this round installs them); this brief; the current `AGENTS.md`, `CLAUDE.md`,
`docs/project-rules.md`; the seat and hook files listed under "Rule sources"
below; and all of `docs/state.md` (you must account for every sentence in it).

**Do not read:** `docs/research/`, `docs/briefs/`, `docs/queue/` beyond what
you need to confirm a file's purpose. They are retired or belong to round B.

**Framework commands.** Until your branch has its own `tools/fw.py`, run the
framework clone's copy: `python3 <framework>/tools/fw.py --cwd . <command>`
(`--cwd` goes before the command word). After adoption you may use either;
they are the same file. Use `python3.13` for this project's own scripts and
tests.

**Archive tag.** Brain created and pushed the annotated tag
`archive/pre-redesign-2026-09-23`, pointing at `main` as it was when this
brief was written (`5ad1a7a2a9733b191d5c838a36593d429bd7a841`). It is the
archive for both this round and round B: removing a file from `main` is
safe only because it is there.

**What Brain's dry run of the adopter planned** (at that commit): create
`docs/agents/FRAMEWORK.md`, `tools/fw.py`, `tests/test_framework.py`,
`docs/rounds/README.md`; replace the three role cards and the Claude Code
seat files `.claude/agents/{brain,worker,verifier}.md` and
`.claude/commands/status.md`; remove nine unedited 2.x copies
(`docs/agents/kickoff.md`, `docs/agents/update.md`, `tools/authority.py`,
`tools/neutrality.py`, `tools/textblocks.py`, `tools/line_endings.py`,
`tests/test_checkout.py`, `tests/test_report.py`,
`tests/test_role_neutrality.py`); keep, because something still refers to
them, `docs/agents/{adapters,briefs,git-and-isolation,reports,topologies,CONSTITUTION,lifecycle,evidence}.md`,
`docs/agents/roles/README.md`, `tools/report.py`, `tools/checkout.py`,
`.claude/README.md`, `.claude/hooks/{run_python.sh,save_agent_reply.py}` and
`.claude/settings.json`. Run it yourself; if your plan differs, say how.

**Two known problems.**

- Until round C, **the gate's exit status cannot be trusted**: piping
  `gate3.py` through `tee` has reported success on failure three rounds
  running (archived queue item `q-gate-exit-status`). Every gate result in
  your report must quote the log's own pass and fail lines; an exit code
  alone proves nothing.
- `fw.py status` says "safe to leave this machine: NO" because of the
  `archive/*` tags. That is a false alarm (they are all on GitHub; framework
  issue 18). Ignore that line only.

**Owner decisions, 2026-09-23** (to be recorded in `docs/state.md`, in
substance, each with its one-line reason):

1. The project becomes a lean "matching factory": a script, not people,
   drives the matching, and the byte-identical rebuild of all three ROMs is
   the reviewer. Rounds exist to improve the factory, run readability passes,
   and deal with the functions it gives up on.
2. The project's real state is the code, the attempts ledger, and one
   computed progress number. Every other state or log document is retired to
   an archive: STATE-LOG, dispatch-log, the queue essays, the state table and
   dashboard as required regenerated files, the briefs index, the report
   inbox, the Dev Hub log.
3. Housekeeping is aggressive: the research corpus, old logs and unused tools
   and tests are archived in a git tag and removed from `main`. One short
   compiler-quirks reference, distilled from the research, is kept.
4. Roles collapse to Brain, one executor (Worker) and Verifier.
5. The factory will run on the owner's Windows 11 desktop. Its usage cap is
   set after a one-week pilot measures the cost per match.
6. The merge rule stays owner-approves. Once the factory runs, the owner
   approves one batch merge a day, not one per function.

The redesign order, each a reviewed round guarded by the three-ROM check:
**A** (this round) framework 3.0.0 and retiring the old process; **B**
housekeeping: research corpus and retired logs out of `main`, `tools/` cut to
what the build, gate, matching loop and CI use, comment-only CI jobs dropped;
**C** a trustworthy checker: gate exit status, a check that every call and
data reference points at the right symbol, a lint rule against fake matches,
Claude Code and Codex settings that stop agents editing checksums, the
original ROMs or generated files; **D** one source tree with per-region
configuration instead of `src/`, `src/usa/`, `src/jpn/`; **E** the factory
(an unattended `cmatch_loop.py` runner) and a one-week pilot measured against
the 0.2-point gain in EUR natural-C between 19 August and 1 September (17.38%
now, from `tools/progress.py`).

## Scope and non-goals

**In scope.**

1. **Adoption.** Clone the framework at tag `v3.0.0` into a temporary folder
   outside this project. Run its `tools/adopt.py <this project> --update
   --dry-run`, then without `--dry-run`, and carry out steps 2 to 7 of "What
   an adopter must do". Keep the 3.0.0 `.claude/agents/*.md` and
   `.claude/commands/status.md` the adopter installs: they are
   framework-managed pointers, and deleting them makes `fw.py status` report
   them missing every session. That is how "Claude seat files retired" is
   met: the 2.x ones are replaced, not kept.
2. **`AGENTS.md`**, rewritten from the 3.0.0 template's shape: what the
   project is; roles (Brain, Worker, Verifier; the Decomper and Scaffolder
   names and the per-role path-ownership table are retired); invariants; the
   evidence table; what is actually enforced, re-checked live (see Required
   evidence) and dated; the gate exit-status warning, in force until round C;
   `python3.13` for project scripts; where to look. Build and toolchain facts
   that are not rules (toolchain table, quick start, matching workflow,
   platform notes, the `dsd init` bootstrap, the round-trip history) move to
   `BUILD.md` or `README.md`, shortened, or are retired to the tag. Your call
   where each goes; the rule table records it.
3. **`CLAUDE.md`** becomes the 3.0.0 Claude Code adapter's pointer.
4. **`docs/state.md`**, rewritten to the 3.0.0 template's headings (where we
   are going, owner decisions, parked and why, pointers) plus
   `## Historical anchors`, within 1,000 words. It records decisions 1 to 6
   and the A to E order; the parked items that still matter, each in one
   line; the pilot baseline under Historical anchors (EUR natural-C 17.38% by
   `tools/progress.py`, and the 0.2-point gain from 19 August to
   1 September); and a pointer to the archive tag. No live status.
5. **Retire to the tag** (delete from `main`). Confirm each before deleting,
   and apply the same test to anything else of the same class you find:
   - Logs and state documents: `docs/STATE-LOG.md`, `docs/dispatch-log.md`,
     `docs/queue/` (including its archive), `docs/state-table.md`,
     `docs/dashboard.md`, `docs/briefs/` (all of it, including `active.md`,
     the index and its archives), `docs/project-rules.md`,
     `docs/guard-coverage-review.md`, `docs/archive/`, and the Dev Hub log
     and report inbox wherever they live in the repository (find them; if
     one does not exist in the repository, say so).
   - Old framework files: every 2.x copy the adopter kept only because
     something referred to it, once the referrer is gone.
   - Seat files and hooks: `.codex/` (all of it), `.claude/hooks/`,
     `.claude/README.md`, the hook entries in `.claude/settings.json`
     (delete the file if nothing is left; round C writes the new settings),
     `.githooks/pre-push` and `tools/install_git_hooks.py`.
   - Guard scanners and process tools: every project tool whose only purpose
     is a retired document, the old lane, queue, kickoff, brief, report or
     worktree process, or wording and role guarding. Certain:
     `tools/report.py`, `tools/checkout.py`,
     `tools/generate_state_table.py`, `tools/generate_dashboard.py`,
     `tools/generate_briefs_index.py`, `tools/check_dispatch_log.py`,
     `tools/queue_state_drift.py`, `tools/kickoff_lint.py`,
     `tools/make_kickoff.py`. Judge the rest by reading them (for example
     `work_queue.py`, `lane_report.py`, `worktree_gc.py`,
     `prune_worktrees.py`, `integrate.py`, `scope_gate.py`,
     `check_activation_invariant.py`). A tool the build, gate, matching loop
     or CI still uses is not in this round. When unsure, keep it for round B
     and say so.
   - Tests whose only subject is a removed file go with it. A test of a kept
     file is never deleted or weakened in this round.
   - CI: remove the steps that run removed tools. Every job named in
     `.github/required-checks.txt` must still exist and run on every pull
     request.
   - `.github/pull_request_template.md` and `.github/ISSUE_TEMPLATE/`:
     rewrite or remove anything that teaches the retired process.
6. **Links.** No kept Markdown file links to a path that no longer exists
   (the adopter flags two in `AGENTS.md`). Comments inside kept code that
   mention removed documents may stay; round B deals with them.

**Not in scope.** Round B's work (`docs/research/`, the attempts ledger's
location, the wider `tools/` cut, comment-only CI jobs such as the analyzer
and cascade diffs, `.claude/commands/{cascade,scratch,suggest}.md`, the
compiler-quirks reference); round C's (changing `gate3.py`, the reference
check, the fake-match lint, new Claude Code or Codex permission settings);
rounds D and E. No change under `src/`, `libs/`, `include/`, `config/`,
`assets/`, to `*.sha1`, `orig/`, or any tool the build or gate runs.
No change to GitHub settings or the ruleset, no deleted branches or tags, and
nothing on the `progress-visuals` branch. No edits to framework-installed
files after the adopter writes them.

## Invariants

- All three ROMs rebuild byte-identical (current `AGENTS.md`, "Non-negotiable
  project invariants"; the owner's guard on every round of this redesign).
- Every file removed from `main` exists, byte-identical, at
  `archive/pre-redesign-2026-09-23` (owner decision 3).
- The required status checks keep their names and still run on every pull
  request: `Python (ruff)`, `Markdown (markdownlint-cli2)`, `drift-check`,
  `unittest`, `configure-windows` (`.github/required-checks.txt`; changing
  the ruleset is the owner's decision, `FRAMEWORK.md` "Always the owner's
  decision").
- Framework files are not edited after installation (`FRAMEWORK.md` rule 14).
- No personal paths or email addresses in `AGENTS.md`, `CLAUDE.md`,
  `docs/state.md`, `docs/agents/` or `docs/rounds/` (`fw.py check`). This
  includes your report: when you quote output or old text that contains a
  home folder or an email address, replace that part with `<home>` or
  `<email>`.
- Merge rule owner-approves (owner decision 6). You never merge.
- `docs/state.md` holds no live status and no full commit ids outside
  `## Historical anchors` (`FRAMEWORK.md` "State").

## Acceptance criteria

1. `docs/agents/framework.json` pins 3.0.0. `fw.py status` reports the merge
   rule as owner-approves, no framework files changed locally, no legacy
   `docs/briefs/active.md`, and no unpushed or uncommitted work other than
   the `archive/*` tag lines.
2. `fw.py check` reports 0 errors and 0 warnings.
3. `AGENTS.md` is between 1,300 and 1,700 words, contains the line
   `Merge rule: owner-approves`, links `docs/agents/FRAMEWORK.md`, and names
   only the roles Brain, Worker and Verifier.
4. `CLAUDE.md` is the adapter pointer and adds no rules.
5. `docs/state.md` is at most 1,000 words and meets scope item 4.
6. Every file named in scope item 5, and each one you added to it, is absent
   from `main` and present at the tag, or kept with a stated reason.
7. No kept Markdown file links to a missing path.
8. Every rule in the rule sources is accounted for in the rule table.
9. The three-ROM gate passes by its own log lines; `pytest` and `unittest`
   are green; `ruff check` is clean.
10. No change under the paths listed in "Not in scope".

## Required evidence

Each as the real command, its real output (trimmed to the relevant lines,
never paraphrased) and its exit status, at your final commit unless stated.

1. The adopter: `python3 <framework>/tools/adopt.py . --update --dry-run`
   and the real run, in full.
2. `python3 <framework>/tools/fw.py --cwd . status` and
   `python3 <framework>/tools/fw.py --cwd . check`.
3. `wc -w AGENTS.md CLAUDE.md docs/state.md`.
4. The gate, written straight to a log outside your checkout with no pipe:
   `python3.13 tools/gate3.py --scope all > <log> 2>&1`, then
   `grep -nE "SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)" <log>`.
   Quote those lines. The gate passes only if the log shows
   `[eur] SHA1 PASS`, `[usa] SHA1 PASS`, `[jpn] SHA1 PASS`, a pytest summary
   with no failures and `GATE PASS`, with no `SKIP` line standing in for a
   region. Say which commit the gate ran at.
5. `python3.13 -m unittest discover -s tests` (its `Ran N tests` and `OK`
   lines) and `ruff check .`. Markdownlint if you have it; otherwise list it
   under "Not verified" and Brain will read CI.
6. Protected paths: `git diff --stat 5ad1a7a2a9733b191d5c838a36593d429bd7a841 HEAD -- src libs include config assets orig '*.sha1'`
   (empty).
7. Archive completeness: a command that lists every file deleted since the
   tag commit and checks each with
   `git cat-file -e archive/pre-redesign-2026-09-23:<path>`; paste the count
   checked and every failure (there should be none).
8. A link check over kept Markdown files: any script or command, shown with
   its output.
9. The live ruleset, re-read for the "What is actually enforced" section:
   `gh api repos/cntrl-alt-lenny/gx-spirit-caller/rulesets` and the ruleset
   it names, trimmed to required checks, review count and bypass actors.

**The rule table (required; without it the round is sent back).** One row
for every rule in the rule sources. A rule is any sentence, bullet or code
path that tells an agent or the owner what must, must not, should or may be
done, or states an invariant or an evidence requirement.

Rule sources: `AGENTS.md`, `CLAUDE.md`, `docs/project-rules.md`,
`.claude/agents/{brain,worker,verifier}.md` (the 2.x versions),
`.claude/README.md`, `.claude/settings.json`, `.claude/hooks/*`,
`.codex/agents/{brain,decomper,scaffolder}.toml`, `.codex/hooks.json`,
`.codex/hooks/*`, `.githooks/pre-push`. For hooks, each behaviour they
enforce is a rule.

Columns: source (`file:line` at the tag commit); the rule (a quote or a
paraphrase of 20 words or fewer); disposition, one of **kept** (where it now
lives, file and section), **covered by the framework** (which rule in
`FRAMEWORK.md` or which role card), **deferred** (to round B, C, D or E, and
which of that round's items), or **retired** (why: which owner decision, or
what makes it obsolete). A rule that appears in several sources gets one row
per source.

**The state change list (required; without it the round is sent back).**
Sentence by sentence for `docs/state.md`: every sentence added, quoted; every
sentence removed, quoted, each marked **kept** (where it went, with its new
wording if changed), **moved** (to which file), or **archived** (at the tag
only, and why, for example history or superseded by decision N). Consecutive
removed sentences may share one mark only if each is still quoted. Documents
removed whole (STATE-LOG, dispatch-log and so on) are listed by path, not by
sentence. If the list is too long for the report's "Changed" section, commit
it as `docs/rounds/001-framework-3-retire-process/state-changes.md` before
you report, and link it from "Changed".
