# Round 0905 — resume point (paused 2026-08-31 ~23:20, Mac M1, brain=Opus 5)

Paused for the night mid-round. Nothing is broken; nothing is half-written to
the repo. Everything below is the exact state to pick up from.

## Do these three things, in order

1. **Merge PR #1619** (`brain/round-0905`) once its `unittest` check is green.
   It was left OPEN only because the repo does not allow auto-merge and the
   check takes ~6 min. Everything else on it was already green, and all four
   drift checks + ruff + markdownlint were verified locally before push.
   ⚠️ Until it merges the decomper queue is `TODO=0`, and the Decomper kickoff's
   preflight will correctly abort on `work_queue.py next decomper --claim`.

2. **Re-run the 3-region gate** — `python3.13 tools/gate3.py --scope all` from
   `brain/`. It was killed mid-USA to free the machine. `build/` is warm, so it
   resumes incrementally rather than rebuilding from scratch.
   Result so far, from the killed run against `1592a2568`: **`[eur] SHA1 PASS`**.
   USA and JPN were never reached. Do not quote a 3-region baseline until they are.

3. **Send both kickoffs**, Decomper first (build-free, can start immediately
   after #1619 merges), Scaffolder once the gate has released the compiler.
   Both files sit beside this one and both pass `tools/kickoff_lint.py` 8/8.
   Re-lint before sending if anything on `main` moved.

## What already landed tonight

- **PR #1615 merged** — `main` at `5b865162b`. The two defects that held it are
  fixed; round 0903's `python3.13` reservation is intact and was verified on the
  Mac. The defect was host-independent, not Linux-specific.
- **PR #1619 open** — round 0905 in `state.md`, the dispatch row, and
  `q-handoff-guard-repair` promoted from prose to a real queue item.
- Five spent `claude-decomper-batch*` worktrees removed (~470 MB).

## Two things the next brain should not have to rediscover

- **The `m2ctx.py` gcc blocker is a property of the Windows PC, not the tool.**
  On this Mac `build_context('eur','ov002')` returns a real 5,035 B context at
  `build/eur/_m2c_ctx/ov002_core.ctx.c`; `main` correctly returns `None`. If the
  round moves back to Windows, the Scaffolder kickoff's m2ctx section is wrong
  and must be reverted to the round-0904 wording.
- **⚠️ Unexplained bulk worktree reset** at 22:56 on 2026-08-31: all nine
  non-brain worktrees were hard-reset to `origin/main` by something outside the
  brain session. No work was lost, but "this branch is merged" is no longer
  independent evidence for those nine, so the local branch namespace was
  deliberately left untouched. If it happens again, find the cause before
  trusting any local branch state.

## Machine state

All worktrees clean. No build, gate, or CI-watch process left running.
`claude-decomper-queue` is parked on `brain/round-0905`; return it to `main`
after #1619 merges.
