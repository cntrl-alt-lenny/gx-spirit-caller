# Yu-Gi-Oh! GX Spirit Caller decomp

Instructions for every AI agent in this repository, whatever tool it runs in.
Tool-specific files (`CLAUDE.md`) only point here.

This project runs the agentic framework, release 3.0.0: read
[`docs/agents/FRAMEWORK.md`](docs/agents/FRAMEWORK.md) and your role card in
[`docs/agents/roles/`](docs/agents/roles/). This file adds the project's own
rules, which take precedence over the framework's.

Merge rule: owner-approves

Brain shows the owner the merge card for a reviewed round and merges only after
the owner says yes to that merge. A passing gate is necessary, not sufficient. Only the owner changes this rule.

## What this project is

A matching decompilation of *Yu-Gi-Oh! GX Spirit Caller* for the Nintendo DS:
C source that rebuilds a byte-identical ROM, verified by SHA-1, for three
regions: EUR (`AYXP`), USA (`AYXE`) and JPN (`AYXJ`). Each owner-supplied dump
lives at `orig/baserom_<region>.nds` and is never committed or redistributed.
The direction is a lean "matching factory" (a script drives the matching, the
three-ROM rebuild reviews it); decisions and the round plan are in [`docs/state.md`](docs/state.md). Toolchain, layout and build
steps are in [`BUILD.md`](BUILD.md).

## Roles

| Role | Does | Runs from |
|---|---|---|
| Owner | Decides what is built and why; approves each merge; can veto anything | conversation |
| Brain | Plans, writes briefs, reviews returned work at an exact commit, re-derives one claim, merges after the owner's yes | the primary checkout, on `brain/<round-id>` branches |
| Worker | Carries out one brief, reports, never merges or accepts its own work | its own worktree (below), on `worker/<round-id>` |
| Verifier | Reviews one exact commit blind, writes findings, never writes production code or merges | its own worktree (below), on `verifier/<round-id>` |

The old specialist executor names and per-role path table are retired: a
Worker's scope is its brief. A Worker starts from the brief in fresh context;
a session carrying over an earlier round is not independent. Any capable tool
may hold any seat.
Every seat starts with its `fw.py` command. Two seats never share a checkout. Adding or retiring a role is the owner's decision.

**Where seats work (owner decision, 2026-09-22).** On the owner's machines the
project is one folder. A Worker or Verifier works in a linked worktree inside
it, `.worktrees/<role>-<round>` (for example `.worktrees/worker-003`; the folder
is git-ignored), created from the primary checkout with `git worktree add`, with
the baseroms hard-linked by `python3.13 tools/link_baseroms.py <worktree>` run
from the primary checkout. Never a clone beside the project (a cloud session may clone in its workspace). Every seat prompt says where to work. After
a round merges, Brain removes its worktrees with `git worktree remove`, once
each is clean, has no stash and has no commit missing from GitHub.

## Prompts and sign-off lines

The owner's rule until the framework adopts it (framework issue 26):

- The first line of every prompt Brain writes for the owner is
  `<project> · ROUND <number> · <ROLE>`, for example
  `gx-spirit-caller · ROUND 003 · WORKER`. A second message to the same seat in
  the same round adds `· message N` (`gx-spirit-caller · ROUND 003 · WORKER ·
  message 2`).
- Every seat's prompt tells it to end its final reply with one line in the
  same form: `<project> · ROUND <number> · <ROLE> · DONE — report pushed at
  <commit>`, or `· STOPPED — <reason>` or `· BLOCKED — <reason>`.
- When the owner comes back, Brain says which seats have reported in each round
  in flight, which prompt to send next, and re-prints it.

## Invariants

- **Every matched function stays matched.** A change must never turn a
  100%-matched function back into a diff.
- **All three ROMs rebuild byte-identical.** `ninja sha1` for EUR, USA and JPN
  is the project's correctness proof; nothing else substitutes for it.
- **Symbol files are preserved.** `config/<region>/**/symbols.txt` is the
  durable record of every name. Rename there (convention
  `ModuleName_FunctionName`), never hand-edit `arm9/config.yaml`, never drop or
  corrupt entries.
- **The baserom SHA-1 check is never bypassed.** `tools/configure.py` fails
  loudly on a wrong or unset hash; fix the dump, not the check.
- **ROMs and generated output are never committed:** `*.nds`, BIOS dumps,
  `extract/`, `build/` and downloaded tool binaries.
- **Framework files are not edited:** `docs/agents/`, `tools/fw.py`,
  `tests/test_framework.py`, `.claude/agents/` and `.claude/commands/status.md`
  are copies. Update them only with the framework's adopter, as its own round.
- **No personal paths or email addresses** in `AGENTS.md`, `CLAUDE.md`,
  `docs/state.md`, `docs/agents/` or `docs/rounds/` (`fw.py check` enforces it).
- **`docs/state.md` holds decisions, never live status** or full commit ids
  outside its `## Historical anchors`.

## Working rules

- Source layout: `src/<module>/` is the EUR baseline, `src/<region>/` holds the
  USA and JPN ports made by `tools/port_to_region.py`, and `libs/` is
  region-neutral; `tools/configure.py` filters them per region. C is the
  default language, and a `.cpp` file opts in to C++ ([`BUILD.md`](BUILD.md)).
- A checkout needs all three baseroms in its own `orig/` to run the gate (a
  worktree gets them as above; a cloud clone needs them copied in). Re-run `tools/configure.py <region>` whenever new `.c` files
  land in `src/`.
- Success for a matching brief is the named functions passing the three-region
  gate with objdiff at 100%, never "a percentage went up"; do not pick functions
  by what maximizes a metric.
- Any progress number quoted comes from `python3.13 tools/progress.py
  --version <region>` at a stated commit. The headline, natural-C, counts
  `.text` only (data and carve work cannot move it), so "EUR is stuck" must
  name the metric.
- Fix the defect class, not the first example. Report a flaw found along the way
  as a defect, never as a quirk of the setup.
- Use `python3.13` for this project's scripts and tests (macOS ships no plain
  `python`, and its `python3` is 3.9). On Windows, `python`. The framework's
  own `fw.py` runs under `python3`, `py -3` or `python`.
- `progress-visuals` is a CI-owned branch: the progress-badge workflow commits
  generated assets there. Never commit to it by hand.
- A gate at 0 objects built and 0% CPU for minutes is hung on a stale
  wineserver lock: `pkill -9 wineserver`, relaunch `ninja sha1`.

## Evidence

Run what is relevant to what you changed and paste the real output with its
exit status (framework rule 7). CI is the backstop, not the primary evidence.

| Changed | Required evidence |
|---|---|
| Anything on the build path: `src/`, `libs/`, `include/`, `config/`, hand-written `.s`, or a `tools/*.py` the build or gate runs | `python3.13 tools/gate3.py --scope all --log <log>`, then the log check below. It passes only with `[eur]`, `[usa]` and `[jpn]` `SHA1 PASS`, a pytest summary with no failures, `GATE PASS`, last line `gate3: GATE EXIT 0`, and no `SKIP` standing in for a region. The gate runs the reference check and the fake-match lint itself, so `GATE PASS` needs both. Quote those lines and name the commit. |
| `config/**/delinks.txt` | `python3.13 tools/check_delink_dupes.py` clean on the merged tree: a sweep that re-derives an already-carved function doubles its block and breaks `dsd lcf` at merge while its own branch is green. |
| `src/` or `config/` | `python3.13 tools/check_match_invariants.py --version eur` reports no errors (exit 2 means errors), and `python3.13 tools/check_fake_matches.py` prints `OK`. The two baselines in `tools/` may only shrink (`--prune-baseline`). |
| Symbol renames | The build-path row, plus the output of `tools/rename_symbol.py --cascade` showing the rename reached every region. |
| `tools/` or `docs/` only, off the build path | `python3.13 -m pytest -q tests`, `python3.13 -m unittest discover -s tests` and `ruff check .`, all clean. |
| `AGENTS.md`, `CLAUDE.md`, `docs/state.md`, `docs/agents/`, `docs/rounds/` | `python3 tools/fw.py check` with 0 errors and 0 warnings. |
| A newly added test | Show it red on a known-bad input before trusting it green. |

The log check, in the form for the shell you are in (copy it verbatim; `<log>`
is the file the gate wrote):

```text
grep -nE "SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)" <log>
Select-String -Pattern 'SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)' <log>
python3.13 -c "import re,sys;[print(n,l,end='') for n,l in enumerate(open(sys.argv[1],errors='replace'),1) if re.search(r'SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)',l)]" <log>
```

The first is for macOS and Linux, the second for PowerShell, the third for
both (on Windows `python` for `python3.13`).

A unit test cannot see a ROM regression, so citing the test suite as evidence
for a build-path change is a blocking finding.

**Never pipe the gate:** through `tee` the status is `tee`'s, and a failed gate
passed three rounds running. `--log` writes the transcript; its last line,
`gate3: GATE EXIT <n>`, is the gate's status.

## What is actually enforced

Checked 2026-09-23 with `gh api repos/cntrl-alt-lenny/gx-spirit-caller/rulesets/19573966`.

| Layer | Reality here |
|---|---|
| `main-protection` ruleset, active on `refs/heads/main` | The one server-side guarantee, where it binds. Requires a pull request (squash merges only) with `required_approving_review_count` 0, so no human review is required. Blocks deletion and non-fast-forward pushes. Requires the five checks in `.github/required-checks.txt`, each running on every pull request: `Python (ruff)`, `Markdown (markdownlint-cli2)`, `drift-check`, `unittest`, `configure-windows`. Changing the set is the owner's decision. |
| Administrator bypass | Defeats the layer above. `cntrl-alt-lenny` is the only collaborator, holds `admin`, and the ruleset's `bypass_actors` gives that role `bypass_mode: "always"`. Every agent authenticates as this account, so nothing stops an agent pushing to `main`. |
| Agent settings | Shown denying, round 005, Claude Code 2.1.284 on Windows: the Edit tool on `*.sha1`, `build.ninja` and a baseline, and Bash `>`, `>>` and `tee` to them, started inside a worktree and started at a stand-in primary root aimed at `.worktrees/<seat>/`. Round 004's file let that Edit through. Only the agent's own edits, not programs it runs; read at session start. The Codex hook is untested (Codex is not installed here), and open issue openai/codex 27833 reports a PreToolUse deny on `apply_patch` that fires without blocking on some builds. |

That executors never merge and that Brain waits for the owner's yes are rules
the agents keep, not locks GitHub checks; never call either server-enforced.

`python3 tools/fw.py status` says the `archive/*` tags are "not on GitHub yet"
and "safe to leave this machine: NO". False alarm (framework issue 18): the tags
are on GitHub (`git ls-remote --tags origin 'archive/*'`). Ignore that line only.

## Where to look

- Standing decisions, the round plan and what is parked: [`docs/state.md`](docs/state.md)
- Rounds, one folder each (brief and reports): [`docs/rounds/`](docs/rounds/)
- Build, toolchain, conventions and bootstrap: [`BUILD.md`](BUILD.md),
  [`docs/machine-setup.md`](docs/machine-setup.md)
- How matching is done, and the tools you run: [`BUILD.md`](BUILD.md); what
  the compilers do that you would not expect:
  [`docs/compiler-quirks.md`](docs/compiler-quirks.md)
- The attempts ledger: [`docs/ledger/attempts.tsv`](docs/ledger/attempts.tsv),
  checked by `tools/validate_attempts.py`
- Everything retired in the redesign, including the research corpus: the git
  tag `archive/pre-redesign-2026-09-23`
