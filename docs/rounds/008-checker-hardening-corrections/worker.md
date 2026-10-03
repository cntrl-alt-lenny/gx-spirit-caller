<!-- fw-report
round: 008-checker-hardening-corrections
role: worker
branch: worker/008-checker-hardening-corrections
head: 9f845a6957f73b44acb133e3582f6b7f82e0fab3
os: macOS 27.0
python: 3.9.6
written: 2026-10-03T19:42:20Z
-->
## Verified

STOPPED after exploratory implementation, before completing the brief. A
semantic fix exposes compiler-valid volatile aggregate locals already in the
source tree. The brief simultaneously requires unchanged or smaller findings,
no source fixes, no baseline additions, and a passing final gate. Those
requirements cannot all hold for the existing volatile-local rule, which also
flags named volatile aggregates. The Worker role card, Start 3, requires a
stop when the brief cannot be satisfied. No exception or weakening was chosen.

Production files are unchanged from the start commit
`8b7b6cc5d8634782de67f1598d7c343020cf1010`. Exploratory edits were preserved
as an explicitly unfinished patch, then removed from the production tree.
The attachment/evidence commit is
`9f845a6957f73b44acb133e3582f6b7f82e0fab3`.

- Required seat start, exit 0:

  ```text
  python3 tools/fw.py start --role worker --round 008-checker-hardening-corrections
  seat ok: worker, round 008-checker-hardening-corrections, branch worker/008-checker-hardening-corrections at 8b7b6cc5d863
  brief: docs/rounds/008-checker-hardening-corrections/brief.md
  ```

- At the start commit's unchanged source, the three new findings are real
  volatile object declarations at line 25, not pointer-to-volatile references:

  ```c
  volatile struct { int x, y; } p1, p2;
  ```

  Sources: `src/overlay011/func_ov011_021d2ca8.c`,
  `src/usa/overlay011/func_ov011_021d2bb8.c`, and
  `src/jpn/overlay011/func_ov011_021d2bb8.c`. Direct calls to the starting
  `check_fake_matches.scan_source(path, source)` returned `[]` for each;
  harness exit 0. Each source compiled with the target compiler, exit 0,
  with no output:

  ```text
  WINEDEBUG=-all MVK_CONFIG_LOG_LEVEL=0 wine <primary>/tools/mwccarm/2.0/sp1p5/mwccarm.exe -proc arm946e -gccext,on -lang c -nolink <source> -o <scratch object>
  src/overlay011/func_ov011_021d2ca8.c compiler exit 0
  src/usa/overlay011/func_ov011_021d2bb8.c compiler exit 0
  src/jpn/overlay011/func_ov011_021d2bb8.c compiler exit 0
  ```

  The semantic prototype's `check_fake_matches.py --list` run exited 1:

  ```text
  NEW: volatile-local src/jpn/overlay011/func_ov011_021d2bb8.c: volatile struct { int x, y; } p1, p2;
  NEW: volatile-local src/overlay011/func_ov011_021d2ca8.c: volatile struct { int x, y; } p1, p2;
  NEW: volatile-local src/usa/overlay011/func_ov011_021d2bb8.c: volatile struct { int x, y; } p1, p2;
  check_fake_matches: FAIL
  ```

  This is a previously missed defect class. Excluding inline aggregate types
  by their spelling would perpetuate it. The existing rule catches named
  aggregates, including `volatile Obj02096040 tmp;`; removing all aggregate
  coverage would also violate the already-detected control requirement.

- Compiler classification at the start source commit: all eleven listed
  constant-false conditions and the pointer typedef, declaration macro and
  multiple declarators compiled, each exit 0. The `for(volatile int i=0;...)`
  initializer and brace-less declaration each exited 1 with `expression
  syntax error`; the braced control compiled, exit 0. Exact inputs, commands,
  individual outputs, initial lint misses and prototype results are in
  `attachments/probe-evidence.md`. The `for` example must be a syntax
  control in the tested target C mode; this classification is not the reason
  for stopping.

The following checks were run at the attachment/evidence commit stated above:

- `python3.13 -m pytest -q tests`, exit 0:

  ```text
  1329 passed, 16 skipped, 132 subtests passed in 15.19s
  ```

- `python3.13 -m unittest discover -s tests`, exit 0:

  ```text
  Ran 1345 tests in 13.467s
  OK (skipped=16)
  ```

- `python3.13 -m ruff check .`, exit 0: `All checks passed!`.
- `python3.13 tools/check_ci_contract.py`, exit 0:
  `OK: all 5 required check(s) resolve to a job that runs on every pull request.`
- `python3 tools/fw.py check`, exit 0: `0 error(s), 0 warning(s)`.
- `git diff --check`, exit 0, no output.
- `wc -w AGENTS.md`, exit 0: `1524 AGENTS.md`; unchanged.

The restored production lint was also run on the unchanged source before the
attachment commit: `python3.13 tools/check_fake_matches.py --list`, exit 0:

```text
check_fake_matches: raw-data-directive 0, section-override 0, data-in-pragma-section 0, text-unit-without-function 0, register-pin 0, do-while-zero 3, volatile-local 1 (baseline entries 4)
check_fake_matches: OK
```

Its four existing findings, listed and not fixed:
`do-while-zero` at line 10 in `src/jpn/overlay000/func_ov000_021ac77c.c`,
`src/overlay000/func_ov000_021ac85c.c`, and
`src/usa/overlay000/func_ov000_021ac77c.c`; `volatile-local` at line 7 in
`src/main/func_02096040.legacy.c` (`volatile Obj02096040 tmp;`).

Environment commands, each exit 0: `uname -s` returned `Darwin`;
`sw_vers` returned `macOS`, `27.0`, `26A428`; `python3.13 --version`
returned `Python 3.13.15`. All baseroms were hard-linked with
`python3.13 tools/link_baseroms.py .worktrees/worker-008` from the primary
checkout, exit 0; the command checked all three expected SHA-1 hashes.

## Not verified

- None of the three implementation items is delivered as production code.
  No acceptance criterion is complete. The attached patch is unfinished,
  unreviewed and has a failing syntax-control test; do not apply or merge it
  as a passing correction. The `for` initializer test also needs its expected
  outcome corrected using the compiler classification above.
- No macOS three-ROM gate, final gate log check, ROM-byte mutation gate,
  genuine toolchain-failure gate or built-object/reference check was run.
  Tests above are documentation-delivery checks, not ROM evidence. There is
  no build-path change in the delivered tree.
- Complete regression red/green evidence against the starting lint was not
  collected. The attached evidence distinguishes observed initial misses,
  compiler outcomes and partial new-test results.
- The proposed trusted factory workflow was not run on GitHub; its trust
  boundary, trigger migration, required-check behaviour and attack coverage
  have not been accepted or fully validated. No GitHub settings, required
  checks, ruleset, secrets or permissions were changed.
- Windows behaviour, hooks, compiler/platform compatibility of libclang,
  and the syntax adapter's full semantic equivalence were not verified.
  Clang accepts the brace-less declaration that the target rejects; the
  prototype therefore requires additional target-dialect validation.
- Initial documentation checks briefly failed on synthetic Git-test email
  literals in the patch attachment. Those were replaced with constructed
  strings; checks above were rerun and are clean. No personal address was
  introduced into the final documents.

## Changed

- `attachments/partial-implementation.patch`: preserves exploratory factory
  guard/CI wiring, semantic lint, mismatch attribution and regression tests
  for a future corrected brief. It changes no production file by itself.
- `attachments/probe-evidence.md`: records compiler inputs and outputs,
  initial lint misses, semantic prototype findings and partial test results.
- `worker.md`: records the stop, contradiction, evidence and remaining work.
- `AGENTS.md`, `BUILD.md`, `docs/state.md`, every source/configuration file,
  both baselines, settings, workflows, tools and framework files are unchanged
  in the delivered production tree. No match was changed or merged.

## Open questions

Brain needs a policy-compatible corrective brief for the three newly exposed
aggregate findings before this semantic checker can produce a passing gate.
Options are a separately authorized source-correction round that preserves
matching, or an owner decision explicitly changing how existing findings are
grandfathered. Adding baseline entries, fixing sources or weakening the rule
is not authorized by this brief; no option was selected here.

The exploratory mismatch fix and base-tree factory protection remain useful
starting points, but both require their complete acceptance experiments after
the brief's incompatible semantic/tree requirements are resolved.
