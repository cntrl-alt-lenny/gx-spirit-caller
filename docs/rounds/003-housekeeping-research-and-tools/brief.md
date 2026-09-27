# 003-housekeeping-research-and-tools: Round B: archive the research corpus, cut `tools/` to what is used

Tier: 2
Mode: implementation
Supersedes: none

Round B of the owner's redesign (see `docs/state.md`). Round A (rounds 001 and
002) is merged.

## Goal

When this round is done:

1. `docs/research/` (about 44 MB) is gone from `main`, and one short
   compiler-quirks reference distilled from it takes its place.
2. The attempts ledger, which lives inside `docs/research/` today, has a
   permanent home outside it, and everything that reads or writes it follows.
3. `tools/` holds only what the build, the gate, the matching loop, CI and the
   ledger actually use, with their tests. Everything else is gone.
4. CI jobs whose only effect is a pull-request comment or label are gone.
5. Every removed file is retrievable from `archive/pre-redesign-2026-09-23`,
   all three ROMs still rebuild byte-identical, and no required check changes.

## Context

**Read:** `AGENTS.md`, `docs/state.md`, `BUILD.md`, this brief, the workflows
in `.github/workflows/`, and each tool as you judge it. For the quirks
reference, start from `docs/research/README.md` (it is 85,000 words: use it as
an index, not a read), `codegen-walls.md`, `style-a-epilogue.md`,
`sp3-routing-decision.md`, `thumb-align-wall.md`,
`ov004-thunk-section-fix.md`, `objdiff-fuzzy-vs-complete-metric.md` and
`docs/research/reshape-recipes/`, and follow what they cite.

**Do not read** the rest of the corpus end to end. Round A's reports in
`docs/rounds/001-*/` and `002-*/` are background only.

**Framework commands:** `python3 tools/fw.py <command>`. Use `python3.13` for
this project's scripts and tests. This Mac has Rosetta 2, so the compiler runs
under Wine.

**The archive tag** `archive/pre-redesign-2026-09-23` points at `main` before
the redesign (`5ad1a7a2a9733b191d5c838a36593d429bd7a841`). Everything this
round removes existed there, except the 11 research files round A edited (only
their links changed) and anything added since; the merged history keeps those
too.

**What counts as "used"** (the owner's words: "what the build, gate, matching
loop and CI actually use"):

- **Build:** every file named in the three generated `build.ninja` files
  (`python3.13 tools/configure.py <region>`), and what those files import.
- **Gate:** `tools/gate3.py` and everything it runs or imports.
- **Matching loop:** `tools/cmatch_loop.py` and everything it imports or runs,
  transitively. Round E turns it into the factory; anything it needs later can
  come back from the tag.
- **CI:** every script a kept workflow step runs, including the progress-badge
  workflow, whose images `README.md` loads from the `progress-visuals` branch.
- **The ledger:** the tools that write or validate the attempts ledger (today
  `tools/validate_attempts.py`, `tools/park_one.py`, `tools/record_shipped.py`;
  confirm).
- **Named in `AGENTS.md` or `BUILD.md` as a step agents or the owner run**
  (for example `rename_symbol.py`, `link_baseroms.py`, `port_to_region.py`,
  `check_delink_dupes.py`, `check_match_invariants.py`,
  `check_ci_contract.py`, `download_tool.py`). A tool kept only for this
  reason must be a real step, not a mention; if it is not, remove it and the
  mention together.
- Data files and folders in `tools/` (`corpus/`, `signatures/`, the `.json`
  and `.tsv` files) stay only if a kept tool reads them.

Anything else goes, however useful it once was. When a call is close, say so in
the tools table and keep it; Brain decides.

## Scope and non-goals

**In scope.**

1. **The ledger.** Move `docs/research/campaign-analytics/attempts.tsv` and its
   schema `attempts-schema.md` to `docs/ledger/`, and update every tool, test,
   workflow and document that names the old path.
2. **The compiler-quirks reference:** `docs/compiler-quirks.md`, at most 1,500
   words. Each quirk: what you see (the symptom in objdiff or the build), what
   causes it, what to do, which compiler tier it concerns if any, and the
   source path at the tag for the detail. Keep only quirks that still apply to
   matching this game; say in the report which candidates you left out and why.
   Link it from `AGENTS.md` and `BUILD.md`.
3. **Remove `docs/research/`** whole, and the research index generator and its
   check.
4. **Cut `tools/`** to the "used" set above, with the tests whose only subject
   is a removed tool. `tools/__pycache__/` is not tracked; ignore it.
5. **Documents that describe the old way of working:** `docs/decomp-workflow.md`
   (3,700 words, still written around the retired lanes and many removed
   tools) is removed; move into `BUILD.md` only what is still true and needed
   to match a function by hand, briefly. `docs/tools-index.md` and its
   generator are removed (a short tools list in `BUILD.md` replaces it if you
   judge one useful). `docs/machine-setup.md` and `docs/setup/` stay if still
   accurate, trimmed if not. `.claude/commands/{cascade,scratch,suggest}.md`
   stay only if their tools stay.
6. **CI.** Remove every job whose only effect is a pull-request comment or a
   label: judge `analyzer.yml`, `cascades-diff.yml`, `mega-cascades-diff.yml`,
   `pattern-clusters-diff.yml`, `worklist-diff.yml`, `labeler.yml` (with
   `.github/labeler.yml`, which still names retired roles) and
   `match-invariants.yml` (it also fails on errors; if you keep it, drop its
   comment step), plus `.github/scripts/` if nothing uses it afterwards. The
   `drift-check` job keeps its name and trigger; after this round it runs the
   ledger validator and `python tools/fw.py check`.
7. **Links and references.** No kept Markdown file links to a removed path.
   `AGENTS.md` "Where to look" and `docs/state.md` Pointers are updated.
   Comments inside kept code that cite `docs/research/` may stay; do not edit a
   build tool only to change a comment.

**Not in scope.** Round C (the gate's exit status, the reference check, the
fake-match lint, agent settings), round D (merging `src/usa/` and `src/jpn/`),
round E (the factory; do not change what `cmatch_loop.py` does). No change
under `src/`, `libs/`, `include/`, `config/`, `assets/`, `orig/` or to
`*.sha1`; no change to any file the build reads; no framework file edited; no
GitHub settings, branch or tag changes; nothing on `progress-visuals`.

## Invariants

- All three ROMs rebuild byte-identical (`AGENTS.md`, Invariants).
- The five required checks keep their names and run on every pull request
  (`.github/required-checks.txt`; changing the ruleset is the owner's).
- Every file removed from `main` is retrievable from the archive tag or from
  `main`'s history, and the report says which.
- The attempts ledger's rows are unchanged by the move (owner decision 2: the
  ledger is part of the project's real state).
- `fw.py check` clean; `docs/state.md` within 1,000 words, no live status.
- No personal paths or email addresses in `AGENTS.md`, `CLAUDE.md`,
  `docs/state.md`, `docs/agents/` or `docs/rounds/`, including your report.

## Acceptance criteria

1. `docs/research/` is absent; `docs/compiler-quirks.md` exists, is at most
   1,500 words, and every quirk in it cites its source at the tag.
2. The ledger is at `docs/ledger/attempts.tsv`, byte-identical to the old file,
   and `validate_attempts.py` checks it there, in CI too.
3. Every file in `tools/` at the start commit is accounted for in the tools
   table, and every kept one names its user with evidence.
4. The generated `build.ninja` for each region is byte-identical before and
   after (paths normalised), and the three-ROM gate passes by its log lines.
5. `cmatch_loop.py` still imports and runs: its tests pass and
   `python3.13 tools/cmatch_loop.py --help` exits 0.
6. `unittest`, `pytest` and `ruff check .` are clean, and no test of a kept
   tool was deleted or weakened.
7. The comment-only and label-only CI jobs are gone; `check_ci_contract.py`
   passes; no kept Markdown file links to a missing path.
8. No change under the paths listed in "Not in scope".

## Required evidence

1. **The tools table (required; without it the round is sent back).** One row
   per file or folder in `tools/` at the start commit: name; **kept** with its
   user (build, gate, matching loop, CI workflow and step, ledger, or the
   `AGENTS.md`/`BUILD.md` step) and how you established it (the `build.ninja`
   line, the import, the workflow line); or **removed**, with the reason and
   whether it is at the tag. Mark close calls.
2. **Test accounting:** the pytest ids collected at the start commit and at
   the end, the removed ones grouped by file, each file's subject, and the
   added ones.
3. **The gate**, written to a log outside the checkout with no pipe:
   `python3.13 tools/gate3.py --scope all > <log> 2>&1`, then the log check
   from `AGENTS.md`, copied verbatim. Quote the lines and name the commit.
4. **The build graph:** `configure.py <region>` at the start commit and at the
   end for all three regions, and a byte comparison of the `build.ninja` files
   with the checkout root replaced.
5. `python3.13 -m unittest discover -s tests` (`Ran` and `OK` lines),
   `python3.13 -m pytest -q tests` (summary), `ruff check .`,
   `python3.13 tools/check_ci_contract.py`, `python3 tools/fw.py check`,
   `python3.13 tools/validate_attempts.py`, and
   `python3.13 tools/cmatch_loop.py --help`.
6. **Archive completeness:** every file deleted since the start commit, checked
   with `git cat-file -e archive/pre-redesign-2026-09-23:<path>`; list any not
   at the tag and where it is kept instead.
7. `cmp` of the old and new ledger files (from `git show`), and
   `wc -w docs/compiler-quirks.md AGENTS.md docs/state.md`.
8. A link check over every kept Markdown file, with its output.
9. For the quirks reference: the list of candidates considered and left out,
   one line each.
10. Every sentence added to or removed from `docs/state.md`, quoted.
