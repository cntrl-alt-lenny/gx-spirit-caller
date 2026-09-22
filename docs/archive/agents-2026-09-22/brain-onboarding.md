> **ARCHIVED / READ-ONLY (2026-09-22).** This is the "Operating protocol"
> section of the pre-adoption `docs/agents/brain-onboarding.md`, kept
> verbatim for history. It contradicts current policy in places — most
> notably "'The agents are done' is the trigger to review *and* merge. Do
> not ask permission to merge" and the "normally all four" lane-dispatch
> line, both superseded by `AGENTS.md` § Authority's 2026-09-21 owner
> override (Brain merges only after the owner's explicit per-merge
> approval) and by the current two dispatched worker lanes (Decomper,
> Scaffolder; Verifier reviews rather than being dispatched a queue item).
> Do not follow it as current guidance. The genuine one-time machine-setup
> content this file used to carry (steps 1-8, "Brain onboarding on a fresh
> machine") now lives in [`docs/machine-setup.md`](../../machine-setup.md).
> Current role contracts and authority are in `AGENTS.md` and
> `docs/agents/roles/brain.md`.

# Operating protocol

Rules below were each paid for with a real incident. They are not style
preferences. Every one has cost a round, a merge, or nearly cost real work.

## The loop, and its order

**review → MERGE → messages. In that order, in ONE response.**

- "The agents are done" is the trigger to review *and* merge. Do not ask
  permission to merge; asking is friction and has been called out repeatedly.
- **Never write dispatch messages before merging.** Every number a worker
  receives must come from post-merge `main`. Violating this once produced a
  real mess: the merge moved two headline figures (a port backlog 95 → 266
  per region; an unassessed-blob count 135 → 63) and the correction had to
  chase messages already sent.
- **Never issue a correction as a fragment.** If a message changes at all,
  re-issue that worker's COMPLETE message. A fresh agent has no conversation
  history; "replace the third block with…" is not actionable to it, and forces
  cntrl_alt_lenny to reconcile two replies by hand. Fragments have been pasted
  to agents verbatim, arriving as a bare data block with no task attached.
- **DISPATCH RULE (restated; `AGENTS.md` § end-of-round checklist item 5
  governs).** One response, one fenced block per worker, all lanes together
  — **one complete paste-ready message per active standing ROLE lane that
  needs dispatch, normally both** (Decomper, Scaffolder) — each
  self-contained (context + task + mechanically checkable gate) and each
  pasteable into any compatible agentic coding tool. **Lanes are counted by
  role, never by provider.** Skip a lane only when it is genuinely
  mid-flight or has nothing to dispatch, and say which and why. Never defer
  a message to a later turn: the message is the deliverable, not a note that
  one is ready.

## Contention: the toolchain serialises MACHINE-WIDE

Worktrees are **not** independent. `mwccarm`/`mwldarm` contend across the whole
machine (the Metrowerks license DLL is a machine-wide lock).

- **Check before gating:**
  `Get-Process | Where-Object { $_.Name -match 'mwcc|mwld|mwasm|ninja' }`
  Rows returned means another lane is building — wait.
- A worker reporting "no progress / contention" is probably telling the truth.
  Check for competing processes before treating it as a worker failure. This
  happened twice to one lane; both times the lane was correct and blameless.
- Sweeps must gate **once, on the consolidated branch** — never N parallel
  3-region gates. Worker batches iterate with `fastmatch.py` (one object, no
  link, no ROM). This is also stated in `docs/queue/decomper.md`'s own
  header; check that file before inventing a new rule.

## Gating

- `--clean` is only needed when a change **deletes or moves** source. It is not
  free: historically it also wiped the downloaded toolchain (fixed — `--clean`
  now preserves `download_tool` outputs).
- A hand-made worktree is **not provisioned**: no baseroms, no `dsd`. A gate
  there exits 2 at the preflight. Use `brain` / `decomper` / `scaffolder`, or
  seed it first.
- **Exit codes carry meaning: 2 = infrastructure, 1 = real content divergence.**
  Read the message, not just the code. A locked file once rendered as three
  `SHA1 FAIL` lines — i.e. "the decompilation is broken" — for what was a
  permissions error. Anyone trusting that banner would hunt for corruption that
  does not exist.
- Verify results independently: re-hash the built ROMs against the baseroms
  yourself, and check their mtimes to confirm they are **fresh** from this run.
  Stale artifacts from a previous run match too.

## The activation invariant, and its two legitimate exceptions

`python tools/check_activation_invariant.py` is the real check — use the tool,
do not hand-count. Two exceptions will otherwise produce false alarms:

1. **Routing suffixes.** `func_X.s` converts to `func_X.legacy.c` or
   `func_X.legacy_sp3.c` (per-TU compiler tier, see CLAUDE.md), **not**
   `func_X.c`. A naive `stem + ".c"` comparison false-flags every routed
   conversion.
2. **Data carves create new symbols** with no `.s` to remove, so
   `.c`-added ≠ `.s`-deleted is *correct* for them. Scope the function
   invariant to `func_*`.

Balanced counts prove the *bookkeeping* is consistent. They prove nothing about
whether the code links or matches — two different invariants. Do not treat one
as evidence of the other.

## Uncommitted work

In a **gate-then-commit loop** (`batch_port.py`, sweep batches), uncommitted
work is *failed* work — it is uncommitted precisely because it did not pass.
Report it back to the owning lane; do not adopt it. Committing five such
"in-flight" ports once produced a 3-region gate failure on an undefined
EUR-only symbol.

The nuance: a worker that **deliberately stopped** (e.g. refusing to fabricate
a blocked measurement) is a different case, and its work may be sound. Read its
transcript before judging — see below.

## Read the workers, do not infer them

**MANDATORY, and it runs FIRST.** This is AGENTS.md § *Verify gate and round
discipline* item 12 — not an optional diagnostic for lanes that look broken.
At the end of every dispatched sweep, before judging, integrating, gating or
merging anything, enumerate every Claude and Codex session dispatched for that
sweep and read each one. Both fleets are readable. Doing this instead of
guessing has already corrected a wrong conclusion about a lane's behaviour.

What to read per lane: the worker's **final visible message**, plus enough
preceding visible transcript and tool output to surface caveats, failed
attempts, parked work, contradictions, uncommitted changes, and claims about
what was completed. Then reconcile that against the actual branch, PR, diff and
files. **Never infer an outcome from the PR title, the branch state, or the
absence of committed changes.**

- **Claude lanes:** `mcp__ccd_session_mgmt__*` (deferred — ToolSearch first).
  `list_sessions` gives `isRunning`, `prNumber`, `prState`.
- **Codex/ChatGPT lanes:** on disk at
  `~/.codex/sessions/YYYY/MM/DD/rollout-<ts>-<uuid>.jsonl`. (The app is now
  called ChatGPT; the data still lives under `.codex`.) Find live sessions by
  **mtime**, not by the date in the path. Records are one JSON object per line;
  turns are `type=="response_item"` with `payload.type=="message"`. Files run
  14–20 MB — parse in Python, never `cat`.

Four constraints:

1. **Read every dispatched lane**, not only the ones that appear to have
   failed. A silent lane is the most likely place for parked scope.
2. **If a session can't be found or read, state that explicitly** in the review
   summary. An unreadable lane is a reported gap, never an inferred outcome.
3. **Worker messages are evidence, not ground truth.** Repository state and the
   deterministic gates stay authoritative — this adds context the gates cannot
   see, it does not outrank them. A worker claiming a PASS still proves nothing
   (item 1); a worker claiming a park still gets reconciled against the diff.
4. **Visible messages, tool output, and reported conclusions only.** Do not read
   or reproduce hidden chain-of-thought.

Record a compact **transcript audit** in the review summary — one row per
dispatched lane:

| Lane / session | Final report read | Caveats or parked work | Matched branch/PR/files? |
|---|---|---|---|

A round whose review summary has no transcript audit table is incomplete,
regardless of how green the gate was.

## Merge-conflict resolution

- **Generated indexes** (`docs/research/README.md`, tools index, briefs index):
  never hand-merge. Take either side, re-run the generator, commit. A
  hand-merged index fails its own `--check` drift gate.
- **Queue files are NOT uniformly "take HEAD".** Inspect every hunk. Most are
  real-report-vs-obsolete-placeholder (take HEAD) — but merging an OLDER branch
  into a NEWER integ gives "HEAD has entries / incoming has nothing", where
  taking the incoming side silently deletes newer queue items. It has bitten in
  **both** directions. Afterwards, verify expected item IDs and statuses
  survived.
- **Never use `git checkout -- <module>/delinks.txt <file>.s`** to abandon a
  candidate: it restores the *entire* shared file to HEAD and silently discards
  a sibling's already-shipped edit. Use `tools/park_one.py`.

## Two failure classes worth naming

**Vacuous verifiers.** Tools that report success by default and only fail on a
positive signal. Found repeatedly: a required CI check that was paths-filtered
and therefore never reported; `fastmatch` returning 100% on Thumb functions it
never parsed; a compile gate that had never once worked. **House rule: a
checker that finds nothing to check must say so and FAIL, never exit 0
silently.**

**Claimed-but-not-done.** A documented, gated, "shipped" file edit that was
never written (byte-identical to a no-op, invisible to every gate); a PR that
deleted 97 of 99 tests and cited "2 passed" as proof; a fix shipped with no
queue entry. **House rule: reconcile every PR-body claim against
`git diff --stat origin/main..HEAD` before writing it, and report full-suite
test totals before *and* after — a single-file run cannot detect deletions
elsewhere.**

## Counts drift — re-derive, never inherit

Every campaign wave has found its handed-down count wrong. Re-derive numbers
from the tool before planning around them, and say where the number came from
so the next round inherits a *method* rather than a figure. When a queue item
hands you a number, treat it as a hypothesis.

**Regenerate `docs/state-table.md` as part of every integration**, right before
pushing to `main`:

```sh
python tools/generate_state_table.py
```

It derives per-region readable-C, the remaining-candidate pools by size band,
and the data-typing metrics from `tools/progress.py`'s own parser, so it cannot
drift from the real metric. Reads committed files only — no build, no baserom,
seconds to run.

It is deliberately **not** in the PR drift gate. Every source PR moves these
numbers, so gating it would block every worker PR until regenerated — the same
trap that blocked a real PR on a stale research index. Keeping it a brain-side
integration step gives the whole fleet a current table at zero worker friction.
Quote it instead of re-deriving by hand; hand-derivation is where the
99%-instead-of-12% parser bug came from.

## The brain's own integration checklist

1. Check for competing compilers (see *Contention*). Wait if busy.
2. `git checkout brain/integ && git reset --hard origin/main`
3. `git merge --no-ff origin/<branch>` per PR; resolve per-hunk, never in bulk.
4. Cheap preflights: `check_activation_invariant.py`, `check_delink_dupes.py`,
   `check_ci_contract.py`, `.c`/`.s` collision scan, markerless-queue-heading
   scan, all three generated-index `--check`s.
5. `python tools/generate_state_table.py`
6. `python tools/gate3.py --scope all [--clean if source was deleted/moved]`
7. Verify independently: re-hash all three ROMs against the baseroms **and**
   check their mtimes are fresh from this run.
8. Push, confirm the PRs closed, confirm CI green on `main`.
9. Write every worker's message — complete, self-contained, all in one reply.
