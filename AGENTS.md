# Yu-Gi-Oh! GX Spirit Caller decomp

Instructions for every AI agent in this repository, whatever tool it runs in.
Tool-specific files (`CLAUDE.md`) only point here.

This project runs the agentic framework, release 4.0.0: read
[`docs/agents/FRAMEWORK.md`](docs/agents/FRAMEWORK.md) and your role card in
[`docs/agents/roles/`](docs/agents/roles/). This file adds the project's own
rules, which take precedence over the framework's.

Merge rule: owner-approves

Brain shows the owner the merge card for a reviewed batch and merges only after
the owner says yes to that merge. A passing gate is necessary, not sufficient. Only the owner changes this rule.

## What this project is

A matching decompilation of *Yu-Gi-Oh! GX Spirit Caller* for the Nintendo DS:
C source that rebuilds byte-identical ROMs, verified by SHA-1, for EUR
(`AYXP`), USA (`AYXE`) and JPN (`AYXJ`). Each owner-supplied dump lives at
`orig/baserom_<region>.nds` and is never committed or redistributed. Decisions
and the plan are in [`docs/state.md`](docs/state.md); toolchain, layout and
build steps in [`BUILD.md`](BUILD.md).

## How batches run here

The light workflow the owner trialled from 2026-10-06 is the framework's
default (4.0); the trial's measures are in [`docs/state.md`](docs/state.md).

- Brain gives one Worker a short prompt: objective, boundaries, acceptance
  checks. The Worker uses `.worktrees/worker-<batch>` on branch
  `worker/<batch>`, commits small, runs the checks, repairs failures, and ends
  with a summary in `docs/batches/<batch>.md` and its reply.
- Every matching batch takes the Checked path: a Verifier reviews the
  delivered commit, the real diff and the evidence, writing
  `docs/batches/<batch>-review.md`. The Worker fixes findings in the same
  batch; review applies to the resulting commit.
- Tooling or docs off the build path are Normal (no Verifier); notes,
  `AGENTS.md` changes the owner asks Brain for, `docs/state.md` and framework
  updates are Small.
- **Side-by-side batches.** Each open batch owns its own address range, and no
  two open batches share one; a Worker changes nothing outside its range
  except its own summary and ledger rows. Only Brain commits changes to the
  shared baselines, `tools/reference_baseline.txt` and
  `tools/fake_match_baseline.txt`. When a batch replaces a `.s` file that has
  a baseline line, its gate fails on that `STALE` line alone: the Worker and
  Verifier list the exact lines and say so, and Brain deletes them in the
  merge branch and runs the full gate there.
- **Merging several batches.** Brain merges one batch at a time. After each
  merge, before the next, Brain re-runs the quick checks on the combined
  result: `check_delink_dupes.py`, `validate_attempts.py` (with every row from
  `main` still present and first), `check_fake_matches.py` and
  `fw.py check`. The next batch merges only on the full three-region gate of
  its combined tree, or on proof that its build-path files equal a tree that
  passed it.
- Always: one approval request per reviewed batch, seats never merge, the
  Invariants, the Evidence table, protected paths, baselines that only shrink,
  and every failed attempt recorded in the ledger.

## Roles and seats

| Role | Does | Runs from |
|---|---|---|
| Owner | Decides what is built and why; approves each merge; can veto anything | conversation |
| Brain | Plans, writes prompts, reviews work at an exact commit, re-derives one claim, merges after the owner's yes | the primary checkout, on `brain/<topic>` branches |
| Worker | Carries out one batch, writes its summary, never merges or accepts its own work | `.worktrees/worker-<batch>`, on `worker/<batch>` |
| Verifier | Reviews one exact commit blind, writes findings, never writes production code or merges | `.worktrees/verifier-<batch>`, on `verifier/<batch>` |

A seat starts from its prompt in fresh context; a session carrying over an
earlier batch is not independent. Any capable tool may hold any seat. Every
seat starts with `python3 tools/fw.py status`, and two seats never share a
checkout. Worktrees are made from the primary checkout with `git worktree add`,
and the baseroms hard-linked by `python tools/link_baseroms.py <worktree>` (a
cloud clone needs them copied into `orig/`);
never a clone beside the project (a cloud session may clone in its workspace).
Adding or retiring a role is the owner's decision.

## Invariants

- **Every matched function stays matched.**
- **All three ROMs rebuild byte-identical.** `ninja sha1` for EUR, USA and JPN
  is the correctness proof; nothing else substitutes for it.
- **Symbol files are preserved.** `config/<region>/**/symbols.txt` is the
  record of every name: rename there (convention `ModuleName_FunctionName`),
  never hand-edit `arm9/config.yaml`, never drop or corrupt entries.
- **The baserom SHA-1 check is never bypassed;** fix the dump, not the check.
- **Never committed:** `*.nds`, BIOS dumps, `extract/`, `build/` and
  downloaded tool binaries.
- **Framework files are copies:** `docs/agents/`, `tools/fw.py`,
  `tests/test_framework.py`, `.claude/agents/` and
  `.claude/commands/status.md` change only through the framework's adopter.
- **No personal paths or email addresses** in `AGENTS.md`, `CLAUDE.md`,
  `docs/state.md`, `docs/agents/`, `docs/batches/` or `docs/rounds/`.
- **`docs/state.md` holds decisions, never live status** or full commit ids
  outside its `## Historical anchors`.

## Working rules

- **Seats never ask the owner a technical question.** The owner is not
  technical, so their "yes" checks nothing. A seat that needs a decision
  outside its prompt stops with `BLOCKED` and the question; Brain decides, or
  turns it into a plain choice of outcome and risk, and treats any change
  called owner-approved as unreviewed until Brain has checked it.
- Success for a matching batch is the named functions passing the gate at
  100%, never "a percentage went up"; do not pick functions by a metric. Any
  progress number comes from `tools/progress.py --version <region>` at a
  stated commit; natural-C counts `.text` only.
- Source layout: `src/<module>/` is EUR, `src/<region>/` holds the USA and JPN
  ports, `libs/` is region-neutral; re-run `tools/configure.py <region>` when
  new `.c` files land. C is the default, and a `.cpp` file opts in to C++.
- Fix the defect class, not the first example, and report a flaw found along
  the way as a defect.
- Python: `python3.13` on macOS (its `python3` is 3.9), `python` on Windows;
  `fw.py` runs under `python3`, `py -3` or `python`.
- Never kill a process you did not start (other seats may share the machine).
- `progress-visuals` is CI-owned; never commit to it by hand.

## Evidence

Paste the real output with its exit status (framework rule 3); CI is the
backstop, not the evidence.

| Changed | Required evidence |
|---|---|
| The build path: `src/`, `libs/`, `include/`, `config/`, hand-written `.s`, or a `tools/*.py` the build or gate runs | `python3.13 tools/gate3.py --scope all --log <log>`, never piped, then the log check below: `[eur]`, `[usa]` and `[jpn]` `SHA1 PASS`, a pytest summary with no failures, `GATE PASS`, last line `gate3: GATE EXIT 0`, and no `SKIP` for a region. The gate includes the reference check and the fake-match lint. Name the commit. |
| `config/**/delinks.txt` | `python3.13 tools/check_delink_dupes.py` clean on the merged tree. |
| `src/` or `config/` | `python3.13 tools/check_match_invariants.py --version eur` with no errors, and `python3.13 tools/check_fake_matches.py` printing `OK`. |
| Symbol renames | The build-path row, plus `tools/rename_symbol.py --cascade` output showing every region. |
| `tools/` or `docs/` only | `python3.13 -m pytest -q tests`, `python3.13 -m unittest discover -s tests` and `ruff check .`, all clean. |
| `AGENTS.md`, `CLAUDE.md`, `docs/state.md`, `docs/agents/`, `docs/batches/` | `python3 tools/fw.py check` with 0 errors and no new warnings. |
| A new test | Shown red on a known-bad input before trusting it green. |

The log check, for your shell (`<log>` is the file the gate wrote):

```text
grep -nE "SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)" <log>
Select-String -Pattern 'SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)' <log>
python3.13 -c "import re,sys;[print(n,l,end='') for n,l in enumerate(open(sys.argv[1],errors='replace'),1) if re.search(r'SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)',l)]" <log>
```

macOS and Linux, PowerShell, then either (on Windows `python`). A unit test
cannot see a ROM regression: citing tests for a build-path change is a
blocking finding.

## What is actually enforced

- GitHub's `main-protection` ruleset requires a squash-merged pull request
  with the five checks in `.github/required-checks.txt`, and blocks deletion
  and force-pushes; it requires no human review.
- The owner's account is the only collaborator, is an administrator with
  bypass, and every agent uses it, so nothing server-side stops an agent
  pushing to `main`.
- Claude Code settings deny the agent's own edits to `*.sha1`, `build.ninja`
  and the baselines (shown in round 005); the Codex hook is untested.

That seats never merge and Brain waits for the owner's yes are rules the agents
keep, not locks; never call them server-enforced.

## Where to look

- Decisions, the plan, what is parked: [`docs/state.md`](docs/state.md)
- Batch summaries and reviews: [`docs/batches/`](docs/batches/); 3.x rounds: [`docs/rounds/`](docs/rounds/)
- Build, toolchain and matching tools: [`BUILD.md`](BUILD.md),
  [`docs/machine-setup.md`](docs/machine-setup.md); compiler surprises:
  [`docs/compiler-quirks.md`](docs/compiler-quirks.md)
- The attempts ledger: [`docs/ledger/attempts.tsv`](docs/ledger/attempts.tsv),
  checked by `tools/validate_attempts.py`
- Everything retired in the redesign: the git tag `archive/pre-redesign-2026-09-23`
