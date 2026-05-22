# Decomp workflow — plain-language guide

A walking tour of how this project actually gets built, aimed at anyone
who is new to decompilation or to "vibe coding" with AI agents. For the
full technical spec see `CLAUDE.md`; for agent coordination see
`AGENTS.md`; for what's in flight right now see `docs/state.md`.

## What we're trying to do

Rebuild *Yu-Gi-Oh! GX Spirit Caller* for Nintendo DS from C source
code, byte-for-byte identical to the original ROM.

That phrase — "byte-for-byte identical" — is the whole game. If the
rebuilt ROM's SHA-1 matches the original dump, every function has been
perfectly reconstructed. If a single byte differs, the SHA-1 is totally
different. There's no "almost matching".

So the project is a long series of small wins: match one function,
commit, match the next, commit, until the whole ROM is in C source and
the hashes line up.

Current status: ~1.3% of the code matched (per the README badge,
which tracks byte-accurate progress). ~98.7% to go. The "easy" tier
sits at ~84% matched, the "medium" tier at ~80%, but those are
function-count percentages — the bulk of the ROM lives in the
"hard" tier (~2%) where each function takes more work. This is
normal for a fresh decomp — the early sinit/stub waves clear the
trivial shapes, then momentum builds as the tooling and conventions
settle. Live stats live in [`docs/state.md`](state.md).

## The cast

Three AI agents, one human. Each has a narrow job.

| Agent | Where it lives | What it does |
|---|---|---|
| **cntrl_alt_lenny** | meatspace | You. Sets priorities, picks direction, merges PRs. |
| **brain** | local LLM session (Claude Code or Codex CLI), PC or Mac | Reviews and merges PRs. Runs `ninja` / `dsd` locally to verify each PR doesn't break the build. Writes task briefs. Keeps `AGENTS.md` / `docs/state.md` current. |
| **decomper** | local LLM session (separate from brain) | The actual decomper. Matches individual functions. Writes C source in `src/`. Renames symbols. |
| **scaffolder** | LLM session without local toolchain (Claude web, Codex web) | Scaffolder and reviewer. Writes tools (`tools/`), library headers (`libs/`), docs. Can't run the build, so delegates verification to brain. (Formerly `scaffolder`; renamed for role clarity.) |

Why the split? Matching a function is a focused, iterative task (one
person on one function at a time). Tool-building is parallel work that
doesn't need the baserom. Reviewing PRs needs a local build to verify.
Separating those three roles keeps everyone unblocked.

## The matching loop

This is the core of the project. Skipping ahead: if you can picture one
function being matched end to end, you understand the whole flow.

Say the decomper picks `__sinit_ov005_021b16e4`. Here's what happens:

1. **Pick**. They consult `tools/next_targets.py` for the current
   worklist — unmatched functions sorted easiest-first. Or they're
   following a brief (`docs/briefs/NNN-*.md`) that already picked the
   target.

2. **Context**. They look at callers, callees, and data refs with
   `tools/find_callsites.py` — so they know what role the function
   plays in the larger picture.

3. **Draft C**. They write `src/overlay005/sinit_ov005_021b16e4.c`
   with their best guess at the original source.

4. **Build**. `ninja` runs the CodeWarrior compiler + linker and
   rebuilds the ROM.

5. **Diff**. `ninja objdiff && ninja report` runs the byte-level
   comparison. The objdiff TUI shows instruction-by-instruction where
   the rebuild differs from the baserom.

6. **Iterate**. If there's a diff, the decomper tweaks the C (maybe
   change `int` to `unsigned short`, reorder a loop, move a local
   variable declaration) and re-runs. Most matches take 2-20 rounds.

7. **Mark complete**. Once objdiff says 100%, the decomper edits
   `config/eur/arm9/overlays/ov005/delinks.txt` to add `complete`
   under that TU's header. That flips the "matched" flag used by
   `progress.py` and the README badge.

8. **Rename**. `tools/rename_symbol.py` swaps the dsd-generated
   placeholder name (`func_021b16e4`) for the real name
   (`__sinit_ov005_021b16e4`).

9. **Commit + PR**. Commit the new `.c` file, the `symbols.txt` and
   `delinks.txt` changes. Push to a `decomper/*` branch. Open a PR.

10. **Review + merge**. Brain reviews, runs `./dsd check modules` to
    confirm no module regressed, and merges.

Now repeat ~5,000 times. That's the project.

## Tools and when to reach for each

Every script in `tools/` exists to shorten some step of that loop.
This section is a narrative walkthrough. For the **exhaustive**
per-tool catalogue (auto-generated from each tool's module
docstring), see
[`docs/tools-index.md`](tools-index.md).

### Picking what to match

- **`tools/next_targets.py`** — "what should I decomp next?"  Filters
  `analyze_symbols`'s tier ranking against already-matched functions,
  outputs a worklist. Slice with `--tier easy --module ov006` for
  narrow questions.
- **`tools/find_duplicates.py`** — "what bulk-template match would
  unlock many functions at once?"  Clusters functions by call-graph
  shape. One template match → ~10-50 siblings fall like dominoes.
- **`tools/analyze_symbols.py`** — the underlying tier classifier.
  Emits `build/<ver>/analysis/targets.md` with every function assigned
  to `trivial` / `easy` / `sinit` / `named` / `medium` / `hard` based
  on size and call shape.

### Gathering context

- **`tools/find_callsites.py`** — "what touches this symbol?"  Dumps
  callers, callees, and data loads for any function. The "who calls
  this" list often tells you what the function *is* before you read a
  single byte of assembly.
- **`tools/overlay_coupling.py`** — "which overlays talk to each
  other?"  Shows cross-overlay call + load graphs. Useful for picking
  which overlay to attack next based on how isolated it is.
- **`tools/data_symbol_sizes.py`** — "is this data 4 bytes or 0x400?"
  Infers sizes for `data_*` symbols that dsd couldn't measure.

### Writing C

- **`tools/rename_symbol.py`** — rename a `func_*` / `data_*`
  placeholder to a real name everywhere it's referenced.
- **Scratches** — `ninja build/usa/path/to/file.ctx.c` emits a
  preprocessed context suitable for pasting into decomp.me alongside
  the extracted assembly.

### Tracking progress

- **`tools/progress.py`** — "how far along are we?"  Reads
  `report.json` (if built) or falls back to `delinks.txt` `complete`
  markers. Outputs code / data byte percentages.
- **`tools/generate_heatmap.py`** — renders the SVG treemap on the
  README. Each rectangle is one translation unit, colored by match %.
- **`tools/analyze_symbols.py --diff-json`** — computes the tier delta
  between two snapshots. Used by CI to post a "this PR changes N
  tier-whatever counts" comment on every pull request.
- **`tools/data_worklist.py`** — "which data symbols are highest-
  leverage to name first?"  Ranks unmatched `data_*` entries by
  cross-module reader density. Good companion to
  `nitro_suggest_renames.py` on the data side.
- **`tools/diff_reasons.py`** — classifies every function in a
  `report.json` snapshot into a fuzzy-match bucket (`matched` /
  `close` / `medium` / `low` / `fail`). Single-snapshot view.
- **`tools/ci_format_diff_reasons.py`** — the two-snapshot delta.
  Consumes two `report.json` files and flags regressions /
  improvements / new / dropped functions. See "Catching match-depth
  regressions before merge" below for the local workflow.

### CI glue (you won't touch these directly, but they exist)

- `tools/ci_format_diff.py` — renders the analyzer diff as Markdown
  for the PR comment bot.
- `tools/ci_format_worklist_diff.py` — delinks-level delta
  (complete-yes/no transitions).
- `tools/ci_format_invariants.py` — metadata-hygiene renderer.
- `tools/configure.py` — generates `build.ninja` for the build.
- `tools/download_tool.py` — fetches mwccarm, dsd, objdiff on first
  use.

## The rename-cascade pipeline

A mature workflow for the "rename a wave of siblings at once" case,
used for briefs 014/015/016+. Validated by PR #165 (4 renames → 85
tier promotions). Four tools compose into a scout → decide → apply
→ verify flow:

### 1. Pick a high-leverage anchor

```bash
python tools/find_cascades.py --version eur --top 20
```

Ranks placeholder functions by how many `hard → medium` tier
promotions their rename would trigger. The top-1 is usually the
single highest-leverage match in the project right now. Pair with
a look at `next_targets.py --tier hard` to confirm the anchor is
tractable at all.

### 2. Scout the anchor's siblings

Match the anchor (manual matching loop above). Once it's named,
the sibling cluster becomes surveyable:

```bash
python tools/bulk_rename_candidates.py --version eur <module> <addr>
```

Scores sibling placeholders via caller-set Jaccard + size
similarity + address adjacency. Top-N candidates form the rename
wave. Example output lives at
`docs/research/cascade-3-scouting.md` (PR #175).

### 3. Decide names + write a decisions file

For each sibling the decomper picks a canonical NitroSDK-style
name (grep [NitroSDK](https://github.com/ntrtwl/NitroSDK) for
matching shapes, use `tools/nitro_suggest_renames.py` for
candidates). Write a JSON decisions file:

```json
{
  "brief": "016",
  "anchor": "Task_InvokeLocked",
  "source_scouting": "docs/research/cascade-3-scouting.md",
  "renames": [
    {
      "module": "main",
      "addr": "0x020067fc",
      "old": "func_020067fc",
      "new": "Task_Post",
      "rationale": "0.25 jaccard / 36 shared callers / size 0x74"
    }
  ]
}
```

### 4. Apply atomically

```bash
# Dry-run first.
python tools/cascade_apply.py cascades/brief-016.json

# Confirms every rename validates (new-name not taken, old-name
# resolves, no batch-internal collisions). If ANY fails, NOTHING
# writes. Prints a commit-message + PR-body template.

# Apply.
python tools/cascade_apply.py cascades/brief-016.json --confirm
```

The emitted template has a test-plan section with checkboxes for:

- `dsd check modules` — module checksum baseline preserved
- `check_match_invariants --version eur` — 0 errors (clean
  cross-file drift; see PR #185)
- `find_cascades --version eur` — measure downstream tier
  promotions from the wave
- `ninja rom` clean

Paste into `git commit -m "$(...)"` directly.

### 5. Quantify the cascade

After merge, the `cascades-diff.yml` CI workflow (PR #144) auto-
comments on the PR with a per-rename cascade impact breakdown. The
post-merge comparison tells you how many `hard → medium` promotions
the wave actually produced — validates the model against the
scouting prediction.

### Tool summary

| Step | Tool | PR |
|---|---|---|
| Anchor pick | `tools/find_cascades.py` | #132 |
| Sibling scout | `tools/bulk_rename_candidates.py` | #153 |
| Batch apply | `tools/cascade_apply.py` | #190 |
| Drift gate | `tools/check_match_invariants.py` | #185 |
| CI cascade comment | `.github/workflows/cascades-diff.yml` | #144 |

For a worked example, see `docs/research/cascade-3-scouting.md`
and the `brief-016-*.md` brief that applies it.

## Catching match-depth regressions before merge

`ninja report` requires a baserom, which CI doesn't have. So the
match-depth regression check runs **locally, pre-merge, by brain**
instead of in a GitHub Actions workflow. This is "Path A" of the
three options documented in #109's PR body — the minimum-viable
regression-alarm loop until the baserom-in-CI problem gets solved
(if ever).

The full check takes ~2 minutes on a warm build:

```bash
# 1. Snapshot main's match state.
git checkout main
ninja report
cp build/eur/report.json /tmp/before.json

# 2. Check out the PR and rebuild.
gh pr checkout <NNN>                       # or: git fetch + checkout
ninja                                      # picks up any config/src changes
ninja report
cp build/eur/report.json /tmp/after.json

# 3. Render the delta.
python tools/ci_format_diff_reasons.py \
    /tmp/before.json /tmp/after.json > /tmp/delta.md
```

Open `/tmp/delta.md` in the editor. The renderer surfaces:

- **🛑 Regressions** — functions that moved to a worse bucket. Alarm
  list. If empty, the PR doesn't break any existing match.
- **✅ Improvements** — functions that moved to a better bucket.
- **🆕 New entries** — functions in `after` but not `before` (usually
  a new TU carve).
- **🗑️ Dropped entries** — in `before` but not `after`. Flagged with
  a footgun warning because the common cause is a rename that broke
  every sibling.
- **Bucket-count delta** — per-bucket before/after/Δ table.

If there's a regression, paste the rendered Markdown into a PR
review comment and hand it back to the author. Agents (scaffolder /
decomper) consume review bodies as first-class feedback, so the
paste-into-review flow closes the loop without any CI infrastructure.

**Tip:** the smoke output in the #109 PR body shows exactly what a
regression report looks like against a synthetic fixture. Read that
once to calibrate before running against a real PR.

**When to skip the check:** brain-only PRs (docs, state.md refreshes,
`docs/briefs/*`) don't touch `config/` or `src/`, so they can't move
the match state. Only run the delta on PRs touching code or config.

## Reading the progress numbers

The badge on the README currently says something like `0.03%-red`.
That number can be misleading if you're new:

- **Code vs data.** Two separate percentages. `code` is the `.text` /
  `.init` sections — the actual instructions. `data` is `.rodata` /
  `.data` / `.bss` — tables, strings, globals. Early decomp is almost
  all code; data gets carved later.
- **Bytes, not function count.** Matching 60 functions averaging 0x30
  bytes each is ~1.8KB, a tiny fraction of the 2.3MB code section.
  The byte percentage is the honest headline.
- **"Units" is carved TUs, not functions.** `progress.py` might show
  `units: 60 / 60 (100%)` — that's "60 of the 60 carved translation
  units are complete". Most of the ROM isn't carved into TUs yet, so
  60/60 is technically correct but doesn't mean the whole ROM is
  matched. The byte percentage is the honest number.
- **`ninja check` modules 24/27.** This is a separate metric. `dsd`
  verifies each module round-trips byte-identically through its
  analysis pipeline (not the actual ROM match). Three modules fail
  for structural reasons (placeholder symbols from `--allow-unknown-
  function-calls`, see `CLAUDE.md`). Fixing those is a separate kind
  of work.

The goal is "the SHA-1 of the rebuilt ROM matches the baserom SHA-1".
Everything else is a proxy.

## Local setup extras (optional but recommended)

One-time hook installation that catches metadata-drift errors
before they reach CI:

```bash
python tools/install_git_hooks.py
```

This sets `core.hooksPath=.githooks` so every `git push` runs
`tools/check_match_invariants.py` and blocks if errors are found.
Warnings (currently ~317 pre-existing `complete_tu_rename` backlog)
are let through. Bypass a single push with `git push --no-verify`;
uninstall with `python tools/install_git_hooks.py --uninstall`.

Caught #135's `.c`-listed-but-`.s`-on-disk delinks mismatch in
testing before CI would have flagged it — same shape of bug that
costs a PR round-trip each time it happens.

### Claude Code hooks (if you run Claude Code)

`.claude/settings.json` wires two hooks that fire inside the agent
loop (earlier than the git-level `.githooks/pre-push`):

- **PostToolUse on Edit / Write / MultiEdit** →
  `.claude/hooks/post_edit.py` runs `ruff check` on any edited
  `tools/*.py` or `tests/*.py` file, then `python -m unittest
  discover -s tests` if ruff was clean. Non-blocking — surfaces
  issues in tool output so the agent can fix before committing.
  Addresses the "F401 unused import found at commit time" class
  of friction seen across multiple scaffolder sessions.
- **PreToolUse on Bash** → `.claude/hooks/pre_bash.py` inspects
  the Bash command for `git push`; if it matches, runs
  `check_match_invariants.py --version eur` and BLOCKS (exit 2)
  on errors. Bypass with `SKIP_INVARIANTS_HOOK=1 git push ...`
  or `git push --no-verify`. Same backstop as `.githooks/pre-push`
  but catches the drift earlier in the agent turn.

These hooks are opt-in per Claude Code session — they only fire
when Claude Code reads `.claude/settings.json`. Raw `git` from a
terminal uses `.githooks/pre-push` (the installer above); Claude
Code uses both paths and checks complementarily.

## What a PR means in this setup

A pull request is just a git branch with a note attached. The flow is:

1. An agent writes code on a branch named like `scaffolder/foo` or
   `decomper/bar`. The `<agent>/<slug>` shape is a convention so
   everyone can see at a glance who made it.
2. The agent pushes the branch and opens a PR via the GitHub API. This
   doesn't change `main`; it just says "here's a proposed change".
3. Brain reviews it: reads the diff, runs `ninja` / `dsd check modules`
   locally to verify it doesn't break the build, summarizes in plain
   English, and either merges or asks questions.
4. You (cntrl_alt_lenny) get a summary from brain and the final say on
   controversial ones.

**No agent merges their own PRs.** That's the safety boundary. Every
change passes through brain's local verification before landing on
`main`.

## Common gotchas for a new vibe coder

- **"The badge says ~1% but easy tier is 84% matched. Which is right?"**
  Both — they measure different things. The badge tracks **code
  bytes** matched out of total code bytes; that's the honest "are we
  done?" headline. The tier percentages track **function count** in
  each difficulty bucket. Easy-tier functions are small, so matching
  900+ of them still only shifts the byte percentage by a couple of
  points. The big move comes from cracking hard-tier work where
  individual functions are larger and there are 8000+ of them.
- **"Why does the decomper iterate 20 times on one function?"**  mwcc
  (the CodeWarrior compiler) has specific quirks — local variable
  order, struct layout, register allocation patterns. Matching means
  convincing mwcc to emit the exact same assembly. Small C changes
  (one `int` → `short`) can flip the output entirely.
  [`docs/research/codegen-walls.md`](research/codegen-walls.md)
  catalogues the 27-and-counting recurring divergences with worked
  C source for each.
- **"Why can't scaffolder just run the build?"**  Scaffolder as a
  *role* is designed to be runnable in a stateless web session
  without toolchain access; that's what keeps tool-building
  parallel to matching. A particular scaffolder session may happen
  to have the toolchain installed (e.g. on the same machine as
  brain) but the role's *outputs* — tools, headers, docs — are
  valid to ship without verifying the rebuilt ROM. Brain is the
  always-local role that runs the build to verify PRs before merge.
- **"sinit outliers?"**  All 51 `__sinit_*` functions are now matched
  (sinit tier sits at 100%). Brief 003's bulk-template wave + brief
  009's one-off `__sinit_ov002_022ca7e8` (asm-void escape for mwcc's
  RHS-first ordering) covered the full set.
- **"Failing modules?"**  Three of 27 modules (main, dtcm, ov004)
  don't round-trip through `dsd check modules` yet. That's a
  structural issue with placeholder symbols injected by
  `--allow-unknown-function-calls` during `dsd init`.
  [`docs/research/ov004-bss-shift.md`](research/ov004-bss-shift.md)
  documents one specific symptom (a 0x400-byte BSS-layout shift on
  ov004 caused by the same root cause). Fixable, deferred until it
  becomes a bottleneck.

## Where to dig deeper

- **`CLAUDE.md`** — complete technical spec: toolchain versions,
  directory conventions, bootstrap commands, the whole matching
  protocol. Read this when you want precise answers.
- **`AGENTS.md`** — full agent coordination manifest: who owns which
  paths, how to add/retire agents, autonomous-work policy.
- **`docs/state.md`** — the churn log. What shipped recently, what's
  in flight, what's next. Updated at the end of every session.
- **`docs/briefs/`** — task briefs. Each file describes one scoped
  piece of work, who's doing it, what success looks like. The
  decomper follows these; reading them is a good way to see what
  "one unit of work" actually looks like.
- **Reference projects** — `CLAUDE.md` lists two similar decomps
  (dqix, SonicRushAdventure-Decomp) that inspired this project's
  layout.

## TL;DR for a new vibe coder

- The point is to rebuild a ROM from C source, byte-identical.
- Matching happens one function at a time, usually with 2-20
  iterations each.
- Three agents split roles so they don't clobber each other; brain
  is the only one that merges.
- The tools in `tools/` each shorten one step of the loop — start
  with `tools/next_targets.py` to see the worklist and
  `tools/find_callsites.py` to understand a specific function's
  context.
- The progress badge is the honest headline; don't read too much
  into "units 100%" or "24/27 modules OK".
