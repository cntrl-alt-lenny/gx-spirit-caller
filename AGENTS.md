# AGENTS.md — who's working on what

Coordination manifest for every AI agent contributing to this decomp
(Claude, Codex, future ones). **Every agent reads this before starting
work** and updates it when their scope changes.

For humans: this is a plain-English map of which agent owns which parts
of the repo, so two agents don't edit the same file and clobber each
other's work. Leona edits it indirectly by telling the "brain" agent
in plain English — see *Adding or retiring agents* near the bottom.

## Active agents

| Slug              | Role                                                                                    | Owns these paths                                                                 | Hands-off paths                                   |
|-------------------|-----------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|---------------------------------------------------|
| **leona**         | Human project owner. Sets priorities, merges PRs, adds/retires agents, final authority. | —                                                                                | —                                                 |
| **claude-cloud**  | The **brain**. Coordinator. Maintains this file, writes task briefs for other agents, reviews PRs, builds shared tooling and library scaffolding. | `tools/`, `libs/`, `include/`, `AGENTS.md`, `CLAUDE.md`, `docs/` (if created)     | `src/`, `config/**/symbols.txt` (except renames explicitly authorised) |
| **claude-pc**     | Primary decomper. Matches individual functions against the baserom, writes C source, renames symbols as functions match. | `src/`, `config/<ver>/**/symbols.txt` (renames), `assets/`                        | `tools/`, `libs/`, `include/`, `AGENTS.md`        |

Extend this table when a new agent joins; see *Adding or retiring
agents* below.

## Rules every agent follows

1. **Before starting any task**, run `git fetch origin` and read this
   file (top to bottom). State on disk may be behind what's on GitHub.
2. **Never push to `main` directly.** Every change is a pull request.
   Leona merges. This is the only review checkpoint, so it matters.
3. **One branch per task.** Branch name = `<agent-slug>/<kebab-scope>`,
   e.g. `claude-pc/ov005-decomp`, `claude-cloud/symbol-analyzer`.
   One branch, one PR, one concern.
4. **Stay inside your "Owns" column.** If the task needs a change in
   another agent's territory, either open a PR in that agent's scope
   (as them, not you) or ask Leona / the brain to re-partition.
5. **Open a PR when done.** Don't merge your own PR. Don't force-push.
   Describe in the PR body: what changed, why, any follow-ups.

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
4. The brain reviews. Leona merges.
5. After merge, delete the branch (GitHub offers a button).

## The "brain" role

Currently held by `claude-cloud`. Responsibilities:

  - Keeps **AGENTS.md** current (this file).
  - Writes **task briefs** for other agents on request — a short spec
    with scope, non-scope, success criteria, suggested branch name,
    and the files they'll touch.
  - Reviews PRs from every agent.
  - Flags scope violations politely and suggests how to re-slice.
  - Does **not** set product priorities; that's Leona's call.

The role is tied to the repo, not a specific Claude conversation —
any fresh Claude session that reads this file picks it up.

## Adding or retiring agents

Leona says, in plain English, something like:

> *"Add Codex as an agent. It'll generate NitroSDK header declarations
> under `libs/nitro/include/nitro/`. Move that path off Cloud."*

The brain then:

1. Adds a row to the *Active agents* table with the new slug, role,
   owned paths, hands-off paths.
2. Moves any overlapping paths off other agents so nothing is double-
   owned.
3. Opens a PR with the change. Leona merges.
4. Writes the first task brief for the new agent.

To retire or pause an agent, move the row to a new *Retired agents*
section at the bottom with a one-line note. Don't delete history.

## Task briefs

When the brain writes a task for another agent, it goes here. Format:

```
### <agent-slug>/<scope>

**Goal:** one sentence describing what's being built.
**Scope:** files / directories this task may touch.
**Non-scope:** explicit "don't touch these".
**Success:** how we'll know it's done (tests pass / PR merges cleanly / etc).
**Branch:** suggested branch name following the convention above.
```

(Empty at the moment — briefs arrive as tasks are scoped.)

## Retired agents

(none yet)

## Existing branches at time of writing

For reference — these predate the manifest and stay as-is:

  - `claude/symbol-analyzer` — Cloud's decomp-target analyzer
    (`tools/analyze_symbols.py`). Awaiting merge.
  - `claude/libs-nitro-scaffold` — Cloud's NitroSDK + CRT header
    scaffolding. Awaiting merge.

Future Cloud branches will use the `claude-cloud/` prefix.
