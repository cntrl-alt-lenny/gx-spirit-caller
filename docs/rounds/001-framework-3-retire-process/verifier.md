<!-- fw-report
round: 001-framework-3-retire-process
role: verifier
branch: verifier/001-framework-3-retire-process
head: e71463b65753366b4a622ef9e9be1a7c862a6f41
os: macOS 27.0
python: 3.9.6
written: 2026-09-23T16:47:58Z
-->
Reviewed commit: `e71463b65753366b4a622ef9e9be1a7c862a6f41` (branch `worker/001-framework-3-retire-process`; base and archive tag commit `5ad1a7a2a9733b191d5c838a36593d429bd7a841`). It differs from the Worker's content commit `defa22475` only by the Worker's report. Everything below was run by me, in an independent clone, on macOS 27 with Python 3.13, at that commit unless stated. Paths are shortened to `<scratch>`.

Commands I ran myself, with exit status:

- `python3 <framework>/tools/fw.py --cwd . start --role verifier --round 001-framework-3-retire-process` -> 0 (put me on the exact commit).
- `python3 <framework>/tools/fw.py --cwd . check` -> 0: `0 error(s), 0 warning(s)`.
- `python3 <framework>/tools/fw.py --cwd . status` -> 0: pinned 3.0.0, "up to date with the latest release (3.0.0)", merge rule `owner-approves`, no uncommitted work, "all project checks pass". It also prints "safe to leave this machine: NO" for the `archive/*` tags only (the false alarm the brief names). I ignored that line and nothing else.
- `python3 <framework>/tools/adopt.py . --update --dry-run` on the final tree -> 0. Every framework file is `same`, `AGENTS.md`, `docs/state.md` and `.gitattributes` are `keep`, and one line is `create  .githooks/pre-push` (see finding 4).
- `python3.13 tools/gate3.py --scope all > <scratch>/gate.log 2>&1` -> **exit 2, and the log says the gate did not pass** (below).
- `python3.13 -m unittest discover -s tests` -> 0. `ruff check .` (via `python3.13 -m ruff`, 0.15.14) -> 0.
- `python3.13 tools/check_ci_contract.py` -> 0; `tools/generate_tool_index.py --check`, `tools/generate_research_index.py --check` and `tools/validate_attempts.py` -> 0 (the three drift-check commands).
- `python3.13 tools/configure.py <eur|usa|jpn>` at the archive tag and at this commit, then a `diff` of the six generated `build.ninja` files (root path normalised) -> 0 for all three.
- `git diff --stat 5ad1a7a2a9733b191d5c838a36593d429bd7a841 HEAD -- src libs include config assets orig '*.sha1'` -> 0, empty.
- Archive completeness, my own loop over `git diff --name-only --diff-filter=D <tag> HEAD` with `git cat-file -e "archive/pre-redesign-2026-09-23:<path>"`.
- `python3.13 tools/progress.py --version eur|usa|jpn` at this commit and, in temporary worktrees, at four earlier commits (below).
- `gh api repos/cntrl-alt-lenny/gx-spirit-caller/rulesets` and `.../rulesets/19573966`; `gh pr view 1020`.
- My own Markdown link checker, a source and import scan for references to removed modules, and `git ls-remote --tags origin archive/pre-redesign-2026-09-23`.

**The gate, from its own log** (`grep -nE "SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)" <scratch>/gate.log`):

```
66:[eur] INFRASTRUCTURE ERROR
142:[usa] INFRASTRUCTURE ERROR
218:[jpn] INFRASTRUCTURE ERROR
277:3387 passed, 21 skipped, 54 subtests passed in 24.08s
280:==================== GATE INFRASTRUCTURE ====================
```

There is no `SHA1 PASS` line for any region and no `GATE PASS`. The cause is the same as the Worker's: this Mac has no Rosetta 2, and the x86-64 `wine` fails with `/bin/sh: /opt/homebrew/bin/wine: Bad CPU type in executable` on every compile step (`arch -x86_64 /usr/bin/true` fails the same way, and `/Library/Apple/usr/share/rosetta` is absent). I did not install Rosetta. The pytest leg of that run is green.

Set-up notes, in the interest of showing what I did. A fresh clone has no toolchain, so my first gate stopped at "`./dsd` missing". I then copied the git-ignored `dsd` (SHA-256 identical to the Worker's) and `tools/mwccarm/` from the Worker's local checkout instead of downloading. Ninja itself then began a `download_tool.py dsd v0.11.0` step and was stopped by the failing compile before it wrote anything (`dsd` hash unchanged). I hard-linked the three baseroms by hand: `tools/link_baseroms.py <clone>` finds no primary for an independent clone and skips every ROM. `configure.py` then verified all three SHA-1s (`OK (1da50df7c210fae96dc69b3825554b9ce13b4f75)` for EUR, and equivalently for USA and JPN).

## Findings

- [SHOULD FIX] `AGENTS.md:102` — the evidence command for the gate is written with escaped pipes inside a table cell: ``grep -nE "SHA1 (PASS\|FAIL)\|INFRASTRUCTURE\|CLEAN-FAIL\|SKIP\|GATE [A-Z]+\|[0-9]+ (passed\|failed)" <log>``. A GitHub renderer hides the backslashes, but an agent reads the raw file and copies them. I ran the command exactly as it is written in the file, against a log I made containing `[eur] SHA1 FAIL` and `GATE FAIL`, with both the system `/usr/bin/grep` and this shell's `grep` (ugrep): 0 lines each. The correct form (the brief's, without the backslashes) finds both. This is the gate's only trustworthy signal while its exit status is not trusted, and on a failing gate it prints nothing, which a careless reader can take as "no failures". The brief's own text has the unescaped form; the fix is to put the command outside a table cell, or in a fenced block under the table.

- [SHOULD FIX] `docs/state.md:90` (under Historical anchors; also in the brief) — "The one-week pilot is measured against the 0.2-point EUR natural-C gain made between 19 August and 1 September." I recomputed it and it does not hold. `tools/progress.py --version eur` (EUR natural-C) gives: 16.79% (400,530 B) at `555c2aeac` (19 August, the last `main` commit that day) and at `fbdb12948` (18 August); 17.37% (414,466 B) at `5b865162b` (31 August); 17.38% (414,738 B) at `722d7b385` (1 September). I ran each commit's own `progress.py` and also today's `progress.py` against each old tree, with identical results. The gain over the stated window is 0.59 points (14,208 B), about three times the recorded figure. Failure path: round E judges the factory's pilot against a baseline that is roughly a third of what the last comparable window produced, so a modest pilot would look as good as or better than the human campaign. The Worker copied the brief faithfully (its list marks it as an added sentence); the error is upstream of the Worker. Brain should decide the intended window and figure, and correct the sentence before merging. The 17.38% (414,738 B) EUR figure itself is right, and so is 15.85% for USA and JPN.

- [NOTE] `docs/research/cluster-b-bundle-cap-raise.md:171` — the Worker's report says of its 15 link edits in `docs/research/` "Only link syntax changed". At this line `` `[0x021ceae4, 0x021cef74)` `` (a half-open address range) became `` `0x021ceae4, 0x021cef74)` ``: the opening bracket was dropped, so the text changed. Line 232 of the same file also gained a stray leading `[`. Both look like the link rewrite matching interval notation. Harmless to the build; worth repairing.

- [NOTE] `docs/agents/framework.json` — it still records `"options": {"hooks": true}` and `.githooks/pre-push` as a `seed` file, because the 2.x hook existed when the adopter ran. The brief has the hook deleted, which I confirmed. Result: my dry-run `adopt.py --update` on the final tree wants to `create  .githooks/pre-push`, so the next framework update round would bring a sample hook back unless it is dropped. I cannot tell whether that is intended; the Worker did not mention it, and the file may only be hand-edited under `settings`.

- [NOTE] `docs/state.md:68` — "(was PR #1020)". The framework's State rule says no pull-request numbers, since they go stale. `fw.py check` only checks commit ids, so it passes. Trivial to reword.

- [NOTE] `docs/decomp-workflow.md:92` and `:606` still say "Push to a `decomper/*` branch" and refer to the "scaffolder's tooling-extension lane". The Worker disclosed the leftover Decomper and Scaffolder vocabulary in this guide and in `.github/labeler.yml`, and leaves it for round B. The new `AGENTS.md` does not name those roles (I grepped), as required.

- [NOTE] `tools/link_baseroms.py` — the prompt for this seat says to run it with the clone as the target. For an independent clone it skips all three ROMs ("source absent"), as the Worker also found; `AGENTS.md` and `docs/machine-setup.md` now say so correctly. Only the seat prompt is out of step.

- [NOTE] Small count differences, no failure: my pytest was `3387 passed, 21 skipped`, the Worker's `3391 passed, 17 skipped`; my unittest `Ran 3402 ... OK (skipped=17)`, the Worker's `3406 ... skipped=16`. I did not chase the difference; my clone is fresh and has no extracted ROM or build outputs, so more tests skip.

Agreements with the Worker's report, where I reproduced the same result independently: the adopter's plan and the 273-file deletion set; `fw.py check` clean; word counts (`AGENTS.md` 1,389, `CLAUDE.md` 18, `docs/state.md` 735); protected paths empty; 273 of 273 deleted files present at the tag and none left at HEAD; the tag is on origin and points at `5ad1a7a2a…`; the live ruleset (required checks, `required_approving_review_count` 0, squash only, one bypass actor of repository role 5 with `bypass_mode: always`, `cntrl-alt-lenny` sole admin collaborator) matches what `AGENTS.md` says; `gh pr view 1020` is CLOSED; the five required checks still resolve to jobs that run on every pull request (`check_ci_contract.py`: `OK: all 5 required check(s) resolve to a job that runs on every pull request.`); my link check finds 20 broken links in kept Markdown, all in `docs/research/`, all present at the tag too, and none caused by the round (the one at the tag that pointed into the retired state log is gone); no kept code imports, or names as a `.py` file, any removed module (I parsed every tracked `.py` file); the only removed tests belong to removed subjects. The Worker's flagged judgement calls (three tests dropped from `tests/test_routing_suffixes.py` because their subject was the two deleted hook copies; `docs/setup/branch-protection-proposal.md` and `tools/check_metric_canon.py` removed as the same class) look right to me: the first tests only deleted files, and the other two are not referenced by the build graph, `gate3.py`, the workflows or a kept test.

## Not verified

- **The three-ROM rebuild, and so acceptance criterion 9 and the first invariant.** I could not run it, for the reason above. No region has a `SHA1 PASS` line from me. What I have instead is evidence that the inputs and the recipe are unchanged, which is an argument and not a rebuild: the generated `build.ninja` is line-for-line identical at the tag and here for EUR (132,364 lines), USA (104,571) and JPN (104,561), and none of the 50,543 distinct `tools/`, `libs/`, `include/`, `config/`, `src/` and `assets/` paths named in those graphs was changed by the round (every path that is absent at HEAD is equally absent at the tag: 17,399 generated outputs). Someone with a working Windows runner (the owner's Windows PC, or a Mac with Rosetta) still has to run `python3.13 tools/gate3.py --scope all > <log> 2>&1` at this commit and read the log's lines.
- Markdownlint (`markdownlint-cli2` is not installed here and I did not fetch it). `Markdown (markdownlint-cli2)` in CI is the real check. Likewise I have not seen any of the five required checks run on a pull request for this branch (none exists), nor anything on Linux, Python 3.11 or Windows.
- The rule table and state-change list (`attachments/`) in full. I read the old `AGENTS.md`, `docs/project-rules.md`, the old hook docstrings and `settings.json` myself first, and compared them with the table: every rule I looked for had a row, with a plausible disposition, and the line references I spot-checked (`project-rules.md:89-97`, `:234-241`, `:257-259`) are correct. The old `docs/state.md` is 10,798 words; I read the parts that hold standing rules, decisions and parked items (about 3,000 words) and looked up specific sentences in the list (for example the one-toolchain-lane-per-machine rule and "EUR-only SHA1 PASS is sufficient" for tools-only pull requests, both marked archived with a reason), but did not check the Worker's "637 removed units, every word quoted" claim sentence by sentence. Those two archived rules are worth Brain's attention for round E, because concurrent compiles still serialise on one machine.
- Whether the one-line reasons for the six owner decisions in `docs/state.md` say what the owner means. The Worker wrote them and asks the owner to confirm; I cannot.
- The two 2026-09-08 tool defects listed under Parked in `docs/state.md` (`pool_freshness.py --module`, `m2ctx.py` needing `gcc`); carried over unchecked, and marked so.

## Verdict

I believe this is a careful, well-scoped change and that it does what the brief asks: framework 3.0.0 is installed and untouched afterwards (the adopter reports every framework file `same`), `AGENTS.md` is a real single entry point that names only Owner, Brain, Worker and Verifier, all 273 deletions are recoverable byte-for-byte from the tag, the required CI check names all still exist and run on every pull request, and nothing the build reads was touched: the build graph for all three regions is identical to the tag's. I am highly confident the ROMs are unaffected, but I have not seen them rebuild, and neither has the Worker, so criterion 9 is open until the real gate runs somewhere with a working compiler runner. I recommend Brain not treat this as accepted until it does. Two things I would have fixed before merge: the gate's grep command in `AGENTS.md`, which as written silently prints nothing on a failing gate, and the pilot baseline in `docs/state.md`, which my recomputation puts at 0.59 points, not 0.2. The rest are notes. My confidence in the second finding is high (I re-ran it four ways); the recorded 17.38% and 15.85% figures are right.
