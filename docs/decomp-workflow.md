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

Current status (post brief 187 — start of the code-decomp
resumption wave):

| Metric | Value | Source |
|---|---|---|
| 3-region `ninja sha1` | **PASS** (EUR + USA + JPN) | brief 140, holding 22 rounds |
| `dsd check modules` | **27 / 27 OK × 3 regions** | post brief 140 / 141 |
| Matched data | 86.14 % | `tools/progress.py` |
| Matched code (objdiff-verified) | **1.40 %** | `build/eur/report.json` |
| Matched functions (objdiff-verified) | **14.78 %** (1,420 / 9,608) | `build/eur/report.json` |

The "matched code" figure is the headline. `tools/progress.py`'s
delinks-based approximation under-counts — the canonical metric is
the objdiff-verified `matched_code_percent` in
`build/eur/report.json`, unblocked by brief 187 Part 1's filter
(`tools/objdiff_filter_panic_units.py`). The "easy" tier sits at
~85 % matched and "medium" at ~80 %, but those are
function-count percentages — the bulk of the ROM lives in the
"hard" tier (~4 %) where each function takes more work. Live
stats live in [`docs/state.md`](state.md).

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
- **`ninja check` modules 27/27 × 3 regions.** This used to be
  24/27 (three placeholder-symbol failures in main / dtcm / ov004
  per `--allow-unknown-function-calls`). Brief 140 / 141 closed the
  gap; brief 140 hit 3-region `ninja sha1` PASS. The module check
  is now a quick smoke test rather than the headline gate.

The headline gate **is now `ninja sha1` PASS across all 3 regions**
(brief 140, holding through 22+ post-SHA1 rounds). Every PR must
preserve that floor — if any region drops from PASS → FAIL, the PR
doesn't merge. Brain re-verifies pre-merge.

The terminal goal stays "the SHA-1 of the rebuilt ROM matches the
baserom SHA-1 across EUR + USA + JPN". Everything else is a proxy.

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
- **Stop** → `.claude/hooks/save_agent_reply.py` captures the
  final assistant turn of every agent session and writes it to a
  shared inbox at `<repo-shared-git-dir>/agent-inbox/<role>-latest.md`
  (i.e. `.git/agent-inbox/` of the main clone). The brain reads
  these to see what the decomper / scaffolder said in sessions that
  didn't ship a PR — blocked-on-non-scope, research-only, aborted —
  without the human user shuttling text manually. Role is inferred
  from the worktree's basename (`brain` / `decomper` / `scaffolder`
  per project convention). Inbox lives inside `.git/` so it's never
  version-controlled, never needs a gitignore entry, and travels
  with no per-machine setup beyond what's already required
  (`python3` + `git`). Also appends to a rolling `<role>-log.md`
  so prior session replies aren't lost. Non-blocking by design:
  any error (no transcript, malformed event, disk full, etc.)
  exits silently with code 0.

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
- **"Failing modules?"**  Historically three of 27 modules
  (main, dtcm, ov004) didn't round-trip through `dsd check
  modules`. Brief 140 / 141 closed that gap — now 27 / 27 OK across
  all three regions, holding through 22+ post-SHA1 rounds. ov004's
  specific 0x400-byte BSS-layout shift (documented in
  [`docs/research/ov004-bss-shift.md`](research/ov004-bss-shift.md))
  was the W7 patcher chain's motivating case; briefs 134 → 180 →
  186 closed it.

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

## Code-decomp resumption — the post-scaffold playbook

The first 9 days post-SHA1 ran 39 briefs of infrastructure (patcher
chain through brief 186, cluster B/C/D residue cleanup, cross-
region apply tooling). With brief 182 closing the W7 patcher chain
at n=0, **the team's center of gravity moves back to code decomp**.
This section is the resumption playbook.

### Pick a candidate

Start from [`docs/research/code-decomp-resumption-queue.md`](research/code-decomp-resumption-queue.md)
— brief 187 Part 2's curated 52-pick list (12 Trivial, 25 Easy, 15
Medium-easy). Each row carries module / addr / size / call count /
shape hint.

For arbitrary picks beyond the curated queue, regenerate the full
worklist:

```bash
python tools/next_targets.py --version eur               # all unmatched, easiest-first
python tools/next_targets.py --version eur --tier easy   # easy tier only
python tools/next_targets.py --version eur --tier hard --size-max 0x60  # narrow query
```

### Routing decision flow — what to do BEFORE writing C

Before opening a decomp.me scratch on a candidate, check the asm
shape against [`docs/research/codegen-walls.md`](research/codegen-walls.md)'s
wall taxonomy. The decision tree:

1. **Disassemble** the target via `objdiff-cli` GUI or `./dsd dis
   build/eur/delinks/<unit>.o`. Look at the first ~10
   instructions + the trailing literal pool.

2. **Cross-check** the asm against each "Recognition cue" /
   "Use when" block in `codegen-walls.md`:
   - 3+ adjacent `ldr rN, [pc, #imm]` of nearby MMIO addresses
     + `ands rN, ...; bne` → **C-23 (MMIO base-folding)** →
     route through `*.legacy.c`.
   - 2 instructions materialising a constant pair where one
     derives from the other → **C-15 (flat-thunk arg setup)** →
     `*.legacy.c`.
   - Indirect-call dispatch with pool-dedup → **C-24** →
     `*.legacy_sp3.c`.
   - Adjacent `bic`/`orr` pairs on the same register at different
     bit positions → **C-22 (adjacent-bitfield)** → keep default
     SP, declare each window as a separate bitfield.
   - Default → **mwcc 2.0/sp1p5** (no routing suffix).

3. **Route by filename suffix:**
   - `src/<module>/<file>.c` → mwcc 2.0/sp1p5 (default).
   - `src/<module>/<file>.legacy.c` → mwcc 1.2/sp2p3 (Style A
     epilogue, C-15 / C-23 / C-26 routing).
   - `src/<module>/<file>.legacy_sp3.c` → mwcc 1.2/sp3 (C-24
     dispatch routing).

4. **When to file a wall research brief instead of attempting:**
   - Target's asm doesn't match any documented wall AND looks like
     it might be a structurally different shape (e.g. an unusual
     prologue or epilogue, an unknown peephole effect).
   - Brief 084's "3 walls not 1" methodology: if N candidates
     share what *looks* like a wall, confirm via codegen sweep
     before classifying. File a `cloud/<wall-N>-sweep` research
     brief; brief 088 (C-23 MMIO) is the template.

5. **When to mark known-wall-skip:**
   - Target hits a documented wall whose recipe doesn't apply
     (e.g. C-24 dispatch but the target's call site shape
     differs). Add a `// codegen-wall: C-N — not amenable to
     this recipe because…` comment in `src/` (matched mode) or
     skip + flag in your brief deliverable. Don't burn iterations
     on a wall whose recipe was already falsified.

### Run the match

Standard objdiff loop:

```bash
ninja                      # rebuild after editing src/
ninja objdiff              # regenerate per-unit diff database
ninja report               # aggregate report.json (post brief 187 filter)
```

`ninja report` now produces `build/eur/report.json` end-to-end —
brief 187 Part 1's filter drops the ~20 panic-causing units +
~1000 unmatched-routing-tier units before `objdiff-cli` runs. The
report is the canonical metric; track `matched_code_percent` and
`matched_functions` deltas across PRs.

For interactive diffing, the objdiff GUI works on the same
filtered units. The 20-ish dropped panic units are mostly
`_dsd_gap@main_181-202` TUs whose `.text` has no `STT_FUNC`
symbol — there's nothing to diff there interactively either.

### Stage a decomp.me scratch

For Easy / Medium-easy candidates, use the scratch flow:

```bash
# Emit the preprocessed context for paste-into-decomp.me.
ninja build/eur/path/to/file.ctx.c

# Or use the brief 098 wrapper that bundles asm + context + reloc
# info into a single LLM-ready prompt.
python tools/scratch_bundle.py --prompt --version eur \
    --module ov006 --addr 0x021d3dc8
```

The `--prompt` flag emits a structured prompt ready to paste into
an LLM (or decomp.me's AI suggestion box). The bundle includes:
- The extracted ARM asm at the target.
- The `.ctx.c` preprocessed context (headers, types, etc.).
- Caller / callee names from `find_callsites.py`.
- Known walls applicable to the target.

### Use the permuter on near-matches

If a match gets to 90 %+ but isn't byte-identical, stage a
decomp-permuter workspace:

```bash
python tools/permute.py --version eur --module ov006 \
    --addr 0x021d3dc8 --setup
# Run the permuter:
cd perm_work/<auto-name>/
./run.sh
```

The wrapper sets up the candidate source, the extracted asm, and
the permuter settings (`permuter_settings.toml`). The permuter
randomly mutates the C source (variable order, types, expression
forms) and tries to match the asm byte-identically.

### Track progress

After every match:

```bash
ninja                         # rebuild
ninja report                  # regenerate report.json
python tools/progress.py      # human-readable summary
```

Per-PR delta:

```bash
# Pre-merge regression check (see § "Catching match-depth
# regressions before merge" above).
cp build/eur/report.json /tmp/before.json
# ... apply PR ...
cp build/eur/report.json /tmp/after.json
python tools/ci_format_diff_reasons.py /tmp/before.json /tmp/after.json
```

### 3-region SHA1 PASS gate — non-negotiable

Every code-decomp PR must preserve `ninja sha1` PASS for all
three regions. This has been the floor since brief 140. Verify
locally:

```bash
python tools/configure.py eur && ninja sha1   # → "OK"
python tools/configure.py usa && ninja sha1   # → "OK"
python tools/configure.py jpn && ninja sha1   # → "OK"
```

Brain re-runs all three pre-merge regardless. Don't push a PR
that fails any region — fix locally first.

### Data-cluster tooling (mostly hands-off for code decomp)

The infrastructure phase shipped a substantial data-cluster
toolkit. Code decomp rarely needs these directly, but they show up
in cross-references. Quick map:

| Tool | Purpose | Brief |
|---|---|---|
| `tools/cluster_b_bundle_gen.py` | Cluster B bundle-extent heuristic | 174 / 185 |
| `tools/cluster_b_bundle.py` | Bundle `.s` emitter w/ aliases | 161 / 185 (bytewise) |
| `tools/cluster_c_pattern3_gen.py` | `.rodata`/`.data` Pattern 3 generator | 125 / 144 / 166 |
| `tools/cross_region_chunk_extent.py` | Multi-symbol extent adjuster | 177 |
| `tools/cross_region_cluster_apply.py` | Cross-region cluster apply orchestrator | 170 / 184 |
| `tools/objdiff_filter_panic_units.py` | objdiff.json filter (brief 187 Part 1) | 187 |

The cluster apply tool has subcommands per cluster: `b-scalars`,
`b-pointers`, `c-strings`, `d1-tables`, `d2-tables`. Code-decomp
PRs shouldn't touch these — they're decomper's data lane (or
scaffolder's tooling-extension lane). If a code-decomp candidate
depends on an unclaimed data symbol, file a data-cluster brief
rather than shipping the data inline.

### After a PR lands

Brain updates `docs/state.md` § *Today's merges* with the
shipped match count + delta. The `cascades-diff.yml` CI workflow
auto-comments per-rename cascade impact. If your match opened up
sibling candidates (renaming X promoted N hard-tier siblings to
medium-tier), the workflow surfaces that.

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
