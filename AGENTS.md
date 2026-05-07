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
| **cntrl_alt_lenny** | meatspace                                                                                 | Human project owner. Sets priorities, picks direction, merges PRs, adds/retires agents, final authority.                                                                              | —                                                              | —                                                                               |
| **brain**         | Any LLM session (Claude Code, Codex CLI, …) on cntrl_alt_lenny's PC or Mac, with toolchain + baserom | The **brain**. Coordinator. Runs `ninja` / `dsd` to verify PRs locally, maintains this file + `docs/state.md`, writes task briefs, reviews incoming PRs, decides the next task. **Default on every PR: review locally → summarize in plain English to cntrl_alt_lenny → offer to merge → execute on OK.** Self-merges autonomously when cntrl_alt_lenny is AFK, flagging in the PR body. | `AGENTS.md`, `CLAUDE.md`, `docs/briefs/`, `docs/state.md`      | `src/`, `tools/`, `libs/`, `include/`, `config/**/symbols.txt`                  |
| **cloud**         | Any LLM session without local toolchain access (Claude web, Codex web, …)                 | **Scaffolder & reviewer.** Writes tools, library headers, surveys, research; reviews PRs via GitHub MCP integrations. Cannot run local builds, so delegates verification to brain.     | `tools/`, `libs/`, `include/`                                  | `src/`, `config/**/symbols.txt`, `AGENTS.md` (proposes via PR; brain merges)    |
| **decomper**      | Any LLM session on cntrl_alt_lenny's PC or Mac, with toolchain + baserom (separate session from brain) | Primary decomper. Matches individual functions against the baserom, writes C source, renames symbols as functions match.                                                              | `src/`, `config/<ver>/**/symbols.txt` (renames), `assets/`     | `tools/`, `libs/`, `include/`, `AGENTS.md`                                      |

Extend this table when a new agent joins; see *Adding or retiring
agents* below.

### Claude Code subagent configs

The three role definitions are also shipped as Claude Code subagent
files under `.claude/agents/`:

- [`.claude/agents/brain.md`](.claude/agents/brain.md) — coordinator
- [`.claude/agents/decomper.md`](.claude/agents/decomper.md) — function matcher
- [`.claude/agents/cloud.md`](.claude/agents/cloud.md) — scaffolder

Each file captures the role's scope + hands-off paths + workflow loop
so a fresh Claude Code session can load the appropriate subagent
(`/agents` picker, or `Task({ subagent_type: "brain" })` from a
parent session) instead of re-discovering the conventions from
AGENTS.md cold. The subagent specs are derived from this file — if
you change the owns/hands-off columns here, update the matching
`.claude/agents/*.md` too (and vice versa).

### Why the brain runs locally (PC or Mac), not on a cloud session

The brain needs to actually execute `ninja`, `./dsd.exe check modules`,
`python tools/progress.py`, etc. to verify that incoming PRs don't
regress the build. Web/cloud LLM sessions don't have the baserom or
the toolchain, so they can *design* work and *review diffs* but can't
*prove the ROM still builds*. Putting the brain on a local machine
means one session can both decide and verify, which is the difference
between coordinating and guessing.

### Slugs are roles, not LLM providers

**Any** LLM session that meets a slot's *Where it runs* requirement can
take that slot. Claude Code has played all three roles; Codex CLI has
played all three roles; a future Gemini / GPT / whatever session can
too. The slug is the **role**, not the **model**. When cntrl_alt_lenny
opens a chat and says *"you are the decomper"*, that session becomes
`decomper` for as long as it's the one working the role — regardless of
which LLM backs it.

Handoff is stateless. Whichever local session has the toolchain
installed, a current `orig/baserom_eur.nds`, and has read this file +
`docs/state.md` is the active `brain` for that stretch; the next one
can pick up from there.

### Brain onboarding on a fresh machine

If you're a brand-new `brain` session starting cold on a PC or Mac
that has never built this repo, do these one-time steps before you
touch any PR. cntrl_alt_lenny will typically say something like *"you are
the brain, review everything"* — that's your cue to run this checklist.
Works the same regardless of which LLM (Claude Code, Codex CLI, etc.)
is backing the session.

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
   [`docs/state.md`](docs/state.md). Today's baseline is 24/27 OK (main /
   DTCM / overlay 4 still fail — expected, placeholder-symbol artifacts).
8. **Read [`docs/state.md`](docs/state.md)** and tackle whatever the
   *Next-brain TODO* section lists.

Afterwards, your loop is: fetch, read `docs/state.md`, review any open
PRs (`gh pr list --state open`), verify them locally (configure +
ninja rom + `./dsd.exe check modules -c config/eur/arm9/config.yaml`),
merge or comment, update `docs/state.md`, write briefs for cntrl_alt_lenny to
paste to other agents, repeat.

### Worktree convention (multi-agent on the same machine)

When `brain` and `decomper` are both running on the same physical
machine (the common case for cntrl_alt_lenny's setup), **they must
work in separate git worktrees** so they don't fight over branch
state in the same working directory. Standard layout:

| Worktree path                              | Slug      | Purpose                                          |
|--------------------------------------------|-----------|--------------------------------------------------|
| `/Users/leo/Dev/gx-spirit-caller`          | `brain`   | Main repo. Brain pulls main, reviews PRs, builds verifications. |
| `/Users/leo/Dev/gx-spirit-caller-decomper` | `decomper`| Sibling worktree. Decomper checks out its own `decomper/cluster-prop-*` branches without touching brain's working state. |

Add the decomper worktree once per machine via:

```
git worktree add /Users/leo/Dev/gx-spirit-caller-decomper main
cp /Users/leo/Dev/gx-spirit-caller/orig/baserom_*.nds \
   /Users/leo/Dev/gx-spirit-caller-decomper/orig/
```

Each worktree gets its own `orig/baserom_*.nds` (gitignored) and
its own `build/` directory. The `.git` is shared via worktree
mechanics, so commits/branches are visible across both — but
working-tree state (modified files, untracked files, current
checkout) is isolated.

When starting a new decomper session, point it at
`/Users/leo/Dev/gx-spirit-caller-decomper` instead of the main
clone. The cloud agent doesn't need a worktree — it runs without
the local toolchain so it works on a remote / cloud LLM session
and pushes branches directly.

### Wine deprecation (macOS, deadline 2026-09-01)

Homebrew's `wine-stable`, `wine@staging`, and `wine@devel` casks
are all deprecated as of 2026-05-06 and **will be disabled on
2026-09-01** (Apple Gatekeeper now blocks the unsigned x86_64
binaries). Existing installs keep working past the deadline; new
installs / reinstalls / contributors with fresh machines won't.

Migration is tracked under [brief 026](docs/briefs/026-wine-migration-prep.md).
Until that lands, current macOS brain setups stay on
`wine-stable`; new machines should pause at AGENTS.md *Brain
onboarding* step 6 and read brief 026 before installing wine.

On **Windows**, `dsd` is shipped as `./dsd.exe`; on **macOS/Linux** it's
`./dsd`. The `dsd check modules` invocation adapts accordingly.

### State of play (moved)

The churn-heavy brain log — matched counts, merged PRs, in-flight
work, next-brain TODOs — lives in [`docs/state.md`](docs/state.md).
This file (AGENTS.md) is now just the role manifest and the rules;
things that change every working chunk land in `docs/state.md` so this
file stays stable and only turns over when agents, scopes, or rules
change.

The brain updates `docs/state.md` at the end of every session; a fresh
brain reads it cold to catch up in under a minute.

## Rules every agent follows

1. **Before starting any task**, run `git fetch origin` and read this
   file (top to bottom). State on disk may be behind what's on GitHub.
2. **Never push to `main` directly.** Every change is a pull request.
   The brain reviews locally, summarizes to cntrl_alt_lenny in plain
   English, and merges on OK. cntrl_alt_lenny retains veto — the brain's
   job is to make the review/merge decision easy to approve, not to
   outsource the click.
3. **One branch per task.** Branch name = `<agent-slug>/<kebab-scope>`,
   e.g. `decomper/ov011-tail-wrappers`, `cloud/tier-delta`,
   `brain/agents-rename`. One branch, one PR, one concern. (Older
   branches in history use the pre-rename slugs `claude-pc`,
   `claude-cloud`, `claude-brain`; those are grandfathered.)
4. **Stay inside your "Owns" column.** If the task needs a change in
   another agent's territory, either open a PR in that agent's scope
   (as them, not you) or ask cntrl_alt_lenny / the brain to re-partition.
5. **Open a PR when done.** Don't merge your own PR — that's the
   brain's job (including for brain-authored PRs, on cntrl_alt_lenny's
   OK). Don't force-push. Describe in the PR body: what changed,
   why, any follow-ups.

### Cloud autonomous work

`cloud` fills idle time between briefs. Defaults:

- **May open unbriefed:** new scripts in `tools/`, improvements to
  existing analyzer scripts, CI changes, PR reviews via GitHub MCP,
  docs restructuring inside `AGENTS.md` / `docs/`.
- **Requires a brief first:** anything under `libs/nitro/` or
  `libs/runtime/` — header scaffolding drifts fast without a
  concrete call-site. Wait for the brain to scope one.
- **When unsure:** open the PR, flag it under a "⚠️ Brain please
  confirm scope" heading, and **don't** request merge — the brain
  approves, rescopes, or closes.

## Branch naming

`<agent-slug>/<kebab-case-scope>` — for example:

  - `cloud/add-gx-headers`
  - `decomper/ov011-tail-wrappers`
  - `brain/agents-rename`

The slug left of `/` identifies which role owns pushes to that branch.
No-one else touches it without coordination. Branches from before the
model-agnostic rename (`claude-brain/*`, `claude-cloud/*`, `claude-pc/*`)
remain valid in git history and don't need to be renamed.

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

Held by `brain` (a dedicated local Claude Code or Codex CLI session
with the toolchain installed). Responsibilities:

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

`cloud` supports the brain: it writes scaffolding, tools, and headers
on its own branches, and can review PRs through GitHub MCP integrations,
but all "does the rebuilt ROM still work?" questions are resolved by
the brain.

The role is tied to the repo, not to a specific LLM conversation — any
fresh local session (Claude Code, Codex CLI, …) that reads this file
and has the toolchain installed can take over.

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

- [`docs/briefs/027-cluster-prop-ov006-021b7ce0.md`](docs/briefs/027-cluster-prop-ov006-021b7ce0.md)
  — `decomper`: first pilot leveraging `find_shape_templates.py`.
  Targets ov006 cluster #2 (`func_ov006_021b7ce0`, sig 1, 2 matched
  / 34 unmatched, 61% MED). Brief 023's research diagnosed this as
  a heterogeneous bag with ≥8 shapes; brief 025's tool surfaces
  per-target clone candidates automatically. Target ≥14 matches
  (lower edge of brief 023's 40-60% calibrated band). Supersedes
  brief 024's self-extend (no remaining HIGH/MED ≥60% non-ov006
  candidates pass the rule post-brief-024). Branch:
  `decomper/cluster-prop-ov006-021b7ce0`.
- [`docs/briefs/026-wine-migration-prep.md`](docs/briefs/026-wine-migration-prep.md)
  — `cloud`: investigate and document the migration path off
  homebrew's deprecated `wine-stable` / `@staging` / `@devel`
  casks (all disabled 2026-09-01). Land as
  `docs/research/wine-migration.md` + AGENTS.md update. Medium-
  low priority; ~4 months runway. Branch:
  `cloud/wine-migration-prep`.

### Closed briefs (reference)

- [`docs/briefs/025-ov006-tooling-followup.md`](docs/briefs/025-ov006-tooling-followup.md)
  `cloud`, shipped in PR #304. `tools/find_shape_templates.py` —
  679-line tool + 532 lines of tests. Opcode-sequence Levenshtein
  scoring across the matched corpus with stat-based dsd-dis caching.
  Sample output on brief-020 anchor returns expected siblings at
  similarity 1.0. Sibling to `pattern_library.py`.
- [`docs/briefs/024-cluster-prop-next-high.md`](docs/briefs/024-cluster-prop-next-high.md)
  `decomper`, shipped in PR #303. **18 byte-identical matches at
  100% yield** on rank-#8 `func_0202b43c`. Single-shape cluster of
  4-insn pre-call-arg-rsb tail-call thunks. First test of the
  anchor-selection rule — selection trace in PR body shows the
  filter working as intended.
- [`docs/briefs/022-cluster-prop-0202b0e0.md`](docs/briefs/022-cluster-prop-0202b0e0.md)
  `decomper`, shipped in PR #301. **24 byte-identical matches at
  77% yield** (target ≥15, predicted 74%). 14 distinct shape
  templates under the lifted 15-cap; excellent reg-alloc notes
  carry over for future heterogeneous-cluster pilots.
- [`docs/briefs/023-ov006-cluster-investigation.md`](docs/briefs/023-ov006-cluster-investigation.md)
  `cloud`, shipped in PR #299. 348-line research note diagnosing
  the two persistently-stuck top-of-pool ov006 clusters as
  heterogeneous bags (≥15 / ≥8 distinct shapes hiding behind
  identical fingerprints). Predicted yields are correct, not bugged.
  Recommendation: build `find_shape_templates.py` (now scoped as
  brief 025).
- [`docs/briefs/021-markdownlint-cleanup.md`](docs/briefs/021-markdownlint-cleanup.md)
  `cloud`, shipped in PR #296. Cleared 7 pre-existing markdown-lint
  errors and patched `tools/generate_tool_index.py` to compute
  GFM-style heading slugs going forward (root-cause fix, not just
  symptoms).
- [`docs/briefs/020-cluster-prop-02006164.md`](docs/briefs/020-cluster-prop-02006164.md)
  `decomper`, shipped in PR #297. **20 byte-identical matches
  (87% yield)** — beat predicted 74%. Heterogeneous cluster
  unlocked via per-shape templating (12 distinct shapes) instead
  of the brief's per-bit-position hand-patches. Updated the
  brief-template guidance in brief 022.
- [`docs/briefs/019-configure-mwasmarm-output.md`](docs/briefs/019-configure-mwasmarm-output.md)
  `cloud`, shipped in PR #292. Fresh-clone bootstrap fix —
  `outputs=[CC, LD, ASM]` in the `download_tool` rule. Verified by
  brain via the documented `rm -rf tools/mwccarm` smoke test.
- [`docs/briefs/018-cluster-tooling-upgrade.md`](docs/briefs/018-cluster-tooling-upgrade.md)
  `cloud`. **First half** shipped in PR #243 (cluster fingerprint
  subdivision). **Second half** (`propagate_template --substitute-imm`)
  *superseded* by the post-#255 hard-tier clustering pivot — see
  `docs/state.md` for the narrative.
- [`docs/briefs/017-cluster-prop-020085d4.md`](docs/briefs/017-cluster-prop-020085d4.md)
  `decomper`, shipped in PR #247. 13 offset-substitution matches on
  the `func_020085d4` cluster.

- Briefs 010–014 all shipped during the gap between the previous and
  current state-md refreshes. Their full archive lives in
  `docs/briefs/010-*.md` through `docs/briefs/014-*.md` plus the
  per-brief PRs (#94, #98, #102, #105, #146 and the wave PRs that
  drained each brief's targets). The auto-generated
  [`docs/briefs/README.md`](docs/briefs/README.md) index lists every
  brief with its working branch.

- [`docs/briefs/009-sinit-ov002-outlier.md`](docs/briefs/009-sinit-ov002-outlier.md)
  `decomper`, shipped in PR #92. Matched `__sinit_ov002_022ca7e8`
  (24 bytes, asm-void escape hatch for mwcc's RHS-first ordering).
- [`docs/briefs/008-ov011-tail-call-wrappers.md`](docs/briefs/008-ov011-tail-call-wrappers.md)
  `decomper`, shipped in PR #89. Matched `func_ov011_021ce324` /
  `021ce334` — both 0x10 ARM tail-call wrappers, 100% objdiff.
- [`docs/briefs/001-ov005-finish-trivials.md`](docs/briefs/001-ov005-finish-trivials.md)
  `claude-pc`, shipped in PR #8 + PR #11. Net: 13 ov005 functions
  matched (8 trivial + 5 easy-tier leaves).
- [`docs/briefs/002-analyzer-bulk-groups.md`](docs/briefs/002-analyzer-bulk-groups.md)
  `claude-cloud`, shipped in PR #10. Output: `build/eur/analysis/{targets.md,bulk.json}`
  with 382 bulk groups covering 8009 functions.
- [`docs/briefs/003-sinit-bulk-match.md`](docs/briefs/003-sinit-bulk-match.md)
  `claude-pc`, shipped across the sinit wave PRs. Matched the
  same-sized `__sinit_*` group; deferred the documented outliers.
- [`docs/briefs/004-trivial-stubs-wave.md`](docs/briefs/004-trivial-stubs-wave.md)
  `claude-pc`, shipped in PR #63, PR #65, and PR #66. Matched 56
  trivial `bx lr` stubs across passing overlays.
- [`docs/briefs/005-easy-tier-wave.md`](docs/briefs/005-easy-tier-wave.md)
  `claude-pc`, shipped in PR #70, PR #71, and PR #72. Matched 24
  easy-tier leaves across ov005/ov006/ov007/ov009.
- [`docs/briefs/006-easy-tier-heavies.md`](docs/briefs/006-easy-tier-heavies.md)
  `claude-pc`, shipped in PR #79, PR #80, PR #81, and PR #82.
  Matched 29 easy-tier leaves across ov015/ov010/ov011/ov000.
- [`docs/briefs/007-ov000-bit-getter.md`](docs/briefs/007-ov000-bit-getter.md)
  `claude-pc`, shipped in PR #85. Matched one ov000 0x10 bit getter
  as the low-risk Brief 007 opener.

## Retired agents

(none yet)

## In-flight branches at time of writing

None known after brief 006. Use `gh pr list --state open` and
`docs/state.md` as the live source of truth before starting work.
