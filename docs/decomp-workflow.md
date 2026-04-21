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

Current status: ~0.09% of the code matched. ~99.9% to go. This is
normal for a fresh decomp — the early sinit/stub waves clear the
trivial shapes, then momentum builds as the tooling and conventions
settle.

## The cast

Three AI agents, one human. Each has a narrow job.

| Agent | Where it lives | What it does |
|---|---|---|
| **cntrl_alt_lenny** | meatspace | You. Sets priorities, picks direction, merges PRs. |
| **claude-brain** | local Claude Code, PC or Mac | Reviews and merges PRs. Runs `ninja` / `dsd` locally to verify each PR doesn't break the build. Writes task briefs. Keeps `AGENTS.md` / `docs/state.md` current. |
| **claude-pc** | local Claude Code (decomper session) | The actual decomper. Matches individual functions. Writes C source in `src/`. Renames symbols. |
| **claude-cloud** | Claude Code on the web | Scaffolder and reviewer. Writes tools (`tools/`), library headers (`libs/`), docs. Can't run the build, so delegates verification to brain. That's me. |

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
   `delinks.txt` changes. Push to a `claude-pc/*` branch. Open a PR.

10. **Review + merge**. Brain reviews, runs `./dsd check modules` to
    confirm no module regressed, and merges.

Now repeat ~5,000 times. That's the project.

## Tools and when to reach for each

Every script in `tools/` exists to shorten some step of that loop.

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

### CI glue (you won't touch these directly, but they exist)

- `tools/ci_format_diff.py` — renders the analyzer diff as Markdown
  for the PR comment bot.
- `tools/configure.py` — generates `build.ninja` for the build.
- `tools/download_tool.py` — fetches mwccarm, dsd, objdiff on first
  use.

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

## What a PR means in this setup

A pull request is just a git branch with a note attached. The flow is:

1. An agent writes code on a branch named like `claude-cloud/foo` or
   `claude-pc/bar`. The `<agent>/<slug>` shape is a convention so
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

- **"The badge says 0%. Is nothing happening?"**  No — the badge is
  code-byte-accurate; 60+ functions are matched (sinit wave), but they
  total 2KB out of 2.3MB. Progress is real, it's just early.
- **"Why does the decomper iterate 20 times on one function?"**  mwcc
  (the CodeWarrior compiler) has specific quirks — local variable
  order, struct layout, register allocation patterns. Matching means
  convincing mwcc to emit the exact same assembly. Small C changes
  (one `int` → `short`) can flip the output entirely.
- **"Why can't cloud just run the build?"**  Cloud sessions are
  stateless web instances with no baserom and no toolchain. That's by
  design — it keeps tool-building (cloud) parallel to matching (pc)
  without either waiting on the other.
- **"sinit outliers?"**  The brief-003 template matched 44 of 48
  `__sinit_*` functions perfectly. Four have slightly different shapes
  (size 0x04 vs 0x2c, or 0x3c) and need small template variants.
  These are the "deferred outliers" — still matchable, just not by
  the exact same paste job.
- **"Failing modules?"**  Three of 27 modules (main, dtcm, ov004)
  don't round-trip through `dsd check modules` yet. That's a
  structural issue with placeholder symbols injected by
  `--allow-unknown-function-calls` during `dsd init`. Fixable but
  hasn't been prioritized.

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
