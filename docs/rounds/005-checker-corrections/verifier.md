<!-- fw-report
round: 005-checker-corrections
role: verifier
branch: verifier/005-checker-corrections
head: bac6a99528c7e05d23bee129bba24cdea17af882
os: Windows 11
python: 3.12.10
written: 2026-09-29T11:38:40Z
-->
Reviewed commit: bac6a99528c7e05d23bee129bba24cdea17af882 (code at 56d703859). Commands I ran myself, on Windows 11 in `.worktrees/verifier-005`:

- `python tools/gate3.py --scope all --log <log>` from PowerShell, exit 0. The first attempt stopped with `GATE EXIT 2` because `dsd.exe` was missing in a fresh worktree; I copied `dsd.exe`, `tools/mwccarm` and `tools/arm-none-eabi` from the primary checkout (no download) and reran. Log check, PowerShell form, verbatim:
  - `27204:[eur] SHA1 PASS`, `52802:[usa] SHA1 PASS`, `78401:[jpn] SHA1 PASS`
  - `78441:1330 passed, 15 skipped, 132 subtests passed in 21.72s`
  - `78444:==== GATE PASS ====`, `78445:gate3: GATE EXIT 0`
  - inside the same log: `check_references: eur, usa, jpn: 32903 units compared; ... (baseline entries 5931)`, `check_references: OK`, `[references] exit 0`, `check_fake_matches: ... do-while-zero 3, volatile-local 1 (baseline entries 4)`, `check_fake_matches: OK`, `[fake-matches] exit 0`.
- Known-bad gate runs, `--scope eur --no-tests --log`, each reverted with `git checkout` (worktree clean afterwards):
  - `src/main/Entry.c`: every `ldr rN, =data_027e0000` in the asm body written as `=0x027e0000`: `[eur] SHA1 PASS`, `NEW: [eur] src/main/Entry.c: missing-reloc at .text+0x118 in Entry: original ABS32 data_027e0000+0x0, built no relocation`, last line `gate3: GATE EXIT 1`. (Changing only one of the four uses changed the ROM bytes: SHA-1 FAIL, `GATE INFRASTRUCTURE`, exit 2.)
  - `src/main/Entry.c`: an `#if 0` block holding `void v_unused(void) { volatile int pad = 0; }` appended: `SHA1 PASS`, `NEW: volatile-local src/main/Entry.c: ...`, `GATE EXIT 1`.
- `ruff check .` exit 0. `python -m unittest discover -s tests`: `Ran 1345 tests ... OK (skipped=15)`. `python tools/check_ci_contract.py` OK. `python tools/fw.py check`: 0 errors, 0 warnings. `wc -w AGENTS.md` = 1737.
- `check_baseline_growth.py` in a scratch git repo seeded with the real baselines: unchanged exit 0; one added line exit 1; one line's detail changed (a swap) exit 1; two lines deleted exit 0; format line dropped exit 1; baseline file deleted exit 2.
- `claude -p --permission-mode acceptEdits`, Claude Code 2.1.284, in a scratch root plus `.worktrees/seat/`, each carrying the real `.claude/settings.json`. Edit tool on `a.sha1`, `build.ninja` and `tools/reference_baseline.txt`, from inside the seat and from the root aimed at `.worktrees/seat/...`, plus the Write tool, `A.SHA1`, `BUILD.NINJA`, `TOOLS/REFERENCE_BASELINE.TXT` and `./tools/../a.sha1`: all `File is in a directory that is denied by your permission settings.`, nothing changed. Control: Edit of an unprotected file succeeded.
- Bash controls. In `-p` mode Bash asks for approval by default, so the Bash denials alone prove nothing. With controls: `echo changed > ok2.txt` ran; with `--allowedTools "Bash(echo:*)" "Bash(tee:*)"`, `echo changed | tee ok3.txt` ran and `echo changed | tee a.sha1` was denied (file unchanged). `echo changed > build.ninja` was denied even with echo allowed. So the deny rules do fire for `>` and `tee` on 2.1.284.
- `protected_paths.py --check` and `--codex-hook` on worktree paths with the cwd at the worktree, its parent and the primary root, including backslash paths, `..`, case changes and `Move to:`: exit 2 for every protected path, 0 for `README.md`. This was fed payloads only; nothing ran inside Codex.
- Compiled 7 probe files with `mwccarm.exe` and ran the object check on them; ran round 004's lint (from `1d3fdd40e`) and the new lint on the same sources.
- Primary sources read: the permissions page (input redirects checked "in v2.1.257 and later", `tee` targets "in v2.1.269 and later", no version given for output redirects) and Codex issue 27833 (open; reports on Codex CLI 0.133.0 and Desktop 0.138.0-alpha.7 that a PreToolUse deny on `apply_patch` fires and the write proceeds).

## Findings

- [SHOULD FIX] `tools/check_fake_matches.py` (`_ZERO_LITERAL`, rule `do-while-zero`) — the zero-loop class is still open. Real bypass, end to end: in `src/main/List_Unlink.c`, `if (next) next->prev = prev;` became `do { if (next) next->prev = prev; } while ((int)0);`. Result: `[eur] SHA1 PASS`, `check_references: OK`, `check_fake_matches: OK`, `GATE PASS`, `gate3: GATE EXIT 0`. The same lexical miss for `while (1-1)`, `-0`, a NUL character literal, `NULL`, `0.0`, `0 && x`, `((void)0, 0)`, `sizeof(char)-1`, `0 == 1` and an enum constant; `(int)0` and `1-1` compile under mwcc. The brief asked to close "any other spelling you find", and no object check can catch this one.
- [SHOULD FIX] `check_fake_matches.py` (rule `volatile-local`) — misses that compile or combine the brief's own forms: `for (volatile int i = 0; ...)` (compiles), `typedef int * volatile VPV; VPV p;` (the typedef branch skips any declarator containing `*`), a function-like macro `#define DECL(t,n) volatile t n`, a brace-less `while (c) volatile int x = c;`, and `int a = 0, * volatile p = &a;`. I confirmed these by calling the lint; only the for-init form was also compiled.
- [SHOULD FIX] `tools/protected_paths.py` `PATTERNS` — protects the two baselines but not the files that decide whether they bind: `.github/workflows/tests.yml`, `tools/check_baseline_growth.py`, `tools/baseline_file.py`, `tools/check_fake_matches.py`, `tools/check_references.py`, `tools/gate3.py`. An agent that cannot edit a baseline can edit the growth check or delete the CI step, and the checker turns green. The Worker flagged this; brief item 4 asked only for the two baselines, so it is below BLOCKER.
- [NOTE] `raw-data-directive` misses a label without a colon (`lbl dcd 0x12345678`); mwcc compiles it. The object check does catch it (`data_words_in_code` returned `.text+0x0`), so the gate is safe, but the source-only CI lint step (`python tools/check_fake_matches.py`, no `--version`) does not see it.
- [NOTE] The Worker's own open bypass (a `##`-pasted `dcd` word that a real `ldr` loads) stays open, as it reported. I agree it is close to an honest literal pool.
- [NOTE] Baseline identity is rule, path, ordinal and line text, so a tolerated finding can move to another function in the same file with identical text and stay green. It cannot add a second one.
- [NOTE] A ROM SHA-1 mismatch is reported by the gate as `INFRASTRUCTURE ERROR` / exit 2 (seen in my first Entry.c run), not `FAIL` / exit 1. It is non-zero either way. I did not check whether this predates the round.
- [NOTE] The Worker's Bash denial evidence for `>` and `tee` had no control run (in `-p` mode Bash is denied by default). My controls above show the same conclusion holds.

## Not verified

- The CI step on GitHub: I ran its command against a scratch merge base, not a real pull request; `gh pr checks 1631` not read.
- Codex CLI (not installed), so the hook is unproven inside Codex; the `apply_patch` payload shape it assumes is untested.
- macOS or Linux behaviour of the `.worktrees/*` deny rules; Windows only.
- Whether `#pragma define_section` can place data in `.text` under mwcc; my one attempt landed the table in `.rodata`, so this is unproven either way.
- Each individual volatile-local and zero-loop miss beyond the ones noted as compiled; I did not compile them all.
- My checks used a stand-in primary root, as the Worker's did, not the real primary checkout.

## Verdict

The round does what the brief's six items and six acceptance criteria ask, and I reproduced it on Windows. The full gate passes with all three ROMs, the reference check and the lint inside one verdict and `GATE EXIT 0`. A wrong reference and a lint-flagged fake each end `GATE EXIT 1` with the ROM still matching. The baseline-growth check fails on an added or swapped entry and passes on a removal. The Claude Code deny rules held from both starting points on 2.1.284, with controls. `AGENTS.md` states only what was observed, and its Codex sentence matches the issue. The remaining weakness is that the lint is lexical: the do-while-zero and volatile-local classes each have simple spellings that pass the whole gate, one of which I demonstrated, and the checker files themselves are not in the protected list. I would not call the lint closed, and I would not call the checker tamper-proof until those files are protected. Confidence is high on what I ran and moderate on the gaps listed under Not verified.
