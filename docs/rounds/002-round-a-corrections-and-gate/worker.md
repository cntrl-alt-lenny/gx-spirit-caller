## Verified

Final content commit: `e61eb2431d37f02058c5d85169b22daf771bf51b` (branch
`worker/002-round-a-corrections-and-gate`, started from `f0a3e11c8`, which sits
on `40070bdc2`). It follows `87ef902b5de8f1ec79c3a499198aef953a76d504`, the
commit the first (full-compile) gate run covered; the only change between them
is the removal of the words "by hand" from one `docs/state.md` sentence, and the
gate was run again on the final commit. The report commit that follows changes
only this file.

Machine: macOS 27.0, build 26A428, arm64 (`sw_vers`, `uname -m`); the compiler
ran under Wine with Rosetta 2 (`arch -x86_64 /usr/bin/true` → exit 0). The
checkout is an independent clone with the three baseroms copied into its
`orig/`. `./dsd` was missing in the fresh clone, so I ran
`python3.13 tools/download_tool.py dsd v0.11.0 --path ./dsd` once before the
gate (gate3's own preflight asked for it; the first attempt stopped there with
`GATE FAIL ... ./dsd is missing`, no build ran).

- Three-ROM gate passed at the final commit `e61eb2431` — `python3.13
  tools/gate3.py --scope all > gate.log 2>&1`, written to a log outside the
  checkout, no pipe. Region order eur, usa, jpn. The log check exactly as the
  corrected `AGENTS.md` gives it (`grep -nE "SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)" <log>`)
  printed:

  ```text
  55:[eur] SHA1 PASS
  97:[usa] SHA1 PASS
  139:[jpn] SHA1 PASS
  198:3392 passed, 16 skipped, 54 subtests passed in 21.85s
  201:==================== GATE PASS ====================
  ```

  This second run was short because the first run had already compiled every
  object in the clone; gate3 deletes the ROM and `objdiff.json` and relinks
  each region. The first run, at `87ef902b5` (a full compile of about 10,000 to
  12,600 ninja steps per region under Wine), printed the same five lines:
  `[eur] SHA1 PASS`, `[usa] SHA1 PASS`, `[jpn] SHA1 PASS`, `3392 passed, 16
  skipped, 54 subtests passed in 22.74s`, `GATE PASS`. Neither log has a
  `SKIP`, `INFRASTRUCTURE`, `CLEAN-FAIL` or `SHA1 FAIL` line. The 16 skipped
  are pytest tests, not regions. `git status` was clean after both runs.
- Correction 1 works on a failing log — a hand-made log holding
  `[eur] SHA1 FAIL`, `[usa] SHA1 PASS`, `2 passed, 1 warning`, an unrelated line
  and `==================== GATE FAIL ====================`. The old command
  (extracted from `HEAD:AGENTS.md` at the start commit, with `\|` as written)
  printed nothing. The new grep line and the new Python line, each extracted
  from the raw fenced block in `AGENTS.md` by `awk` and run, both exited 0 and
  printed:

  ```text
  2:[eur] SHA1 FAIL
  3:[usa] SHA1 PASS
  4:2 passed, 1 warning
  6:==================== GATE FAIL ====================
  ```

  (the Python line prints `2 [eur] SHA1 FAIL` and so on, same four lines).
- Correction 3, recomputed by me — `git worktree add --detach <tmp> 555c2aeac`,
  then `python3.13 tools/progress.py --version eur` there → exit 0:
  `Natural-C:        400530 / 2385948    bytes  (16.79%)`. At `87ef902b5`
  the same command gives `Natural-C:        414738 / 2385948    bytes  (17.38%)`.
  `555c2aeac` is `2026-08-19 Correct unmatched-function metric framing (#1523)`,
  the newest `main` first-parent commit dated 19 August; `722d7b385` is the
  newest dated 1 September. 414,738 − 400,530 = 14,208 B; 17.38 − 16.79 = 0.59.
  I did not re-run `progress.py` at `722d7b385` itself; the 17.38% is from the
  current tree, which has the same `.text` sources, and matches the figure the
  brief and the earlier `docs/state.md` already gave.
- Correction 5, word diff of `docs/research/` between the tag and the final
  commit — `git diff --word-diff=porcelain --word-diff-regex='[^[:space:]]+'
  archive/pre-redesign-2026-09-23 -- docs/research`, filtered to changed
  tokens. Every remaining change is a link turned into plain text plus
  "(removed from `main`; at tag `archive/pre-redesign-2026-09-23`: `<path>`)".
  No other change. The two defects now show as no diff: line 171 again reads
  `` `[0x021ceae4, 0x021cef74)` ``, and line 232 reads
  ``- `docs/briefs/174-bundle-extent-heuristic-generator.md` (removed from ...``
  without the stray `[`. The complete word diff (16 changed lines across 11 files)
  was reviewed; the changed files are `brain-rounds-0805-0810.md`,
  `brain-rounds-0822-0828b.md`, `chunk-extent-generalisation.md`,
  `cluster-b-bundle-cap-raise.md`, `codegen-walls.md`,
  `cross-region-symbol-aliasing-audit.md`, `data/cm-bss-convert-3-2026-07-31.md`,
  `first-wave-wall-mmio-base-folding.md`, `first-wave-wall-permuter-results.md`,
  `multi-region-feasibility.md`, `nitrosdk-import-study.md`.
- Diff scope — `git diff --stat 40070bdc2057376d085e4bbe3907aa41e176300c HEAD`
  at `87ef902b5` (the later commit changes one line of `docs/state.md`, so the
  file list is the same):

  ```text
   AGENTS.md                                          |  21 +++-
   docs/research/cluster-b-bundle-cap-raise.md        |   4 +-
   .../002-round-a-corrections-and-gate/brief.md      | 130 +++++++++++++++++++++
   docs/state.md                                      |  14 ++-
   4 files changed, 159 insertions(+), 10 deletions(-)
  ```

  (`brief.md` is the round's own folder, added by Brain's `f0a3e11c8`.)
- Checks at `87ef902b5` (`fw.py check` re-run at `e61eb2431`):
  `python3 tools/fw.py check` → exit 0, `0 error(s), 0 warning(s)` (also after
  the last commit);
  `python3.13 -m unittest discover -s tests` → exit 0, `Ran 3401 tests in
  20.022s` / `OK (skipped=23)`; `python3.13 -m ruff check .` → exit 0,
  `All checks passed!`; `npx markdownlint-cli2 AGENTS.md docs/state.md
  docs/research/cluster-b-bundle-cap-raise.md` → `Summary: 0 issues in 0
  files`.
- Correction 2 — `git ls-remote --tags origin 'archive/*'` lists 13 tags, the
  same 13 that `git tag -l 'archive/*'` shows in a fresh clone, so they are on
  GitHub. `fw.py status --leaving` in this clone still prints "not on GitHub
  yet: tag archive/branch-brain-guard-repair-0909 ..." and "safe to leave this
  machine: NO", so the note now says that output is a false alarm.

## Not verified

- The PowerShell line of the log check was not run: there is no `pwsh` on this
  Mac. The `Select-String` pattern is the same regular expression as the `grep`
  line (single-quoted, with `|` unescaped); a Windows run should confirm it.
- The `python -c` line was tested with `python3.13` on macOS, not on Windows
  (`python`).
- `progress.py` at `722d7b385` was not re-run (see above).
- CI for the pushed branch is not something I ran; the five required checks are
  Brain's to read.
- The gate's exit status was not relied on; the verdict is the log lines above.

## Changed

- `AGENTS.md`: the gate row now points to a fenced "log check" block holding
  the `grep`, `Select-String` and Python forms with unescaped `|`; the
  `fw.py status` note now says the tags are on GitHub and what the tool
  wrongly prints.
- `docs/research/cluster-b-bundle-cap-raise.md`: restored the `[` at line 171,
  removed the stray `[` at line 232.
- `docs/state.md`, every sentence changed:
  - Removed: "- **decomp.dev CI** (was PR #1020) is closed; it needed a private
    image only the owner could build." Added: "- **decomp.dev CI** was closed;
    it needed a private image only the owner could build."
  - Removed: "The one-week pilot is measured against the 0.2-point EUR
    natural-C gain made between 19 August and 1 September." Added: "The
    one-week pilot is measured against the EUR natural-C gain made
    between 19 August and 1 September: 16.79% (400,530 B) at `555c2aeac`, the
    last `main` commit of 19 August, to 17.38% (414,738 B) at `722d7b385`, the
    last of 1 September, which is 0.59 points (14,208 B) in 13 days."
  - Added under Parked: "- **Retired hook still seeded:**
    `docs/agents/framework.json` still lists `.githooks/pre-push` as a seed
    file (framework issue 25), so the next framework update would re-create it;
    that update round must delete the hook again."
- This report.

## Open questions

- The state note says `722d7b385` is "the last of 1 September", as the brief
  phrased it; I confirmed it is the newest first-parent `main` commit dated
  1 September.
- `fw.py status` still reports the `archive/*` tags as not on GitHub in a
  fresh clone even though they are (framework issue 18); nothing to do here.
