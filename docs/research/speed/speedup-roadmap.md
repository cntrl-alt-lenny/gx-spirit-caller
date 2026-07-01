# Campaign throughput — the ranked speed-up roadmap

**Status:** build-free synthesis, 2026-07-01. Pulls together every known
speed lever across the campaign into one ranked plan. Companion docs:
[`ninja-report-panic.md`](ninja-report-panic.md),
[`parallel-vs-serial.md`](parallel-vs-serial.md). Per-candidate build
cost is a parallel lane's own deliverable (the Decomper's
`buildcost-analysis.md`, not yet landed as of this writing) — slotted in
below by reference, not duplicated.

**Ranking method:** `rank ≈ (expected payoff × confidence) / effort`,
risk noted as a caveat rather than folded into the score (a high-payoff,
high-risk lever is still worth listing — just not blindly adopted).
Levers that are already shipped (zero marginal effort, cost sunk) are
front-loaded regardless of raw payoff size, since "done" beats "planned"
at any payoff level.

---

## Ranked table

| # | Lever | Payoff | Effort | Risk | Status |
|---|---|---|---|---|---|
| 1 | Ground-truth dossier coverage | High | Done | Low | **Shipped** (PRs #1063, #1064/#1066, #1069) |
| 2 | Per-unit resolved-check recipe (kills the report-panic tax) | Med-High | Low | Low | Documented this lane — [`ninja-report-panic.md`](ninja-report-panic.md) |
| 3 | Batch the `ninja sha1` gate | Medium | Low | Med | Proposed, needs a batch-size trial |
| 4 | Parallel Codex lanes (`-j4`×2 vs `-jN` solo) | Uncertain (0×–2×) | Low to test | Med-High | **Pending** — [`parallel-vs-serial.md`](parallel-vs-serial.md) settles this |
| 5 | Batch `port_to_region.py` | Low-Med | Med | Low | Proposed, needs implementation (out of this lane's scope) |
| 6 | Per-candidate build cost | Unknown, likely large | — | — | **Pending** Decomper's `buildcost-analysis.md` |
| 7 | Codex rate-limit / stuck-worker discipline | Med | Low | Low | Institutional practice, already partially adopted |
| 8 | Windows Defender exclusion | Unknown, possibly large | Low (needs admin) | Low | Unresolved since brief 486 |
| 9 | Upstream `objdiff-cli` panic fix | Removes lever #2 entirely | None (upstream) | — | Filed as encounter/objdiff#352, watch for release |

---

## 1. Ground-truth dossier coverage — SHIPPED

**Mechanism:** [`docs/research/objdiff-sha1-gap/gap-taxonomy.md`](../objdiff-sha1-gap/gap-taxonomy.md)
established that **Modes A and B — wrong pool-word value, wrong
callee/BL target — dominate the ~60–80% objdiff-100%/sha1-fail gap**, and
that both are *invisible* to `verify.py` and raw `ninja objdiff` (reloc
wildcarding hides them; only `ninja report`/resolved diffs or the full
`ninja sha1` catch them). The fix is upstream of verification entirely:
put the correct pool values and callee targets **in front of the
authoring agent before it writes the `.c`**, extracted directly from the
`.s` ship (which has them as ground truth — `.word` directives and `bl`
targets).

**What landed:** every dossier in `docs/research/dossiers-high/` (1067/
1067) and `docs/research/dossiers/` (1267/1267) now carries a `##
GROUND TRUTH` section — pool-word value/type table, BL/BLX callee-target
table, and a Mode-C reminder (no `static const` arrays — a separate
invisible-to-both-tools failure mode). Where no `.s` ship exists, the
dossier says so explicitly (already-matched pointer, or a "BLOCKED, here's
why" note) instead of silently missing the section — so a future pass
doesn't waste time re-discovering the same gap.

**Confidence caveat — read before citing this as proven:** the yield
lift is a **predicted mechanism**, not yet isolated by a clean before/
after measurement. Dossier landing and campaign waves have run
interleaved in time (brief 510's HIGH wave 7, for instance, ran
concurrently with dossier work and reports 22.2% yield — not obviously
higher than brief 509's pre-dossier-heavy 23.8%, though the two waves
aren't on a matched candidate pool so this isn't a fair A/B either).
**Follow-up recommended:** once a full wave has run entirely *after*
100% GT coverage landed, compare its objdiff-100%→sha1-clean conversion
rate against brief 509/510's baseline on a similarly-sized candidate
pool. That comparison is the actual proof point this lever is owed.

**Effort:** zero marginal (already merged). **Risk:** low — additive
documentation, no source/tooling changed.

---

## 2. Per-unit resolved-check recipe — kills the `ninja report` panic tax

Full detail in [`ninja-report-panic.md`](ninja-report-panic.md).
Summary: every USA/JPN HIGH/MED wave since brief 499 has independently
re-derived a manual workaround for a full-region `ninja report` panic
(`objdiff-core` ARM index underflow, `arm.rs:130`). The existing
workaround ("isolated single-unit `objdiff-cli report generate`") still
routes through the crashing aggregator, just on a smaller input. This
lane's doc gives an exact recipe that reuses the `*.o.resolved` sidecars
the three existing post-processors already write (they complete
successfully before the aggregator panics) and diffs them directly with
`objdiff-cli diff` — a single-pair command that never touches the
aggregator at all. It also gives a ready-to-run bisection script so the
actual culprit unit can finally be identified and (maybe) upstreamed,
rather than worked around forever.

**Payoff:** removes a recurring per-wave time sink and — more
importantly — makes the resolved (Mode A/B-catching) check as cheap and
routine on USA/JPN as it already is on EUR, instead of being skipped or
deferred to the much more expensive full `ninja sha1`. **Effort:** low —
no new tooling, just adopting an existing-tool command sequence as the
standard USA/JPN port-verification step. **Risk:** low, built entirely
from already-shipped, already-battle-tested tools.

---

## 3. Batch the `ninja sha1` gate

**Current practice** (brief 509, explicit quote): "EUR accepted matches
were gated with `ninja sha1` after each accepted function." `ninja sha1`
triggers `dsd rom build` — a full-ROM reassembly — every time, gated on
whatever module(s) changed. Running this once per single accepted
candidate is the safest possible attribution (a failure points at
exactly one candidate) but pays the full-rebuild cost N times for N
candidates.

**Proposal:** accept candidates into batches of 3–5 (small enough that a
batch failure is cheap to bisect by reverting half the batch and
re-gating) before running `ninja sha1`, instead of gating after every
single one. This directly trades a bounded amount of attribution
precision for roughly a 3–5× reduction in full-ROM-rebuild count.

**Why not larger batches:** gap-taxonomy.md's own numbers put the
naive objdiff-100%→sha1-clean failure rate at 60–80% *before* the
ground-truth dossiers (lever #1); even optimistically post-dossier,
expect a non-trivial per-batch chance that at least one candidate in the
batch fails sha1. A batch of 20 with one bad candidate costs a full
bisection across 20; a batch of 3–5 bounds that cost tightly. **This
needs a trial**, not a guess — the brain should measure actual
`dsd rom build` wall-clock cost (a number this lane doesn't have) before
picking a final batch size; 3–5 is a starting point, not a conclusion.

**Effort:** low — pure workflow discipline, no new tooling. **Risk:**
medium — mis-sized batches could make bisection *more* expensive than
the status quo; needs the measurement above before wide adoption.

---

## 4. Parallel Codex lanes — PENDING, do not adopt or reject yet

Full experiment design in [`parallel-vs-serial.md`](parallel-vs-serial.md).
This is listed here for completeness, not as a settled recommendation:
briefs 486/493 already found a real, empirically-measured I/O-bound
contention wall when two lanes shared this machine for a *different*
workload (`batch_carve.py` mass file carving), collapsing throughput to
near-zero-CPU "blocked-waiting on I/O." Whether the current C-match
compile/link/verify loop hits the same wall or is different enough
(fewer files touched, more compiler-seconds per file) to actually
benefit from two lanes is exactly what the linked experiment is designed
to settle, with an explicit decision rule. **Do not schedule two
concurrent HIGH/MED waves as standard practice until that experiment has
run** — brief 486's precedent means the downside (both lanes starving
each other) is real, not hypothetical, on this exact machine.

---

## 5. Batch `port_to_region.py`

`tools/port_to_region.py --help` confirms it takes exactly one `source`
positional argument — no batch/directory mode. Every EUR match that gets
ported to USA and JPN (brief 510: 80% of accepted matches get ported
symmetrically) currently pays a fresh Python process spawn + config/
symbol-table load per port, per region — for the same repo state, twice,
per candidate. Batching N candidates into one invocation (or a directory
mode) would amortize the fixed Python-startup + symbol-resolution cost
across N ports instead of paying it N times. On Windows specifically,
process-spawn overhead is proportionally larger than on Unix, so this is
likely a bigger win here than it would be on macOS/Linux campaign lanes.

**Effort:** medium — this is a `tools/port_to_region.py` code change,
out of this build-free, docs-only lane's scope to implement. Listed here
as a recommendation for whichever lane owns `tools/`. **Payoff:**
low-medium — real but modest; it compounds over hundreds of candidates
but doesn't touch the dominant sha1-fail-rate or panic-tax costs.
**Risk:** low.

---

## 6. Per-candidate build cost — PENDING (Decomper's lane)

Tracked separately in the Decomper's `buildcost-analysis.md` (not yet
landed as of this writing — a sibling agent is actively on
`research/speed-buildcost` in the `kb-types` worktree). Not duplicated
here per this lane's constraints. One piece of grounded context worth
carrying into that analysis when it lands: per `CLAUDE.md`'s platform
notes, **this Windows machine runs `mwccarm.exe`/`mwldarm.exe` natively
— no `wine`/`wibo` emulation layer**, unlike macOS (Game Porting
Toolkit + Rosetta 2) or Linux (`wibo`) campaign lanes. If per-candidate
compiler invocation cost turns out to be a major lever, the Windows
brain is structurally the cheapest place to run compile-heavy waves,
independent of whatever that analysis finds — worth weighing when
deciding where to schedule future waves.

---

## 7. Codex rate-limit / stuck-worker discipline

Not a repo-code lever — an operating discipline one, but a real
throughput cost when violated: mistaking a live, still-running worker
for a stalled one and killing/restarting it discards a multi-hour wave's
in-flight progress, which dwarfs any of the mechanical levers above in a
single incident. The distinguishing signal is not the coordinator's
"out of messages"/rate-limit UI (which reflects the *coordinator's*
budget, not whether the worker's already-dispatched task is still
executing) but durable evidence: `git log origin/<branch>` continuing to
advance, or the worktree's build artifacts still changing on disk.
**Practice:** before concluding a lane is stuck, check for durable
progress (a recent push, a growing commit count) rather than the
message-budget indicator alone; only kill/restart on confirmed
non-progress over a real time window, not a rate-limit signal alone.

**Effort:** low (protocol, not code). **Payoff:** medium — bounded by
how often this actually happens, but each incident is expensive.
**Risk:** low.

---

## 8. Windows Defender exclusion

Flagged in brief 486 as the prime suspect for the dual-lane I/O
contention wall ("Windows Defender real-time protection is ON; the
repo's exclusion status is unknown — needs admin to view/set") and never
resolved. This is a single admin-privileged command
(`Add-MpPreference -ExclusionPath "C:\Users\leona\Dev\gx-spirit-caller"`)
that costs nothing to try and could remove or shrink whatever I/O
penalty real-time AV scanning imposes on every `mwasmarm`/`mwcc`/`mwld`
spawn and every small `.o`/`.s` write — which is every single build
action this campaign takes, on every lane, all the time, not just during
contention. **This is worth doing regardless of the
[parallel-vs-serial.md](parallel-vs-serial.md) outcome** — it's listed
there as the parallel-arm follow-up because that's where its effect is
easiest to measure (contention makes the signal larger), but a serial
lane pays the same per-write tax, just without another lane competing
for the same disk.

**Effort:** low (needs a human with admin rights — not something an
agent lane can self-serve). **Payoff:** unknown magnitude, possibly
large given it taxes *every* build action project-wide. **Risk:** low
(a standard, reversible Defender configuration change).

---

## 9. Upstream `objdiff-cli` fix

[encounter/objdiff#352](https://github.com/encounter/objdiff/issues/352)
is already filed with a full repro. If/when it lands and this project
bumps its `objdiff-cli` pin past `v2.7.1`, lever #2 (the per-unit
resolved-check recipe) becomes unnecessary — full `ninja report` would
just work on USA/JPN the way it already does on EUR. Not actionable from
this lane (upstream dependency); listed so whoever next bumps
`OBJDIFF_VERSION` in `tools/configure.py` knows to re-check whether the
workaround recipe can be retired.

---

## Top 3, for anyone skimming

1. **Ground-truth dossier coverage** (shipped) — directly targets the
   documented dominant failure mode (Mode A/B, 60–80% of the
   objdiff-100%/sha1-fail gap); zero marginal cost since it's already
   merged; the one open item is proving the yield lift with a clean
   post-coverage wave measurement.
2. **Per-unit resolved-check recipe** — removes a real, recurring,
   currently-manual per-wave tax on every USA/JPN port batch, built
   entirely from existing tools, ready to adopt immediately.
3. **Batch the `ninja sha1` gate** — cheap, mechanical, directly cuts
   the full-ROM-rebuild count that currently gates every single accepted
   candidate; needs one measurement (actual `dsd rom build` cost) to
   pick the right batch size, then it's pure workflow discipline.

Parallel Codex lanes are the highest *ceiling* (up to ~2×) but are
explicitly **not** in the top 3 — brief 486's precedent means adopting
that lever before [`parallel-vs-serial.md`](parallel-vs-serial.md)'s
experiment actually runs risks repeating a throughput collapse that's
already happened once on this machine.
