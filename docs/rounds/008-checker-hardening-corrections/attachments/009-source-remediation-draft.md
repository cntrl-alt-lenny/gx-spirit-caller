# 009-checker-and-source-corrections: Close the checker's remaining gaps before the factory

Tier: 2
Mode: implementation
Supersedes: 008-checker-hardening-corrections — source-scope constraints blocked real semantic findings, and compiler probes used the wrong language mode.

Draft for the owner's source-remediation direction. Do not dispatch this
attachment as a live brief; Brain will publish it as round 009 after the
owner chooses that direction.

Round 008 delivered reports and an unfinished exploratory patch, with no
production correction. Brain checked the Verifier's findings at
`d38970fe178e7114e3d911705326aa1f49cd852f`; the review is in
`docs/rounds/008-checker-hardening-corrections/attachments/brain-review.md`.

## Goal

1. **The factory cannot change the checker.** A factory batch that changes
   any file the verdict depends on fails a required check, while a reviewed
   round can still change those files.
2. **The lint decides meaning, not spelling,** for its `do-while-zero` and
   `volatile-local` rules.
3. **A ROM mismatch is reported as a failure,** not as an infrastructure
   error.
4. **Three newly exposed legacy findings are repaired without losing matching
   C:** the overlay011 source files listed below no longer use volatile dummy
   locals or equivalent fake-match workarounds, and all three functions still
   match their original bytes at 100%.

## Context

**Read:** `AGENTS.md`, your role card, `BUILD.md` ("The checker"), this
brief, round 008's Brain review and reports, round 005's findings, and the
checker tools/workflow named in the earlier briefs. The round 008 patch is
an unfinished reference only: evaluate it, do not assume it is correct.
The Verifier must defer the new round's Worker report until after its blind
first pass; historical reports are context, not proof.

**Compiler context.** Derive the production compiler version, language mode,
optimization, type and per-file flags from `tools/configure.py` and the actual
build command. Ordinary `.c` uses `-lang=c99`, not `-lang c`. In that mode
the brace-less volatile declaration and volatile for-initializer compile.
They are semantic lint misses, not invalid-input controls. Every compiler
probe must use the applicable production flags and show object creation.

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

Include the compiler-valid brace-less `while (c) volatile int x = c;`
and volatile for-initializer in the missing-case campaign. A genuinely invalid
input remains a separate non-zero diagnostic control. Classify examples using
the production compiler flags, not a language-mode assumption. Already-detected
controls need preservation, not invented red results.

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

**Item 4.** These actual source files each declare
`volatile struct { int x, y; } p1, p2;` at line 25:

- `src/overlay011/func_ov011_021d2ca8.c` (EUR)
- `src/usa/overlay011/func_ov011_021d2bb8.c` (USA)
- `src/jpn/overlay011/func_ov011_021d2bb8.c` (JPN)

Their comments say the locals force otherwise eliminated stack writes to retain
matching output. The current lint misses them; the named-aggregate form is
already detected. Repair the actual source semantics while preserving each
function's matched C. Do not exempt aggregates by spelling, convert the
functions to assembly, manufacture new fake dependencies, or add baseline
entries. Interim new findings are expected during diagnosis; final findings
must be resolved. If another real finding appears, or matching C cannot be
preserved, report the concrete evidence and unresolved scope rather than
hiding it or weakening the checker.

**Where to work.** On the owner's Mac, in
`.worktrees/worker-009` inside the primary checkout (`git worktree add`),
baseroms hard-linked with `python3.13 tools/link_baseroms.py
.worktrees/worker-009` from the primary checkout. Use `python` for project
scripts on Windows and `python3.13` on macOS; the framework's `fw.py` may
use `python3`. Downloaded tools arrive on the first build. The Verifier
works in `.worktrees/verifier-009` with its own hard-linked baseroms.
The owner moved this round's work to macOS; the final gate is required on
macOS. Windows behaviour not exercised here must be reported as not verified.

## Scope and non-goals

**In scope:** items 1 to 4, their tests, the trusted CI wiring inside an
existing required job, descriptions in `AGENTS.md` / `BUILD.md`, and C-only
repairs to the three named overlay011 source files. No other source file is
authorized for repair.

**Not in scope:** the token-pasted `dcd` word read by a real `ldr` (round
005 left it open and `BUILD.md` documents it); round D; round E and
`cmatch_loop.py`; source repairs beyond the three explicitly named files;
GitHub settings, the ruleset or the set of required checks; any change under
`libs/`, `include/`, `config/`, `assets/`, `orig/` or to `*.sha1`;
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
   starting lint and green on the new lint. This includes the brace-less
   declaration and volatile for-initializer in production C99 mode. A
   genuinely invalid input produces a non-zero diagnostic. Already-detected cases remain detected. Honest
   cases the current lint accepts still pass, and the tree's findings are
   unchanged or smaller, with any change explained. Cover active source and
   any inactive-source checks the existing lint performs; explain semantic
   coverage limits and fail closed when analysis cannot establish a result.
3. A scratch change that alters ROM bytes ends the gate with `SHA1 FAIL`,
   `GATE FAIL` and `gate3: GATE EXIT 1`; a genuine toolchain failure still
   ends `GATE EXIT 2`.
4. The three named functions retain matching C, with before/after objdiff
   at 100%, no new fake-match workaround, no baseline growth and no source
   edits outside the authorized trio.
5. On the final commit the three-ROM gate passes on macOS with
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
6. Every final finding and its disposition. Source edits are limited to
   item 4; no new finding may be hidden or baselined.
7. For each named function, before/after objdiff at 100% at stated commits,
   the source-level removal of fake-match workarounds, and
   `python3.13 tools/check_match_invariants.py --version eur` with no errors.
   Quote any progress values only from `python3.13 tools/progress.py
   --version <region>` at stated commits; matched C is retained in all regions.
