# 008-checker-hardening-corrections: Close the checker's remaining gaps before the factory

Tier: 2
Mode: implementation
Supersedes: 007-checker-hardening — its criterion 2 incorrectly required a semantic finding for syntax the target compiler rejects.

Round C (rounds 004 and 005) is merged. Its review left three gaps that
matter once the factory (round E) runs unattended; this round closes them.
Round 007 stopped before implementation and delivered only its Worker report.
The correction below distinguishes valid semantic bypasses from invalid
syntax; none of the three implementation items was completed in round 007.

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
brief, round 007's Worker report and
`docs/rounds/007-checker-hardening/attachments/brain-review.md`, round 005's
brief and both its reports in
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

The factory guard must also survive removal or weakening of its own CI step,
workflow, checker, imports, configuration or protected-path list in the proposed
tree. Derive and document what code and metadata the decision trusts. A
check executed solely from factory-controlled files does not meet this goal.
Changes to workflow triggers are in scope only if the existing five required
check names still report on every PR, permissions stay read-only, and no
untrusted proposed code is executed with secrets or write permissions.
No GitHub settings or required-check-set changes are authorized. Show the
attack simulations against the actual trusted decision path, not just a
helper supplied by the proposed tree.

**Item 2.** Round 005's Verifier got `do { ... } while ((int)0)` past the
whole gate (`GATE EXIT 0`) and listed further misses: `while (1-1)`, `-0`, a
NUL character literal, `NULL`, `0.0`, `0 && x`, `((void)0, 0)`,
`sizeof(char)-1`, `0 == 1`, an enum constant; and for `volatile-local`, a
`for (volatile int i = 0; ...)` init, `typedef int * volatile VPV; VPV p;`, a
function-like macro `#define DECL(t,n) volatile t n`, and
`int a = 0, * volatile p = &a;`.

The previously listed brace-less `while (c) volatile int x = c;` is invalid:
round 007 demonstrated target-compiler syntax rejection. Keep it as an invalid
input control, not a compiling semantic bypass. Invalid input must produce a
non-zero result with a diagnostic, never silently count as a successful
semantic analysis. Its braced counterpart is a detection control that already
triggers the current lint. Validate all other examples with the target
compiler, including the definitions and context each requires. If another
example is invalid or already detected, classify it with evidence and proceed
with the valid missing cases; do not invent a bypass or stop over that
classification alone.

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

**Where to work.** On the owner's Mac, in
`.worktrees/worker-008` inside the primary checkout (`git worktree add`),
baseroms hard-linked with `python3.13 tools/link_baseroms.py
.worktrees/worker-008` from the primary checkout. Use `python` for project
scripts on Windows and `python3.13` on macOS; the framework's `fw.py` may
use `python3`. Downloaded tools arrive on the first build. The Verifier
works in `.worktrees/verifier-008` with its own hard-linked baseroms.
The owner moved this round's work to macOS; the final gate is required on
macOS. Windows behaviour not exercised here must be reported as not verified.

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
   step's command locally. Factory attacks removing or weakening the guard's
   workflow, CI step, implementation or dependencies also fail through the
   trusted decision path. Derive the PR's head-branch classification from
   trusted event metadata; proposed-tree configuration must not override it.
2. Every valid previously missed construct under item 2 produces the
   appropriate semantic finding, with each regression test shown red on the
   starting lint and green on the new lint. Invalid syntax, including the
   brace-less declaration, produces a non-zero diagnostic; it need not yield
   a volatile-local finding. Already-detected cases remain detected. Honest
   cases the current lint accepts still pass, and the tree's findings are
   unchanged or smaller, with any change explained. Cover active source and
   any inactive-source checks the existing lint performs; explain semantic
   coverage limits and fail closed when analysis cannot establish a result.
3. A scratch change that alters ROM bytes ends the gate with `SHA1 FAIL`,
   `GATE FAIL` and `gate3: GATE EXIT 1`; a genuine toolchain failure still
   ends `GATE EXIT 2`.
4. On the final commit the three-ROM gate passes on macOS with
   `gate3: GATE EXIT 0`, and `unittest`, `pytest`, `ruff check .`,
   `check_ci_contract.py` and `fw.py check` are clean.

## Required evidence

1. The gate log check from `AGENTS.md` in its macOS shell form, verbatim, on
   the final commit, naming it.
2. Item 1: the derived allowed set and protected set with how each was
   derived, the CI job and step, and the three local runs.
3. Item 2: the method, compiler acceptance/rejection for each listed
   construct, each bypass tried, and the starting and new lint's output.
   Give valid misses, invalid syntax and already-detected controls distinct
   expected outcomes; include the red/green evidence for new regression tests.
4. Item 3: the cause with the evidence that shows it, and the two gate runs'
   log lines.
5. `python3.13 -m unittest discover -s tests`, `python3.13 -m pytest -q tests`,
   `python3.13 -m ruff check .` (the installed Ruff module),
   `python3.13 tools/check_ci_contract.py`,
   `python3 tools/fw.py check`, and the word count of `AGENTS.md`.
6. Every source file or symbol the checks flag on the final tree, listed,
   not fixed.
