<!-- fw-report
round: 001-framework-3-retire-process
role: worker
branch: worker/001-framework-3-retire-process
head: defa22475cccfec6d43529b7a27b351f023baa91
os: macOS 27.0
python: 3.9.6
written: 2026-09-23T14:29:54Z
-->
Round 001-framework-3-retire-process, Worker report. Scope: brief `docs/rounds/001-framework-3-retire-process/brief.md` (Tier 2, implementation). Base is `main` at `5ad1a7a2a9733b191d5c838a36593d429bd7a841` (the archive tag's commit); the brief commit is `7477deab5`. The final content commit is `defa22475cccfec6d43529b7a27b351f023baa91`; the report commit that follows it touches only this folder. Every result below was produced at that content commit unless a line says otherwise. Home folders in quoted output are shown as `<home>`, and log files live outside the checkout (`<scratch>`).

The summary in plain English: the project now runs framework 3.0.0 (installed by the framework's own adopter), `AGENTS.md` is the one entry point (1,389 words, `Merge rule: owner-approves`), `CLAUDE.md` is a pointer, `docs/state.md` is 735 words and records the owner's decisions of 2026-09-23, and the old process (logs, 2.x framework copies, Codex and Claude hooks, the guard scanners and process tools) is removed from `main` and present at the archive tag. **One thing the brief needs I could not do: rebuild the three ROMs.** This Mac has no Rosetta 2, the x86-64 `wine` the compiler runs under fails with "Bad CPU type in executable", and installing Rosetta is a system change I did not make. The gate's three region legs therefore ended in INFRASTRUCTURE ERROR. I give instead a build-graph proof that nothing the build reads has changed (item V4b), and Brain or the owner must run the real gate on a machine that can.

## Verified

### Environment (from commands)

`sw_vers -productVersion; uname -m; python3.13 --version; ninja --version; git --version; arch -x86_64 /usr/bin/true` (last line is the Rosetta probe)

```
27.0
arm64
Python 3.13.15
1.13.2
git version 2.55.0
arch: posix_spawnp: /usr/bin/true: Bad CPU type in executable
```

### V1. The adopter, in full (evidence 1)

`python3 <framework>/tools/adopt.py . --update --dry-run` -> exit 0. Its plan matched the plan Brain recorded in the brief (same creates, replaces, removals and keeps).

```
update: <home>/Dev/GitHub/gx-spirit-caller-worker-001 -> agentic-framework 3.0.0 (from 2.x (no record))
  create  docs/agents/FRAMEWORK.md
  replace docs/agents/roles/brain.md
  replace docs/agents/roles/worker.md
  replace docs/agents/roles/verifier.md
  create  tools/fw.py
  create  tests/test_framework.py
  create  docs/rounds/README.md
  replace .claude/agents/brain.md
  replace .claude/agents/verifier.md
  replace .claude/agents/worker.md
  replace .claude/commands/status.md
  remove  docs/agents/kickoff.md  (unedited copy from an earlier release)
  remove  docs/agents/update.md  (unedited copy from an earlier release)
  remove  tests/test_checkout.py  (unedited copy from an earlier release)
  remove  tests/test_report.py  (unedited copy from an earlier release)
  remove  tests/test_role_neutrality.py  (unedited copy from an earlier release)
  remove  tools/authority.py  (unedited copy from an earlier release)
  remove  tools/line_endings.py  (unedited copy from an earlier release)
  remove  tools/neutrality.py  (unedited copy from an earlier release)
  remove  tools/textblocks.py  (unedited copy from an earlier release)
  keep    AGENTS.md  (project-owned)
  keep    docs/state.md  (project-owned)
  keep    .gitattributes  (project-owned)
  keep    .githooks/pre-push  (project-owned)
  keep    CLAUDE.md  (project-owned)
  keep    .claude/settings.json  (edited in this project, so kept; delete it once nothing needs it)
  keep    .claude/README.md  (unedited, but .claude/settings.json still refers to it; remove that use, then delete it)
  keep    .claude/hooks/run_python.sh  (unedited, but .claude/settings.json still refers to it; remove that use, then delete it)
  keep    .claude/hooks/save_agent_reply.py  (unedited, but .claude/settings.json still refers to it; remove that use, then delete it)
  keep    docs/agents/adapters.md  (unedited, but tests/test_codex_agents_current.py still refers to it; remove that use, then delete it)
  keep    docs/agents/briefs.md  (unedited, but tools/generate_briefs_index.py still refers to it; remove that use, then delete it)
  keep    docs/agents/git-and-isolation.md  (unedited, but .codex/agents/brain.toml still refers to it; remove that use, then delete it)
  keep    docs/agents/reports.md  (unedited, but .codex/agents/brain.toml still refers to it; remove that use, then delete it)
  keep    docs/agents/roles/README.md  (unedited, but tests/test_generate_briefs_index.py still refers to it; remove that use, then delete it)
  keep    docs/agents/topologies.md  (unedited, but tests/test_role_lane_neutrality.py still refers to it; remove that use, then delete it)
  keep    tools/report.py  (unedited, but .claude/hooks/save_agent_reply.py still refers to it; remove that use, then delete it)
  keep    tools/checkout.py  (unedited, but tools/report.py still refers to it; remove that use, then delete it)
  keep    docs/agents/CONSTITUTION.md  (docs/agents/adapters.md, which is kept, links to it; delete both together)
  keep    docs/agents/lifecycle.md  (docs/agents/briefs.md, which is kept, links to it; delete both together)
  keep    docs/agents/evidence.md  (docs/agents/reports.md, which is kept, links to it; delete both together)
  record  docs/agents/framework.json

fix this link after the update: AGENTS.md links to docs/agents/kickoff.md
fix this link after the update: AGENTS.md links to docs/agents/update.md

dry run: nothing written
```

`python3 <framework>/tools/adopt.py . --update` -> exit 0. Committed as `618594dcf` ("Install agentic-framework 3.0.0 with the framework's own adopter"). The adopter wrote no `<file>.framework` copies, so CHANGELOG step 2 had nothing to merge. Full output:

```
update: <home>/Dev/GitHub/gx-spirit-caller-worker-001 -> agentic-framework 3.0.0 (from 2.x (no record))
  create  docs/agents/FRAMEWORK.md
  replace docs/agents/roles/brain.md
  replace docs/agents/roles/worker.md
  replace docs/agents/roles/verifier.md
  create  tools/fw.py
  create  tests/test_framework.py
  create  docs/rounds/README.md
  replace .claude/agents/brain.md
  replace .claude/agents/verifier.md
  replace .claude/agents/worker.md
  replace .claude/commands/status.md
  remove  docs/agents/kickoff.md  (unedited copy from an earlier release)
  remove  docs/agents/update.md  (unedited copy from an earlier release)
  remove  tests/test_checkout.py  (unedited copy from an earlier release)
  remove  tests/test_report.py  (unedited copy from an earlier release)
  remove  tests/test_role_neutrality.py  (unedited copy from an earlier release)
  remove  tools/authority.py  (unedited copy from an earlier release)
  remove  tools/line_endings.py  (unedited copy from an earlier release)
  remove  tools/neutrality.py  (unedited copy from an earlier release)
  remove  tools/textblocks.py  (unedited copy from an earlier release)
  keep    AGENTS.md  (project-owned)
  keep    docs/state.md  (project-owned)
  keep    .gitattributes  (project-owned)
  keep    .githooks/pre-push  (project-owned)
  keep    CLAUDE.md  (project-owned)
  keep    .claude/settings.json  (edited in this project, so kept; delete it once nothing needs it)
  keep    .claude/README.md  (unedited, but .claude/settings.json still refers to it; remove that use, then delete it)
  keep    .claude/hooks/run_python.sh  (unedited, but .claude/settings.json still refers to it; remove that use, then delete it)
  keep    .claude/hooks/save_agent_reply.py  (unedited, but .claude/settings.json still refers to it; remove that use, then delete it)
  keep    docs/agents/adapters.md  (unedited, but tests/test_codex_agents_current.py still refers to it; remove that use, then delete it)
  keep    docs/agents/briefs.md  (unedited, but tools/generate_briefs_index.py still refers to it; remove that use, then delete it)
  keep    docs/agents/git-and-isolation.md  (unedited, but .codex/agents/brain.toml still refers to it; remove that use, then delete it)
  keep    docs/agents/reports.md  (unedited, but .codex/agents/brain.toml still refers to it; remove that use, then delete it)
  keep    docs/agents/roles/README.md  (unedited, but tests/test_generate_briefs_index.py still refers to it; remove that use, then delete it)
  keep    docs/agents/topologies.md  (unedited, but tests/test_role_lane_neutrality.py still refers to it; remove that use, then delete it)
  keep    tools/report.py  (unedited, but .claude/hooks/save_agent_reply.py still refers to it; remove that use, then delete it)
  keep    tools/checkout.py  (unedited, but tools/report.py still refers to it; remove that use, then delete it)
  keep    docs/agents/CONSTITUTION.md  (docs/agents/adapters.md, which is kept, links to it; delete both together)
  keep    docs/agents/lifecycle.md  (docs/agents/briefs.md, which is kept, links to it; delete both together)
  keep    docs/agents/evidence.md  (docs/agents/reports.md, which is kept, links to it; delete both together)
  record  docs/agents/framework.json

fix this link after the update: AGENTS.md links to docs/agents/kickoff.md
fix this link after the update: AGENTS.md links to docs/agents/update.md

What each release asks of this project:

--- 3.0.0 ---
Run this as one Tier 2 round, with no other round in flight.

1. From a clone of the framework at `v3.0.0`, run
   `python3 tools/adopt.py <project> --update --dry-run`, read the plan, then
   run it without `--dry-run`. It installs the new files, replaces and
   removes 2.x copies it can prove were never edited, and keeps everything
   else, saying why. It also lists documents that would be left linking to a
   removed file; fix those links.
2. **Merge edited copies.** For each `<file>.framework` it wrote, move any
   project-specific content into `AGENTS.md` (or `docs/agents/local/`), then
   replace the file with the `.framework` copy.
3. **Retire what it kept on purpose.** For each file listed as "still refers
   to it", remove the reference (usually the Stop hook entry in
   `.claude/settings.json`, or a project hook calling `tools/line_endings.py`
   or `tools/report.py`), then delete the file. Delete the project's own
   2.x-only documents that restate the framework (for example a local
   `reports.md` or `push-gate.md`) once their project-specific content is in
   `AGENTS.md`.
4. **Make `AGENTS.md` the entry point.** Add `Merge rule: owner-approves` (or
   `brain-merges`), point it at `docs/agents/FRAMEWORK.md`, and move rules
   that live only in `CLAUDE.md` into it. Replace `CLAUDE.md` with a pointer
   (`@AGENTS.md`), or keep its project facts and add that line at the top.
5. **Trim `docs/state.md`** to decisions, parked items and pointers (1,000
   words by default). Move history into an archive document. Keep any commit
   ids under `## Historical anchors`. If project tools genuinely need a longer
   file, raise `settings.state_words` in `docs/agents/framework.json` and say
   why in `AGENTS.md`.
6. **Start new rounds in `docs/rounds/`.** Leave `docs/briefs/` as history,
   and delete `docs/briefs/active.md` once its round is finished
   (`fw.py status` mentions it until then).
7. Run the project's full test suite and `python3 tools/fw.py check`, paste
   both outputs, and remove personal paths the check reports.

Project checks still to satisfy (python3 tools/fw.py check):
  error: docs/state.md is 10798 words; its budget is 1000. Keep decisions, move history into docs/rounds/ or a dedicated document
  error: CLAUDE.md does not point at AGENTS.md, so sessions that load only CLAUDE.md never see the project's rules. Make it a pointer: '@AGENTS.md'
  warning: AGENTS.md has no 'Merge rule:' line (owner-approves or brain-merges)
```

How the seven "What an adopter must do" steps were carried out:

1. Dry run read, then the real run (above). The two flagged links (`AGENTS.md` to `docs/agents/kickoff.md` and `update.md`) were fixed by rewriting `AGENTS.md`.
2. Merge edited copies: none were written (`git ls-files '*.framework'` -> 0 files, and `find . -name '*.framework'` outside `.git`, `build`, `extract` and the downloaded toolchains -> 0 files; `fw.py status` reports no framework file changed locally).
3. Retire what the adopter kept on purpose: all 15 files it kept because something referred to them were removed once their referrers were gone (`docs/agents/{adapters,briefs,git-and-isolation,reports,topologies,CONSTITUTION,lifecycle,evidence}.md`, `docs/agents/roles/README.md`, `tools/report.py`, `tools/checkout.py`, `.claude/README.md`, `.claude/hooks/{run_python.sh,save_agent_reply.py}`, `.claude/settings.json`), together with the project's own `.claude/hooks/{post_edit,pre_bash}.py`, `.codex/`, `.githooks/pre-push` and `tools/install_git_hooks.py`. The hook rules are in the rule table.
4. `AGENTS.md` is the entry point with `Merge rule: owner-approves` and a link to `docs/agents/FRAMEWORK.md`; `CLAUDE.md` is byte-identical to the 3.0.0 adapter's pointer (`cmp` against the framework clone's `adapters/claude-code/files/CLAUDE.md`: identical). Rules that lived only in `CLAUDE.md` went to `AGENTS.md` or `BUILD.md` (rule table, CLAUDE.md rows).
5. `docs/state.md` trimmed to 735 words; history stays at the tag. `settings.state_words` was not raised.
6. New rounds live in `docs/rounds/`; `docs/briefs/` is deleted whole, including `active.md`, which read "No active brief." at the tag.
7. Full tests and `fw.py check` are in V2 and V5; personal-path check is clean (the check reports 0).

### V2. Framework status and check (evidence 2)

`python3 <framework>/tools/fw.py --cwd . status --offline` -> exit 0. (Run before the report commit, after pushing the branch; `--offline` skips the release lookup, which an earlier online run had already shown as "up to date with the latest release (3.0.0)".) The only "not on GitHub yet" items are `archive/*` tags, which the brief says to ignore (framework issue 18); no uncommitted work.

```
Framework
  pinned to agentic-framework 3.0.0 (https://github.com/cntrl-alt-lenny/agentic-framework)
  newer releases: not checked
Merge rule
  owner-approves
Rounds
  in flight: 001-framework-3-retire-process -- brief on origin/brain/001-framework-3-retire-process (+2 more)
This machine
  on worker/001-framework-3-retire-process; 1 uncommitted change(s)
  not on GitHub yet: tag archive/branch-brain-guard-repair-0909 (1 commit(s)), tag archive/branch-brain-integ-0818 (5 commit(s)), tag archive/branch-brain-integ-0819 (3 commit(s)), tag archive/branch-claude-decomper-queue-run-2 (13 commit(s)), tag archive/branch-codex-decomper-queue-run (2 commit(s)), tag archive/branch-codex-decomper-queue-run-2 (3 commit(s)), tag archive/branch-codex-ov004-readable-stubs (1 commit(s)), tag archive/branch-codex-queue-q-name-crossprop-2 (4 commit(s)), tag archive/branch-integ-1615 (3 commit(s)), tag archive/stash-2026-08-03-queue-claim-port-harvest (2 commit(s)), tag archive/stash-2026-08-04-pre-round-0804e-residue (3 commit(s))
  safe to leave this machine: NO -- push or deal with the items above first
Checks
  all project checks pass
Command form on this machine: python3 tools/fw.py <command>
```

`python3 <framework>/tools/fw.py --cwd . check` -> exit 0

```
0 error(s), 0 warning(s)
```

`cmp tools/fw.py <framework>/tools/fw.py` -> exit 0 (the project's copy is the framework's file).

### V3. Word counts (evidence 3)

`wc -w AGENTS.md CLAUDE.md docs/state.md` -> exit 0

```
    1389 AGENTS.md
      18 CLAUDE.md
     735 docs/state.md
    2142 total
```

`grep -n '^Merge rule' AGENTS.md` -> `11:Merge rule: owner-approves`. `AGENTS.md` links `docs/agents/FRAMEWORK.md` (line 6-7) and names the roles Owner, Brain, Worker and Verifier and no others (`grep -n 'Decomper\|Scaffolder' AGENTS.md` finds nothing).

### V4. The gate (evidence 4), at the final content commit

`python3.13 tools/gate3.py --scope all > <log> 2>&1` -> exit 2 (INFRASTRUCTURE). Log lines by the brief's grep (`grep -nE "SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)" <log>`, exit 0):

```
64:[eur] INFRASTRUCTURE ERROR
115:[usa] INFRASTRUCTURE ERROR
166:[jpn] INFRASTRUCTURE ERROR
225:3391 passed, 17 skipped, 54 subtests passed in 21.02s
228:==================== GATE INFRASTRUCTURE ====================
```

The cause, first two occurrences and the count of the line in the log (the same message ends every compile step):

```
26:/bin/sh: /opt/homebrew/bin/wine: Bad CPU type in executable
30:/bin/sh: /opt/homebrew/bin/wine: Bad CPU type in executable
30
```

**This gate did not pass.** There is no `[eur] SHA1 PASS`, `[usa] SHA1 PASS` or `[jpn] SHA1 PASS` line, and no `GATE PASS`. The brief's own test says the gate passes only with those lines, so I am not claiming it. The pytest leg of the same run is green (`3391 passed, 17 skipped`).

`python3.13 tools/gate3.py --scope tests > <log> 2>&1` (the wine-free part: invariants and pytest) -> exit 0, log lines (exit 0):

```
52:3391 passed, 17 skipped, 54 subtests passed in 19.95s
55:==================== GATE PASS ====================
```

An earlier `--scope all` run at `42d208371` went red on `tests/test_docs_links.py` (quoted links in my `state-changes.md` resolved from the wrong folder). That was a real defect, found by the gate's pytest leg, and fixed in `81389bc3b`; the runs above are after the fix.

#### V4b. Substitute evidence that the ROMs are unaffected (not a replacement for the gate)

The ROM depends only on what the ninja graph names. `tools/configure.py` was run at the archive tag (extracted with `git archive`) and at HEAD (extracted the same way), for each region, with `--skip-sha1`, and the two `build.ninja` files compared after replacing each tree's root path with `<ROOT>`. (Run at `218ceb907`; the one later commit, `defa22475`, changes only `AGENTS.md`.)

```
$ python3.13 tools/configure.py <region> --skip-sha1     (tag tree, then HEAD tree)   -> exit 0 for all six runs
$ cmp <tag build.ninja> <HEAD build.ninja>
eur: build.ninja byte-identical, tag vs HEAD (132364 lines, sha1 dbd74ec67b00)
usa: build.ninja byte-identical, tag vs HEAD (104571 lines, sha1 d6490e5a4100)
jpn: build.ninja byte-identical, tag vs HEAD (104561 lines, sha1 649e956573e0)
```

The three graphs name 18 distinct `tools/` files (`clean_macos_junk`, `download_tool`, `generate_heatmap`, `m2ctx`, `objdiff_filter_panic_units`, `objdiff_resolve_relocs`, `patch_arm_mapping_symbols`, `patch_lcf_arm9_align`, `patch_module_literals`, `patch_objects_legacy`, `patch_ov004_veneers`, `patch_rom_header_crc`, `patch_section_align`, `progress`, `sha1`, `touch_stamp`, `transform_dep`, `wine_link_lock`). All exist at HEAD, `git diff --stat <tag> HEAD -- <those 18>` is empty, and a walk of their imports (22 modules reachable) finds no module that existed at the tag and is gone now, and no difference in any of them. `git diff --stat <tag> HEAD -- tools/gate3.py tools/configure.py tools/progress.py tools/sha1.py` is also empty. With V6 (nothing changed under `src`, `libs`, `include`, `config`, `assets`, `orig`, `*.sha1`), the inputs and the recipe of every region's ROM are the same bytes as at the tag. This is an argument, not a rebuild.

### V5. Tests and lint (evidence 5)

`python3.13 -m unittest discover -s tests > <log> 2>&1` -> exit 0 (grep of the log, exit 0):

```
845:Ran 3406 tests in 20.195s
847:OK (skipped=16)
```

`python3.13 -m pytest -q tests -p no:cacheprovider > <log> 2>&1` -> exit 0: `3391 passed, 17 skipped, 54 subtests passed`.

`python3.13 -m ruff check .` -> exit 0

```
All checks passed!
```

(`ruff` is not on `PATH` here; `python3.13 -m ruff` is the same tool, 0.15.14.) Markdownlint is not installed here: see Not verified.

Test accounting: pytest ids collected at the tag versus now, so that no test of a kept file is lost.

```
tests collected at the tag: 3742
tests collected now: 3408
added:
tests/test_framework.py::FrameworkHygiene::test_project_checks
removed, by file:
   2 tests/test_checkout.py
   3 tests/test_claude_hook_interpreter.py
  30 tests/test_claude_hooks.py
   4 tests/test_codex_agents_current.py
  13 tests/test_dispatch_log_lint.py
  13 tests/test_generate_briefs_index.py
  34 tests/test_generate_dashboard.py
   8 tests/test_generate_state_table.py
   6 tests/test_install_git_hooks.py
   4 tests/test_integrate.py
  37 tests/test_kickoff_lint.py
  14 tests/test_lane_report.py
   6 tests/test_make_kickoff.py
   3 tests/test_metric_canon.py
   8 tests/test_pre_push_hook.py
   8 tests/test_prune_worktrees.py
  21 tests/test_queue_state_drift.py
  58 tests/test_report.py
  20 tests/test_role_lane_neutrality.py
  11 tests/test_role_neutrality.py
   3 tests/test_routing_suffixes.py
  17 tests/test_work_queue.py
  12 tests/test_worktree_gc.py
```

Every removed id belongs to a removed subject (the 2.x framework copies, hooks, generated documents, queue, kickoff, worktree and lane tools) except the three in `tests/test_routing_suffixes.py`, which loaded the removed `post_edit.py` hook copies; see Changed and Open questions. The one added id is the framework's `tests/test_framework.py`.

`python3.13 tools/check_ci_contract.py --verify-ruleset`: the five required checks still resolve to a job that runs on every pull request, and match the live ruleset.

-> exit 0

```
OK: all 5 required check(s) resolve to a job that runs on every pull request.

SKIP: could not determine repository.
```

The only workflow change is in `.github/workflows/generated-files-drift.yml` (the briefs-index, queue/state-drift and dispatch-log steps are removed with their tools). The remaining drift-check steps were run: `python3.13 tools/generate_tool_index.py --check` -> exit 0 ("is current"), `python3.13 tools/generate_research_index.py --check` -> exit 0 ("is current"), `python3.13 tools/validate_attempts.py` -> exit 0.

### V6. Protected paths (evidence 6)

`git diff --stat 5ad1a7a2a9733b191d5c838a36593d429bd7a841 HEAD -- src libs include config assets orig '*.sha1'` -> exit 0, output empty:

```
(no output)
```

### V7. Archive completeness (evidence 7)

A Python one-liner lists `git diff --name-only --diff-filter=D <tag commit> HEAD` and runs `git cat-file -e archive/pre-redesign-2026-09-23:<path>` on each, and `git cat-file -e HEAD:<path>` to confirm each is gone from `main`:

```
tag commit: 5ad1a7a2a9733b191d5c838a36593d429bd7a841
files deleted since the tag commit: 273
checked with git cat-file -e archive/pre-redesign-2026-09-23:<path>: 273 checked, 0 failures []
deleted files still present at HEAD: 0
```

`git rev-parse 'archive/pre-redesign-2026-09-23^{commit}'` -> `5ad1a7a2a9733b191d5c838a36593d429bd7a841` (annotated tag, `git cat-file -t` -> `tag`; it is on origin: `git ls-remote --tags origin archive/pre-redesign-2026-09-23` lists it). The tag holds these files byte-identical because it is the commit they were deleted from.

### V8. Links (evidence 8)

A script (kept outside the repository) walks every Markdown file git knows, tracked or untracked-not-ignored, extracts inline, reference and HTML links, skips URLs and fenced or inline code, and reports each relative link whose target does not exist, split by whether that target existed at the archive tag (broken by this round) or never did (pre-existing):

`python3.13 <script> --all` -> exit 0

```
markdown files: 3211; relative links checked: 4454
broken because the target was removed since archive/pre-redesign-2026-09-23: 0
broken but target never existed at the tag (pre-existing, not caused by this change): 20
  PRE-EXISTING docs/research/brief-310-ov006-wave4-drain.md -> (int*
  PRE-EXISTING docs/research/brief-397-ov004-thumb-drain-wave2.md -> void*
  PRE-EXISTING docs/research/brief-629-main-readable-c-batch.md -> ../../../pull/1196
  PRE-EXISTING docs/research/brief-629-main-readable-c-batch.md -> ../../../pull/1198
  PRE-EXISTING docs/research/code-decomp-resumption-queue.md -> ../../build/eur/analysis/next_targets.md
  PRE-EXISTING docs/research/code-decomp-resumption-queue.md -> ../../build/eur/report.json
  PRE-EXISTING docs/research/code-decomp-wall-predictions.md -> ../../build/eur/analysis/wall_predictions.json
  PRE-EXISTING docs/research/dossiers/020384e8.md -> lim&0x1f
  PRE-EXISTING docs/research/dossiers/021ac0b8.md -> 0x634/4
  PRE-EXISTING docs/research/dossiers/021afbac.md -> sel-1
  PRE-EXISTING docs/research/map/NAMES.md -> idx
  PRE-EXISTING docs/research/map/_names_overlay005.md -> idx
  PRE-EXISTING docs/research/reshape-recipes/contained-reshape-catalog.md -> ../../../brain/src/main/func_0200b1bc.c
  PRE-EXISTING docs/research/reshape-recipes/contained-reshape-catalog.md -> ../../../brain/src/main/func_0200a454.c
  PRE-EXISTING docs/research/reshape-recipes/contained-reshape-catalog.md -> ../../../brain/src/main/func_0200592c.c
  PRE-EXISTING docs/research/reshape-recipes/contained-reshape-catalog.md -> ../../../brain/src/main/func_0200b0c8.c
  PRE-EXISTING docs/research/reshape-recipes/contained-reshape-catalog.md -> ../../../brain/src/main/func_0201bea8.c
  PRE-EXISTING docs/research/reshape-recipes/contained-reshape-catalog.md -> ../../../brain/src/main/func_02038270.c
  PRE-EXISTING docs/research/reshape-recipes/imported-sm64ds.md -> ../../../../brain/src/overlay006/func_ov006_021b4d68.c
  PRE-EXISTING docs/research/reshape-recipes/imported-sm64ds.md -> ../../../../brain/src/main/func_02032724.s
```

Zero links are broken by this round. The 20 pre-existing ones are all in `docs/research/` (round B): URL-relative pull-request links, `build/` outputs, a retired `brain/` folder layout, and text like `(int*` that the pattern reads as a link. They were not caused by this change and I did not touch them. `tests/test_docs_links.py` is green (it ignores `build/`, `extract/` and `brain/` targets and needs a file suffix).

### V9. Live ruleset (evidence 9)

```
$ gh api repos/cntrl-alt-lenny/gx-spirit-caller/rulesets
{"enforcement":"active","id":19573966,"name":"main-protection"}
exit 0
$ gh api repos/cntrl-alt-lenny/gx-spirit-caller/rulesets/19573966 (trimmed)
{"bypass_actors":[{"actor_id":5,"actor_type":"RepositoryRole","bypass_mode":"always"}],"current_user_can_bypass":"always","enforcement":"active","include":["refs/heads/main"],"name":"main-protection","rules":[{"checks":null,"merge_methods":null,"reviews":null,"type":"deletion"},{"checks":null,"merge_methods":null,"reviews":null,"type":"non_fast_forward"},{"checks":["Python (ruff)","Markdown (markdownlint-cli2)","drift-check","unittest","configure-windows"],"merge_methods":null,"reviews":null,"type":"required_status_checks"},{"checks":null,"merge_methods":["squash"],"reviews":0,"type":"pull_request"}]}
exit 0
```

Read for `AGENTS.md` "What is actually enforced": required checks are the five above, `required_approving_review_count` is 0, squash is the only merge method, deletion and non-fast-forward are blocked, and the single bypass actor is repository role 5 (admin) with `bypass_mode: always`; `cntrl-alt-lenny` is the only collaborator and has role `admin` (`gh api repos/cntrl-alt-lenny/gx-spirit-caller/collaborators`). Checked 2026-09-23.

### V10. Other facts I checked before writing them

- `gh pr view 1020 --json state,closedAt` -> `CLOSED`, closed 2026-09-23T13:34:32Z (so `docs/state.md` says decomp.dev CI is closed, not parked).
- `python3.13 tools/progress.py --version eur` -> `Natural-C: 414738 / 2385948 bytes (17.38%)`; `--version usa` and `--version jpn` -> `Natural-C: 377920 / 2384964 bytes (15.85%)` each. These are the figures in `docs/state.md`.
- `git ls-files | grep -iE 'inbox|hub|feedback|mail'` finds nothing relevant: the Dev Hub is a shared drive folder and the report inbox was `.git/agent-inbox/` (never tracked), so neither has a file in the repository to remove. The only in-repository mention of the Dev Hub was a paragraph of the old `docs/state.md`, now archived.
- `/usr/bin/python3 --version` -> `Python 3.9.6` and `which python` finds nothing on this Mac (the basis of the `python3.13` rule).

## Not verified

- **The three-ROM rebuild.** Not run to completion: no Rosetta 2 on this Mac (`arch -x86_64 /usr/bin/true` fails with `Bad CPU type in executable`; `/Library/Apple/usr/share/rosetta` is absent), so the compiler's `wine` cannot start. Fixing that means installing system software, which I did not do. V4b is an argument that the ROMs are unchanged, not a substitute for `[eur] [usa] [jpn] SHA1 PASS`. **Acceptance criterion 9 and invariant 1 are therefore unproven by me.** Brain should run `python3.13 tools/gate3.py --scope all > <log> 2>&1` and read the lines at `defa22475` (or at the final branch tip, which differs only by this report) on a machine with a working Windows runner.
- **Markdownlint.** Not installed here (no `markdownlint-cli2` on `PATH`; I did not install it). I ran a hand-written approximation of the enabled rules (MD001, MD003, MD012, MD018, MD019, MD022, MD023, MD025, MD031, MD042, MD047) over the changed and added Markdown files. It flagged only two pre-existing patterns that my edits did not create (a missing single final newline in three files and, spuriously, blank-line runs the real rule allows); the tails of those files are byte-identical to the tag's. That is a heuristic, not the CI check. CI's `Markdown (markdownlint-cli2)` is the real check and Brain should read it.
- **GitHub CI on this branch.** I have not seen any of the five required checks run on a pull request for this branch (I did not open a pull request). `check_ci_contract.py` proves the check names still exist and run on every pull request, not that they pass.
- **`configure-windows`, `unittest` on Python 3.11 and Linux.** Everything ran on macOS with Python 3.13. CI runs Python 3.11 on Linux and Windows.
- **The 20 pre-existing broken links** in `docs/research/` were classified by whether the target existed at the tag; I did not fix them (round B).
- **State claims in `docs/state.md` about the 2026-09-08 tool defects** (`pool_freshness.py --module`, `m2ctx.py` and `gcc`) are carried over from the old file and marked "not re-checked" there; I did not re-check them. Parts of the old text look already fixed (for example `context_error` is now read in `cmatch_loop.py`).
- **Owner decision reasons** in `docs/state.md`: the brief gave the decisions but not a reason for each, so the one-line reasons are my wording drawn from the brief and the old file. The owner should confirm they say what he means.

## Changed

Net effect against the tag commit: `git diff --shortstat 5ad1a7a2a9733b191d5c838a36593d429bd7a841 HEAD` -> 311 files changed, 3465 insertions(+), 58013 deletions(-) (before this report): 8 added, 273 deleted, 30 modified. The commits, oldest first: `618594dcf` adoption; `817653b63` retire logs, state documents and 2.x framework documents; `1a05fbe8c` retire seat files, hooks, process tools and their tests; `150731fdb` CI, links, generated index; `f1d8ebdfe` AGENTS/CLAUDE/state rewrite; `42d208371` rule table and state-change list; `81389bc3b` link fix in the state-change list; `218ceb907` attachments folder; `defa22475` AGENTS.md names only the current roles.

### Framework adoption

The adopter created `docs/agents/FRAMEWORK.md`, `docs/agents/framework.json`, `tools/fw.py`, `tests/test_framework.py`, `docs/rounds/README.md`; replaced the three role cards and `.claude/agents/{brain,worker,verifier}.md` and `.claude/commands/status.md` (the framework-managed pointers, kept on purpose so `fw.py status` does not report them missing); removed nine unedited 2.x copies. No framework file was edited afterwards (`fw.py status` lists none as changed).

### Entry points

- `AGENTS.md` rewritten (1,389 words) from the 3.0.0 template's shape: what the project is, roles (Owner, Brain, Worker, Verifier), invariants, working rules, the evidence table, the exit-status warning until round C, what is actually enforced (re-read live, dated 2026-09-23), where to look. Toolchain and build facts are not there.
- `CLAUDE.md` replaced by the 3.0.0 adapter's two-line pointer.
- `BUILD.md` gained the build facts that only `CLAUDE.md` held: the region argument, `ninja check`, the two legacy compiler rows, Conventions, Platform notes, the one-off `dsd init` bootstrap, the round-trip status and the reference projects. `README.md` and `.github/pull_request_template.md` now point at `AGENTS.md` and `BUILD.md` instead of `CLAUDE.md`.
- `docs/state.md` rewritten to the template's headings plus `## Historical anchors`, 735 words, no live status and no full commit id outside Historical anchors. **Sentence-by-sentence list: [attachments/state-changes.md](attachments/state-changes.md)** (637 removed units, each quoted and marked kept, moved or archived, with a check that every word of the old file is quoted; 47 added units, each quoted). Documents removed whole are listed by path below.
- **Rule table: [attachments/rule-table.md](attachments/rule-table.md)** (199 rows, one per rule per source, over all 15 rule sources named in the brief).

### Removed from `main` (all present at the tag; 273 files, V7)

- Logs and state documents: `docs/STATE-LOG.md`, `docs/dispatch-log.md`, `docs/queue/` (6 files including its archive), `docs/state-table.md`, `docs/dashboard.md`, `docs/briefs/` (178 files: the index, `active.md`, `delivered/`, and `archive/legacy/`), `docs/project-rules.md`, `docs/guard-coverage-review.md`, `docs/archive/` (16 files). **Added by me, same class:** `docs/setup/branch-protection-proposal.md` (a proposal stating "nothing has been applied" and "no rulesets", which the live ruleset contradicts). The Dev Hub log and report inbox have no file in the repository (V10).
- 2.x framework files the adopter kept only because a referrer existed: `docs/agents/{adapters,briefs,git-and-isolation,reports,topologies,CONSTITUTION,lifecycle,evidence}.md`, `docs/agents/roles/README.md`, plus the nine it removed itself.
- Seat files and hooks: `.codex/` (6 files), `.claude/hooks/` (4), `.claude/README.md`, `.claude/settings.json` (only hook entries and a description were in it, so the file is deleted), `.githooks/pre-push`, `tools/install_git_hooks.py`.
- Tools whose only purpose was a retired document or the old lane, queue, kickoff, brief, report or worktree process: `report`, `checkout`, `generate_state_table`, `generate_dashboard`, `generate_briefs_index`, `check_dispatch_log`, `queue_state_drift`, `kickoff_lint`, `make_kickoff` (the brief's certain list) and, after reading them, `work_queue` (the queue), `lane_report` (lane transcripts and the inbox), `worktree_gc` and `prune_worktrees` (the worktree layout), `integrate` (the brain-lane merge driver that merges `docs/queue/**` and regenerates the briefs index). **Added by me:** `check_metric_canon` (a wording guard on metric documents that nothing in the build, gate or CI runs). None is referenced by the build graph, `gate3.py`, the workflows or a kept test (V4b, V5).
- Tests whose only subject was a removed file: 19 files (`test_claude_hook_interpreter`, `test_claude_hooks`, `test_codex_agents_current`, `test_dispatch_log_lint`, `test_generate_briefs_index`, `test_generate_dashboard`, `test_generate_state_table`, `test_install_git_hooks`, `test_integrate`, `test_kickoff_lint`, `test_lane_report`, `test_make_kickoff`, `test_metric_canon`, `test_pre_push_hook`, `test_prune_worktrees`, `test_queue_state_drift`, `test_role_lane_neutrality`, `test_work_queue`, `test_worktree_gc`) plus the three the adopter removed.

### Kept on purpose, and why (round B decides)

- `tools/scope_gate.py` (pre-merge completeness, duplicate-symbol and rename-cascade checks), `tools/check_activation_invariant.py` (the `.c` added, `.s` deleted and `delinks.txt` flip count for a sweep) and `tools/roi_per_lane.py`: nothing in the build, gate, CI or a kept tool runs them, but the first two check matching integrity (round C's "every reference points at the right symbol" may reuse them) and the third reads a campaign ledger under `docs/research/`. "When unsure, keep it for round B." `tools/link_baseroms.py`, `tools/gate3.py`, `tools/check_delink_dupes.py`, `tools/check_match_invariants.py` and `tools/rename_symbol.py` are kept because the new `AGENTS.md` names them, and `tools/check_ci_contract.py` because it guards `.github/required-checks.txt`.
- `docs/decomp-workflow.md` and `docs/machine-setup.md` are kept but edited (below); `docs/research/`, `docs/tools-index.md`, `.claude/commands/{cascade,scratch,suggest}.md`, `.github/labeler.yml` and `.github/workflows/labeler.yml` are untouched apart from what is listed below (round B).

### Edited, not removed

- `.github/workflows/generated-files-drift.yml`: three steps that ran removed tools deleted; header comments updated. The job name `drift-check` and its trigger (every pull request) are unchanged.
- `docs/tools-index.md` regenerated (141 tools) and `tools/generate_tool_index.py` lost two category rows for removed tools.
- `tests/test_routing_suffixes.py`: **removed three tests** (`test_claude_post_edit`, `test_codex_post_edit`, `test_claude_and_codex_post_edit_stay_byte_identical`) and the loader helper they used, because their only subject was the two deleted `post_edit.py` hook copies. The brief says a test of a kept file is never deleted or weakened; the file is kept, and I read these three as tests of the removed hooks. This is a judgement call I flag for Brain (Open questions).
- 15 links in 11 `docs/research/` files that pointed at removed files (`docs/briefs/`, `docs/queue/`, `docs/STATE-LOG.md`, `docs/dispatch-log.md`) became plain text naming the tag and the old path. Only link syntax changed.
- `docs/decomp-workflow.md`: "The cast", "Local setup extras", "Lane report recovery" and the "Does scaffolder run the build?" answer removed or replaced (they described the retired hooks, inbox, lane reports and worktree layout), "What a PR means" and "Where to dig deeper" rewritten, and four one-line pointers fixed. The rest of the guide still uses the older Decomper and Scaffolder vocabulary in its examples.
- `docs/machine-setup.md`: references to `docs/agents/*`, `docs/project-rules.md`, `make_kickoff.py` and the nested worktree layout removed; a note that `link_baseroms.py` works for linked worktrees only (Open questions, item 3).
- `.github/pull_request_template.md`: one word (`CLAUDE.md` to `AGENTS.md`).

### Not changed, on purpose

`src/`, `libs/`, `include/`, `config/`, `assets/`, `orig/`, `*.sha1` and every tool the build or gate runs (V4b, V6); GitHub settings, the ruleset, branches and tags; the `progress-visuals` branch; `.github/ISSUE_TEMPLATE/` (it teaches nothing about the retired process); `.github/labeler.yml` (see Open questions); `docs/research/` beyond the 15 link edits.

## Open questions

1. **The three-ROM gate has not passed on any machine for this round.** See Not verified. Brain (or the owner) needs to run it; nothing in the diff should change its result, and V4b is why I expect it to pass.

2. **Framework defect, for the framework's own Brain (not filed by me; I did not open an issue or edit a framework file).** Project and commit: gx-spirit-caller at `81389bc3bc9d` (before the fix below); framework release 3.0.0. What happened: the brief told me to commit an oversized list as `docs/rounds/<id>/state-changes.md`, but `fw.py delivery` treats every `*.md` directly in a round folder other than `brief.md` and `README.md` as a role's report and prints "NOT delivered" with "has no fw.py stamp". Reproduce: put any unstamped `.md` file in `docs/rounds/<id>/` on a worker branch and run `python3 tools/fw.py delivery --round <id>`. Expected: an extra document does not stop delivery, or the brief template names a place for attachments. Actual: `evaluate_branch` in `tools/fw.py` (the loop that skips only names containing `/`, `brief.md` and `README.md`) reports a problem for each. My workaround, inside the rules: both attachments live in `docs/rounds/001-framework-3-retire-process/attachments/`, a subfolder the loop skips. This deviates from the exact path the brief named; the content is what it asked for.

3. **Environment note for the next Worker on this Mac.** `tools/link_baseroms.py <checkout>` derives the primary checkout from the target's git common directory, so for an independent clone (as this task required) it treats the clone as its own primary and reports each ROM "source absent". I called `link_baseroms(target, primary=<primary checkout>)` from the primary checkout's copy of the module, which runs the same SHA-1 checks and creates hard links (all three linked, hashes printed as matching the pinned values). The CLI has no `--primary` flag. The tool is outside this round's scope; I only documented the limit in `docs/machine-setup.md`.

4. **Judgement calls to confirm** (each is listed above): removing `docs/setup/branch-protection-proposal.md` and `tools/check_metric_canon.py` (+ its test) as the same class as the named retirements; removing three tests from `tests/test_routing_suffixes.py`; keeping `scope_gate.py`, `check_activation_invariant.py` and `roi_per_lane.py` for round B; rewriting parts of `decomp-workflow.md` and `machine-setup.md`, which the brief did not name.

5. **Left for round B:** `docs/research/` (including the 20 pre-existing broken links), the wider `tools/` cut, `.github/labeler.yml` (its `agent:scaffolder`, `agent:pc` and `agent:brain` labels and its comment "Mirrors AGENTS.md slugs" now describe a retired role set), `.github/workflows/labeler.yml` and the other comment-only CI jobs, `.claude/commands/{cascade,scratch,suggest}.md`, and the older Decomper/Scaffolder wording inside `docs/decomp-workflow.md`'s worked examples and in code comments that name removed documents.

6. **Owner-decision reasons** in `docs/state.md` are my wording (see Not verified). Decision 5's cap-after-pilot and decision 6's daily batch merge are as the brief states them.

7. **`fw.py status` shows "safe to leave this machine: NO"** because of `archive/*` tags only, as the brief predicted (framework issue 18). There is no unpushed or uncommitted work besides those tag lines.

