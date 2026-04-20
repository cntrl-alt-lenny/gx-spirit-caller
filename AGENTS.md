# AGENTS.md — who's working on what

Coordination manifest for every AI agent contributing to this decomp
(Claude, Codex, future ones). **Every agent reads this before starting
work** and updates it when their scope changes.

For humans: this is a plain-English map of which agent owns which parts
of the repo, so two agents don't edit the same file and clobber each
other's work. cntrl_alt_lenny edits it indirectly by telling the "brain" agent
in plain English — see *Adding or retiring agents* near the bottom.

## Active agents

| Slug              | Where it runs                                                                             | Role                                                                                                                                                                                   | Owns these paths                                               | Hands-off paths                                                                 |
|-------------------|-------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|---------------------------------------------------------------------------------|
| **cntrl_alt_lenny** | meatspace                                                                                 | Human project owner. Sets priorities, merges PRs, adds/retires agents, final authority.                                                                                               | —                                                              | —                                                                               |
| **claude-brain**  | Claude Code on cntrl_alt_lenny's PC **or Mac** (dedicated session, separate from the decomper)      | The **brain**. Coordinator. Runs `ninja` / `dsd` to verify PRs locally, maintains this file, writes task briefs, reviews incoming PRs, decides the next task. **Default on every PR: review locally → summarize in plain English to cntrl_alt_lenny → offer to merge → execute on OK.** Self-merges autonomously when cntrl_alt_lenny is AFK, flagging in the PR body. | `AGENTS.md`, `CLAUDE.md`, `docs/briefs/`                       | `src/`, `tools/`, `libs/`, `include/`, `config/**/symbols.txt`                  |
| **claude-cloud**  | Claude Code on the web (no access to the ROM, `dsd`, or `ninja`)                          | **Scaffolder & reviewer.** Writes tools, library headers, surveys, research; reviews PRs via the GitHub MCP integration. Cannot run local builds, so delegates verification to brain. | `tools/`, `libs/`, `include/`                                  | `src/`, `config/**/symbols.txt`, `AGENTS.md` (proposes via PR; brain merges)    |
| **claude-pc**     | Claude Code on cntrl_alt_lenny's PC (decomper session)                                              | Primary decomper. Matches individual functions against the baserom, writes C source, renames symbols as functions match.                                                              | `src/`, `config/<ver>/**/symbols.txt` (renames), `assets/`     | `tools/`, `libs/`, `include/`, `AGENTS.md`                                      |

Extend this table when a new agent joins; see *Adding or retiring
agents* below.

### Why the brain runs locally (PC or Mac), not on Cloud

The brain needs to actually execute `ninja`, `./dsd.exe check modules`,
`python tools/progress.py`, etc. to verify that incoming PRs don't
regress the build. Cloud sessions don't have the baserom or the
toolchain, so they can *design* work and *review diffs* but can't
*prove the ROM still builds*. Putting the brain on a local machine
means one session can both decide and verify, which is the difference
between coordinating and guessing.

The role is tied to the repo, not to a specific machine or Claude
conversation. cntrl_alt_lenny roams between PC and Mac; whichever one has a
Claude Code session open with the toolchain installed and a current
`orig/baserom_eur.nds` is the active brain for that stretch. Handoff
is stateless — the next brain reads this file + *State of play* below
and picks up.

### Brain onboarding on a fresh machine

If you're a brand-new `claude-brain` session starting cold on a PC or
Mac that has never built this repo, do these one-time steps before you
touch any PR. cntrl_alt_lenny will typically say something like *"you are
the brain, review everything"* — that's your cue to run this checklist.

1. **Be at the repo root.** `git clone https://github.com/cntrl-alt-lenny/gx-spirit-caller`
   then `cd` into it, or `cd` into an existing clone.
2. **Sync with GitHub.** `git fetch origin && git pull --ff-only`.
3. **Drop the baserom in place.** Copy `baserom_eur.nds` (SHA-1
   `1da50df7c210fae96dc69b3825554b9ce13b4f75`) to `orig/baserom_eur.nds`.
   Ask cntrl_alt_lenny to AirDrop / iCloud-share / USB-transfer it from a machine
   that already has it — do **not** re-dump or redownload. The SHA-1
   is pinned, any other copy will fail `tools/configure.py`.
4. **Install Python deps.** `python -m pip install -r tools/requirements.txt`
   (gets `requests`, `pyperclip`). Python 3.11+ required per CLAUDE.md.
5. **Generate the build graph + verify the ROM.** `python tools/configure.py eur`
   (verifies baserom SHA-1 and writes `build.ninja`). **Do this again
   every time new `.c` files appear in `src/` from a decomper PR** — the
   linker will otherwise error with *"ov005_*.o not found"*.
6. **First build.** `ninja rom`. First run auto-downloads the native
   `dsd`, `objdiff-cli`, and `mwccarm`/`mwldarm` (via `wibo` on Linux,
   `wine` on macOS, direct on Windows). Takes a few minutes. Subsequent
   builds are seconds.
7. **Confirm the baseline.** Run the current module-check command from
   *State of play* below. Today's baseline is 24/27 OK (main / DTCM /
   overlay 4 still fail — expected, placeholder-symbol artifacts).
8. **Read `State of play`** and tackle whatever *Next-brain TODO* lists.

Afterwards, your loop is: fetch, read State of play, review any open
PRs (`gh pr list --state open`), verify them locally (configure +
ninja rom + `./dsd.exe check modules -c config/eur/arm9/config.yaml`),
merge or comment, update State of play, write briefs for cntrl_alt_lenny to
paste to other agents, repeat.

On **Windows**, `dsd` is shipped as `./dsd.exe`; on **macOS/Linux** it's
`./dsd`. The `dsd check modules` invocation adapts accordingly.

### State of play (brain keeps this current)

The brain updates this section at the end of every working chunk so
the next brain (possibly on a different machine) can catch up in under
a minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-20 (evening), after brain handoff from PC to
Mac. cntrl_alt_lenny moved machines and dropped USA + JPN dumps into
`orig/` on the Mac. Mac brain is now active; PC brain is idle.

**Baseline:** `ninja rom` succeeds, `./dsd.exe check modules` reports
24/27 OK. ARM9 main / DTCM / overlay 4 still fail — expected,
placeholder-symbol artifacts per CLAUDE.md, not caused by agent work.

**Matched function count:** 17 — 12 × 4-byte `bx lr` stubs in ov005
plus 5 easy-tier leaves in ov005 from PR #11 (`021ab0fc`, `021ac9c8`,
`021acacc`, `021acad4`, `021ad048` — first non-stub matches in the
repo, all hand-decomped with disassembly-prefaced comments).

**Merged today (in order):**
  - PR #4 — `tools/analyze_symbols.py`, 6-tier decomp target analyzer.
  - PR #5 — `libs/nitro/` + `libs/runtime/` header scaffolding.
  - PR #6 — Brief 001 published (`docs/briefs/001-*.md`).
  - PR #7 — State-of-play section + brief 002 (`docs/briefs/002-*.md`).
  - PR #8 — `claude-pc` ships brief 001: 8 ov005 `bx lr` stubs.
  - PR #9 — Rename "Leona" → "cntrl_alt_lenny" throughout AGENTS.md.
  - PR #10 — Analyzer: bulk-candidate groups + `__sinit`-by-overlay
    summary (claude-cloud, brief 002).
  - PR #11 — `claude-pc` ov005 easy-tier: 5 hand-decomped leaves.
  - PR #12 — `tools/rename_symbol.py`, safe symbol rename with
    validation (cloud, unbriefed but useful — decomper should use it).
  - PR #13 — Analyzer: `--diff` mode for snapshot-over-snapshot
    progress deltas (cloud, unbriefed; brain rebased onto #10 during
    review since they both touched `analyze_symbols.py`).
  - PR #14 — `tools/overlay_coupling.py`, cross-module call-density
    report (cloud, unbriefed).
  - PR #15 — `tools/data_symbol_sizes.py`, infers `data_*` extents
    from symbol-address gaps (cloud, unbriefed).
  - PR #16 — `generate_heatmap.py` per-cell progress-bar overlay so
    partial matches are visible (cloud, unbriefed).
  - PR #17 — `libs/nitro/include/nitro/fx.h`, FX_* fixed-point math
    signatures (cloud, unbriefed; mildly preemptive vs the "add only
    when needed" rule in `libs/nitro/README.md`, but self-aware about
    it — file's own header explains the drift risk. Kept for now.)

**In flight:**
  - PR #19 — `claude-brain/record-usa-jpn-hashes`. Records USA and
    JPN baserom SHA-1s now that cntrl_alt_lenny's dumps are on the Mac.
    Unblocks `python tools/configure.py usa/jpn`; doesn't build them
    yet (no `config/usa/` or `config/jpn/` — dsd init is EUR-only).
  - PR for brief 003 (this branch, `claude-brain/brief-003-sinit`) —
    publishes [docs/briefs/003-sinit-bulk-match.md](docs/briefs/003-sinit-bulk-match.md)
    and wires it into the Open briefs section.
  - `claude-pc` → brief 003 is ready to pick up. `__sinit` bulk match
    — match one, propagate the 0x2c pattern across 43 siblings in
    passing overlays. See the brief for scope and first-target
    recommendation.
  - `claude-cloud` → still paused. cntrl_alt_lenny's instruction: stand
    down until brief 003 surfaces scaffolding needs (likely a
    `libs/runtime/sinit.c` / ctor-list header).

**Next-brain TODO:**
  1. Merge PRs #19 and the brief-003 PR after review (they're both
     authored by brain; a second brain or cntrl_alt_lenny should sanity-check
     before merge).
  2. After the decomper ships brief 003, re-run the analyzer (`--diff`
     is worth a try now — PR #13 landed it) and look for cascades:
     every newly-named callee bumps unmatched functions up the tier
     list.
  3. Stale remote branches: `claude-pc/ov005-easy-tier` (PR #11,
     merged) is still on origin. Safe to `git push origin --delete`
     once cntrl_alt_lenny confirms the PC decomper session is off it.
  4. ~~Namecheck unused tools in the next brief.~~ Done in brief 003:
     `tools/rename_symbol.py` (strongly recommended),
     `tools/overlay_coupling.py`, `tools/data_symbol_sizes.py`.

**New agents?** Still no. The brain + decomper + cloud slot-split held
up cleanly under today's traffic (14 PRs, one merge conflict). Reopen
the question if a fourth role emerges from the next 1-2 weeks of
work — e.g. a dedicated `asset-pc` agent for graphics / sound if those
become a decomp target.

## Rules every agent follows

1. **Before starting any task**, run `git fetch origin` and read this
   file (top to bottom). State on disk may be behind what's on GitHub.
2. **Never push to `main` directly.** Every change is a pull request.
   The brain reviews locally, summarizes to cntrl_alt_lenny in plain
   English, and merges on OK. cntrl_alt_lenny retains veto — the brain's
   job is to make the review/merge decision easy to approve, not to
   outsource the click.
3. **One branch per task.** Branch name = `<agent-slug>/<kebab-scope>`,
   e.g. `claude-pc/ov005-decomp`, `claude-cloud/symbol-analyzer`.
   One branch, one PR, one concern.
4. **Stay inside your "Owns" column.** If the task needs a change in
   another agent's territory, either open a PR in that agent's scope
   (as them, not you) or ask cntrl_alt_lenny / the brain to re-partition.
5. **Open a PR when done.** Don't merge your own PR — that's the
   brain's job (including for brain-authored PRs, on cntrl_alt_lenny's
   OK). Don't force-push. Describe in the PR body: what changed,
   why, any follow-ups.

## Branch naming

`<agent-slug>/<kebab-case-scope>` — for example:

  - `claude-cloud/add-gx-headers`
  - `claude-pc/overlay-4-sinit-matches`
  - `codex/generate-nitro-os-decls`

The slug left of `/` identifies which agent owns pushes to that branch.
No-one else touches it without coordination.

## Pull-request workflow

1. Push your branch: `git push -u origin <branch>`.
2. Open a PR titled with a short summary of the change (under 70 chars).
3. PR description says: **what** changed, **why** (link the task brief
   or a sentence of context), anything the reviewer should know.
4. **Brain reviews locally** — pulls the branch, runs the appropriate
   subset of `ninja rom` / `./dsd check modules` / `ninja objdiff` /
   `python tools/progress.py` to verify the PR doesn't regress the
   baseline, then summarizes for cntrl_alt_lenny in plain English:
   what changed, why it's safe, what's next. cntrl_alt_lenny doesn't
   need to read the diff — the summary is the interface.
5. **Brain offers to merge.** On cntrl_alt_lenny's OK (explicit "merge
   it" or a thumbs-up), merge with `gh pr merge <N> --squash
   --delete-branch` (squash matches the existing commit history).
   When cntrl_alt_lenny is AFK, the brain self-merges and notes so in
   the PR body — see *Rules every agent follows* §2.
6. After merge, delete the branch. If `--delete-branch` fails from a
   worktree because `main` is checked out in the main clone, finish
   with `git push origin --delete <branch>`.

## The "brain" role

Currently held by `claude-brain` (the dedicated PC Claude Code session).
Responsibilities:

  - Keeps **AGENTS.md** current (this file).
  - Writes **task briefs** for other agents on request — a short spec
    with scope, non-scope, success criteria, suggested branch name,
    and the files they'll touch.
  - Reviews PRs from every agent locally: pulls the branch, runs
    `ninja rom`, `./dsd.exe check modules`, `python tools/progress.py`
    (and `python tools/analyze_symbols.py` once that lands) to verify
    the PR doesn't regress any module's checksum or the target list.
  - **Summarizes every PR for cntrl_alt_lenny in plain English before
    merging** — what changed, why it's safe, what's next. Brain has
    the context; cntrl_alt_lenny shouldn't have to reverse-engineer
    the diff to approve. Then offers to merge; executes on OK. This
    applies even to brain-authored PRs (e.g. AGENTS.md edits, briefs,
    baserom-hash records) — cntrl_alt_lenny still gets the yes/no.
  - Flags scope violations politely and suggests how to re-slice.
  - Does **not** set product priorities; that's cntrl_alt_lenny's call.

`claude-cloud` supports the brain: it writes scaffolding, tools, and
headers on its own branches, and can review PRs through the GitHub MCP
integration, but all "does the rebuilt ROM still work?" questions are
resolved by the brain.

The role is tied to the repo, not a specific Claude conversation —
any fresh PC Claude session that reads this file and has the toolchain
installed can take over.

## Adding or retiring agents

cntrl_alt_lenny says, in plain English, something like:

> *"Add Codex as an agent. It'll generate NitroSDK header declarations
> under `libs/nitro/include/nitro/`. Move that path off Cloud."*

The brain then:

1. Adds a row to the *Active agents* table with the new slug, role,
   owned paths, hands-off paths.
2. Moves any overlapping paths off other agents so nothing is double-
   owned.
3. Opens a PR with the change. cntrl_alt_lenny merges.
4. Writes the first task brief for the new agent.

To retire or pause an agent, move the row to a new *Retired agents*
section at the bottom with a one-line note. Don't delete history.

## Task briefs

When the brain writes a task for another agent, it goes into
`docs/briefs/NNN-<slug>.md` and gets a one-line pointer here so agents
can see the open queue without opening every file. Format of the brief
itself:

```
### <agent-slug>/<scope>

**Goal:** one sentence describing what's being built.
**Scope:** files / directories this task may touch.
**Non-scope:** explicit "don't touch these".
**Success:** how we'll know it's done (tests pass / PR merges cleanly / etc).
**Branch:** suggested branch name following the convention above.
```

### Open briefs

- [`docs/briefs/003-sinit-bulk-match.md`](docs/briefs/003-sinit-bulk-match.md)
  — `claude-pc`, branch `claude-pc/sinit-bulk-match`. Match a single
  `__sinit_*` (suggested: `__sinit_ov005_021b16e4`, size `0x2c`),
  then propagate across the 43 same-sized siblings in passing
  overlays. Outliers and `__sinit_ov004_*` are explicitly out of
  scope. First PR should contain one matched function so the brain
  can sanity-check the template before bulk propagation.

### Closed briefs (reference)

- [`docs/briefs/001-ov005-finish-trivials.md`](docs/briefs/001-ov005-finish-trivials.md)
  — `claude-pc`, shipped in PR #8 + PR #11. Net: 13 ov005 functions
  matched (8 trivial + 5 easy-tier leaves).
- [`docs/briefs/002-analyzer-bulk-groups.md`](docs/briefs/002-analyzer-bulk-groups.md)
  — `claude-cloud`, shipped in PR #10. Output: `build/eur/analysis/{targets.md,bulk.json}`
  with 382 bulk groups covering 8009 functions.

## Retired agents

(none yet)

## In-flight branches at time of writing

For reference — these predate the manifest. Brain should review and
merge (or request changes on) each in whatever order makes sense:

  - `claude/symbol-analyzer` — Cloud's decomp-target analyzer
    (`tools/analyze_symbols.py`). Parses every `config/eur/**/symbols.txt`
    + `relocs.txt`, builds a call graph, classifies 9,867 functions
    into 6 tiers (trivial / easy / sinit / named / medium / hard).
    Emits `build/eur/analysis/{graph.json,targets.md}`.
  - `claude/libs-nitro-scaffold` — Cloud's NitroSDK + CodeWarrior
    runtime header scaffolding (`libs/nitro/`, `libs/runtime/`).
    Declarations only, no `.c` files yet; provides the inclusion
    target for future matched code.
  - `claude-cloud/agents-manifest` — this file's introduction PR.

Future Cloud branches will use the `claude-cloud/` prefix; the two
`claude/…` branches above predate the naming convention and stay
as-is until merged.
