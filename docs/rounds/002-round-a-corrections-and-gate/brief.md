# 002-round-a-corrections-and-gate: Finish round A: five corrections and the three-ROM gate

Tier: 2
Mode: implementation
Supersedes: 001-framework-3-retire-process. Its work was reviewed at
`40070bdc2057376d085e4bbe3907aa41e176300c` and is sound, but it cannot be
accepted: the three-ROM gate never ran (the Mac used had no Rosetta 2, so the
compiler could not start), and review found five text defects. This round
starts from that commit and finishes it. Nothing in round 001 is redone.

## Goal

When this round is done, the round-001 changes plus the five corrections below
have passed the three-ROM gate by its own log lines, on a machine where the
compiler actually runs.

## Context

**Read:** the framework's `FRAMEWORK.md` and your role card; this brief;
`AGENTS.md` and `docs/state.md` as they stand at the start commit. Round 001's
brief and reports in `docs/rounds/001-framework-3-retire-process/` are
background: read them only for the defects named below.

**Framework commands.** This branch already has `tools/fw.py`. Run either it
or a clone of the framework at `v3.0.0`, with `--cwd .` before the command
word if you use the clone. Use `python3.13` for this project's scripts on
macOS and `python` on Windows.

**Where to run the gate.** The compiler runs under Wine on macOS, and Wine
needs Rosetta 2, which the owner's Mac currently lacks. Run this round on the
owner's Windows 11 desktop, where the compiler runs natively, or on the Mac
only after the owner has installed Rosetta 2 (`arch -x86_64 /usr/bin/true`
exits 0). Installing system software is the owner's decision, not yours: if
neither machine can run the compiler, stop and report that. The checkout needs
`orig/baserom_eur.nds`, `orig/baserom_usa.nds` and `orig/baserom_jpn.nds`.
`tools/link_baseroms.py` only works for a linked worktree of a checkout that
has them; an independent clone needs the three files copied in (`configure.py`
checks their SHA-1).

**The gate's exit status is still untrusted** until round C: quote the log's
own lines, never an exit code alone.

**CI at the start commit** (draft pull request 1627, head `40070bdc2`): all
five required checks passed: `Python (ruff)`, `Markdown (markdownlint-cli2)`,
`drift-check`, `unittest`, `configure-windows`.

## Scope and non-goals

**In scope: five corrections.**

1. **`AGENTS.md`, the gate's log check.** The evidence table's `grep` command
   is inside a table cell, so its `|` characters are escaped as `\|`. Copied
   from the raw file, as agents do, it matches nothing, so on a failing gate it
   prints nothing. Put the command where it is copied verbatim (for example a
   fenced block under the table) and give the Windows form too
   (`Select-String` in PowerShell, or a Python one-liner that works on both).
2. **`AGENTS.md`, the `fw.py status` note.** It says the `archive/*` tags
   "exist only locally" and then that "they are on GitHub". They are on GitHub.
   Say only what is true.
3. **`docs/state.md`, the pilot baseline.** Under Historical anchors it says
   the pilot is measured against "the 0.2-point EUR natural-C gain made between
   19 August and 1 September". Recomputed with `tools/progress.py --version
   eur`, EUR natural-C was 16.79% (400,530 B) at `555c2aeac` (the last `main`
   commit of 19 August) and 17.38% (414,738 B) at `722d7b385` (1 September): a
   gain of 0.59 points (14,208 B) over those 13 days. Record the measured
   figures and the two commits, not 0.2. Recompute at least the 19 August
   figure yourself and quote it (a temporary worktree at `555c2aeac` works:
   `progress.py` needs no build).
4. **`docs/state.md`, "(was PR #1020)".** The framework's State rule forbids
   pull-request numbers there. Reword without the number.
5. **`docs/research/cluster-b-bundle-cap-raise.md`.** Round 001's link rewrite
   damaged text that was not a link: at line 171 `` `[0x021ceae4, 0x021cef74)` ``
   lost its opening `[`, and at line 232 an entry gained a stray leading `[`.
   Restore both. Then compare every one of round 001's link edits in
   `docs/research/` against the tag with a word diff, and fix any other change
   that is not link syntax.

**In scope: the gate** on the final commit (Required evidence 1).

**Not in scope.** Anything else from round 001's reports: `tools/link_baseroms.py`
(round B or C), the retired role names left in `docs/decomp-workflow.md` and
`.github/labeler.yml` (round B), and `docs/agents/framework.json`, which still
records the retired `.githooks/pre-push` as a seed file so the next framework
update would re-create it. That is framework issue 25, and `framework.json` is
not edited by hand outside `settings`. Add one line about it under Parked in
`docs/state.md` so the next update round deletes the hook again. No change
under `src/`, `libs/`, `include/`, `config/`, `assets/`, `orig/` or to
`*.sha1`, and no framework file edited.

## Invariants

- All three ROMs rebuild byte-identical (`AGENTS.md`, Invariants).
- Everything round 001 established still holds: `fw.py check` clean, the 273
  files it removed still absent from `main` and present at
  `archive/pre-redesign-2026-09-23`, and the required CI check names unchanged.
- `docs/state.md` stays within 1,000 words, with no live status and no full
  commit ids outside `## Historical anchors`.
- No personal paths or email addresses in `AGENTS.md`, `CLAUDE.md`,
  `docs/state.md`, `docs/agents/` or `docs/rounds/`, including your report.

## Acceptance criteria

1. The gate log shows `[eur] SHA1 PASS`, `[usa] SHA1 PASS`, `[jpn] SHA1 PASS`,
   a pytest summary with no failures and `GATE PASS`, with no `SKIP` standing
   in for a region, at the final content commit.
2. The log-check command in `AGENTS.md`, copied from the raw file, prints the
   `SHA1 FAIL` and `GATE FAIL` lines of a log made to contain them.
3. Corrections 2 to 5 are made, and correction 3's figures are recomputed by you.
4. `fw.py check`: 0 errors, 0 warnings. `unittest` and `ruff check .` clean.
5. The diff from `40070bdc2` touches only `AGENTS.md`, `docs/state.md`,
   `docs/research/` and this round's folder.

## Required evidence

1. The gate, written straight to a log outside the checkout, no pipe:
   `python3.13 tools/gate3.py --scope all > <log> 2>&1` (on Windows,
   `python tools\gate3.py --scope all > <log> 2>&1`), then the log check
   exactly as your corrected `AGENTS.md` gives it. Quote the lines, and say the
   machine (from `sw_vers` or `ver`), the commit and the region order.
2. For correction 1: the copied command run against a hand-made log holding
   `[eur] SHA1 FAIL` and `==================== GATE FAIL ====================`,
   with its output.
3. For correction 3: `python3.13 tools/progress.py --version eur` at
   `555c2aeac`, the `Natural-C` line.
4. For correction 5: the word diff of `docs/research/` between the tag and
   your final commit.
5. `git diff --stat 40070bdc2057376d085e4bbe3907aa41e176300c HEAD`.
6. `fw.py check`, `python3.13 -m unittest discover -s tests` (the `Ran` and `OK`
   lines) and `ruff check .`.
7. Every sentence added to or removed from `docs/state.md`, quoted.
