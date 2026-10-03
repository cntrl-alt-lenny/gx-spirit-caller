<!-- fw-report
round: 007-checker-hardening
role: worker
branch: worker/007-checker-hardening
head: d3a7d02812ef0418811a8affe119d37914c187ab
os: macOS 27.0
python: 3.9.6
written: 2026-10-03T19:10:33Z
-->
## Verified

STOPPED before implementation: one assumption in the brief is false. The
Worker role card, Start 3, requires stopping when a brief's assumptions turn
out to be false. Acceptance criterion 2 treats a brace-less declaration as
a semantic volatile-local miss; the actual Metrowerks compiler rejects that
construct before it can produce a ROM. The lint does miss its spelling, but
it is not a compiling bypass.

All repository checks below were run at
`d3a7d02812ef0418811a8affe119d37914c187ab`, with no production changes.

- Startup: the requested `git worktree add --detach .worktrees/worker-007
  origin/main` exited 128: `fatal: '.worktrees/worker-007' already exists`.
  `git worktree list --porcelain` showed that folder was a registered detached
  worktree at `5a660035d6faef87902b9f51793b1aff91fa64f9` (origin/main).
  In that folder, `python3 tools/fw.py start --role worker --round
  007-checker-hardening` exited 0:

  ```text
  seat ok: worker, round 007-checker-hardening, branch worker/007-checker-hardening at d3a7d02812ef
  brief: docs/rounds/007-checker-hardening/brief.md
  ```

- Compiler probe, run from the primary checkout using its existing compiler
  binary; only temporary files outside the repository were created. Input:

  ```c
  void f(int c) { while (c) volatile int x = c; }
  ```

  Command: `WINEDEBUG=-all wine tools/mwccarm/2.0/sp1p5/mwccarm.exe
  -proc arm946e -gccext,on -lang c -nolink /tmp/007-braceless.c
  -o /tmp/007-braceless.o` exited 1. Relevant real output (Wine's drive prefix
  redacted to satisfy the portable-document check):

  ```text
  ### mwccarm.exe Compiler:
  #    File: <scratch>/007-braceless.c
  # -------------------------------
  #       1: void f(int c) { while (c) volatile int x = c; }
  #   Error:                           ^^^^^^^^
  #   expression syntax error

  Errors caused tool to abort.
  ```

  Control input, identical except for braces:

  ```c
  void f(int c) { while (c) { volatile int x = c; } }
  ```

  `WINEDEBUG=-all MVK_CONFIG_LOG_LEVEL=0 wine
  tools/mwccarm/2.0/sp1p5/mwccarm.exe -proc arm946e -gccext,on -lang c
  -nolink /tmp/007-braced.c -o /tmp/007-braced.o` exited 0, no output.
  This distinguishes the syntax rejection from a broken compiler setup.

- Current lint, direct Python calls to
  `check_fake_matches.scan_source('probe.c', source)` for those two inputs,
  printing `(finding.rule, finding.text)`, exited 0:

  ```text
  braceless []
  braced [('volatile-local', 'void f(int c) { while (c) { volatile int x = c; } }')]
  ```

- Item 3 cause confirmed by a synthetic classifier call, not a ROM run.
  `gate3.is_infrastructure_failure(['ninja','sha1'], output, 1)` returned
  `True` for this output, printed as
  `successful compile then mismatch: True`; the probe exited 0:

  ```text
  [1/2] wine tools/mwccarm/2.0/sp1p5/mwccarm.exe -c x.c
  [2/2] sha1sum -c gx-spirit-caller_eur.sha1
  gx-spirit-caller_eur.nds: FAILED
  ```

  The classifier scans the whole output for tool names, so it cannot
  distinguish an earlier successful invocation from a failed invocation.
  `git log -S 'TOOLCHAIN_MARKERS' --oneline -- tools/gate3.py` exited 0:

  ```text
  e7f3c93c2 gate3: attribute toolchain failures as infrastructure
  ```

  `git show e7f3c93c2 --format=fuller -- tools/gate3.py` exited 0 and shows
  the current marker list and `any(marker in lowered ...)` introduced on
  July 31, before round C. No fix was made.

- `python3.13 -m pytest -q tests` exited 0:

  ```text
  1329 passed, 16 skipped, 132 subtests passed in 21.55s
  ```

- `python3.13 -m unittest discover -s tests` exited 0:

  ```text
  Ran 1345 tests in 19.582s
  OK (skipped=16)
  ```

- `ruff check .` exited 127: `zsh:1: command not found: ruff`.
  The installed module works: `python3.13 -m ruff check .` exited 0:
  `All checks passed!`.
- `python3.13 tools/check_ci_contract.py` exited 0:
  `OK: all 5 required check(s) resolve to a job that runs on every pull request.`
- `python3 tools/fw.py check` exited 0: `0 error(s), 0 warning(s)`.
- `python3.13 tools/check_fake_matches.py --list` exited 0:

  ```text
  check_fake_matches: raw-data-directive 0, section-override 0, data-in-pragma-section 0, text-unit-without-function 0, register-pin 0, do-while-zero 3, volatile-local 1 (baseline entries 4)
  check_fake_matches: OK
  ```

  Source findings, listed and not fixed: `do-while-zero` at line 10 in
  `src/jpn/overlay000/func_ov000_021ac77c.c`,
  `src/overlay000/func_ov000_021ac85c.c`, and
  `src/usa/overlay000/func_ov000_021ac77c.c`; `volatile-local` at line 7 in
  `src/main/func_02096040.legacy.c` (`volatile Obj02096040 tmp;`).
- `wc -w AGENTS.md` exited 0: `1524 AGENTS.md`; it is unchanged.
- Environment commands exited 0: `uname -s` returned `Darwin`,
  `sw_vers` returned `macOS`, `27.0`, `26A428`; `python3.13 --version`
  returned `Python 3.13.15`.

## Not verified

- None of the three implementation items or acceptance criteria is complete.
  No production code, workflow, settings, baseline or source was changed.
- No three-ROM gate, ROM-byte mutation gate, genuine toolchain-failure gate,
  final object/reference check, or new regression tests were run. Unit-suite
  success above is not ROM evidence. The baseroms were hard-linked into the
  Worker worktree with `tools/link_baseroms.py`, but not built there.
- A scratch libclang 18.1.1 experiment evaluated `0 && x` as integer zero
  and resolved `typedef int * volatile VPV; VPV p;` as a volatile canonical
  type. This was only a prototype outside the tracked tree, not a selected
  implementation or validation of the full construct list. Parsing the
  tree after blanking Metrowerks asm bodies still produced diagnostics in
  18 of 17,396 C units; adaptations were not finished or audited. No
  dependency was added to the project.
- Item 1 exploration read matching diffs `288253e4b` and `15a8e9579` and
  `tools/record_shipped.py`. Match shipments include C additions, assembly
  deletions, delinks changes and ledger records; those historical PRs also
  contain unrelated reviewed tooling and documentation changes. They
  cannot be adopted wholesale as a factory allowlist. No allowed/protected
  set was implemented or tested.
- The current `pull_request` workflow and checker execute from the proposed
  tree, so merely adding a step there leaves a self-removal avenue. A trusted
  workflow/checker design needs to address that. GitHub's current official
  documentation lists `pull_request_target` among events eligible for
  required checks, but no migration or live GitHub experiment was done.
  Source read: `docs.github.com/en/pull-requests/how-tos/merge-and-close-pull-requests/troubleshooting-required-status-checks`,
  section `Checks from some workflow jobs are not evaluated`.
- Windows behaviour was not exercised. No new Claude/Codex hook enforcement
  was exercised. No CI execution or ruleset modification was performed.

## Changed

- Only `docs/rounds/007-checker-hardening/worker.md`: records the mandatory
  stop, compiler rejection and control, preliminary findings, checks and
  unfinished work. `docs/state.md` and `AGENTS.md` are unchanged.

## Open questions

- Brain should correct or clarify criterion 2 before assigning further
  implementation. Suggested option: distinguish syntactically invalid
  snippets (which must fail closed as input errors) from valid compiler
  bypasses (which must yield the appropriate semantic rule finding).
  Alternatively remove the brace-less declaration from the compiling
  bypass list; its braced form already triggers today's lint, so that form
  cannot satisfy the requirement that every listed test fail on today's
  lint. I did not choose an interpretation or edit the brief.
- The remaining real compiler-valid misses, factory checker protection and
  mismatch classification remain outstanding. This stop is not acceptance
  of the current checker and not a claim that round 007 is finished.
