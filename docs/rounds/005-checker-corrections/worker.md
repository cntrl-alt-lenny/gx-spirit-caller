<!-- fw-report
round: 005-checker-corrections
role: worker
branch: worker/005-checker-corrections
head: 93417fd169659328f31d74a6a59d5e19d620953c
os: Windows 11
python: 3.12.10
written: 2026-09-29T10:34:46Z
-->
# 005-checker-corrections: Worker report

Environment, from commands: Windows 11 (`10.0.26200`), Python 3.12.10, Claude
Code 2.1.284, worktree `.worktrees/worker-005` cut from the round's brief
commit, baseroms hard-linked, `dsd.exe` fetched by `download_tool.py`. Code
commit under test: `56d703859` (this report is the next commit). `<scratch>` is
a session scratch directory outside the worktree.

## Verified

- All six corrections are in and the tree gates clean on Windows —
  `python tools/gate3.py --scope all --log <scratch>/gate-final.log` → shell exit 0.
  The log check from `AGENTS.md`, PowerShell form, verbatim
  (`Select-String -Pattern 'SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)' <log>`):

  ```text
  55:[eur] SHA1 PASS
  97:[usa] SHA1 PASS
  139:[jpn] SHA1 PASS
  179:1330 passed, 15 skipped, 132 subtests passed in 22.47s
  182:==================== GATE PASS ====================
  183:gate3: GATE EXIT 0
  ```

  The reference check and the lint ran inside that log:

  ```text
  144:check_references: eur, usa, jpn: 32903 units compared; missing-reloc 5514, extra-reloc 0, wrong-target 417 (baseline entries 5931)
  145:check_references: OK
  146:[references] exit 0
  149:check_fake_matches: raw-data-directive 0, data-in-text 0, section-override 0, data-in-pragma-section 0, text-unit-without-function 0, register-pin 0, do-while-zero 3, volatile-local 1 (baseline entries 4)
  150:check_fake_matches: OK
  151:[fake-matches] exit 0
  ```

- Two known-bad inputs each end the gate non-zero, with all three ROMs still
  `SHA1 PASS` (so only the new checks can have failed it). Both were edits to
  `src/main/data/data_020c3e68.c`, reverted with `git checkout` afterwards
  (in-place edits of the worktree, not copies of the tree).
  - Wrong reference: `&data_020c3e5c` written as `(void *)0x020c3e5c` (same
    bytes after linking) → shell exit 1:
    `NEW: [eur] src/main/data/data_020c3e68.c: missing-reloc at .data+0x0: original ABS32 data_020c3e5c+0x0, built no relocation`,
    `check_references: FAIL`, `==== GATE FAIL ====`, last line `gate3: GATE EXIT 1`.
  - Fake match: an unused `static` function containing `do { *p = 1; } while (0U);`
    (mwcc drops it, the ROMs match; round 004's lint could not see `0U`) →
    shell exit 1: `NEW: do-while-zero src/main/data/data_020c3e68.c: do { *p = 1; } while (0U);`,
    `check_fake_matches: FAIL`, last line `gate3: GATE EXIT 1`.

- **Item 1, the gate decides everything.** `gate3.py` runs
  `check_references.py` for the regions it built and `check_fake_matches.py
  --version ...` after the region loop; exit 1 from either is `GATE FAIL`
  (exit 1), any other non-zero exit is `GATE INFRASTRUCTURE` (exit 2), never a
  pass. `--scope tests` runs the source lint only; a failed region skips them.
  Tests in `tests/test_gate3.py::TestCheckersDecideTheVerdict`.

- **Item 2, the lint class.** Findings from probing mwcc itself
  (`mwccarm.exe`, the project's flags):
  - only `dcd` is an accepted data directive; `dcb`, `dcw`, `opword`, `.word`,
    `.long`, `.4byte`, `space`, `fill` all fail with "unknown assembler
    instruction mnemonic". `dcd` compiles behind a label, through a `#define`
    alias, through a function-like macro, through `##` token pasting, and
    split over two lines with a backslash; every spelling puts a `$d` mapping
    symbol in `.text`.
  - New object check (`data-in-text`, `check_fake_matches.py --version <ver>`):
    a `$d` word in a code section that no pc-relative `ldr`/`add` (ARM or
    Thumb) of that section loads and no relocation covers. It caught every
    spelling below. False positives: 0 over the 32,903 units of the three
    builds (0 also over the 7,867 EUR C units when first measured).
  - Lexical rule now: `dcd` after `; { } :` (labels), tree-wide macro and
    typedef aliases (headers included, alias-of-alias, function-like), line
    continuations spliced, `while` zero as `0`, `0U`, `0x0`, `((0))`, `false`,
    `FALSE`, `!1` or a zero macro, and volatile as `T volatile x`,
    `T * volatile p`, `volatile struct S s`, `volatile` typedefs and macros.
  - Every attempt to get a fake match past the lints (`attempts.py`, real
    compiles, round 004's lint loaded from `1d3fdd40e`):

    ```text
    attempt                                    compiles  round-004 lint         lexical now            object check
    plain dcd                                  yes       raw-data-directive     raw-data-directive     FLAGGED
    upper-case DCD                             yes       raw-data-directive     raw-data-directive     FLAGGED
    dcd after a label                          yes       clean                  raw-data-directive     FLAGGED
    dcd after two labels                       NO        clean                  raw-data-directive     -
    #define W dcd                              yes       clean                  raw-data-directive     FLAGGED
    alias of alias                             yes       clean                  raw-data-directive     FLAGGED
    macro carries operand                      yes       clean                  raw-data-directive     FLAGGED
    function-like macro                        yes       clean                  raw-data-directive     FLAGGED
    dcd on a line after a comment              yes       raw-data-directive     raw-data-directive     FLAGGED
    token paste CAT(d,cd)                      yes       clean                  clean                  FLAGGED
    token paste, word loaded by a real ldr     yes       clean                  clean                  clean   <- gets through
    dcd after ; on one line                    yes       raw-data-directive     raw-data-directive     FLAGGED
    dcd as expression                          yes       raw-data-directive     raw-data-directive     FLAGGED
    line-continued dcd                         yes       clean                  raw-data-directive*    FLAGGED
    real ldr = constant (honest pool)          yes       clean                  clean                  clean
    while (0U) wrapper                         yes       clean                  do-while-zero          clean
    while (false) wrapper                      NO        clean                  do-while-zero          -
    volatile via typedef                       yes       clean                  volatile-local         clean
    T * volatile p                             yes       clean                  volatile-local         clean
    array in .text via declspec                NO        section-override       section-override       -
    declspec through a macro arg               NO        clean                  clean                  -
    array in a #pragma section .text           yes       data-in-pragma-section data-in-pragma-section clean
    ```

    (`*` this attempt was clean under the lexical rule when first tried; the
    lint now splices continuation lines, and
    `test_split_over_two_lines_with_a_continuation` covers it. The table is the
    final run.)
  - **One attempt still gets through both lints:** a `dcd` word spelled with
    token pasting AND loaded by a real pc-relative `ldr` in the same function
    (`ldr r0, [pc, #0]; bx lr; CAT(d,cd) 0xe12fff1e`). The object check counts
    a loaded word as an honest literal-pool word, and mwcc's own pools are
    indistinguishable from it. It is a hex dump used as a constant, so it is
    only a partial fake, but it is open: the reference check does not see it
    either.
  - Tests that are red on round 004's lint: 24 failures and 15 errors (of 34 tests) when
    `tests/test_check_fake_matches_variants.py` runs against `1d3fdd40e`'s
    `check_fake_matches.py` (label, alias, alias-of-alias, operand macro,
    header alias, `0U/0u/0L/0x0/((0))/false/FALSE/!1`, `while (ZERO)`,
    `int volatile`, `T * volatile`, `volatile struct`, typedef and macro
    volatile, section and register-pin through a macro, the whole object check
    and the baseline identity); all green now.

- **Item 3, baselines only shrink.** Format 2, one line per finding
  (`tools/baseline_file.py`): reference entries carry section, offset and both
  relocations; lint entries carry rule, path, ordinal and the offending line.
  The 431 per-unit counts (5,931 differences) became 5,931 lines and the four
  lint counts four lines; grouping the new lines by unit and kind reproduces the
  old counts exactly. `--prune-baseline` removes stale lines and adds nothing
  (it still exits 1 if a new finding exists and then writes nothing);
  `--write-baseline` stays for the first fill.
  - CI step: `Baselines only shrink (round 005)`, job `unittest` in
    `.github/workflows/tests.yml` (pull requests only, `fetch-depth: 0` already
    there): `python tools/check_baseline_growth.py --base "origin/$BASE_REF"`.
  - Local runs, base = the code commit, real baselines:
    - added entry → `reference_baseline.txt: 5932 entries, 1 added`,
      `ADDED: eur src/main/func_02000000.c missing-reloc ...`, `check_baseline_growth: FAIL`, exit 1.
    - swapped entry in one unit (`.data+0x14` → `.data+0x15` in
      `data_020c72f0.c`) → `5931 entries, 1 added`, `FAIL`, exit 1.
    - removed stale entry: a stale line added in a temporary commit →
      `check_references` `STALE: ... - delete the line, or run --prune-baseline`
      exit 1; `--prune-baseline` → `pruned 1 stale baseline entries`;
      `check_baseline_growth` → `0 added`, `OK`, exit 0; `check_references` → `OK`.
      (The temporary commit was reset away.)
    - against `origin/main`, where neither file exists yet: `introduced by this
      change, nothing to compare with`, exit 0. The migration from a
      format-1 base is compared per unit-and-kind budget (tested).
  - Tests: `tests/test_check_baseline_growth.py` (11), plus swap and prune tests
    in `tests/test_check_references.py` and
    `tests/test_check_fake_matches_variants.py`.

- **Item 4/5, protections in worktrees.** `PATTERNS` gained
  `tools/reference_baseline.txt` and `tools/fake_match_baseline.txt`;
  `claude_rules()` writes `Edit(/P)` and `Edit(/.worktrees/*/P)` for each
  pattern into `.claude/settings.json` (a test keeps them equal);
  `protected_pattern()` strips `.worktrees/<seat>/`.
  - Hook run for 14 protected paths and one free path, from a stand-in primary
    root (script copied there) and from the worktree, exit 2 for every
    protected one, 0 for `src/main/free.c`, both roots.
  - Claude Code 2.1.284, `claude -p ... --permission-mode acceptEdits`, tool
    output as returned:
    - inside the worktree: Edit on `gx-spirit-caller_eur.sha1` and on
      `build.ninja` → `File is in a directory that is denied by your permission
      settings.` Bash `echo hacked > build.ninja`,
      `echo hacked | tee objdiff.json`, `echo hacked >> tools/reference_baseline.txt`
      → `Permission to use Bash with command ... has been denied.`; Edit on
      `tools/fake_match_baseline.txt` → the same directory denial. Nothing changed.
    - session started at a stand-in primary root aimed at
      `.worktrees/worker-005/`: Edit on the `.sha1` and `build.ninja` denied,
      Edit on `notes.txt` allowed; Bash `>` to `build.ninja` and to the `.sha1`
      and `tee` to `objdiff.json` denied. **Control:** with round 004's
      `settings.json` in the same stand-in root, the Edit on
      `.worktrees/worker-005/build.ninja` succeeded (`has been updated
      successfully`), reproducing the Verifier's finding.
    - The stand-in root (a scratch directory with a copy of the settings file
      and a fake `.worktrees/worker-005/`) was used because the real primary
      checkout must not be edited; it tests anchoring, not the real primary.
  - Permissions page (fetched today): input redirects are checked "in v2.1.257
    and later", `tee` targets "in v2.1.269 and later". The Verifier's reading of
    `tee` is right; the "redirects" version is about input redirects. The page
    gives no version for output redirects. 2.1.284 is past both.
  - Codex issue openai/codex 27833 (read in full with `gh`): open; reports that
    on Codex CLI 0.133.0 and Desktop 0.138.0-alpha.7 (Windows) a PreToolUse deny
    on `apply_patch` fires ("Failed") and the write proceeds. A comment on
    Desktop 26.623 reports a shell tool not blocked even by an always-deny hook;
    another on 0.147.0 (macOS) says a deny was enforced. So version-dependent.

- **Item 6, docs.** `AGENTS.md` "Agent settings" row now names what was shown
  denied, on which tool and version, says the Codex hook is untested, and
  summarises the issue. `protected_paths.py`'s docstring no longer says `tee`
  is always checked. Evidence rows updated for item 1. `BUILD.md` "The checker"
  section rewritten. `wc -w AGENTS.md` → 1737.

- Suites: `python -m unittest discover -s tests` → `Ran 1345 tests`, `OK (skipped=15)`;
  `python -m pytest -q tests` → `1330 passed, 15 skipped, 132 subtests passed`;
  `python -m ruff check .` → `All checks passed!`; `python tools/check_ci_contract.py`
  → `OK: all 5 required check(s) resolve to a job that runs on every pull request.`;
  `python tools/fw.py check` → `0 error(s), 0 warning(s)`;
  `npx markdownlint-cli2 AGENTS.md BUILD.md` → `0 issues`.

- Flagged on the final tree, listed and not fixed (nothing under `src/` changed).
  Reference check: 5,931 differences in 420 region-units — eur 5,412
  missing-reloc and 166 wrong-target, usa 51 and 126, jpn 51 and 125 — the
  largest being `src/overlay002/data_ov002_022c357c.c` (2,187),
  `data_ov002_022bf3c4.c` (836), `data_ov002_022be1ac.c` (398),
  `data_ov002_022c9ad0.c` (276); the full list is `tools/reference_baseline.txt`.
  Lint: `do-while-zero` in `src/overlay000/func_ov000_021ac85c.c`,
  `src/jpn/overlay000/func_ov000_021ac77c.c`, `src/usa/overlay000/func_ov000_021ac77c.c`;
  `volatile-local` in `src/main/func_02096040.legacy.c`. Object check: none. The
  lint's findings did not change, only their baseline format.

## Not verified

- Codex: not installed (brief), so the hook ran only as a program fed payloads.
- The real primary checkout as a session root: I tested a stand-in directory
  with the same settings file, not the primary itself. The primary's own copy of
  `protected_paths.py` and `settings.json` are the old ones until this merges.
- The CI step itself was run as its command, not on GitHub. `gh pr checks 1631`
  was not read; the new step cannot pass or fail there until a pull request
  carries it.
- `--scope all` was run on committed code only, one full run per case; no repeat
  runs. Resume (`SKIP`) was never triggered in the final runs.
- Whether Claude Code applies `Edit(/.worktrees/*/...)` the same way on macOS
  or Linux; observed on Windows only.

## Changed

- `tools/gate3.py`, `tests/test_gate3.py`: the checkers decide the verdict.
- `tools/check_fake_matches.py`: rewritten lexical rules, alias collection,
  object check, format-2 baseline, `--version`, `--prune-baseline`.
- `tools/check_references.py`: per-difference baseline, `--prune-baseline`; the
  missing-object message uses `/` on Windows (a test failed there before).
- `tools/baseline_file.py` (new), `tools/check_baseline_growth.py` (new) and
  their tests.
- `tools/protected_paths.py`, `.claude/settings.json`: baselines protected,
  worktree rules, docstring correction. `tests/test_protected_paths.py`.
- `tools/fake_match_baseline.txt`, `tools/reference_baseline.txt`: format 2,
  same findings.
- `.github/workflows/tests.yml`: the `Baselines only shrink (round 005)` step.
- `AGENTS.md`, `BUILD.md`: as above. `docs/state.md` is unchanged.

## Open questions

- The surviving bypass above (token-pasted `dcd` word that a real `ldr` loads).
  Closing it means banning `##` in `asm` bodies, or treating any `$d` word inside
  an `asm` function as suspect; either would flag honest hand-written pools.
  Brain's call.
- The growth check runs from `.github/workflows/tests.yml`, which agents can
  edit and the protected list does not cover; the ruleset and required checks
  were out of scope. Adding the workflow, `tools/check_baseline_growth.py` and
  `tools/baseline_file.py` to `PATTERNS` is one line each.
- `git worktree add` from an older commit yields a worktree without these
  settings files, so it has no protection.
- The 5,931 tolerated reference differences are mostly data tables written as
  raw numbers; whether to burn them down is a later round.
