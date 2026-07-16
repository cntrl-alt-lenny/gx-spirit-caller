# Two Codex lanes at `-j4` each vs. one lane at `-jN` solo — a controlled experiment

**Status:** build-free experiment design, 2026-07-01. This lane does not
run builds; the brain executes this protocol and records the results.

---

## 0. What this experiment is actually testing (read before running)

`-j` is ninja's *own* internal parallelism — how many independent build
edges (compile/link/objdiff jobs) it runs at once. The tight
edit-build-verify loop for a single candidate (`ninja` → `ninja objdiff`
→ `ninja report`/diff → `ninja sha1`) is **mostly a serial dependency
chain for that one candidate** — one file compiles, then links, then
gets hashed — so raising `-j` mostly helps when there's a *backlog* of
independent work to fan out (an initial full build, or committing a
batch of N already-written candidates together, per
[`speedup-roadmap.md`](speedup-roadmap.md)'s sha1-batching lever), not
the single-candidate loop itself.

So "two lanes at `-j4` each vs. one at `-jN` solo" is really two
different things bundled together, and this experiment has to separate
them or the result will be uninterpretable:

1. **Agent-count parallelism** — two independent Codex workers editing,
   building, and verifying *different* candidates at the same time.
   This is where brief 486's dual-lane contention was found (see §1) —
   and that contention was **I/O-bound, not CPU-bound**: two lanes each
   hammering the disk with thousands of small file ops (plus, suspected,
   Windows Defender real-time scanning every write) starved each other
   while the CPUs sat "near-idle... ~8s CPU over a 50-min window."
2. **Ninja's own `-j` setting within each lane** — a secondary,
   lower-order effect that mostly matters for each lane's own bulk
   operations, not the tight loop.

This experiment's primary question is (1). It controls (2) by fixing
`-j4` per lane in the parallel arm (a conservative share of the
machine's 16 logical cores, leaving headroom for the OS + the other
lane) and `-jN` (`N = 14`, cores − 2, matching this project's own
concurrency convention elsewhere) in the solo arm.

---

## 1. Prior art — this has already happened once, for a different workload

Briefs 486 and 493 (USA/JPN `.s` carving via `batch_carve.py`, not the
current C-match campaign) already ran exactly this comparison
empirically, unintentionally:

- **Brief 486** ran the overlay `.s`-carve lane *concurrently* with the
  decomper's own USA/JPN main `batch_carve` lane. Result: **~0.5 `.s`/min
  steady state** (vs. an expected much higher rate), both lanes' CPU
  usage near-idle, "blocked-waiting on I/O / file-scan, not computing."
  Windows Defender real-time protection was flagged as the prime suspect
  (exclusion status unknown — "needs admin to view/set," never resolved
  as of that brief). The brief's own recommendation: **serialize the two
  lanes**.
- **Brief 493** re-ran the same class of work **solo** (the other lane
  doing unrelated low-I/O tooling work instead of also carving) and got
  **full speed, 0 gate-fails, 0 verify-fails** — "the contention was the
  bottleneck, not the lane."

This is real, on this machine, already-collapsed-once evidence that two
concurrent lanes *can* starve each other via I/O, not CPU. But
`batch_carve.py`'s workload (mass small-file `.s`/`.o` writes, one
`mwasmarm` spawn per function) is shaped very differently from the
current C-match campaign's workload (one `.c` edit → one `mwcc` compile
→ one `mwld` link → occasional `dsd rom build` + hash, per candidate,
with many more compiler-cycle-seconds per file touched and far fewer
files touched per unit of work). **It is not safe to assume brief 486's
finding transfers unchanged** — the C-match loop could be far more
CPU-bound (favoring parallel lanes) or could hit the exact same
Defender/disk wall (favoring serial). That is what this experiment
settles.

---

## 2. Setup

- **Candidate pool:** pick 60 not-yet-attempted EUR HIGH-tier candidates
  (class A/B) from `docs/research/dossiers-high/INDEX.md`, in INDEX
  order, skipping anything already parked/matched. Split into three
  **disjoint** sub-pools of 20 (Pool-1, Pool-2, Pool-3) so no candidate
  is ever attempted by two arms — a shared candidate would let one
  arm's outcome leak into the other's timing.
- **Worktrees:** use two of the repo's existing git worktrees for the
  parallel arm (e.g. `decomper` and `scaffolder` — already independent
  working directories with independent `build/` output dirs, so this
  also implicitly tests whether worktree isolation is enough to dodge
  the brief-486 wall, or whether the contention is at the physical-disk
  /Defender level and worktree separation doesn't help). Use a single
  worktree for the solo arm, run at a different time (not concurrently
  with anything else).
- **Ground rules held constant across all arms:** same starting `main`
  commit, same machine, same time-of-day class (avoid comparing a
  night-time serial run against a daytime parallel run if anything else
  competes for the machine), dossiers already available for every
  candidate in the pool (so dossier-lookup time doesn't confound the
  measurement — this experiment is about build/verify throughput, not
  authoring quality).

## 3. Protocol A — parallel (two lanes, `-j4` each)

1. Start both lanes within the same 5-minute window.
2. Lane-1 (worktree `decomper`) works Pool-1, `.claude`/build invocations
   capped at `ninja -j4`.
3. Lane-2 (worktree `scaffolder`) works Pool-2, also `ninja -j4`.
4. Run for a **fixed wall-clock window of 90 minutes** (not a fixed
   candidate count — see §5 on why).
5. At T+0, T+30, T+60, T+90 minutes, sample CPU utilization:

   ```powershell
   Get-Counter '\Processor(_Total)\% Processor Time' -SampleInterval 2 -MaxSamples 5
   ```

   (or Task Manager → Performance tab, eyeballed) — this is the brief-486
   tell: if CPU sits under ~30% while both lanes are actively working,
   that's the I/O-bound signature recurring.
6. At T+90, stop both lanes. Record, per lane: candidates attempted,
   candidates confirmed matched (objdiff 100% **and** regional
   `ninja sha1` OK — the brief-509 gate, not just objdiff), candidates
   parked, any exit-127/timeout deaths (the brief-486/482/484 recurring
   failure signature).

## 4. Protocol B — serial (one lane, `-jN` solo)

1. One lane (any single worktree), Pool-3, `ninja -j14` (cores − 2),
   **no other lane building concurrently** for the duration.
2. Run for the same **fixed 90-minute window**.
3. Same CPU sampling cadence (expect this to run hotter than Protocol A
   if the machine is actually CPU-limited rather than I/O-limited for
   this workload — a useful cross-check).
4. Record the same per-lane metrics as Protocol A.

## 5. Trials

Run **each protocol twice**, on different days or at least separated by
several hours (4 sessions total: A1, A2, B1, B2). Brief 486 documented
"variable 0.2–2.0" throughput swings for the *same* contended condition
— a single sample of either protocol is not enough to trust. Use a fixed
wall-clock window (not a fixed candidate count) per run so the
"confirmed matches / hour" metric is directly comparable without needing
to normalize for stopping-time effects (a candidate count target lets a
lucky streak of easy candidates finish early and understate the
protocol's true rate, or an unlucky streak run long and overstate it).

## 6. Metrics

For each session, compute:

- **Confirmed rate** = (sha1-clean matches) / (wall-clock hours). This
  is the same metric briefs 509/510 already report (1.3–2.7 funcs/hour),
  so results are directly comparable to existing campaign history.
- **Protocol A's combined rate** = (Lane-1 matches + Lane-2 matches) /
  wall-clock (both lanes ran the same window, so this is just the sum).
- **Mean CPU utilization** during the window, from the sampled readings.
- **Failure count** (exit-127s, timeouts, any lane needing a restart).

## 7. Decision rule

Let `R_A` = mean confirmed rate across A1+A2 (combined both lanes), `R_B`
= mean confirmed rate across B1+B2 (solo lane).

| Condition | Verdict | Action |
|---|---|---|
| `R_A ≥ 1.6 × R_B` | Parallel lanes deliver ≥80% of the naive 2× expectation | Adopt two-lane parallel as standard practice for HIGH/MED waves |
| `1.0 × R_B ≤ R_A < 1.6 × R_B` | Real but discounted benefit | Adopt parallel, but keep monitoring — do not scale past 2 lanes without re-testing |
| `R_A < 1.0 × R_B` | Parallel is a wash or **worse** than solo | Brief-486 contention has recurred. Serialize lanes (brief-493 pattern) for this workload too |

**Override:** regardless of the throughput ratio, if mean CPU
utilization during any Protocol-A session is **< 30%** while both lanes
are actively working (not idle/blocked on human input), treat that as
direct confirmation of I/O-bound contention (the brief-486 signature)
**even if `R_A` looks acceptable** — it means the current throughput is
being capped by something fixable, and there's headroom being left on
the table. In that case, route to the follow-up in §8 before concluding
the investigation.

## 8. Follow-up — is the contention fixable?

If the decision rule lands on "contention recurred," run **one more
90-minute Protocol-A session** with a Windows Defender exclusion added
for the repo root (`Add-MpPreference -ExclusionPath
"C:\Users\leona\Dev\gx-spirit-caller"`, needs admin — brief 486 flagged
this as never having been checked or set). If `R_A` with the exclusion
clears the `1.6 × R_B` bar, the fix is a one-time admin action, not a
fundamental limit on this machine, and parallel lanes should be
re-adopted immediately. If it's still capped, the bottleneck is
elsewhere (raw disk throughput, antivirus other than Defender, NTFS
metadata contention on the shared repo mount) and is a separate, deeper
investigation — not a blocker for shipping the serial-lane
recommendation in the meantime.
