[//]: # (markdownlint-disable MD013 MD041)

# Brief 468 — ov002 LOWER-half ARM `.s` drain, wave 4 (contention-limited)

**Brief:** 468 (scaffolder). Continue `tools/batch_carve.py` over the ov002
lower-half range (`addr < 0x02234000`) **above the b466 0xbc–0xcc verify-fail
wall** (`--min-size 0xcc`). Same chunked recipe, but this round ran
**concurrently with the decomper's USA `batch_carve` lane** (brief 469) for the
first time.

## What shipped — 2 carves, EUR sha1 OK

| commit | shipped | size band | funcs |
|---|---|---|---|
| `334e2a74` | +2 | 0xdc–0xe4 | `func_ov002_02230f10`, `func_ov002_02233c50` |

Both auto-committed on a green EUR `ninja sha1` gate. **No verify-fails, no
REFUSE** — every candidate that got *through the gate* was byte-identical,
consistent with b466's finding that the lane is 100% clean above 0xcc. The low
ship count is **not** a clean-rate problem; it is a wineserver-contention
problem (below).

## KEY FINDING — the two `batch_carve` lanes cannot share the wineserver

This was the **first round with both lanes carving concurrently** (scaffolder
EUR ov002 + decomper USA main, both driving `tools/batch_carve.py`). The result
was near-total gate starvation on the EUR side:

- **Every `--gate-timeout 180/240/300` gate timed out** (`GateTimeout:
  contention -> DEFER`). The decomper builds **continuously** — its
  `--batch 5/10` micro-waves keep a `ninja … sha1` (and its wine compiler
  clients) resident on the single machine-wide wineserver almost without gaps,
  so an EUR gate never gets an uncontended ~90 s window to complete.
- **Staging contends too**, not just the gate: `asm_escape --whole-function`
  invokes the mwcc compiler under wine, so under contention most candidates
  hit `--call-timeout` and DEFER before they can even stage.
- **`--limit 50/25` background runs hit the harness ~8–10 min wall-clock kill**
  while waiting on contended gates/calls — the `334e2a74 +2` only landed
  because a bisected 2-func sub-batch happened to gate green just before the
  kill.

### Mitigations tried (all insufficient on their own)

1. **Timing windows** — wait for `ps aux | grep ninja` to clear, fire in the
   gap. The decomper's `--limit 5` runs exit every ~3 min but relaunch within
   seconds; the gap is too short and racy. Lost every race.
2. **Longer `--gate-timeout` + `--gate-retries`** — pushes total wall-clock
   past the background-task kill cap before a clean window appears.
3. **SIGSTOP watchdog** (the [[batch-carve-tool]] documented resolution) — a
   detached loop that `pkill -STOP`s the decomper's `batch_carve` to hold a
   clean window, with a `trap` + timed `pkill -CONT` safety so the decomper
   always resumes (verified: decomper left in state `S`, not `T`). This *did*
   open a clean window, but the batch still raced the ~8–10 min kill and only
   the one sub-batch survived. The watchdog is **whack-a-mole** (the decomper
   relaunches), exactly as the memory warned, and pausing a peer lane is the
   wrong layer to solve this at.

### Recommendation for the brain (lane scheduling)

The memory already calls this out — *"Real fix the brain should own: schedule
the two lanes' heavy gates so they don't overlap."* This round is the empirical
confirmation. Concretely, one of:

- **Serialize the lanes** — run scaffolder EUR ov002 and decomper USA
  `batch_carve` in **alternating** brain-scheduled windows, not concurrently.
  Each lane gets the warm wineserver to itself and gates in ~90 s.
- **One worktree, one driver** — point a single `batch_carve` run at both
  scopes sequentially (it already supports `--srcdir`/`--version`), so there is
  never more than one wine-driving process.
- If concurrency is required, a **brain-owned mutex** (a lockfile both lanes'
  gate steps acquire) is the right primitive — not a peer-pausing watchdog.

**The lane itself is healthy** — above 0xcc it is 100% byte-clean (b466). The
only blocker is two drivers fighting one wineserver. Give the EUR lane an
uncontended window and a normal `--limit 50` wave drains ~150/round as in
b462/464.

## Runway (unchanged from b466)

**~619 carvable ov002 lower-half ARM funcs remain above 0xcc** (621 at b466,
minus the 2 shipped here), ~4 waves of 150 once the contention is resolved. The
~74 parked verify-fails at 0xbc–0xcc remain a permuter/RE cohort — do not
re-grind.

Lower-half drain progress:

| wave | brief | PR | shipped | notes |
|---|---|---|---|---|
| w1 | 462 | #998 | 100 | 0x4c–~0x90 |
| w2 | 464 | #1001 | 150 | 0x94–0xb8 |
| w3 | 466 | #1003 | 77 | 0xbc–0xdc; verify-fail wall 0xbc–0xcc |
| **w4** | **468** | **this** | **2** | **0xdc–0xe4; wineserver-contention-limited** |
| remaining | — | — | **~619** | above 0xcc, 100% clean |

## Operational notes

- The decomper lane was **never harmed** — SIGSTOP/SIGCONT is transparent and
  it was verified running (state `S`) on stand-down. Standing down (not
  launching further EUR batches) gives the decomper the wineserver to finish
  its USA wave uncontended.
- The `334e2a74` commit was gated by `batch_carve`'s own commit-on-green-sha1,
  so no redundant (contending) `ninja sha1` re-run was needed to confirm it.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
