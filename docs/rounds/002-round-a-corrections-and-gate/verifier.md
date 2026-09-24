<!-- fw-report
round: 002-round-a-corrections-and-gate
role: verifier
branch: verifier/002-round-a-corrections-and-gate
head: e5a17444243716f5b9ebfdc4d03839a81749ae04
os: macOS 27.0
python: 3.9.6
written: 2026-09-24T08:21:16Z
-->
Reviewed commit: `e5a17444243716f5b9ebfdc4d03839a81749ae04`. It is the Worker's report commit; the Worker's final content commit is `e61eb2431d37f02058c5d85169b22daf771bf51b`, and `git diff e61eb2431 e5a174442 --stat` touches only the Worker's report. Everything below was run by me, in my own independent clone, on macOS 27.0 (`sw_vers -productVersion` -> `27.0`), arm64, Python 3.13, at that commit. Paths are shortened to `<scratch>`.

Commands I ran myself, with exit status:

- `arch -x86_64 /usr/bin/true` -> 0 (Rosetta 2 works) before building.
- `python3 <framework>/tools/fw.py --cwd . start --role verifier --round 002-round-a-corrections-and-gate` -> 0.
- `python3.13 tools/gate3.py --scope all > <scratch>/gate.log 2>&1` -> exit 0 and, more to the point, the log says `GATE PASS` (below). Region order in the log: eur, usa, jpn. A full compile of 12,593 (EUR), 10,258 (USA) and 10,257 (JPN) ninja steps, the ROMs were written at 08:22 (EUR), 08:52 (USA) and 09:18 (JPN) local time, about an hour and a half in all.
- The log check, taken from the raw `AGENTS.md` fenced block by `awk`, with only `<log>` replaced, run on the gate log and on a hand-made failing log (below).
- `cmp gx-spirit-caller_<region>.nds orig/baserom_<region>.nds` for each of the three rebuilt ROMs -> 0 for all three.
- `python3 <framework>/tools/fw.py --cwd . check` -> 0: `0 error(s), 0 warning(s)`.
- `python3.13 -m unittest discover -s tests` -> 0. `python3.13 -m ruff check .` -> 0.
- `python3.13 tools/progress.py --version eur` in temporary detached worktrees at `555c2aeac` and `722d7b385`, and at HEAD -> 0 each.
- `python3.13 tools/check_ci_contract.py` -> 0. `git diff --word-diff` of `docs/research/` against the tag. `git cat-file -e` over the 273 files round 001 deleted. `git ls-remote --tags origin 'archive/*'`. `gh issue view 18` and `25` on the framework repository.

**The gate, from its own log** (the corrected `AGENTS.md` command, verbatim, against `<scratch>/gate.log`; commit `e5a174442`, worktree clean before and after: `git status --short` printed nothing):

```
27855:[eur] SHA1 PASS
53879:[usa] SHA1 PASS
79904:[jpn] SHA1 PASS
79963:3392 passed, 16 skipped, 54 subtests passed in 25.58s
79966:==================== GATE PASS ====================
```

There is no `SKIP`, `INFRASTRUCTURE`, `CLEAN-FAIL`, `SHA1 FAIL` or `GATE FAIL` line (`grep -c SKIP` on the log: 0). The 16 skipped are pytest tests. The step before each PASS is `tools/sha1.py gx-spirit-caller_<region>.nds -c gx-spirit-caller_<region>.sha1` printing `<file>: OK`. I also compared the three rebuilt ROMs with the baseroms with `cmp`, independently of the project's `sha1.py`: identical for EUR, USA and JPN.

**Correction 1, run as the raw file gives it.** The hand-made log held `[eur] SHA1 FAIL`, `==================== GATE FAIL ====================`, one unrelated line and `12 passed in 1.0s`. The `grep` line and the Python line from `AGENTS.md` printed:

```
1:[eur] SHA1 FAIL
2:==================== GATE FAIL ====================
4:12 passed in 1.0s
```

(the Python form prints `1 [eur] SHA1 FAIL` and so on, the same three lines, exit 0). `grep -c '\\|' AGENTS.md` -> 0: no escaped pipes remain.

**Correction 3, recomputed by me.**

```
555c2aeac (2026-08-19 19:13 +0100)  Natural-C:  400530 / 2385948 bytes (16.79%)
722d7b385 (2026-09-01 19:10 +0100)  Natural-C:  414738 / 2385948 bytes (17.38%)
HEAD e5a174442                      Natural-C:  414738 / 2385948 bytes (17.38%)
```

`git log --first-parent origin/main` on 19 August lists `555c2aeac` first, so it is the last of that day; `722d7b385` is the last first-parent commit dated 1 September. 414,738 - 400,530 = 14,208 B. 1 September minus 19 August is 13 days.

**Correction 5, the word diff** (`git diff --word-diff=plain -U0 archive/pre-redesign-2026-09-23 HEAD -- docs/research`): 16 changed places in 11 files, and in every one the removed side is a Markdown link and the added side is the same text as plain code with "(removed from `main`; at tag `archive/pre-redesign-2026-09-23`: `<path>`)" added. Nothing else differs. Lines 171 and 232 of `docs/research/cluster-b-bundle-cap-raise.md` no longer show a diff of their own: `` `[0x021ceae4, 0x021cef74)` `` is restored, and the line-232 entry has no stray `[`.

**Round 001's invariants at this commit.** `fw.py check` 0 and 0; the 273 files round 001 deleted are all still absent and all 273 present at `archive/pre-redesign-2026-09-23` (`checked=273 failures=0`); `git diff --stat <tag> HEAD -- src libs include config assets orig '*.sha1'` is empty; `check_ci_contract.py` prints `OK: all 5 required check(s) resolve to a job that runs on every pull request.` and `.github/required-checks.txt` still lists the five names; `git diff --name-only 40070bdc2 HEAD` is `AGENTS.md`, `docs/research/cluster-b-bundle-cap-raise.md`, `docs/state.md` and this round's `brief.md` and `worker.md`, so nothing under `.github`, `tools`, `tests`, `docs/agents`, `src`, `libs`, `include`, `config`, `assets` or `orig` moved. Word counts: `AGENTS.md` 1,478, `CLAUDE.md` 18, `docs/state.md` 795.

`docs/state.md` sentences, from `git diff 40070bdc2 HEAD -- docs/state.md`: removed "- **decomp.dev CI** (was PR #1020) is closed; it needed a private image only the owner could build." and "The one-week pilot is measured against the 0.2-point EUR natural-C gain made between 19 August and 1 September."; added "- **decomp.dev CI** was closed; it needed a private image only the owner could build.", the Parked bullet "**Retired hook still seeded:** `docs/agents/framework.json` still lists `.githooks/pre-push` as a seed file (framework issue 25), so the next framework update would re-create it; that update round must delete the hook again.", and the pilot sentence now ending "...between 19 August and 1 September: 16.79% (400,530 B) at `555c2aeac`, the last `main` commit of 19 August, to 17.38% (414,738 B) at `722d7b385`, the last of 1 September, which is 0.59 points (14,208 B) in 13 days." Nothing else in the file changed. Both framework issue numbers check out on GitHub: 25 is "adopt.py --update re-creates a seed file (.githooks/pre-push) the project deliberately deleted"; 18 is the `status --leaving` "not safe" one.

## Findings

- [NOTE] `AGENTS.md` log check, PowerShell line: neither the Worker nor I could run it; there is no `pwsh` on this Mac. Reading it, `Select-String -Pattern '<regex>' <log>` is valid PowerShell with the same regex as the `grep` line, and it will print `path:line:text` instead of `line:text`. The Python form, which the file says works on both systems, is the one I would trust on the Windows PC.
- [NOTE] `docs/state.md`, pilot sentence: "0.59 points" is the difference of the two rounded percentages (17.38 - 16.79). From the raw counts, 14,208 / 2,385,948 is 0.5955 points, which would round to 0.60. The brief chose 0.59; both figures are correct to the precision given, and the byte figure is exact. No action needed unless Brain wants the two to agree.
- [NOTE] Test counts differ between machines and are not a defect: my unittest run was `Ran 3406 tests ... OK (skipped=15)`, the Worker's `Ran 3401 ... OK (skipped=23)`; my pytest leg was `3392 passed, 16 skipped`, the same as the Worker's. I did not investigate the difference; it looks like environment-dependent skips.

No blockers. The Worker's report agrees with everything I could reproduce: the gate lines, the failing-log demonstration, the 555c2aeac figure, the word-diff conclusion and the diff scope. Its claim that `722d7b385`'s figure came from the current tree and not from that commit was correct (I ran it at both: identical).

## Not verified

- CI on this branch: there is no pull request for it and no check runs on either commit (`gh api .../commits/<sha>/check-runs` returned nothing), so I have not seen the five required checks pass. The Worker ran `markdownlint-cli2` on the three changed Markdown files with 0 issues; I did not, because it is not installed here and I did not download it. `configure-windows` and anything on Linux, Windows or Python 3.11 are likewise unseen.
- The PowerShell `Select-String` line and the Python line on Windows (above).
- The Worker's own two gate runs (the compile at `87ef902b5` and the relink at `e61eb2431`): I cannot see their logs. My run is a full compile at `e5a174442`, which has the same content as `e61eb2431` in every file the build reads.
- The toolchain: I did not download it. For this run and the last I copied the git-ignored `dsd` and `tools/mwccarm/` from an earlier Worker's local checkout (the `dsd` SHA-256 matches the one from the first round's review). If those binaries were wrong, the three ROMs would not be byte-identical to the baseroms, which they are.

## Verdict

I believe round A is complete. The three corrections that touch text do what the brief says: the gate's log check now works when copied from the raw file (shown on a log that holds `SHA1 FAIL` and `GATE FAIL`), the status note says only what is true (all 13 `archive/*` tags are on GitHub), the pilot baseline records the measured figures and both commits (I re-derived both, and 16.79% to 17.38% is 14,208 B), the PR number is gone, the two damaged characters in the research file are restored and no other change in `docs/research/` is anything but link syntax. The diff from the round-001 commit touches only the files the brief allows. And the thing round 001 could not show is now shown: at `e5a174442`, on a machine where the compiler runs, the gate log has `[eur] SHA1 PASS`, `[usa] SHA1 PASS`, `[jpn] SHA1 PASS`, a green pytest summary and `GATE PASS`, and the three rebuilt ROMs are byte-identical to the baseroms by my own `cmp`. Combined with round 001's unchanged build graph, I am highly confident the change is safe to accept. What remains for Brain is the CI read and the merge under the owner's rule.
