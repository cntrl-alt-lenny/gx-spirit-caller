<!-- fw-report
round: 006-framework-3-1-0
role: worker
branch: worker/006-framework-3-1-0
head: 18cbab63ef6b8dff65f1d3c5b609e915d1b2a5cd
os: Windows 11
python: 3.12.10
written: 2026-09-29T12:40:22Z
-->
# 006-framework-3-1-0: Worker report

Windows 11, Python 3.12.10, worktree `.worktrees/worker-006` from the brief
commit `f618dfb0c`. The framework was cloned at tag `v3.1.0` into a scratch
directory outside the project. Nothing outside the brief's scope was touched.

## Verified

- The adopter pinned 3.1.0. Dry run, `python <clone>/tools/adopt.py <worktree> --update --dry-run`:

  ```text
  update: <worktree> -> agentic-framework 3.1.0 (from 3.0.0)
    replace docs/agents/FRAMEWORK.md
    replace docs/agents/roles/brain.md
    replace docs/agents/roles/worker.md
    replace docs/agents/roles/verifier.md
    replace tools/fw.py
    replace tests/test_framework.py
    same    .claude/agents/brain.md
    same    .claude/agents/verifier.md
    same    .claude/agents/worker.md
    same    .claude/commands/status.md
    same    CLAUDE.md
    keep    AGENTS.md  (project-owned)
    keep    docs/state.md  (project-owned)
    keep    docs/rounds/README.md  (project-owned)
    keep    .gitattributes  (project-owned)
    gone    .githooks/pre-push  (deleted in this project, so not re-created)
    record  docs/agents/framework.json
  dry run: nothing written
  ```

  The real run printed the identical plan (then the same 3.1.0 adopter steps)
  and wrote it: `docs/agents/framework.json` now has `"release": "3.1.0"`.
  No `other` line, no `.framework` sibling (`find` for `*.framework` → none).
- `git diff --stat f618dfb0c` (nothing in the not-in-scope list):

  ```text
   AGENTS.md                     |  34 +-
   docs/agents/FRAMEWORK.md      |  79 ++---
   docs/agents/framework.json    |  14 +-
   docs/agents/roles/brain.md    |  31 +-
   docs/agents/roles/verifier.md |   4 +-
   docs/agents/roles/worker.md   |   4 +-
   docs/state.md                 |   8 +-
   tests/test_framework.py       |   8 +-
   tools/fw.py                   | 808 ++++++++++++++++++++++++++++++++++--------
  ```

- `python tools/fw.py status` shows the round seat by seat (`worker: started on
  worker/006-framework-3-1-0, no report yet`), pinned 3.1.0 and up to date, and
  ends `next: wait for the Worker of round 006-framework-3-1-0 to finish; if
  its chat has stopped, send it the same prompt again as message 2`.
- `python tools/fw.py prompt --round 006-framework-3-1-0 --role worker` prints,
  first line, `gx-spirit-caller · ROUND 006 · WORKER`.
- Point 2 (issue 18). Command: `python tools/fw.py status | grep -c -i archive`
  → `0`; `git ls-remote --tags origin 'archive/*'` lists the tags on GitHub.
  `status` no longer mentions the `archive/*` tags, so the AGENTS.md paragraph
  is removed. Note `status` still ends `safe to leave this machine: NO`, now for
  real: this machine holds about 60 local-only branches (`claude/*`, `codex/*`,
  `brain/integ-*`, `fix/*`) that are not on GitHub, four stashes, and it lists
  four old seat folders as removable. Those are the owner's to deal with, not
  a false alarm, and are outside this round.
- Point 4 (issue 25). The dry run above is what settled it: the manifest still
  lists `.githooks/pre-push` (seed) and `"hooks": true`, but the adopter prints
  `gone ... (deleted in this project, so not re-created)`, and after the real
  run `.githooks` does not exist. `adopt.py` re-creates a deleted hook only with
  `--hooks`. So no edit to `options` was needed. Framework feedback: the
  manifest keeps listing a retired hook, which reads as if the next update
  would restore it.
- Point 5. `fw.py report` runs `settings.report_check` with
  `subprocess.run(command, shell=True, cwd=<project root>)`, so it goes through
  `cmd` on Windows and `sh` on macOS. No interpreter name works in both here
  (`python` is absent on the Mac, `python3.13` and `python3` are not reliable on
  Windows, `py -3` is Windows only), and adding a wrapper script is outside this
  round. Left unset; round 003's link break is caught by `tests/test_docs_links.py`
  in the unittest job instead.
- `python tools/fw.py check` → `0 error(s), 0 warning(s)`;
  `python -m unittest discover -s tests` → `Ran 1345 tests`, `OK (skipped=17)`;
  `python -m pytest -q tests` → `1328 passed, 17 skipped, 132 subtests passed`;
  `python -m ruff check .` → `All checks passed!`; `wc -w AGENTS.md` → 1524
  (1,737 at the start).

## Not verified

- Brain's re-derivation and the CI checks on GitHub; I ran none of the pull
  request checks.
- That `status` stays free of the archive tags on the macOS machine; I ran it on
  Windows only.
- Skips are 17 here against 15 in round 005 (no build in this worktree).

## Changed

- Framework files, by the adopter only: `docs/agents/FRAMEWORK.md`,
  `docs/agents/roles/{brain,worker,verifier}.md`, `tools/fw.py`,
  `tests/test_framework.py`, `docs/agents/framework.json`.
- `AGENTS.md`, removed or shortened, with the framework text that now carries it:
  - "release 3.0.0" → "release 3.1.0".
  - The whole "Prompts and sign-off lines" section (header line, the `· message
    N` suffix, the closing `· DONE — report pushed at <commit>` line, "when the
    owner comes back, Brain says which seats have reported..."). `FRAMEWORK.md`
    (Round protocol, step 1): "A prompt's first line is `<project> · ROUND
    <number> · <ROLE>` (plus `· message N` when resent); the seat's final reply
    ends with that header and `· DONE — report pushed at <commit>`, or `STOPPED`
    or `BLOCKED` with the reason", and `fw.py status` ends with `next:`.
  - "Where seats work": dropped "(owner decision, 2026-09-22)", "the folder is
    git-ignored", "Every seat prompt says where to work" and the sentence that
    Brain removes worktrees when a round merges (FRAMEWORK.md: "a seat works in
    `.worktrees/<role>-<number>`, a git-ignored linked checkout inside the
    project"; the Brain card removes finished ones). Kept: the baserom hard link
    with `link_baseroms.py`, and never a clone beside the project.
  - The `fw.py status` false-alarm paragraph (point 2).
- `docs/state.md`, one Parked item replaced. Removed: "Retired hook still
  seeded: `docs/agents/framework.json` still lists `.githooks/pre-push` as a seed
  file (framework issue 25), so the next framework update would re-create it;
  that update round must delete the hook again." Added: "Retired hook stays
  retired: `docs/agents/framework.json` still lists `.githooks/pre-push` as a
  seed and `"hooks": true` (framework issue 25), but the 3.1.0 adopter reports
  the file `gone` and does not re-create it. The stale manifest entry is
  framework feedback, not ours to edit."

## Open questions

- Framework feedback to file (I did not file it): the manifest of a project that
  retired the hook still records the seed and `"hooks": true`.
- `status` reports `safe to leave this machine: NO` for real, for the local-only
  branches and stashes above; Brain or the owner may want to push or archive them.
- `AGENTS.md` still says `python3.13` in several places; unchanged, outside the
  brief.
