[//]: # (moved verbatim from AGENTS.md 2026-07-15 — Codex 32KB instruction-cap diet)

# Brain onboarding on a fresh machine


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
     [`docs/research/wine-migration.md`](../../docs/research/wine-migration.md).
7. **Confirm the baseline.** Run the full 3-region gate:
   `python tools/gate3.py` (reconfigures + clean-tree `ninja sha1` for
   eur/usa/jpn, then the pytest suite). All three regions rebuild
   byte-identical and **all 27 modules × 3 regions check green** — a diverging
   region or a `dsd check` regression is a REAL break, not an expected
   artifact. (The old "24/27, main/DTCM/ov004 expected to fail" baseline is
   obsolete — those closed in briefs 138–140.)
8. **Read [`docs/state.md`](../../docs/state.md)** and tackle whatever the
   *Next-brain TODO* section lists.

Afterwards, your loop is: fetch, read `docs/state.md`, review any open
PRs (`gh pr list --state open`), verify them locally (configure +
ninja rom + `./dsd.exe check modules -c config/eur/arm9/config.yaml`),
merge or comment, update `docs/state.md`, write briefs for cntrl_alt_lenny to
paste to other agents, repeat.

---

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
- One response, one fenced block per worker, all lanes together, each
  self-contained (context + task + mechanically checkable gate).

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
  link, no ROM). This is also stated in `docs/queue/claude-decomper.md`'s own
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
