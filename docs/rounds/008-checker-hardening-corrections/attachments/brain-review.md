# Brain review of round 008

Reviewed delivery: `89530cfd35a2` (Verifier report commit).
Reviewed implementation/report tree:
`d38970fe178e7114e3d911705326aa1f49cd852f`.
Worker evidence tree: `9f845a6957f73b44acb133e3582f6b7f82e0fab3`.
Review date: 2026-10-03.

## Decision

Reject as a completed checker-hardening implementation. Both seats reported;
no production implementation was delivered. No merge card or merge is due.
The partial implementation attachment is an unfinished prototype, not a
passing production change. A corrective brief needs to resolve the exposed
source findings and use the actual production compiler flags.

## Independently checked findings

### Production changes absent: all three implementation blockers stand

Command:

```text
git diff --exit-code 8b7b6cc5d8634782de67f1598d7c343020cf1010 d38970fe178e7114e3d911705326aa1f49cd852f -- tools tests .github AGENTS.md BUILD.md src libs include config
```

Exit 0, no output. Only reports and attachments were added after the brief.
The workflow still checks out the proposed tree and executes its checker
scripts; no factory guard is installed. The production scanner still misses
compiler-valid constructs (probes below). The gate's classifier still treats
an earlier compiler invocation as infrastructure attribution for a later
checksum failure.

### Actual C99 language mode: the Verifier's correction stands

`tools/configure.py` routes `.c` through `-lang=c99`, not `-lang c`.
Brain's earlier round 007 probe used the wrong mode. Its rejection result was
real in that mode but did not establish production behaviour. The round 008
brief and its invalid-syntax test expectation are therefore incorrect for
the brace-less declaration. The for-initializer also compiles in production
mode and must not be demoted to a syntax control.

A Python 3.13 harness parsed the literal `CC_FLAGS` list from
`tools/configure.py` and passed every flag to the target compiler, adding
`-lang=c99`. Temporary inputs and objects were outside the tree. The harness
first checked that production files were identical between the reviewed tree
and Brain's checkout (`git diff --quiet` on production paths, exit 0).
Compiler invocation for each input:

```text
WINEDEBUG=-all MVK_CONFIG_LOG_LEVEL=0 WINEPREFIX=<primary>/.wine-lane wine tools/mwccarm/2.0/sp1p5/mwccarm.exe <CC_FLAGS> -lang=c99 <scratch>/<case>.c -o <scratch>/<case>.o
```

Each row below gives the compiler exit, object existence and current
`scan_source('probe.c', source)` findings. The harness exited 0:

```text
braceless C99 compiler exit 0 object exists True lint []
for-init C99 compiler exit 0 object exists True lint []
cast-zero C99 compiler exit 0 object exists True lint []
pointer-typedef C99 compiler exit 0 object exists True lint []
anonymous-aggregate C99 compiler exit 0 object exists True lint []
named-aggregate C99 compiler exit 0 object exists True lint [('volatile-local', 1)]
```

Inputs:

```c
void f(int c) { while (c) volatile int x = c; }
void f(void) { for (volatile int i=0; i<2; ++i) {} }
void f(void) { do {} while ((int)0); }
typedef int * volatile VPV; void f(void) { VPV p; }
void f(void) { volatile struct { int x,y; } p1,p2; }
typedef struct { int x,y; } S; void f(void) { volatile S p; }
```

### Three existing source findings: the stopping reason stands

The same harness compiled each actual source file with the production
compiler flags and scanned it with the unchanged production lint:

```text
src/overlay011/func_ov011_021d2ca8.c C99 compiler exit 0 object exists True lint []
src/usa/overlay011/func_ov011_021d2bb8.c C99 compiler exit 0 object exists True lint []
src/jpn/overlay011/func_ov011_021d2bb8.c C99 compiler exit 0 object exists True lint []
```

Each contains `volatile struct { int x, y; } p1, p2;` at line 25.
The named-aggregate control above is detected, so anonymous aggregate spelling
is a coverage gap, not grounds for a rule exemption. These three findings are
absent from `tools/fake_match_baseline.txt`.

The source comment in each file explicitly says the two dummy locals are
made volatile to defeat elimination of otherwise dead stack writes and retain
the target store order. This is stronger evidence than merely finding a
volatile type: the source itself records a matching workaround of the class
the rule is intended to reject. No Brain claim here proves that removing it
would preserve matching; a remediation Worker must prove any replacement.

Round 008 prohibits source repairs and baseline additions while requiring
unchanged-or-smaller findings and a passing semantic lint. Newly detecting
these real findings cannot satisfy all those requirements. The stop was
justified; no exception was authorized.

### Mismatch classification: blocker reproduced

The harness called
`gate3.is_infrastructure_failure(['ninja', 'sha1'], output, 1)` with:

```text
[1/2] wine tools/mwccarm/2.0/sp1p5/mwccarm.exe -c x.c
[2/2] sha1sum -c gx-spirit-caller_eur.sha1
gx-spirit-caller_eur.nds: FAILED
```

Real output, harness exit 0:

```text
successful compile then mismatch: infrastructure = True
```

This verifies the classifier defect, not a complete ROM-mutation gate.

## Proposed next direction

Recommended: a corrective implementation round may repair the three named
source files while preserving their matching C status and all three ROM
hashes, restore production-mode expectations for the brace-less and for-init
cases, and finish the three checker items. Keep both baselines shrink-only;
newly exposed findings are defects to resolve, not spelling exemptions.
Any additional finding or inability to preserve matching is reported rather
than hidden, converted to unmatched C or added to a baseline.

Alternative requiring an explicit owner policy change: grandfather these
three exact legacy findings while retaining the stronger rule for new code.
This conflicts with the current baseline shrink-only rule and is not
implicitly authorized. No baseline or policy was changed in this review.

## Not verified

No passing three-ROM gate was delivered or independently run for checker
corrections, because no correction was installed. Neither this review nor
unit-suite results proves a ROM verdict. No partial patch was applied or
accepted, no production test was added, no Windows or in-app hook run was
performed, and no PR or CI acceptance at the delivered commit exists.
The prototype's semantic adapter, dependencies and workflow trust design
still need full review and acceptance experiments after implementation.

## Review-document checks

Run at the delivered production tree with this review and the source-remediation
draft present as documentation only. All commands exited 0:

- `python3.13 -m pytest -q tests`:

  ```text
  1331 passed, 14 skipped, 132 subtests passed in 16.17s
  ```

- `python3.13 -m unittest discover -s tests`:

  ```text
  Ran 1345 tests in 15.385s
  OK (skipped=14)
  ```

- `python3.13 -m ruff check .`:

  ```text
  All checks passed!
  ```

- `python3.13 tools/check_ci_contract.py`:

  ```text
  OK: all 5 required check(s) resolve to a job that runs on every pull request.
  ```

- `python3 tools/fw.py check`:

  ```text
  0 error(s), 0 warning(s)
  ```

- `git diff --check`: no output.

These are documentation checks, not acceptance of the proposed checker or
source changes. The draft is not a live round or an agent assignment.
