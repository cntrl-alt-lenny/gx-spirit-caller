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
   - **macOS prerequisite** (replaces deprecated `wine-stable`):
     `brew install --cask Gcenx/wine/game-porting-toolkit`. Apple
     Silicon also needs Rosetta 2 (`softwareupdate
     --install-rosetta --agree-to-license`). Existing brains
     migrating from `wine-stable` should
     `brew uninstall --cask wine-stable` first to satisfy the
     cask's conflicts-with check. Rationale + tested baseline:
     [`docs/research/wine-migration.md`](docs/research/wine-migration.md).
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

### Wine on macOS (post-deprecation)

Homebrew's `wine-stable`, `wine@staging`, and `wine@devel` casks
are all deprecated and **will be disabled on 2026-09-01** (Apple
Gatekeeper blocks the unsigned x86_64 binaries). The migration
landed in [brief 026](docs/briefs/026-wine-migration-prep.md):
fresh macOS brains install
[Gcenx's Game Porting Toolkit cask](https://github.com/Gcenx/homebrew-wine)
instead — the install command is in *Brain onboarding* step 6
above. Rationale + verified-baseline write-up:
[`docs/research/wine-migration.md`](docs/research/wine-migration.md).

Existing brains already on `wine-stable` keep working past the
deadline (the binary on disk doesn't disappear); migrate at the
next reinstall or when the cask conflict bites a fresh
configure.

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

- [`docs/briefs/082-pokeheartgold-bulk-port-wave-1.md`](docs/briefs/082-pokeheartgold-bulk-port-wave-1.md)
  — `decomper` (HIGH, **NOW ACTIVE**): first pokeheartgold
  cross-project bulk-port wave using brief 080's CSV
  pipeline. Target 30-60 byte-identical ports from
  `lib/NitroSDK + lib/MSL_C + lib/dsprot` (2.0/sp2p2, one
  SP-rev off ours). Branch:
  `decomper/pokeheartgold-bulk-port-wave-1`.

- [`docs/briefs/084-c22-struct-pointer-corruption-wall.md`](docs/briefs/084-c22-struct-pointer-corruption-wall.md)
  — `cloud` (MEDIUM-HIGH): codify the new struct-pointer +
  field-access silent-corruption wall (C-22 candidate)
  brief 081 chain confirmed across 3 datapoints. Part 1:
  fold entry into codegen-walls.md. Part 2: investigate
  recipe via C-variation + SP sweep. Branch:
  `cloud/c22-struct-pointer-corruption-wall`.

- [`docs/briefs/063-permuter-auto-runner.md`](docs/briefs/063-permuter-auto-runner.md)
  — `cloud` (MEDIUM-LOW priority): extend `tools/permute.py`
  from bootstrap-only to auto-running decomp-permuter on
  close-but-not-byte-identical candidates. Becomes high-priority
  as soon as the next cap-raise hits the 0x60-0x100 band where
  permuter shines. Independent of 062 + 064/065. Branch:
  `cloud/permuter-auto-runner`.

- [`docs/briefs/066-cross-project-source-research.md`](docs/briefs/066-cross-project-source-research.md)
  — `cloud` (MEDIUM priority): research brief — survey the
  DS-decomp ecosystem (AetiasHax/st, pret/pokeheartgold,
  pret/pokediamond) for already-matched NitroSDK / MSL_C
  source we can mechanically port. Ship feasibility verdict +
  `tools/find_external_source.py` prototype. Estimated unlock:
  **120-500 mechanical ports** for EUR, ~3× through brief
  064/065's multi-region pipeline. Independent of 064/065;
  scheduled after 064 closes so it doesn't compete for cloud
  attention. Branch: `cloud/cross-project-source-research`.

### Closed briefs (reference)

- [`docs/briefs/081-single-region-hard-tier-resumption.md`](docs/briefs/081-single-region-hard-tier-resumption.md)
  `decomper`, full 3-wave chain shipped via PRs #464 / #467
  / #468. **21 matches / 876 bytes / 67.7% combined yield.**
  Slope-change validation post-tools-investment. Wave 1
  hit 87.5% yield; chain trended downward as pool drained.
  Surfaced new wall candidate (struct-pointer + field-
  access silent-corruption, 3 datapoints — brief 084
  codifies) + suggest_coercion calibration: 6.5%
  cumulative invocation rate, rule engine is long-tail
  accelerator at ≤0x40 band (not first-pass tool).
- [`docs/briefs/079-cross-apply-tool-v2-fixes.md`](docs/briefs/079-cross-apply-tool-v2-fixes.md)
  `cloud`, shipped in PR #463. D1 v2 overlay-prefix rename
  + D2 v2 reloc-mask offset fix (closes Thumb-2 BL
  half-mask trap). ~30 cross-region ports unlocked for
  brief 085 (future).
- [`docs/briefs/080-pokeheartgold-extension-research.md`](docs/briefs/080-pokeheartgold-extension-research.md)
  `cloud`, shipped in PR #465. VERDICT: GO-WITH-CAVEATS.
  Brief 066 correction: nitrocrypto is `.s` not `.c`. Real
  unlock is 39 portable `.c` files across NitroSDK +
  MSL_C + dsprot at 2.0/sp2p2 (one SP rev off ours).
  Estimated ~50-80 ports/region after disambiguation.
  Plus cloud-research-archaeology lessons writeup
  shipped via PR #466.
- [`docs/briefs/078-cross-region-apply-wave-2.md`](docs/briefs/078-cross-region-apply-wave-2.md)
  `decomper`, shipped in PR #461. 11 of 40 target — below
  target. **Cross-region pipeline at natural drain**:
  39/99 libs/nitro ports applied (39% coverage). Remaining
  60 split into ~30 four-byte trivial stubs (un-cross-
  applicable), ~25 overlay ports (blocked on D1 v2 in
  brief 079), ~5 substantive byte-collision (D2 v2 in
  brief 079). Pipeline cap with current tools ~70 ports.
- [`docs/briefs/077-strip-static-keyword.md`](docs/briefs/077-strip-static-keyword.md)
  `cloud`, shipped in PR #459. 2-line static-strip regex
  + 5 tests. Followed by PR #460 (brief 077.b — `static
  inline` extension after family survey ruled out other
  family members).
- [`docs/briefs/074-cross-project-bulk-port-wave-3.md`](docs/briefs/074-cross-project-bulk-port-wave-3.md)
  `decomper`, shipped in PR #457 at 12/50 below floor. **Brief
  074 chain CLOSES at cumulative 99 cross-project ports**
  (10 b069w1 + 64 b071w1 + 13 b071w2 + 12 b074w3). Three sub-
  floor waves in a row signaled pool drain, not driver
  quality (substantive ≥0x18 conversion rate stayed at 75%).
  `already-complete` count climbed 119 → 450 confirming pool
  drain. Surfaced two follow-ups: static-keyword silent-
  corruption (brief 077), pool depth bias future waves toward
  substantive ports only.
- [`docs/briefs/076-cross-apply-libs-port-improvements.md`](docs/briefs/076-cross-apply-libs-port-improvements.md)
  `cloud`, shipped in PR #456. D1 overlay-port regex + D2
  raw-bytes + reloc-parity fallback. Sweep shows **17 size-
  16+ unlocks on existing libs/nitro sample** plus 29 overlay
  ports unlocked. D2's strictly-conservative-fallback design
  (never overrides primary HIGH) catches the BL-offset
  divergence trap from brief 075 wave 1.
- [`docs/briefs/075-cross-region-apply-existing-ports.md`](docs/briefs/075-cross-region-apply-existing-ports.md)
  `decomper`, shipped in PR #454. 27 of 87 ports cross-applied
  (below 70 target). Headline output: byte-uniqueness diagnostic
  — 62% of the 87-port set is size-4 stubs (`bx lr` etc.),
  2,632 byte-identical instances in USA's main alone. Refusal
  rate was 92% but every refusal was a true negative. 568
  bytes per region, all 3 regions 24/27 baseline preserved.
  USA + JPN climbed 0.19% → 0.23% (smaller than projected
  0.6-0.7% because refused pool was trivial bytes). Three
  follow-up vectors surfaced; D1 + D2 become brief 076.
- [`docs/briefs/073-per-region-cross-application.md`](docs/briefs/073-per-region-cross-application.md)
  `cloud`, shipped in PR #451. **Approach A extended** (function
  + data-ref rename via parallel-reloc bridge). 1-port worked
  example (`func_02007218.legacy.c`) verifies 3-region 24/27
  baseline preserved. New tool: `tools/cross_apply_libs_port.py`.
  20 new tests. Approach B (upstream NitroSDK naming) deferred to
  brief 076 if Approach A's semantic noise bites decomper
  iteration. Followed by brief 075 (full 87-port batch).
- [`docs/briefs/072-port-driver-d5-struct-vendoring.md`](docs/briefs/072-port-driver-d5-struct-vendoring.md)
  `cloud`, shipped in PR #449. Full struct defs for
  `_OSThread`, `_OSThreadQueue`, `OSMutex` + transitive deps
  (OSContext, CPContext). 300-sample sweep: struct-access
  drops 118 → 80 (-38). 3 of 5 OS_thread.c / OS_mutex.c
  functions unblock (was 0/5 pre-D5). New headers:
  libs/nitro/include/nitro/os_thread.h + os_printf.h.
- [`docs/briefs/071-cross-project-bulk-port-wave-1-rerun.md`](docs/briefs/071-cross-project-bulk-port-wave-1-rerun.md)
  `decomper`, full chain shipped across PRs #442 (wave 1, 64
  ports / 0.88) + #445 (wave 2, 13 ports / 0.68 — below
  floor). **Cumulative 87 cross-project ports** at the
  closure. Wave 2 surfaced three driver-quality findings now
  on cloud's queue: D5 full-struct vendoring (brief 072),
  per-region cross-application refactor (brief 073), D1
  ambiguous-addr disambiguation. Plus cloud shipped #444
  (TU-collision pre-filter + ish-mismatch) and #446
  (STT_NOTYPE r-value classification) in parallel — both
  silent-corruption fixes the next cross-project wave needs.
- [`docs/briefs/070-port-external-source-driver.md`](docs/briefs/070-port-external-source-driver.md)
  `cloud`, **fully closed** across PRs #438 (D1 callee remap),
  #440 (D4 data-ref remap), #441 (D2+D3 vendored framework).
  D1+D4+D2+D3 combined: 171 compile-ready candidates against
  the pokediamond NitroSDK + libnns pool (3.4× brief 071's
  50 floor). Architectural symmetry with `port_to_region.py`'s
  parallel-reloc bridge paid off as designed. D2+D3 framework
  compounds incrementally as decomper vendors more headers
  into `libs/nitro/include/`.
- [`docs/briefs/069-cross-project-bulk-port-wave-1.md`](docs/briefs/069-cross-project-bulk-port-wave-1.md)
  `decomper`, shipped in PR #436 at the floor (10 ports vs 50
  floor). **Brain scoping miss** — brief 069 listed
  `port_external_source.py` as a brief 068 deliverable but
  it wasn't in brief 068's actual scope. The 10 ports are all
  byte-identical at 100% precision; the floor-miss is
  port-driver maturity, not pipeline precision. Funnel
  diagnostic: 2887 HIGH rows → 455 dedup → 14 driver-OK →
  10 byte-match. Followed by brief 070 (ship the proper
  driver) → brief 071 (decomper rerun).
- [`docs/briefs/065-multi-region-bulk-port-wave-1.md`](docs/briefs/065-multi-region-bulk-port-wave-1.md)
  `decomper`, full 3-wave chain shipped via PRs #423 / #428 /
  #431. **400 byte-identical cross-region matches (200 USA +
  200 JPN) / 92.6% cumulative precision.** Brief 057+060
  combined shipped 45 EUR-side matches over 6 waves; brief
  065 shipped 400 cross-region in 3. Order-of-magnitude lift
  the multi-region investment was scoped for. Followed by
  brief 069 (cross-project bulk-port, now ACTIVE).
- [`docs/briefs/068-cross-project-byte-fingerprint-pass.md`](docs/briefs/068-cross-project-byte-fingerprint-pass.md)
  `cloud`, shipped in PR #432. `tools/external_obj.py` +
  `find_external_source.py --byte-scan` mode. **5/5 perfect
  1.000 byte-sim matches** on pokediamond's `OS_tick.c` with
  contiguous EUR addresses (0x020930a0 → 0x020931f8). Critical
  SP refinement vs brief 066: pokediamond's NitroSDK + libnns
  subtrees (103 of 105 files) use mwcc 1.2/sp2p3 = exact match
  to our `.legacy.c` SP. Hit rate jumps from 80-95% to 100%
  sample-validated. CSV contract shipped for brief 069.
- [`docs/briefs/066-cross-project-source-research.md`](docs/briefs/066-cross-project-source-research.md)
  `cloud`, shipped in PR #429. **VERDICT: GO** with refined
  estimates. SP-distance matrix is the dominant risk model:
  pokediamond (one SP rev → 80-95%), pokeheartgold (50-70%),
  st (skip — different ISA family). Bonus finding: pokeheartgold's
  nitrocrypto uses our exact `.legacy.c` SP (1.2/sp2p3) — perfect-
  fingerprint candidates. v0 prototype shipped:
  `tools/find_external_source.py` + `tools/vendor_external_sources.py`
  + 819 pokediamond functions indexed. Estimated unlock: 300-600
  EUR ports from pokediamond alone (×3 regions via brief 064/065
  → 900-1800 cross-region matches). Followed by brief 068 (impl)
  + brief 069 (bulk-port wave).
- [`docs/briefs/062-diff-to-coercion-suggester.md`](docs/briefs/062-diff-to-coercion-suggester.md)
  `cloud`, shipped in PR #422. `tools/suggest_coercion.py` v0
  rule engine over objdiff JSON + codegen-walls.md catalog.
  Two-mode CLI (auto-locate + JSON-in). 5 walls in v0 (C-15,
  P-1, S-1, C-20, C-1). Doc-as-source-of-truth (anchors only,
  no recipe restating). 28 unit tests; full suite 1274/1274.
  Hit-rate measurement deferred to decomper's next iterative
  wave per the brief's spec.
- [`docs/briefs/064-multi-region-implementation.md`](docs/briefs/064-multi-region-implementation.md)
  `cloud`, full chain shipped across PRs #418 (part 1, byte-
  disambiguation) + #419 (part 2, `tools/port_to_region.py`) +
  #420 (part 3, parallel-region builds). **All 3 deliverables
  closed.** v2 disambiguation: 20% → 57% single-HIGH unique
  winners (2.85× improvement, brief 061 500-sample re-run).
  Per-region tree convention (Option A) confirmed in #419.
  `configure.py` per-region filter ships and all three regions
  hit 24/27 baseline at the same placeholder modules. Brief
  065 unblocked; **wave 1 closed at 88 matches / 100%
  precision** (PR #423).
- [`docs/briefs/061-multi-region-porting-research.md`](docs/briefs/061-multi-region-porting-research.md)
  `cloud`, shipped in PR #414. **VERDICT: GO.** 74.8%
  HIGH-confidence pairings across 500-sample stratified survey
  (peaking 90.6% in ≤0x40 band, 100% in medium). USA + JPN are
  pairwise-identical in function count to EUR (1 extra function
  in main = total drift across symbol graph). Estimated unlock:
  **800-1700 cross-region matches** at full pipeline ship.
  Followed by PR #415 (brain bootstrap of `config/usa/` +
  `config/jpn/`) then brief 064 (implementation pipeline) +
  brief 065 (first bulk-port wave).
- [`docs/briefs/060-hard-tier-c20-medium-pool.md`](docs/briefs/060-hard-tier-c20-medium-pool.md)
  `decomper`, full chain shipped across PRs #405 / #408 / #412
  (waves 24/25/26). **29 matches / 1072 bytes / ~75% combined
  yield.** Strongest brief outcome since brief 057's first two
  waves. C-20a recipe (PR #404) recovered both wave-23 drops
  first-try. Two distinct propagate-template 4-clone families
  shipped (wave 25 bitfields + wave 26 helper-thunks). ~32% of
  the PR #397 90-pool drained; ~61 candidates remain. Surfaced
  cascade variants (b)/(c)/(d) (PRs #407/#410/#413).
- [`docs/briefs/057-hard-tier-cap-raise-0x60.md`](docs/briefs/057-hard-tier-cap-raise-0x60.md)
  `decomper`, full chain shipped across PRs #390 / #392 / #402
  (waves 21/22/23). **16 matches / 1016 bytes / ~57% combined
  yield.** Cap-raise paid off for 2 waves (70% each at 0x60) then
  collapsed in wave 23 (25%). Surfaced C-21 ternary-to-constants
  (folded in PR #391) + S-1 padding off-by-one (folded in PR #398)
  + the candidate C-21 "next-ahead walk loop" pattern. Followed
  by brief 060 (fall back to ≤ 0x40, mine the PR #397 MEDIUM pool).
- [`docs/briefs/055-hard-tier-byte-volume-continued.md`](docs/briefs/055-hard-tier-byte-volume-continued.md)
  `decomper`, full chain shipped across PRs #383 / #385 / #387
  (waves 18/19/20). **22 matches / 948 bytes / 69% combined
  yield.** Beat brief 053's 884-byte chain. 4 C-16 W-H wins via
  natural C; multi-module twin pattern strong. Triggered cloud
  C-17 / C-18 / C-19 autonomous fold-ins.
- [`docs/briefs/053-hard-tier-byte-volume.md`](docs/briefs/053-hard-tier-byte-volume.md)
  `decomper`, full chain shipped across PRs #374 / #378 / #380
  (waves 15/16/17). **19 matches / 884 bytes combined at 66%
  yield.** Strategic byte-volume pivot validated. Brief 055
  continues the pattern. Wave 16 surfaced C-1r over-predication
  (cloud confirmed permanent in PR #379).
- [`docs/briefs/054-c15-vs-p1-taxonomy-fold-plus-ldr-ip-wall.md`](docs/briefs/054-c15-vs-p1-taxonomy-fold-plus-ldr-ip-wall.md)
  `cloud`, shipped in PR #375. Two deliverables: (1) C-15 vs P-1
  wall family note (cross-links + discriminator table); (2)
  **C-16 / W-H** ldr-r1-vs-ip flipped coercible.
- [`docs/briefs/051-mixed-wave-13.md`](docs/briefs/051-mixed-wave-13.md)
  `decomper`, shipped in PR #368. **14 byte-identical at 88%**
  from the `func_ov010_021b4750` tail-call cluster (PR #363
  separate-scope, 22 siblings). All 14 reclassify to easy
  (82.7% → 84.0%).
- [`docs/briefs/052-wave-12-wall-investigations.md`](docs/briefs/052-wave-12-wall-investigations.md)
  `cloud`, shipped in PR #369. Three deliverables: C-2a
  struct-copy refinement (cracks brief 022's historic
  `func_0208904c` miss); **C-15 / W-G** mvn-vs-sub peephole
  classified as routing-tractable; ov004 BSS investigation
  documented.
- [`docs/briefs/049-hard-tier-wave-10.md`](docs/briefs/049-hard-tier-wave-10.md)
  `decomper`, full chain shipped across PRs #359 + #362 + #366
  (waves 10/11/12). **34 matches at ~87% combined yield.** Wave
  10 validated cap-raise to 0x28; wave 11 took both C-14 W-F
  unblocks first try; wave 12 took 11/15 from cloud's PR #363
  rescan list and reclassified them all to easy tier — empirically
  validating the "easy-tier reopened" finding.
- [`docs/briefs/050-codegen-walls-c13-plus-r2-research.md`](docs/briefs/050-codegen-walls-c13-plus-r2-research.md)
  `cloud`, shipped in PR #360. Two deliverables: (1) **C-13**
  folded (predicated if-X order, from wave 9). (2) **W-F →
  C-14 coercible** (r2-vs-r1 reg-alloc; specific C variation
  flips). Two unblocks for decomper queued.
- [`docs/briefs/049-hard-tier-wave-10.md`](docs/briefs/049-hard-tier-wave-10.md)
  `decomper`, shipped in PR #359. **15/15 = 100% yield** at
  raised ≤ 0x28 cap. Hard tier 1.6% → 1.8%. Cap-raise hypothesis
  validated. Strong repeated-twin signal observed (compounding
  via find_shape_templates).
- [`docs/briefs/048-push-r0-wall-research.md`](docs/briefs/048-push-r0-wall-research.md)
  `cloud`, shipped in PR #351. **C-12 push-r0 thunk via asm void**
  — mwcc inline asm coerces; verified across all 15 SPs in
  toolchain (none emit push-r0 from C source). Two immediate
  unblocks: `func_02093294`, `func_02092f04`. Decomper picks
  these up under brief 047's self-extend.
- [`docs/briefs/047-hard-tier-pilot.md`](docs/briefs/047-hard-tier-pilot.md)
  `decomper`, shipped in PR #350. **15 byte-identical matches at
  100% per-attempt yield** on first hard-tier wave. 9 sp1p5 + 6
  sp3 + 0 sp2p3 across main/ov002/ov011. Hard tier 1.1% → 1.3%.
  Qualitative read: hard tier ≤ 0x20 = medium-tier thunks
  rebadged. Self-extend yield criterion exceeded; 2 follow-ups
  available.
- [`docs/briefs/046-medium-tier-wave-5.md`](docs/briefs/046-medium-tier-wave-5.md)
  `decomper`, shipped in PR #342. **6 byte-identical matches
  across all 3 compiler tiers** (4 sp3, 1 sp2p3, 1 sp1p5). 3/5
  brief-044 sp3-unique candidates landed; W-B unblocked. Brief
  044's discriminator predicted reliably. New observation: brief
  041's declare-order r4↔r5 trick doesn't transfer to sp3.
  Self-extend allowance preserved (2 follow-ups remaining).
- [`docs/briefs/045-sp3-routing-implementation.md`](docs/briefs/045-sp3-routing-implementation.md)
  `cloud`, shipped in PR #340. Third compiler routing tier
  (`*.legacy_sp3.c` → mwcc 1.2/sp3) implemented next to existing
  tiers. Brain ran the dual-tier smoke test before merging
  (lcf + objects.txt agreed on both `.legacy.o` and
  `.legacy_sp3.o`). Brain pushed a follow-up commit on cloud's
  branch to regenerate `docs/tools-index.md` after CI caught the
  drift; small miss, no rework needed.
- [`docs/briefs/044-sp3-routing-research.md`](docs/briefs/044-sp3-routing-research.md)
  `cloud`, shipped in PR #337. Sp3 sweep verdict: **ship the
  third tier**. 7 sp3-unique medium+easy candidates (borderline
  range), but cloud's cross-cutting argument about the 416
  hard-tier candidates as future leverage convinced brain to
  override the conservative default. Brief 045 implements.
- [`docs/briefs/043-medium-tier-wave-4.md`](docs/briefs/043-medium-tier-wave-4.md)
  `decomper`, shipped in PR #338. **9 byte-identical matches at
  100% per-attempt yield.** W-A unblock confirmed first-try via
  C-9. Medium tier 69.9% → 75.6%. Decomper is on a streak.
- [`docs/briefs/042-codegen-walls-w-abcd.md`](docs/briefs/042-codegen-walls-w-abcd.md)
  `cloud`, shipped in PR #334. 310-line update to codegen-walls.md
  documenting W-A..W-D + coercion attempts. **W-A flipped to C-9
  coercible** (uninitialised temp trick); **W-B verified
  byte-identical via mwcc 1.2/sp3** (T-3 tooling-tractable —
  triggered brief 044). W-C T-3+P-7 hybrid. W-D true permanent
  (P-8).
- [`docs/briefs/041-medium-tier-wave-3.md`](docs/briefs/041-medium-tier-wave-3.md)
  `decomper`, shipped in PR #335. **8 byte-identical matches
  across 4 modules** (main + ov005 + ov006 + ov011). Medium
  tier 64.7% → 69.9%. New source-shape lesson: declaration
  order controls callee-save register allocation. Provisional
  new wall flagged on `func_0201904c` (clamped 16-bit add); brief
  044 picks it up as part of the sp3 sweep.
- [`docs/briefs/040-medium-tier-wave-2-retry.md`](docs/briefs/040-medium-tier-wave-2-retry.md)
  `decomper`, shipped in PR #332. **7 byte-identical matches
  (64% yield)** via the now-working `.legacy.c` pipeline. First
  validation of the Style A unblock chain end-to-end. Source-
  shape lessons captured: twin functions can want opposite C
  shapes; `unsigned short` return type controls halfword extend
  emission. 4 walls (W-A..W-D) documented for brief 042.
- [`docs/briefs/039-objects-txt-legacy-patch.md`](docs/briefs/039-objects-txt-legacy-patch.md)
  `cloud`, shipped in PR #330. `tools/patch_objects_legacy.py`
  post-process script + 20 unit tests. Chained into the lcf
  ninja rule. **Brain ran brief 038's exact reproducer end-to-
  end before merging this time** — link step succeeded; arm9.lcf
  and objects.txt now agree on `.legacy.o`. Style A unblock
  chain end-to-end working.
- [`docs/briefs/038-medium-tier-wave-2-dual-compiler.md`](docs/briefs/038-medium-tier-wave-2-dual-compiler.md)
  `decomper`, **escalation closed in PR #328**. 0 byte-identical
  matches; blocked on the `dsd lcf` filename inconsistency.
  Empty commit; bug analysis is the deliverable. Triggered
  brief 039.
- [`docs/briefs/037-dual-compiler-routing.md`](docs/briefs/037-dual-compiler-routing.md)
  `cloud`, shipped in PR #327. Per-TU dual-compiler routing via
  `*.legacy.c` filename convention. **Brain merged this without
  running the brief's required end-to-end smoke test** — the
  test would have caught the `dsd lcf` inconsistency that
  blocked brief 038. Brief 039 is the post-process workaround;
  the routing core itself is sound.
- [`docs/briefs/036-style-a-epilogue-research.md`](docs/briefs/036-style-a-epilogue-research.md)
  `cloud`, shipped in PR #325. **Style A wall fully diagnosed** —
  mwcc 1.2/sp2p3 emits Style A; mwcc 2.0 (all SPs) and
  1.2/sp3+ emit Style B. Verified byte-identical against 2 of
  brief 034's targets. Matches pokediamond's dual-compiler
  pattern. Brief 037 (cloud) operationalises; brief 038
  (decomper) consumes.
- [`docs/briefs/035-codegen-walls-c1-refinement.md`](docs/briefs/035-codegen-walls-c1-refinement.md)
  `cloud`, shipped in PR #322. Refined codegen-walls.md C-1
  with the ≤3-op if-body predication threshold + new P-6
  permanent entry. Quantification updated: permanent 29 → 32
  drops (62% → 68%), coercible-but-missed 9 → 6 drops (19% →
  13%).
- [`docs/briefs/034-medium-tier-wave.md`](docs/briefs/034-medium-tier-wave.md)
  `decomper`, shipped in PR #323. **0 byte-identical matches**
  but discovered the **Style A vs Style B epilogue wall** —
  blocks every IRQ-bracket / Task-Locked / Fill32-pattern
  medium-tier candidate attempted. Empty commit; the analysis
  IS the deliverable. Triggered brief 036 (cloud research)
  immediately.
- [`docs/briefs/033-cluster-prop-final-med.md`](docs/briefs/033-cluster-prop-final-med.md)
  `decomper`, shipped in PR #320. **3 byte-identical matches at
  18% yield** — second below-floor pilot, BUT the PR delivered a
  research-grade post-mortem: cluster turned out to be brief 028
  residue re-fingerprinted; codegen-walls.md workflow validated
  (cross-reference-before-iterate saved hours); concrete C-1
  refinement proposal (predicated-exec ≤3-op limit) handed to
  brief 035; explicit pivot-to-medium-tier recommendation.
- [`docs/briefs/032-consolidate-codegen-walls.md`](docs/briefs/032-consolidate-codegen-walls.md)
  `cloud`, shipped in PR #317. 641-line research note at
  `docs/research/codegen-walls.md`; 15 codegen walls classified
  into coercible-with-knowledge (8, accounting for 19% of past
  drops), permanent (5, 62%), and edge cases (3, 17%). Plus 2
  tooling-tractable proposals for follow-up. Brain auto-fixed
  MD031 lint in the file post-merge.
- [`docs/briefs/030-cluster-prop-next-med-2.md`](docs/briefs/030-cluster-prop-next-med-2.md)
  `decomper`, shipped across PR #313 (10 matches @ 71% on
  `func_02001e84`), PR #315 (2 matches @ 22% — below floor on
  HIGH rank-#8 escalation), and PR #318 (24 matches @ 77% on
  rank #1 `func_02033f10` — option-B recovery). Self-extend
  pattern fully tested across 3 PRs; produced both wins and the
  first below-floor escalation. Pattern stays per-brief for now,
  not graduated to AGENTS.md yet.
- [`docs/briefs/029-cluster-prop-next-med.md`](docs/briefs/029-cluster-prop-next-med.md)
  `decomper`, shipped in PR #311. **21 byte-identical matches at
  70% yield** on rank-#2 `func_02001d84` (default suggestion;
  doubled the predicted MED 37%). 16 distinct shape templates;
  selection-rule trace in PR body validates the brief's
  filtering.
- [`docs/briefs/028-cluster-prop-ov006-021c81a4.md`](docs/briefs/028-cluster-prop-ov006-021c81a4.md)
  `decomper`, shipped in PR #309. **27 byte-identical matches at
  61% yield** on ov006 cluster #1 — 3x the predicted 20% LOW,
  comfortably above brief 023's 40-60% calibration. 18 distinct
  shape templates across two passes; honest stop at 27 because
  remaining 17 had clear codegen-quirk reasons. Per-target time
  1.8x brief 027 (within stop-guidance).
- [`docs/briefs/027-cluster-prop-ov006-021b7ce0.md`](docs/briefs/027-cluster-prop-ov006-021b7ce0.md)
  `decomper`, shipped in PR #306. **32 byte-identical matches at
  94% yield** on ov006 cluster #2 — way past brief 023's 40-60%
  calibrated band. First real-world validation of
  `find_shape_templates.py`. Honest workflow note: tool useful
  for cluster orientation, asm-read still the bottleneck on the
  C-write step.
- [`docs/briefs/026-wine-migration-prep.md`](docs/briefs/026-wine-migration-prep.md)
  `cloud`, shipped in PR #307. Migrated macOS brain onboarding
  off `wine-stable` (disabled 2026-09-01) onto **Gcenx's Game
  Porting Toolkit cask**. Brain locally verified end-to-end
  (24/27 baseline preserved with the new wine binary; 20 unit
  tests including 4 new `TestResolveMacosWine` cases pass).
  AGENTS.md *Brain onboarding* step 6 + *Wine on macOS* section
  updated by cloud as part of the PR.
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
