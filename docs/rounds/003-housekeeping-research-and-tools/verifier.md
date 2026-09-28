<!-- fw-report
round: 003-housekeeping-research-and-tools
role: verifier
branch: verifier/003-housekeeping-research-and-tools-2
head: e3b504a0ebf1902ff90fff0955be26948336829b
os: macOS 27.0
python: 3.9.6
written: 2026-09-28T12:47:47Z
-->
Reviewed commit: e3b504a0ebf1902ff90fff0955be26948336829b (re-review after the
Worker's correction). My first review, of `1a576d63b`, is commit `c9491ad4f` on
`origin/verifier/003-housekeeping-research-and-tools`. Its findings, commands
and results stand as written there and are kept here by reference, not
repeated. That review reproduced the three-region gate (`[eur]`, `[usa]` and
`[jpn]` `SHA1 PASS`), the byte-identical build graph in all three regions, the
byte-identical ledger move, the archive-tag coverage of all 7,018 deleted paths
and the tools reachability analysis. Its one blocker was the five live
`docs/state.md` links quoted in `worker.md`, which broke
`tests/test_docs_links.py`.

Checkout for this pass: a linked worktree of the owner's primary checkout,
`.worktrees/verifier-003`, made with `git worktree add --detach` at
`origin/worker/003-housekeeping-research-and-tools`, then
`python3 tools/fw.py start --role verifier --round 003-housekeeping-research-and-tools`
(exit 0, "reviewing exactly e3b504a0ebf1…"). No baseroms and no rebuild, as
instructed.

Commands I ran myself at `e3b504a0e`:

- Scope of the change: `git diff --stat 1a576d63b HEAD` prints one file,
  `docs/rounds/003-housekeeping-research-and-tools/worker.md`
  (22 insertions, 5 deletions). `git log 1a576d63b..HEAD` is the single report
  commit `e3b504a0e`. Nothing on the build path moved, so the first review's
  SHA-1 results carry over.
- The diff itself: the five quoted links under the `docs/state.md` entry are
  now code spans with the target named in text (for example
  `` `BUILD.md` (link target `../BUILD.md`) ``). The quoted wording is
  otherwise unchanged. The report adds a correction bullet under Verified and
  one under Changed, and its header `head:` moves to `1a576d63b`.
- `python3.13 tools/gate3.py --scope tests > <scratch>/gate-tests.log 2>&1`,
  log outside the worktree, no pipe, process exit 0. Log check from
  `AGENTS.md`, verbatim:

  ```text
  20:1239 passed, 16 skipped, 41 subtests passed in 22.19s
  23:==================== GATE PASS ====================
  ```

  No `SHA1` lines, as expected for `--scope tests`. No `SKIP`,
  `INFRASTRUCTURE` or `CLEAN-FAIL` line.
- `python3.13 -m unittest discover -s tests > <scratch>/ut.log 2>&1`: exit 0,
  `Ran 1255 tests in 11.070s`, `OK (skipped=16)`.
- `python3.13 -m ruff check .`: exit 0, `All checks passed!`
- `python3 tools/fw.py check`: exit 0, `0 error(s), 0 warning(s)`.
- Link check: the same script as the first review (all tracked `*.md`, code
  spans and fenced blocks stripped, relative targets resolved against the
  file's directory): 33 files, 37 relative links, **0 missing**. The first
  review counted 42 links and 5 missing; the difference is exactly the five
  links the Worker converted.
- `git status --short` after the tests: clean.

## Findings

- [BLOCKER, from `c9491ad4f`] Live `docs/state.md` links quoted in
  `worker.md` broke `tests/test_docs_links.py`. **Resolved at `e3b504a0e`:**
  the links are code spans, the test passes, the gate prints `GATE PASS` and
  my link check finds 0 missing.
- The three NOTEs in `c9491ad4f` (`tools/retrieval_eval.py` and
  `tools/family_hit_harness.py` dead default inputs, the plain-text path in
  `libs/nitro/README.md:35`, and `analyzer.yml`'s `main-baseline` job) are
  unchanged and still stand. None blocks the merge.
- No new findings.

## Not verified

- I did not rerun `--scope all` or rebuild any ROM at `e3b504a0e`. The only
  change since `1a576d63b` is a Markdown report under `docs/rounds/`, which is
  off the build path; the SHA-1 evidence is the first review's.
- `python3.13 -m pytest -q tests` was run only through the gate's tests scope,
  not separately.
- Everything listed under Not verified in `c9491ad4f` still applies: CI on
  GitHub, markdownlint, the Windows jobs, and re-deriving compiler quirks by
  compiling.

## Verdict

The blocker is fixed and nothing else moved. The only file changed since the
commit I first reviewed is the Worker's report, the correction does what it
says, and the tests, lint, framework check and link check are all clean at
`e3b504a0e`. Together with the first review's verdict on the substance, I find
`e3b504a0e` mergeable. The decision stays with Brain and the owner.
