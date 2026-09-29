# 007-checker-hardening: Close the checker's remaining gaps before the factory

Tier: 2
Mode: implementation
Supersedes: none

Round C (rounds 004 and 005) is merged. Its review left three gaps that
matter once the factory (round E) runs unattended; this round closes them.

## Goal

1. **The factory cannot change the checker.** A factory batch that changes
   any file the verdict depends on fails a required check, while a reviewed
   round can still change those files.
2. **The lint decides meaning, not spelling,** for its `do-while-zero` and
   `volatile-local` rules.
3. **A ROM mismatch is reported as a failure,** not as an infrastructure
   error.

## Context

**Read:** your role card, `AGENTS.md`, `BUILD.md` ("The checker"), this
brief, round 005's brief and both its reports in
`docs/rounds/005-checker-corrections/` (the findings below come from its
Verifier), `tools/gate3.py`, `tools/check_fake_matches.py`,
`tools/check_baseline_growth.py`, `tools/protected_paths.py` and
`.github/workflows/tests.yml`.

**Item 1.** Factory batches will come from branches named `factory/<name>`
(Brain's decision for round E; nothing creates them yet). A pull request
from such a branch may change only what a match needs. Establish that set
from how matches have actually shipped (the diffs of recent matching pull
requests, and `tools/record_shipped.py` if it applies), and establish the
set of files a change to which could let the gate or a required check pass
without the ROMs, references and lint really passing (at least the checker
tools, their baselines, `.github/`, `tools/check_ci_contract.py`, the agent
settings and `tools/protected_paths.py`). Reviewed rounds on other branches
must still be able to change those files. The check runs inside an existing
required job, because adding a required check is the owner's decision.

**Item 2.** Round 005's Verifier got `do { ... } while ((int)0)` past the
whole gate (`GATE EXIT 0`) and listed further misses: `while (1-1)`, `-0`, a
NUL character literal, `NULL`, `0.0`, `0 && x`, `((void)0, 0)`,
`sizeof(char)-1`, `0 == 1`, an enum constant; and for `volatile-local`, a
`for (volatile int i = 0; ...)` init, `typedef int * volatile VPV; VPV p;`, a
function-like macro `#define DECL(t,n) volatile t n`, a brace-less
`while (c) volatile int x = c;`, and `int a = 0, * volatile p = &a;`.
Establish a method that decides "the condition is a constant false" and
"this local is volatile" the way the compiler does (macros expanded,
constant expressions evaluated), and use it; adding more spellings to a list
is not a fix. Then try to get past it yourself and report every attempt. A
`do { ... } while (0)` inside a macro definition that the project's headers
already use for statement macros is legitimate if the lint allowed it
before; say how you treat it.

**Item 3.** Round 005's Verifier saw a ROM SHA-1 mismatch reported as
`[eur] INFRASTRUCTURE ERROR` and `GATE EXIT 2`. Establish why and whether it
predates round C. One lead, not a finding: `is_infrastructure_failure()`
matches toolchain names such as `mwccarm.exe` anywhere in the output of
`ninja sha1`, which may appear whenever anything was recompiled.

**Where to work.** On the owner's Windows 11 desktop, in
`.worktrees/worker-007` inside the primary checkout (`git worktree add`),
baseroms hard-linked with `python tools/link_baseroms.py
.worktrees/worker-007` from the primary checkout. Use `python` for project
scripts. Downloaded tools arrive on the first build.

## Scope and non-goals

**In scope:** items 1 to 3, their tests, the CI wiring for item 1 inside an
existing required job, and `AGENTS.md` / `BUILD.md` text that describes
them.

**Not in scope:** the token-pasted `dcd` word read by a real `ldr` (round
005 left it open and `BUILD.md` documents it); round D; round E and
`cmatch_loop.py`; fixing any source file a check flags (list it); GitHub
settings, the ruleset or the set of required checks; any change under
`src/`, `libs/`, `include/`, `config/`, `assets/`, `orig/` or to `*.sha1`;
framework files.

## Invariants

- All three ROMs rebuild byte-identical (`AGENTS.md`, Invariants).
- The five required checks keep their names and run on every pull request.
- The two baselines only shrink (round 005); a baseline entry may be
  removed, never added.
- A new check is trusted only after it is shown failing on a known-bad input
  (`AGENTS.md`, Evidence).
- The gate is never piped; its log is written with `--log`.
- No personal paths or email addresses in `AGENTS.md`, `CLAUDE.md`,
  `docs/state.md`, `docs/agents/` or `docs/rounds/`; `AGENTS.md` does not
  grow (1,524 words at the start commit).

## Acceptance criteria

1. A simulated `factory/` pull request that changes a checker file fails the
   item-1 step; one that changes only match files passes; a non-`factory/`
   branch changing a checker file passes. Each is shown by running the
   step's command locally.
2. Every construct listed under item 2 is flagged, each as a test that fails
   on today's lint; the honest cases the lint passes today still pass; and
   the tree's findings are unchanged or smaller, with any change explained.
3. A scratch change that alters ROM bytes ends the gate with `SHA1 FAIL`,
   `GATE FAIL` and `gate3: GATE EXIT 1`; a genuine toolchain failure still
   ends `GATE EXIT 2`.
4. On the final commit the three-ROM gate passes on Windows with
   `gate3: GATE EXIT 0`, and `unittest`, `pytest`, `ruff check .`,
   `check_ci_contract.py` and `fw.py check` are clean.

## Required evidence

1. The gate log check from `AGENTS.md` in its PowerShell form, verbatim, on
   the final commit, naming it.
2. Item 1: the derived allowed set and protected set with how each was
   derived, the CI job and step, and the three local runs.
3. Item 2: the method, each listed construct and each bypass you tried, with
   today's lint and the new lint's output.
4. Item 3: the cause with the evidence that shows it, and the two gate runs'
   log lines.
5. `python -m unittest discover -s tests`, `python -m pytest -q tests`,
   `ruff check .`, `python tools/check_ci_contract.py`,
   `python tools/fw.py check`, and the word count of `AGENTS.md`.
6. Every source file or symbol the checks flag on the final tree, listed,
   not fixed.
