<!-- fw-report
round: 008-checker-hardening-corrections
role: verifier
branch: verifier/008-checker-hardening-corrections
head: d38970fe178e7114e3d911705326aa1f49cd852f
os: macOS 27.0
python: 3.9.6
written: 2026-10-03T19:54:26Z
-->
Reviewed commit: `d38970fe178e7114e3d911705326aa1f49cd852f`.

Blind first pass inspected the actual diff and unchanged production checker,
ran independent lint/classifier probes and launched the required checks before
opening this round's Worker report. Pass two compared that report and its
attachments, then independently checked the newly reported aggregate locals
and the compiler language mode. No production code or source was changed.

## Findings

- [BLOCKER] `.github/workflows/tests.yml:39` — acceptance criterion 1 is
  not implemented. The workflow still checks out the proposed tree and runs
  its checker scripts; there is no factory branch classification or trusted
  factory scope decision. A factory change can remove or weaken those scripts
  or steps. The proposed guard exists only as attachment text, which no job
  executes. This is an unmet implementation goal, not a new regression.
- [BLOCKER] `tools/check_fake_matches.py:355` — acceptance criterion 2 is
  not implemented. The production rules remain lexical. All eleven listed
  constant-false expressions and the declaration macro, volatile pointer
  typedef and multiple declarators compile under the project's C99 flags and
  return no findings. Scratch-root CLI runs for the cast-zero and pointer
  typedef return `check_fake_matches: OK`, exit 0. Such source can still pass
  the source lint without satisfying the semantic rules.
- [BLOCKER] `tools/gate3.py:202` — acceptance criterion 3 is not
  implemented. A successful compiler command earlier in Ninja output makes
  a later SHA-1 mismatch classify as infrastructure. The independent probe
  below returns `True`; the unchanged region handler therefore takes the
  infrastructure path instead of `SHA1 FAIL`. No real mutation gate was
  delivered or reproduced. This predates round C.
- [SHOULD FIX] `docs/rounds/008-checker-hardening-corrections/worker.md:69`
  and `attachments/probe-evidence.md:121` — the compiler probes use
  `-lang c`, but `tools/configure.py:272` builds `.c` with `-lang=c99`.
  Under the actual C99 mode both the for-initializer and brace-less
  declaration compile successfully and create objects, including with the
  production optimization/type flags. The instruction to reclassify the for
  initializer as a syntax control is therefore unsuitable for this build.
  The brief's assumed brace-less rejection also needs correction: it is a
  compiler-valid lint miss in the tested project mode. The reported C-mode
  rejection is not disputed; its applicability to the production mode is.
- [NOTE] `src/overlay011/func_ov011_021d2ca8.c:25`,
  `src/usa/overlay011/func_ov011_021d2bb8.c:25` and
  `src/jpn/overlay011/func_ov011_021d2bb8.c:25` — independently confirmed
  the Worker's stopping reason. Each declares
  `volatile struct { int x, y; } p1, p2;`, compiles and is missed by the
  existing scanner. A named aggregate control is already detected. These
  are real volatile objects; treating anonymous aggregate spelling as exempt
  would retain the defect. Correct semantic detection exposes additional
  findings while this brief forbids source fixes and baseline growth and
  requires unchanged or smaller findings and a passing gate. Brain needs a
  corrective scope/policy decision before implementation can satisfy those
  requirements together. No source was fixed or baseline expanded.

Acceptance assessment: criteria 1, 2 and 3 are not met. Criterion 4 is
partially checked: non-ROM checks are clean, but there is no completed
three-ROM result. The partial patch is explicitly unfinished, including a
reported failing test; it is not executable delivery or acceptance evidence.
The Worker accurately reports that no implementation goal is complete.

Independent commands and real output at the reviewed commit:

1. `git diff --name-only 8b7b6cc5d8634782de67f1598d7c343020cf1010 HEAD`,
   exit 0:

   ```text
   docs/rounds/008-checker-hardening-corrections/attachments/partial-implementation.patch
   docs/rounds/008-checker-hardening-corrections/attachments/probe-evidence.md
   docs/rounds/008-checker-hardening-corrections/worker.md
   ```

   `git diff --quiet 8b7b6cc5d8634782de67f1598d7c343020cf1010 HEAD -- tools tests .github AGENTS.md BUILD.md src libs include config`,
   exit 0, no output. The production implementation is unchanged.

2. Python 3.13 harness called `scan_source` and `main(['--root', scratch])`
   with a temporary `src/probe.c` and empty format-2 baseline. Harness exit 0:

   ```text
   cast-zero []
   cast-zero CLI exit 0
   pointer-typedef []
   pointer-typedef CLI exit 0
   invalid-braceless []
   invalid-braceless CLI exit 0
   braced-control [('volatile-local', 1)]
   braced-control CLI exit 1
   ```

   Inputs were `void f(void) { do { } while ((int)0); }`,
   `typedef int * volatile VPV; void f(void) { VPV p; }`,
   `void f(int c) { while (c) volatile int x = c; }` and
   `void f(int c) { while (c) { volatile int x = c; } }`.
   The first three printed `check_fake_matches: OK`; the last printed
   `NEW: volatile-local src/probe.c:` and `check_fake_matches: FAIL`.

3. Target compiler harness, Python 3.13, temporary sources/objects, exit 0.
   Each compiler invocation used this worktree's downloaded compiler and Wine
   prefix, with `WINEDEBUG=-all` and `MVK_CONFIG_LOG_LEVEL=0`:

   ```text
   wine tools/mwccarm/2.0/sp1p5/mwccarm.exe -O4,p -enum int -char signed -proc arm946e -gccext,on -fp soft -inline noauto -Cpp_exceptions off -RTTI off -interworking -w off -sym on -gccinc -nolink -lang=c99 <scratch-source> -o <scratch-object>
   ```

   Real per-case output (the harness also ran the production scanner):

   ```text
   (int)0 C99 compiler exit 0 object exists True lint []
   1-1 C99 compiler exit 0 object exists True lint []
   -0 C99 compiler exit 0 object exists True lint []
   '\0' C99 compiler exit 0 object exists True lint []
   NULL C99 compiler exit 0 object exists True lint []
   0.0 C99 compiler exit 0 object exists True lint []
   0 && x C99 compiler exit 0 object exists True lint []
   ((void)0,0) C99 compiler exit 0 object exists True lint []
   sizeof(char)-1 C99 compiler exit 0 object exists True lint []
   0 == 1 C99 compiler exit 0 object exists True lint []
   ZERO C99 compiler exit 0 object exists True lint []
   for-init C99 compiler exit 0 object exists True lint []
   pointer-typedef C99 compiler exit 0 object exists True lint []
   declaration-macro C99 compiler exit 0 object exists True lint []
   multi-decl C99 compiler exit 0 object exists True lint []
   invalid-braceless C99 compiler exit 0 object exists True lint []
   braced-control C99 compiler exit 0 object exists True lint [('volatile-local', 1)]
   src/overlay011/func_ov011_021d2ca8.c C99 compiler exit 0 object exists True lint []
   src/usa/overlay011/func_ov011_021d2bb8.c C99 compiler exit 0 object exists True lint []
   src/jpn/overlay011/func_ov011_021d2bb8.c C99 compiler exit 0 object exists True lint []
   ```

   Condition inputs used `#define NULL ((void*)0)`, `enum { ZERO=0 };`
   and `void f(int x){do{}while(<condition>);}`. Declaration inputs match
   the complete examples in `attachments/probe-evidence.md:129`.
   Aggregate cases compiled the actual committed files. An earlier harness
   using the primary compiler and default Wine prefix stalled and was
   terminated; no compiler conclusion relies on that incomplete run.

   Separate scanner controls, harness exit 0:

   ```text
   named aggregate control [('volatile-local', 1)]
   honest statement macro []
   ```

   Inputs: `typedef struct {int x,y;} S; void f(void){volatile S p;}` and
   `#define STMT() do {} while (0)` followed by `void f(void){STMT();}`.

4. Python 3.13 classifier harness, exit 0, called
   `gate3.is_infrastructure_failure(['ninja','sha1'], output, 1)` on:

   ```text
   [1/2] wine tools/mwccarm/2.0/sp1p5/mwccarm.exe -c x.c
   [2/2] sha1sum -c gx-spirit-caller_eur.sha1
   gx-spirit-caller_eur.nds: FAILED
   ```

   Output: `successful compile then mismatch: infrastructure = True`.
   `git log -S TOOLCHAIN_MARKERS --format='%h %ad %s' --date=short -- tools/gate3.py`,
   exit 0:
   `e7f3c93c2 2026-07-31 gate3: attribute toolchain failures as infrastructure`.

5. `python3.13 -m pytest -q tests`, exit 0:
   `1329 passed, 16 skipped, 132 subtests passed in 14.46s`.
   `python3.13 -m unittest discover -s tests`, exit 0 (repeat captured to
   a scratch log to retain its summary):

   ```text
   Ran 1345 tests in 19.529s
   OK (skipped=15)
   ```

   The later unittest run had downloaded dsd available; skip counts reflect
   available tools, not a production change.
6. `python3.13 -m ruff check .`, exit 0: `All checks passed!`.
7. `python3.13 tools/check_ci_contract.py`, exit 0:
   `OK: all 5 required check(s) resolve to a job that runs on every pull request.`
8. `python3 tools/fw.py check`, exit 0: `0 error(s), 0 warning(s)`.
9. `wc -w AGENTS.md`, exit 0: `1524 AGENTS.md`.
   `git diff --check`, exit 0, no output.
10. `python3.13 tools/check_fake_matches.py --list`, exit 0:

    ```text
    check_fake_matches: raw-data-directive 0, section-override 0, data-in-pragma-section 0, text-unit-without-function 0, register-pin 0, do-while-zero 3, volatile-local 1 (baseline entries 4)
    check_fake_matches: OK
    ```

    Every reported source finding, left unchanged: `do-while-zero` at
    `src/jpn/overlay000/func_ov000_021ac77c.c:10`,
    `src/overlay000/func_ov000_021ac85c.c:10` and
    `src/usa/overlay000/func_ov000_021ac77c.c:10`; `volatile-local` at
    `src/main/func_02096040.legacy.c:7`.

## Not verified

- No completed three-ROM gate or final object/reference verdict. Baseroms
  were hard-linked and all three hashes checked by `tools/link_baseroms.py`,
  exit 0. Initial `python3.13 tools/gate3.py --scope all --log <scratch-log>`
  exited 2 with `./dsd` missing and `gate3: GATE EXIT 2`. Downloaded dsd
  using `python3.13 tools/download_tool.py dsd v0.11.0 --path ./dsd`, exit 0,
  and reran the gate. I deliberately interrupted the fresh EUR build after
  confirming this is a stopped documentation-only delivery, rather than
  claim a ROM verdict for absent corrections. Exit 130, final output:

  ```text
  gate3: interrupted
  gate3: GATE EXIT 130
  ```

  The required macOS log-check command was run verbatim with the actual
  scratch log, exit 0:

  ```text
  grep -nE "SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)" /tmp/verifier-008-gate.log
  10288:gate3: GATE EXIT 130
  ```

  This is explicitly incomplete evidence, not a content or toolchain
  failure diagnosis and not a passing gate. Unit-suite results do not
  substitute for the ROM gate.
- No real ROM-byte mutation or genuine failed-toolchain experiment.
  Classifier evidence above establishes the existing bug only.
- No trusted factory command exists in production to run the requested
  three simulations or guard-removal attacks. No GitHub workflow experiment,
  settings change, required-check change or external trust claim was made.
- No partial patch was applied or tested as production. Full semantic
  coverage, inactive-source coverage, regression red/green campaign and
  equivalence of the proposed Clang adapter remain unverified. There are
  no newly added executable regression tests in this delivery.
- Windows behavior and agent hook enforcement were not exercised.

## Verdict

This exact delivery is an honest stopped round with useful exploratory
evidence, not a completed checker-hardening implementation. High confidence
that the three goals remain unmet and the aggregate findings require a
policy-compatible corrective scope. Independent production-mode compiler
results also overturn the proposed syntax-control classification. Brain
should not accept this commit as satisfying round 008 or apply its partial
patch as a passing correction; no merge was performed.
