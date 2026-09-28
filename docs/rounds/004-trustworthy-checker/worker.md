<!-- fw-report
round: 004-trustworthy-checker
role: worker
branch: worker/004-trustworthy-checker
head: 688b41e092801a4d545e955040e35dbae2736d60
os: macOS 27.0
python: 3.9.6
written: 2026-09-28T16:12:04Z
-->
# 004-trustworthy-checker: Worker report

All four items are done on `worker/004-trustworthy-checker`. The last code
commit is `688b41e09`, and the three-ROM gate passes there. Commands ran on
the owner's Mac (Darwin 27.0.0, `python3.13`, Claude Code 2.1.233) in
`.worktrees/worker-004`. `<scratch>` below is a session scratch directory
outside the worktree.

## Verified

- **Item 1, the masking reproduced before the fix** (at `51c9c05ae`):
  `python3.13 tools/gate3.py --scope bogus 2>&1 | tee <scratch>/canary-before.log; echo "PIPELINE_EXIT=$?"` → the pipeline's status was 0

  ```text
  gate3: unknown --scope 'bogus' (expected all|eur|usa|jpn|tests)
  PIPELINE_EXIT=0
  ```

  With no pipe, the same command gave `NOPIPE_EXIT=2`. So the gate was
  right and `tee` masked it, as the archived item said.
- **PowerShell does not mask this** (a correction to the archived item):
  `pwsh -NoProfile -Command "python3.13 tools/gate3.py --scope bogus 2>&1 | Tee-Object -FilePath <scratch>/canary-before-ps.log; ..."`
  → `PS_LASTEXITCODE=2` (PowerShell 7.6.6). `Tee-Object` is a cmdlet, so
  `$LASTEXITCODE` still holds the native command's status. The mask is a
  POSIX-shell `tee` problem.
- **Item 1, the same canary after the fix** (at `3d94d79e9` onward): the
  documented form, `--log`, with no pipe.
  `python3.13 tools/gate3.py --scope bogus --log <scratch>/canary-after.log; echo "EXIT=$?"` → exit 2

  ```text
  gate3: unknown --scope 'bogus' (expected all|eur|usa|jpn|tests)
  gate3: GATE EXIT 2
  EXIT=2
  ```

  The log holds the same two lines. The Windows-form invocation, run in
  `pwsh` with the same `--log` command, gave `LASTEXITCODE=2`, and the log's
  last line was `gate3: GATE EXIT 2`. If someone pipes through `tee` anyway,
  the shell still says 0, but the transcript now ends `gate3: GATE EXIT 2`
  and contradicts it on sight.
- **Item 1 regression tests fail on the old gate and pass on the new one.**
  `tests/test_gate3.py` was run against the old `gate3.py` (from `HEAD` at
  `51c9c05ae`) in a scratch copy → `4 failed, 17 passed, 1 skipped`, and
  against the new one → `22 passed`. The key test runs an always-failing
  stub region through a real subprocess with `--log`. It asserts process
  status 1, and that both the log and stdout end in `gate3: GATE EXIT 1`.
- **Item 2, the reference check on today's tree, all three regions**
  (built by the gate at `210c843d9`):
  `python3.13 tools/check_references.py --version eur --version usa --version jpn` → exit 1 before the baseline

  ```text
  check_references: eur, usa, jpn: 32903 units compared; missing-reloc 5514, extra-reloc 0, wrong-target 417 (baseline entries 0)
  check_references: FAIL
  ```

  After `--write-baseline` (431 entries, committed at `688b41e09`) → exit 0,
  with the same counts and `check_references: OK`. The per-region runs gave:
  EUR 12582 units, `missing-reloc 5412, wrong-target 166`; USA 10160 units,
  `missing-reloc 51, wrong-target 126`; JPN 10161 units,
  `missing-reloc 51, wrong-target 125`. No unit lacked an object: 0 `INPUT`
  lines.
- **Item 2 fails a deliberately wrong reference in a scratch copy, where the
  bytes are identical.** In `src/main/data_020c3cd0.c`, `&data_020c3d9c` was
  changed to `(void *)0x020c3d9c`, compiled with the project's mwcc command
  line, and put beside the original delinked `.o` in a scratch root. The
  built word is `9c3d 0c02`, the same value the original's `R_ARM_ABS32`
  against `data_020c3d9c` links to.
  `python3.13 tools/check_references.py --version eur --root <scratch>/refbad2 --baseline <scratch>/refbad2/none.txt` → exit 1

  ```text
  [eur] src/main/data_020c3cd0.c: missing-reloc at .data+0x0: original ABS32 data_020c3d9c+0x0, built no relocation
  check_references: FAIL
  ```

  A second scratch case did the same in the function
  `src/overlay011/ov011_021d129c.c` (`missing-reloc at .text+0x1c in func_ov011_021d129c`,
  exit 1). There mwcc also changed the bytes. The control, with the real
  built object in the same scratch root, gave `check_references: OK` and
  exit 0. `tests/test_check_references.py` (9 tests, synthetic ELF objects)
  covers a raw number, an alias, an extra relocation, a local label against
  a section offset, a REL implicit addend, ratchet growth and staleness, and
  missing inputs. The synthetic ELF was checked with `arm-none-eabi-readelf -sr`.
- **Item 3, the fake-match lint on today's tree:**
  `python3.13 tools/check_fake_matches.py` → exit 0

  ```text
  check_fake_matches: raw-data-directive 0, section-override 0, data-in-pragma-section 0, text-unit-without-function 0, register-pin 0, do-while-zero 3, volatile-local 1 (baseline entries 4)
  check_fake_matches: OK
  ```

- **Item 3 fails on each pattern it claims to catch.** One known-bad file per
  lexical rule was added under `src/zz_fake_canary/`, the lint was run, and
  the directory was deleted (`git status` then clean) → exit 1

  ```text
  NEW: data-in-pragma-section src/zz_fake_canary/canary_2.c: 1 found, baseline 0
  NEW: do-while-zero src/zz_fake_canary/canary_4.c: 1 found, baseline 0
  NEW: raw-data-directive src/zz_fake_canary/canary_0.c: 2 found, baseline 0
  NEW: register-pin src/zz_fake_canary/canary_3.c: 1 found, baseline 0
  NEW: section-override src/zz_fake_canary/canary_1.c: 1 found, baseline 0
  NEW: volatile-local src/zz_fake_canary/canary_5.c: 1 found, baseline 0
  check_fake_matches: FAIL
  ```

  The seventh rule, `text-unit-without-function`, needs a `delinks.txt`
  entry, so it is shown by
  `TestTree.test_text_unit_without_function_fails`. A clean fixture passes:
  honest `asm` functions with `register` parameters, `#pragma section INIT`
  around a function, a `do/while (0)` macro, struct `volatile` members,
  pointers to volatile, and comments and strings that mention `dcd`.
- **Item 4, protected-path rules:** `python3.13 -m pytest -q tests/test_protected_paths.py` → `9 passed, 23 subtests passed`.
  One rule, `Edit(/**/*.sha1)`, was deleted from `.claude/settings.json`,
  and `test_claude_settings_deny_exactly_the_list` failed
  (`1 failed, 8 passed`); the rule was restored. The Codex hook, run as a
  subprocess with a documented `apply_patch` payload that updates
  `gx-spirit-caller_eur.sha1`, exits 2 with
  `is protected (**/*.sha1)` on stderr. A patch to `src/main/a.c` exits 0,
  and unreadable input exits 2. The module also runs under macOS
  `/usr/bin/python3` 3.9.6.
- **The gate at the final code commit `688b41e09`:**
  `python3.13 tools/gate3.py --scope all --log <scratch>/gate-688b41e09.log > /dev/null 2>&1; echo "SHELL_EXIT=$?"` → `SHELL_EXIT=0`.
  The log check, copied verbatim from `AGENTS.md`:
  `grep -nE "SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)" <scratch>/gate-688b41e09.log`

  ```text
  55:[eur] SHA1 PASS
  97:[usa] SHA1 PASS
  139:[jpn] SHA1 PASS
  168:1268 passed, 14 skipped, 70 subtests passed in 9.54s
  171:==================== GATE PASS ====================
  172:gate3: GATE EXIT 0
  ```

  It logged `resume disabled — state missing or from another commit`, so
  every region was really re-verified, with no `SKIP`. The full build before
  it, at `210c843d9` (13116, 39330 and 66470 lines, the same verdict lines
  and `gate3: GATE EXIT 0`), built USA and JPN from scratch. EUR reused the
  objects of an EUR build stopped part-way.
- **The rest of the required evidence, at `688b41e09`:**
  - `python3.13 -m unittest discover -s tests` → exit 0, `Ran 1282 tests`,
    `OK (skipped=14)`.
  - `python3.13 -m pytest -q tests` → exit 0,
    `1268 passed, 14 skipped, 70 subtests passed`.
  - `python3.13 -m ruff check .` → exit 0, `All checks passed!`. The `ruff`
    binary is not on `PATH` here, and the module is the same tool.
  - `python3.13 tools/check_ci_contract.py` → exit 0,
    `OK: all 5 required check(s) resolve to a job that runs on every pull request.`
  - `python3 tools/fw.py check` → exit 0, `0 error(s), 0 warning(s)`.
  - `wc -w AGENTS.md` → `1735` (the limit is 1,738).
  - `python3.13 tools/check_test_imports.py` → `violations=0` across 56
    modules.
- **The CI change:** workflow `.github/workflows/tests.yml`, job `unittest`
  (a required check), new step `Fake-match lint (round 004)` running
  `python tools/check_fake_matches.py`. The unit tests for all the new tools
  run in the same job's existing `Run unittest suite` step. The reference
  check needs built objects, and so the baseroms, so CI cannot run it.

## Not verified

- **A denied edit in a fresh Claude Code session.** `claude -p --permission-mode bypassPermissions ...`
  ran in the worktree and failed before any tool call with
  `Failed to authenticate: OAuth session expired and could not be refreshed`.
  The CLI's own login has expired, and only the owner can renew it. In this
  already-running session, an Edit to `gx-spirit-caller_eur.sha1` was not
  denied, and I restored it at once with `git checkout`. The session loaded
  its settings at start, before the file existed, which is the brief's
  "reads settings only at start" point, not a test of the rules. To test,
  run `claude` in a worktree of this branch, ask it to edit
  `gx-spirit-caller_eur.sha1`, and expect a deny.
- **Codex.** `codex` is not installed on this machine, so the hook was
  tested only as a program fed the documented payload, never inside Codex.
  Whether Codex passes `apply_patch` input exactly as `{"command": "<patch>"}`
  comes from its docs, not observation. The hook also reads `file_path` and
  `path`, and every string field.
- **Windows.** Nothing ran on Windows. PowerShell was tested on macOS
  (`pwsh` 7.6.6). The new code is plain Python and calls no shell.
- **Trustworthiness of the baseline contents.** I did not judge whether each
  of the 5,514 missing relocations is a real fake. Many are pointer tables in
  `.rodata` and `.data` written as numbers. The brief says record, not fix.
- **`m2ctx.py` on the Windows PC** (`docs/state.md` asks for a re-check in
  round C): not in this brief, and not possible from this Mac.

## Changed

- `tools/gate3.py`: adds `--log PATH` (tees stdout and stderr into the
  file). Every exit path, including usage errors and crashes, ends with
  `gate3: GATE EXIT <n>` and returns that code. Verdict rules, scopes and
  tests are unchanged.
- `tests/test_gate3.py`: the argument-guard test now expects a returned 2
  plus the status line, and `TestExitStatusSurvives` is new.
- `tools/check_references.py`, `tests/test_check_references.py` and
  `tools/reference_baseline.txt`: item 2. It uses its own small ELF32
  reader, because `pyelftools` is not a dependency, and the delinks parser
  from `progress.py`.
- `tools/check_fake_matches.py`, `tests/test_check_fake_matches.py` and
  `tools/fake_match_baseline.txt`: item 3. It reuses `progress.py`'s
  comment and literal blanker, so it agrees with the natural-C and asm-C
  classifier.
- `.github/workflows/tests.yml`: one step in the `unittest` job.
- `tools/protected_paths.py`, `.claude/settings.json`, `.codex/hooks.json`
  and `tests/test_protected_paths.py`: item 4, one list with two enforcers.
- `AGENTS.md`: the build-path evidence row uses `--log` and adds the
  reference check; the `src/`-or-`config/` row adds the lint. "Until round
  C, the gate's exit status cannot be trusted" is replaced by a "never pipe
  the gate" note, and the "Local hooks" row by "Agent settings".
- `BUILD.md`: step 6 and the tools table, plus a new section, "The checker".
- `docs/machine-setup.md`: the gate command uses `--log`, and its "cannot be
  trusted until round C" sentence is replaced.
- `docs/state.md`: not changed.

**Flagged on today's `main`, listed, not fixed** (evidence 7):

- The fake-match lint flags four places:
  - `do-while-zero`: `src/overlay000/func_ov000_021ac85c.c:10`,
    `src/usa/overlay000/func_ov000_021ac77c.c:10` and
    `src/jpn/overlay000/func_ov000_021ac77c.c:10`, all
    `do { Fill32(0, p, 0xa0); ... } while (0);`.
  - `volatile-local`: `src/main/func_02096040.legacy.c:7`,
    `volatile Obj02096040 tmp;`, whose dead stores exist only to shape the
    stack.
- The reference check flags 431 (region, unit, kind) entries across 242 EUR,
  90 USA and 89 JPN units. Every one is listed in
  `tools/reference_baseline.txt`, and
  `check_references.py --version <ver> --list` prints each difference with
  its offset, function and both targets. The classes:
  - Pointer tables in `.rodata` and `.data` written as raw numbers where the
    original names functions or data: most of EUR's 5,412
    `missing-reloc`, for example `src/overlay002/data_ov002_022bf3c4.c` and
    `src/overlay022/data_ov022_021ab9a0.c`.
  - Code loading a raw address where the original loads a symbol: 133 in
    EUR `.text`, for example `src/main/func_020068f4.c` (`data_02104f1c`).
  - `_alias` symbols standing in for the original's name: 13 in EUR, for
    example `src/main/func_02026fd8.c`, which uses `data_0219a924_alias`
    where the original names `data_0219a924`.
  - A base symbol plus an offset where the original names a separate
    symbol, often in hand-written `.s`: for example
    `src/main/func_0201a170.s` has `data_020b59e0+0xc` where the original
    has `data_020b59ec`, and `src/main/func_020069f4.c` has
    `data_020c3e84+0x4` for `data_020c3e88`.

## Open questions

- **Should the gate run the reference check?** It is a separate evidence
  step now, because adding it to `gate3.py`'s verdict changes what the gate
  decides, which the brief puts out of scope. Round E's factory needs it on
  every match: Brain or the owner should decide whether it becomes a gate
  step.
- **Baseline growth is caught only by review.** A change can run
  `--write-baseline` and commit a larger baseline. Nothing mechanical stops
  that, as the documents say. Making growth a CI failure would need the
  merge base in the job.
- **Reach of the settings.** Claude Code's deny rules cover its file tools,
  the file commands it recognises in Bash and redirections, in every mode.
  They do not cover a program that writes files itself (Python, `ninja`,
  `git checkout`). That gap is deliberate: the build must write `build/`,
  and an OS sandbox deny would break the build, is not available on native
  Windows, and would stop the gate. Codex's sandbox profiles apply to every
  command it runs, so they have the same problem. The hook covers only
  `apply_patch`, and loads only in a project Codex trusts. The hook's
  command path is relative, so a Codex session started outside the repo
  root would not find it.
- **What is protected beyond the brief's list:** `**/*.nds`, BIOS dumps,
  `.ninja_log` and `.ninja_lock`, `config/*/arm9/config.yaml` (`AGENTS.md`:
  never hand-edit), the downloaded tool binaries, and the three enforcer
  files themselves. Say if any should come off.
- **A process slip:** to stop my standalone EUR build I used a machine-wide
  `pkill -x ninja` rather than its PID. The last process listing before it
  showed only this worktree's ninja, so I believe nothing else was hit, but
  I did not re-check at the moment of the kill.
- **Sources consulted.** They are quoted briefly and treated as evidence,
  not instructions.
  - `code.claude.com/docs/en/permissions`: Read and Edit deny rules "don't
    apply to ... arbitrary subprocesses that read or write files indirectly".
  - `code.claude.com/docs/en/sandboxing`: "Native Windows is not supported".
  - The Codex config reference at
    `learn.chatgpt.com/docs/config-file/config-reference`: `":workspace_roots"`
    permission profiles and project-config trust.
  - Codex hooks at `learn.chatgpt.com/docs/hooks`: PreToolUse fires for
    "file edits performed through `apply_patch`", and a hook can block with
    "exit code `2`".
  - The Chris Lewis blog post named in the brief gives no fake-match
    definition. It cites permuter noise such as `do {} while (0)` and an
    agent that "updated the SHA1 hash", which the settings now deny.
  - The `cdlewis/nigel` README describes no anti-cheat rules.
