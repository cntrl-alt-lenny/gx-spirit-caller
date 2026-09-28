<!-- fw-report
round: 004-trustworthy-checker
role: verifier
branch: verifier/004-trustworthy-checker
head: 8bd6730353acf0d6af99684353a211543c2de96f
os: macOS 27.0
python: 3.9.6
written: 2026-09-28T18:09:10Z
-->
# 004-trustworthy-checker: Verifier report

Reviewed commit: `8bd6730353acf0d6af99684353a211543c2de96f` (the Worker's
report on top of the last code commit `688b41e09`). Worktree
`.worktrees/verifier-004` on the owner's Mac, `python3.13`, Rosetta 2
confirmed (`arch -x86_64 /usr/bin/true` → exit 0). `<scratch>` is a session
scratch directory outside the worktree.

Commands I ran myself, with exit codes:

- `python3.13 tools/gate3.py --scope all --log <scratch>/gate-verifier.log > <scratch>/gate-stdout.txt 2>&1` → shell exit 0.
  The log check from `AGENTS.md`, verbatim
  (`grep -nE "SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)" <log>`):

  ```text
  27840:[eur] SHA1 PASS
  53864:[usa] SHA1 PASS
  79889:[jpn] SHA1 PASS
  79918:1268 passed, 14 skipped, 70 subtests passed in 10.74s
  79921:==================== GATE PASS ====================
  79922:gate3: GATE EXIT 0
  ```

  A fresh worktree, so every region was built from nothing (12593, 10258 and
  10257 ninja steps); no `SKIP`, no `INFRASTRUCTURE`.
- An earlier gate run in the same worktree, before `./dsd` was downloaded,
  was a real failing gate through the documented form: shell exit 2, log
  last line `gate3: GATE EXIT 2` (`./dsd is missing ... GATE FAIL`).
- Masking canary. Before, `origin/main`'s `gate3.py` copied to a scratch
  path: `python3.13 <scratch>/old/tools/gate3.py --scope bogus 2>&1 | tee <scratch>/old.log` →
  `shell status: 0  gate status: 2`. After, at the reviewed commit:
  `python3.13 tools/gate3.py --scope bogus --log <scratch>/new.log` → exit 2,
  log last line `gate3: GATE EXIT 2`. Piping the new gate through `tee`
  still gives shell status 0, with `gate3: GATE EXIT 2` as the last line.
- `python3.13 tools/check_references.py --version eur --version usa --version jpn` → exit 0:
  `32903 units compared; missing-reloc 5514, extra-reloc 0, wrong-target 417 (baseline entries 431)`, `check_references: OK`.
- Reference check, my own known-bad: in a scratch root (copies of `config/`,
  `build/eur/src`, `build/eur/libs`, and the real `build/eur/delinks`), I
  replaced `src/main/func_02001c98.c`'s `extern state_02102c7c_t data_02102c7c;`
  with `#define data_02102c7c (*(state_02102c7c_t *)0x02102c7c)`, compiled
  it with the project's mwcc command line, and dropped the object in →
  exit 1:
  `NEW: eur src/main/func_02001c98.c missing-reloc ... original ABS32 data_02102c7c+0x0, built no relocation`, `check_references: FAIL`.
  (mwcc also changed the bytes here. The check reads only relocation
  tables, so it does not depend on that. The Worker shows a same-bytes case
  in `.data`.)
- `python3.13 tools/check_fake_matches.py` → exit 0,
  `do-while-zero 3, volatile-local 1 (baseline entries 4)`, `OK`.
- Fake-match lint, my own known-bad inputs, scratch root with an empty
  baseline (`--root <scratch>/lint --baseline <scratch>/empty.txt --list`) →
  exit 1. It caught plain `dcd` and `.word` in an `asm` function,
  `__declspec(section ".text")`, data in a `#pragma section` region, a
  `register ... asm("r4")`, a `volatile int` local and `do { } while (0)`.
  It missed the cases in the findings below.
- `python3.13 -m unittest discover -s tests` → exit 0, `Ran 1282 tests`, `OK (skipped=15)`.
- `python3.13 -m pytest -q tests` → exit 0, `1267 passed, 15 skipped, 70 subtests passed`.
  (Run before the gate's build existed. The gate's own pytest step, run
  after the build, gives 1268 and 14.)
- `python3.13 -m ruff check .` → exit 0, `All checks passed!` (no `ruff` on `PATH`).
- `python3.13 tools/check_ci_contract.py` → exit 0, `OK: all 5 required check(s) ...`.
- `python3 tools/fw.py check` → exit 0, `0 error(s), 0 warning(s)`.
- `wc -w AGENTS.md` → 1735 (was 1738 on `main`).
- `python3.13 tools/check_delink_dupes.py` → exit 0, `OK`.
  `python3.13 tools/check_match_invariants.py --version eur` → exit 1
  (warnings; exit 2 means errors; this round changes no source).
- `python3.13 tools/protected_paths.py --check` on crafted paths, and the
  module's `protected_pattern()` called with the primary checkout as root.
- Primary documentation, fetched and read as evidence:
  `code.claude.com/docs/en/permissions`, `learn.chatgpt.com/docs/hooks`, and
  the Codex issue `github.com/openai/codex/issues/27833`.

## Findings

- [SHOULD FIX] `tools/check_fake_matches.py:90` — `raw-data-directive` only
  matches a directive at the start of a line or after `;`, `{` or `}`. Two
  simple variants get past it, and mwcc compiles both into a raw word in
  `.text`:

  ```text
  asm void f(void) {
  lbl: dcd 0xe12fff1e
  }
  ```

  and `#define W dcd` followed by `W 0xe12fff1e` inside the `asm` body.
  With `-proc arm946e` and the project's other flags, both objects' `.text`
  is `1eff2fe1`, the raw word, and the lint reports nothing (exit 0 with an
  empty baseline). How it fails: in the factory, a candidate that dumps the
  original's words behind a label or a macro passes the lint that is meant
  to stop exactly that. Checked and not holes: `__asm__(".word ...")` does
  not compile under mwcc, and `#pragma section code_type ".text"` leaves the
  array in `.rodata`. Smaller misses, for the same fix: `while (0U)` and
  `while (false)` for `do-while-zero`, a `volatile` hidden in a `typedef`,
  and `int * volatile p` (a volatile local pointer) for `volatile-local`.
- [SHOULD FIX] `.claude/settings.json:9`, `.codex/hooks.json:9` and
  `tools/protected_paths.py` (`repo_relative`) — the protections are
  anchored at the checkout the session starts in. The project's own seat
  layout (`AGENTS.md`, "Where seats work") starts each seat in the primary
  checkout and works in `.worktrees/<role>-<round>`. There, only the `**/`
  patterns still match. With the primary checkout as root:
  `.worktrees/worker-005/build/eur/x.o`, `.../build.ninja`,
  `.../objdiff.json` and `.../config/eur/arm9/config.yaml` → `None`
  (unprotected); `.../orig/baserom_eur.nds` → `**/*.nds` and
  `.../gx-spirit-caller_eur.sha1` → `**/*.sha1` (protected). This is shown
  for the Codex hook, which resolves against the primary checkout's own
  `tools/protected_paths.py`. For Claude Code the permissions page says a
  `/path` rule in project settings resolves to
  "`<primary working directory>/path`", so `Edit(/build/**)` has the same
  reach. I could not run a live Claude session to confirm it (see Not
  verified). How it fails: a Worker in its worktree can hand-edit its
  `build.ninja`, `objdiff.json` or `arm9/config.yaml` with no denial, which
  is the case item 4 exists for. A `**/`-prefixed form of each pattern (or
  `/**/build/**` style rules) would cover both layouts.
- [SHOULD FIX] `AGENTS.md:163` — "`.codex/hooks.json` deny edits to the
  paths in `tools/protected_paths.py`" states Codex enforcement as fact, but
  it was never observed. Codex is not installed on this Mac, and the owner's
  `~/.codex/config.toml` has no hooks setup (hooks are on by default, per
  the Codex docs, but a project hook loads only after the project `.codex/`
  layer and "the exact hook definition" are trusted). An open Codex issue,
  `openai/codex#27833` (Codex CLI 0.133.0, Codex Desktop 0.138.0-alpha.7),
  reports that a PreToolUse exit 2 on `apply_patch` "fires" but "the write
  is not blocked". The Codex docs say exit 2 blocks, so the two readings
  conflict. How it fails: Brain or the owner reads "What is actually
  enforced", believes Codex seats cannot touch the checksums, and a Codex
  version affected by that issue writes them anyway. That table's purpose is
  to say only what is checked. It should say the Codex hook is untested and
  may not block `apply_patch` on some versions.
- [SHOULD FIX] `tools/check_fake_matches.py:282` and
  `tools/check_references.py:243` — `--write-baseline` launders any new
  violation, and nothing mechanical stops it. In a scratch root, an `asm`
  function with `dcd 0xe12fff1e` → `check_fake_matches: FAIL`; then
  `--write-baseline` → `check_fake_matches: OK`. Neither baseline file is in
  `protected_paths.py` (`--check` → `not protected`), and protection would
  not help anyway, since the tool itself writes the file. The ratchet also
  demands a rewrite in ordinary work: converting a baseline-listed `.s` unit
  to `.c` changes its unit key, so the old entry turns `STALE`, the only
  documented remedy is `--write-baseline`, and that also records every
  difference the new `.c` unit has. How it fails: in round E, with no person
  reviewing each match, one command turns both new checks green. The Worker
  names this under Open questions; it matters enough to fix before the
  factory runs. For example, CI could compare each baseline with the merge
  base and fail on any count that grows.
- [NOTE] `tools/check_references.py:295` — the ratchet counts per (region,
  unit, kind), so a change that fixes one difference and adds another in the
  same unit, such as one of the 2,187 `missing-reloc` entries in
  `src/overlay002/data_ov002_022c357c.c`, keeps the count and passes.
- [NOTE] `tools/protected_paths.py:10` — the docstring says Claude Code's
  deny rules cover `tee` in Bash. The permissions page says "Claude Code
  checks `tee` targets in v2.1.269 and later", and input redirects in
  v2.1.257 and later. The Claude Code here is 2.1.233, so on this machine
  `... | tee build.ninja` is not checked.
- [NOTE] `AGENTS.md:128` — the reference check is a separate evidence step,
  outside `gate3.py`, so `GATE PASS` / `GATE EXIT 0` does not cover it. That
  is inside the brief (changing the gate's verdict was out of scope). The
  Worker raises the same question.
- [NOTE] `.wine-lane/`, the Wine prefix the build creates in each checkout,
  is generated and unprotected. Low stakes.

## Pass two — against the Worker's report

Agreements: the masking reproduces through `tee`, and `--log` returns the
gate's status with `gate3: GATE EXIT <n>` last. The reference-check counts
are identical to mine (32903 units, 5514 / 0 / 417, 431 entries), and
per-region EUR 12582 units, 5412 / 166. The lint's four baseline entries and
the three-ROM gate verdict match mine. The unittest, pytest, ruff, CI
contract, `fw.py check` and word-count results match, apart from 14 against
15 skipped tests, which depends on whether a build exists. The CI step is in
the `unittest` job as stated
(`.github/workflows/tests.yml`, step `Fake-match lint (round 004)`). A live
Claude Code denial was blocked for both of us by the same expired CLI login.

Unproven claims (not reproduced by me):

- "PowerShell does not mask this ... `PS_LASTEXITCODE=2` (PowerShell 7.6.6)"
  and the `pwsh` run of the `--log` form. I did not run `pwsh`. Plausible,
  since `Tee-Object` is a cmdlet, but not re-derived.
- "In `src/main/data_020c3cd0.c` ... The built word is `9c3d 0c02`, the same
  value" (the same-bytes reference case). I did not rebuild that one. My
  function-level case fails the same way.
- "`tests/test_gate3.py` was run against the old `gate3.py` ... → `4 failed,
  17 passed, 1 skipped`". Not rerun, though the new tests pass `--log`,
  which the old gate lacks, so they cannot pass there.

Not in the Worker's report, which I add: the label and macro lint bypass,
the worktree-anchoring gap, the open Codex issue, and the `tee` version gate.

## Not verified

- A denied edit in a fresh Claude Code session. `claude -p --permission-mode acceptEdits ...`
  in this worktree failed before any tool call with `Failed to authenticate:
  OAuth session expired and could not be refreshed`. So the Claude half of
  item 4, and the worktree-anchoring finding for Claude, rest on the
  settings file and the permissions page, not on an observed denial. The
  owner can test this after renewing the CLI login: start `claude` inside a
  worktree of this branch and ask it to edit `gx-spirit-caller_eur.sha1`
  and `build.ninja`, then start it in the primary checkout and ask it to
  edit `.worktrees/<seat>/build.ninja`.
- Codex: not installed, so the hook ran only as a program fed paths, never
  inside Codex.
- Windows: nothing ran on Windows or in PowerShell.
- Whether each of the 5,514 tolerated missing relocations is a real fake.
  I sampled the largest entries: most are `data_*.c` pointer tables written
  as raw numbers, which is what the check is meant to find, and the brief
  says record, not fix.

## Verdict

Items 1 and 2 are sound and I re-derived both. The gate's `--log` form
carries the true status to the shell and into its last line, on a real
failing gate as well as the canary. The reference check runs for all three
regions, matches the Worker's numbers exactly, and fails on a raw address
in a real function. All three ROMs rebuild byte-identical at the reviewed
commit, and the tests, ruff, CI contract and `fw.py check` are clean.
Items 3 and 4 do what they claim for the plain cases, but less than their
descriptions say. The lint can be passed with a label or a macro in front of
`dcd`. The agent settings do not reach the worktree layout the project
itself prescribes. The Codex half is untested and has a live upstream
report of not blocking. Either baseline can be regrown with one command.
None of this breaks the ROM or regresses anything already on `main`, so I
see no blocker. But the round's premise is that this checker can stand in
for a reviewer, and the four SHOULD FIX findings are the gaps between that
premise and what the code does. I am confident in items 1 and 2, and in the
lint and worktree findings, which I reproduced. I am less confident about
how Claude Code's rule anchoring behaves in a live session, which I could
not test.
