# Yu-Gi-Oh! GX Spirit Caller decomp

Instructions for every AI agent working in this repository, whatever tool it
runs in. Tool-specific files (`CLAUDE.md`) only point here.

This project runs the agentic framework, release 3.0.0: read
[`docs/agents/FRAMEWORK.md`](docs/agents/FRAMEWORK.md) and your role card in
[`docs/agents/roles/`](docs/agents/roles/). This file adds the project's own
rules, which take precedence over the framework's.

Merge rule: owner-approves

Brain shows the owner the merge card for a reviewed round and merges only after
the owner says yes to that specific merge. A passing gate is necessary, never
sufficient. Only the owner changes this rule.

## What this project is

A matching decompilation of *Yu-Gi-Oh! GX Spirit Caller* for the Nintendo DS:
C source that rebuilds a byte-identical ROM, verified by SHA-1, for three
regions: EUR (`AYXP`), USA (`AYXE`) and JPN (`AYXJ`). Each owner-supplied dump
lives at `orig/baserom_<region>.nds` and is never committed or redistributed.
The direction is a lean "matching factory" (a script drives the matching and
the three-ROM rebuild is the reviewer); the owner's decisions and the round
plan are in [`docs/state.md`](docs/state.md). Toolchain, layout and build
steps are in [`BUILD.md`](BUILD.md).

## Roles

| Role | Does | Runs from |
|---|---|---|
| Owner | Decides what is built and why; approves each merge; can veto anything | conversation |
| Brain | Plans, writes briefs, reviews returned work at an exact commit, re-derives one claim, merges after the owner's yes | the primary checkout, on `brain/<round-id>` branches |
| Worker | Carries out one brief, reports, never merges or accepts its own work | its own checkout, on `worker/<round-id>` |
| Verifier | Reviews one exact commit blind, writes findings, never writes production code or merges | its own checkout, detached at the commit |

The names Decomper and Scaffolder and the per-role path-ownership table are
retired: a Worker's scope is its brief. A Worker starts from the brief in fresh
context; a session carrying over an earlier round is not independent. Any
capable tool may hold any seat.
Every seat starts with its `fw.py` command (see the framework). Two seats never
share a checkout. Adding or retiring a role is the owner's decision.

## Invariants

- **Every matched function stays matched.** A change must never turn a
  100%-matched function back into a diff.
- **All three ROMs rebuild byte-identical.** `ninja sha1` for EUR, USA and JPN
  is the project's correctness proof; nothing else substitutes for it.
- **Symbol files are preserved.** `config/<region>/**/symbols.txt` is the
  durable record of every name. Rename there (convention
  `ModuleName_FunctionName`), never hand-edit `arm9/config.yaml`, and never drop
  or corrupt entries.
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
- A checkout needs all three baseroms in its own `orig/` to run the gate. A
  linked worktree gets them with `python3.13 tools/link_baseroms.py
  <checkout>` run from the primary checkout; an independent clone needs the
  dumps copied in. Re-run `tools/configure.py <region>` whenever new `.c` files
  land in `src/`.
- Success for a matching brief is the named functions passing the three-region
  gate with objdiff at 100%, never "a percentage went up". Do not choose which
  functions to attempt by what maximizes a metric.
- Any progress number quoted comes from `python3.13 tools/progress.py
  --version <region>` at a stated commit. The headline, natural-C, counts
  `.text` only: data and carve work cannot move it, so any "EUR is stuck" claim
  must name the metric.
- Fix the defect class, not the first example. A flaw found along the way is
  reported as a defect, never reframed as a quirk of the existing setup.
- Use `python3.13` for this project's scripts and tests (macOS ships no plain
  `python`, and its `python3` is 3.9). On Windows, `python`. The framework's
  own `fw.py` runs under `python3`, `py -3` or `python`.
- `progress-visuals` is a CI-owned branch: the progress-badge workflow commits
  generated assets there. Never commit to it by hand.
- A gate that sits at 0 objects built and 0% CPU for minutes is hung on a stale
  wineserver lock, not slow: `pkill -9 wineserver`, relaunch `ninja sha1`, and
  watch the object count climb.

## Evidence

Run what is relevant to what you changed and paste the real output with its
exit status (framework rule 7). CI is the backstop, not the primary evidence.

| Changed | Required evidence |
|---|---|
| Anything on the build path: `src/`, `libs/`, `include/`, `config/`, hand-written `.s`, or a `tools/*.py` the build or gate runs | `python3.13 tools/gate3.py --scope all > <log> 2>&1`, then `grep -nE "SHA1 (PASS\|FAIL)\|INFRASTRUCTURE\|CLEAN-FAIL\|SKIP\|GATE [A-Z]+\|[0-9]+ (passed\|failed)" <log>`. It passes only with `[eur]`, `[usa]` and `[jpn]` `SHA1 PASS`, a pytest summary with no failures, `GATE PASS`, and no `SKIP` standing in for a region. Quote those lines and name the commit. |
| `config/**/delinks.txt` | `python3.13 tools/check_delink_dupes.py` clean on the merged tree: a sweep that re-derives an already-carved function doubles its block and breaks `dsd lcf` at merge while its own branch is green. |
| `src/` or `config/` | `python3.13 tools/check_match_invariants.py --version eur` reports no errors (exit 2 means errors). |
| Symbol renames | The build-path row, plus the output of `tools/rename_symbol.py --cascade` showing the rename reached every region. |
| `tools/` or `docs/` only, off the build path | `python3.13 -m pytest -q tests`, `python3.13 -m unittest discover -s tests` and `ruff check .`, all clean. |
| `AGENTS.md`, `CLAUDE.md`, `docs/state.md`, `docs/agents/`, `docs/rounds/` | `python3 tools/fw.py check` with 0 errors and 0 warnings. |
| A newly added test | Show it red on a known-bad input before trusting it green. |

A unit test cannot see a ROM regression, so citing the test suite as evidence
for a build-path change is a blocking finding.

**Until round C, the gate's exit status cannot be trusted.** Piping `gate3.py`
through `tee` has reported success on failure three rounds running. Write the
gate to a log with no pipe and quote the log's own pass and fail lines; an exit
code alone proves nothing.

## What is actually enforced

Checked 2026-09-23 with `gh api repos/cntrl-alt-lenny/gx-spirit-caller/rulesets/19573966`.

| Layer | Reality here |
|---|---|
| `main-protection` ruleset, active on `refs/heads/main` | The one server-side guarantee, where it binds. Requires a pull request (squash merges only) with `required_approving_review_count` 0, so no human review is required. Blocks deletion and non-fast-forward pushes. Requires the five checks in `.github/required-checks.txt`, each running on every pull request: `Python (ruff)`, `Markdown (markdownlint-cli2)`, `drift-check`, `unittest`, `configure-windows`. Changing the set is the owner's decision. |
| Administrator bypass | Defeats the layer above. `cntrl-alt-lenny` is the only collaborator, holds `admin`, and the ruleset's `bypass_actors` gives that role `bypass_mode: "always"`. Every agent authenticates as this account, so nothing stops an agent pushing to `main`. |
| Local hooks | None. The git pre-push hook and the Claude Code and Codex hooks were retired in round A; round C writes new Claude Code and Codex settings that stop agents editing checksums, the original ROMs or generated files. |

That executors never merge, and that Brain waits for the owner's yes, are rules
the agents keep, not locks GitHub checks. Do not describe either as
server-enforced.

`python3 tools/fw.py status` says "safe to leave this machine: NO" while
`archive/*` tags exist only locally; that is a false alarm (they are on GitHub,
framework issue 18). Ignore that line only.

## Where to look

- Standing decisions, the round plan and what is parked: [`docs/state.md`](docs/state.md)
- Rounds, one folder each (brief and reports): [`docs/rounds/`](docs/rounds/)
- Build, toolchain, conventions and bootstrap: [`BUILD.md`](BUILD.md),
  [`docs/machine-setup.md`](docs/machine-setup.md)
- How matching is done: [`docs/decomp-workflow.md`](docs/decomp-workflow.md),
  the research corpus in [`docs/research/`](docs/research/) and the tool
  catalogue [`docs/tools-index.md`](docs/tools-index.md)
- Everything retired in the redesign: the git tag
  `archive/pre-redesign-2026-09-23`
