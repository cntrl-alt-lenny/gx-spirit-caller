# Brain review of round 007

Reviewed delivery: `09dfe0a7f925` (report commit), describing
`d3a7d02812ef0418811a8affe119d37914c187ab` (unchanged production tree).
Review date: 2026-10-03.

## Outcome

Stopped delivery, not an accepted implementation. The diff from the brief
branch adds only the Worker report. No implementation item or ROM gate was
completed. The next step is corrective round 008, not a Verifier review of
round 007. No merge was made or proposed.

## Independently re-derived

Brain ran these probes at `d3a7d02812ef0418811a8affe119d37914c187ab`.
The harness used Python 3.13, temporary source/object files outside the tree,
and the primary checkout's existing compiler. File locations below are
abbreviated as `<scratch>` for portability.

Compiler command for each input:

```text
WINEDEBUG=-all MVK_CONFIG_LOG_LEVEL=0 wine tools/mwccarm/2.0/sp1p5/mwccarm.exe -proc arm946e -gccext,on -lang c -nolink <scratch>/<case>.c -o <scratch>/<case>.o
```

Input `void f(int c) { while (c) volatile int x = c; }`:

```text
braceless: compiler exit 1
### mwccarm.exe Compiler:
#    File: <scratch>/braceless.c
#       1: void f(int c) { while (c) volatile int x = c; }
#   Error:                           ^^^^^^^^
#   expression syntax error
Errors caused tool to abort.
```

Control `void f(int c) { while (c) { volatile int x = c; } }`:

```text
braced: compiler exit 0
```

A Python 3.13 harness called `check_fake_matches.scan_source('probe.c',
source)` on both inputs and printed `(finding.rule, finding.text)`;
harness exit 0:

```text
braceless []
braced [('volatile-local', 'void f(int c) { while (c) { volatile int x = c; } }')]
```

Thus the brace-less example is invalid syntax, not a compiling semantic
bypass; the braced counterpart is already detected. Criterion 2 must give
these distinct outcomes rather than requiring a new semantic regression
for every spelling. The Worker's stop followed its role card.

The same harness called
`gate3.is_infrastructure_failure(['ninja', 'sha1'], output, 1)` on:

```text
[1/2] wine tools/mwccarm/2.0/sp1p5/mwccarm.exe -c x.c
[2/2] sha1sum -c gx-spirit-caller_eur.sha1
gx-spirit-caller_eur.nds: FAILED
```

Actual output, harness exit 0:

```text
successful compile then mismatch: infrastructure = True
```

`git log -S TOOLCHAIN_MARKERS --format='%h %ad %s' --date=short -- tools/gate3.py`
exited 0:

```text
e7f3c93c2 2026-07-31 gate3: attribute toolchain failures as infrastructure
```

This is classifier evidence, not a ROM build or gate failure experiment.

## Other review observations

The current `.github/workflows/tests.yml` checks out the proposed tree and
runs checker scripts from it. A factory guard that lives only in that tree
can be removed or weakened alongside its CI step. Round 008 retains the
original protection goal and explicitly requires testing that avenue against
the trusted decision path without changing GitHub settings or the required
check set.

## Not verified

No three-ROM gate, production fix, final CI run, Windows run or in-app hook
enforcement was independently exercised in this review. Unit-suite success
in the Worker report is not evidence that any implementation goal was met.

## Checks for the corrective documentation

Run with the round 008 brief and this review present in the working tree,
based on delivery `09dfe0a7f925`; production files are unchanged:

- `python3.13 -m pytest -q tests`, exit 0:

  ```text
  1331 passed, 14 skipped, 132 subtests passed in 14.48s
  ```

- `python3.13 -m unittest discover -s tests`, exit 0:

  ```text
  Ran 1345 tests in 12.616s
  OK (skipped=14)
  ```

- `python3.13 -m ruff check .`, exit 0:

  ```text
  All checks passed!
  ```

- `python3 tools/fw.py check`, exit 0:

  ```text
  0 error(s), 0 warning(s)
  ```

- `git diff --check`, exit 0, no output.
