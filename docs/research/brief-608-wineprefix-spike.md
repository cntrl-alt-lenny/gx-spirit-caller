[//]: # (markdownlint-disable MD013 MD041)

# Brief 608 — prove or kill parallel wine lanes

**Verdict: GO.** Per-worktree `WINEPREFIX` isolation gives each lane its own
wineserver, compiles parallelize near-linearly through at least 4 concurrent
lanes (3.66x aggregate throughput at 4 lanes, zero deadlocks). The one wine
lane can become four for the compile/iterate loop.

**The link caveat only partially held up.** The specific deadlock
`_wait_wine_quiet` guards against (two `mwldarm.exe` fighting over the
*same* `arm9.o` path on a *shared* wineserver) is structurally impossible
once lanes are isolated worktrees with isolated prefixes — there is no
shared path or shared server left to collide on. The *newer* r7-3 worry
(2 concurrent links CPU-thrash the M1, aggregate slower) did **not**
reproduce: 5 measured `mwldarm` runs (1 solo, 2 concurrent-with-each-other,
2 concurrent-during-the-full-builds) all land within a 2.8s band
(86.4-89.2s) regardless of concurrency. Recommend keeping the link
serialized anyway (see GO/NO-GO) — not because the data demands it, but
because the test only covered 2-way concurrency with no simultaneous
compile load, and the cost of keeping a flock is near-zero (the link runs
once per gate check, not once per edit) against the cost of being wrong
under untested conditions (4-way link concurrency, or a link racing
alongside 3 other lanes' compiles).

## Method

Per r7-3's hypothesis: `transform_dep.py:6-8` already reads `WINEPREFIX`
from the environment (defaulting to `~/.wine`, set by nobody), so every
agent has been compiling against the one shared prefix -> one shared
wineserver -> full serialization, regardless of how many worktrees or
agents are nominally "in flight." Isolating `WINEPREFIX` per lane should
give each its own wineserver and let compiles run truly concurrently.

Four fresh worktrees (`claude-608`, `-B`, `-C`, `-D`), each with its own
`WINEPREFIX=<worktree>/.winelane-<X>` (first-initialized via `wineboot
--init`, ~15-20s each in practice, not the ~2min estimate) — deliberately
**separate worktrees**, not just separate prefixes in one tree, because
r7-21 already flagged concurrent `ninja` invocations in the *same* build
directory as a self-collision risk independent of the wine question; using
separate worktrees isolates the wineserver variable cleanly from that
confound.

Compile timing uses one `ninja build/eur/<unit>.o` process per target (not
a single `ninja -jN` invocation) to mirror the real post_edit inner loop:
edit one file, compile just that one object, look at the result. Each
lane's 30 targets are disjoint (no two lanes ever built the same object),
drawn from `src/main`'s ~3725 default-tier (`mwcc`, non-legacy) compile
units so results aren't skewed by tier-specific compile cost.

## Compiles/min — baseline vs 2/3/4-lane aggregate

| Config | Per-lane result | Aggregate compiles/min | Speedup | Per-lane efficiency |
|---|---|---:|---:|---:|
| 1-lane (baseline, shared `~/.wine`) | 30/30 ok, 201.8s | 8.9 | 1.00x | 100% |
| 2-lane (isolated prefixes) | A: 30/30@194.3s · B: 30/30@202.3s | 17.8 | 2.00x | 100% |
| 3-lane (isolated prefixes) | A: 30/30@207.3s · B: 30/30@207.4s · C: 30/30@209.7s | 25.8 | 2.89x | 96% |
| 4-lane (isolated prefixes) | A: 30/30@209.6s · B: 30/30@210.6s · C: 30/30@209.8s · D: 30/30@220.9s | 32.6 | 3.66x | 92% |

**Zero failures across 300 compiles** (30 baseline + 30x2 + 30x3 + 30x4).
**Zero deadlocks, zero hangs, zero manual intervention needed** at any lane
count — no `_wait_wine_quiet`-style stall was ever observed on the compile
side.

Scaling is close to perfectly linear through 2 lanes (100% efficiency —
each lane ran exactly as fast concurrently as it did alone) and stays
strong through 4 (92% efficiency, a mild but real per-lane slowdown
starting to appear as concurrent lane count approaches the machine's core
count). Test machine: Apple M1 (`MacBookPro17,1`), 8 total cores (4P + 4E)
— 4 concurrent Rosetta2-translated compiler processes is already at the
performance-core ceiling, which plausibly explains why the falloff starts
exactly at lane 4 rather than earlier. **Saturation has not been reached
by lane count 4** (still climbing, not flattening) — the ceiling is more
likely the P-core count than any wine/wineserver limit, meaning going
beyond 4 lanes on this specific machine would trade compile-lane count
against per-lane speed rather than deliver further clean wins. This
matches the brief's own "prove or kill FOUR" framing: four is validated as
a genuinely productive lane count on this hardware.

## Wineserver isolation — directly confirmed

At each lane count, `pgrep -fl wineserver` was checked *during* the
concurrent run (mid-burst, not just at setup):

- 2-lane: 2 distinct wineserver PIDs.
- 3-lane: 3 distinct wineserver PIDs.
- 4-lane: 4 distinct wineserver PIDs.

One per active `WINEPREFIX`, confirming the r7-3 hypothesis directly
rather than just inferring it from throughput numbers.

## The link caveat

Testing the link required two **fully-built** EUR trees (the linker needs
every object the LCF references — there's no way to time "just the link"
without first compiling everything). Two full `ninja` builds were run
concurrently in lanes A and B (isolated prefixes) to reach that state —
both finished clean, **both `ninja sha1` OK**, a useful bonus: isolated
concurrent full builds are correct, not just fast.

With both trees fully built, the ROM output was deleted and `ninja sha1`
re-run — since no source changed, ninja only re-executes the link + ROM-
build + sha1-check chain, isolating link-only wall time from compile time.
`.ninja_log` gives authoritative per-target timing (not just wall-clock
around the whole `ninja sha1` invocation), so the `mwldarm` step
(`build/eur/arm9.o`) can be pulled out on its own:

| Run | Concurrent with | `mwldarm` (arm9.o) time |
|---|---|---:|
| Full build, lane A | Full build, lane B | 86.4s |
| Full build, lane B | Full build, lane A | 87.2s |
| Solo relink, lane A | (nothing) | 89.2s |
| 2-concurrent relink, lane A | 2-concurrent relink, lane B | 86.9s |
| 2-concurrent relink, lane B | 2-concurrent relink, lane A | 88.5s |

All 5 runs land in an 86.4-89.2s band (2.8s spread, i.e. within normal
run-to-run noise) **regardless of whether another link was running at the
same time.** No aggregate slowdown was measured at 2-way link concurrency.
Total `ninja sha1` wall time (link + delink + rom-build + sha1-check) was
~97-99s in every configuration, solo or concurrent.

**Why the thrash didn't show up (best-effort explanation, not re-verified
independently this brief):** `mwldarm.exe` is very likely single-threaded
(linkers typically are), so each Rosetta2-translated link process occupies
roughly one core. This machine (Apple M1, `MacBookPro17,1`) has 4
performance + 4 efficiency cores — 2 single-threaded link processes fit
comfortably within the 4 P-cores with no need to time-slice, unlike the
4-lane *compile* test where ninja's own internal parallelism means each
lane can spawn more than one concurrent `mwccarm` process, pushing total
concurrent Rosetta2 processes past the P-core count sooner.

**Scope of what was and wasn't tested:** only 2-way link concurrency, one
trial each, with no compile lanes running at the same time. 3-4 way link
concurrency, and link-during-active-compile contention, were NOT measured
this brief — the brief's own ask was specifically "two concurrent links."

## Deadlock verdict

**Zero deadlocks anywhere in the spike** — 300 compiles (30 baseline +
30x2 + 30x3 + 30x4), 2 full clean builds (10254 + 10284 targets each,
run concurrently against each other), and 5 link attempts (1 solo, 4
concurrent-with-another), all completed cleanly with no hang and no
manual intervention. `_wait_wine_quiet`'s specific failure mode (two
`mwldarm.exe` racing to write the *same* `arm9.o`, wedging the shared
GPTK wineserver) never had an opportunity to occur here, because
isolation removes both preconditions at once: no shared output path
(separate worktrees) and no shared wineserver (separate `WINEPREFIX`).

## GO/NO-GO

**GO** on isolating the compile/iterate lane — that part of the hypothesis
is fully confirmed. **Keep the link serialized too, but for a narrower
reason than originally hypothesized:** not because measured data shows
2-way CPU thrash (it didn't), but because only 2-way was tested, with no
concurrent compile load, and the cost of caution here is cheap (the link
runs once per gate check, not once per edit — unlike the compile lane,
where serializing would cost real iteration speed).

### Proposed exact change (NOT wired this brief — brief 608 measures only)

1. **Per-worktree `WINEPREFIX` default** in the worktree-setup step: when a
   new `claude-NNN` (or `codex-NNN`) worktree is created, set
   `WINEPREFIX=<worktree>/.wine` (or `.winelane-<id>`) either via a
   committed `.envrc`/wrapper env-var convention or by having the
   worktree-setup script `export` it for the session, so every subsequent
   `ninja`/`wine` invocation in that worktree automatically targets an
   isolated prefix without the agent having to remember to set it by hand.
   One-time `wineboot --init` per new prefix (~15-20s measured here, not
   the ~2min budgeted) before the first real compile.
2. **Drop `_wait_wine_quiet` from the compile path.** It exists purely to
   avoid two lanes' `mwldarm.exe` colliding on a shared wineserver
   (`batch_carve.py:472-490`) — with isolated prefixes, there is no shared
   wineserver for the compile loop to wait on. `_kill_orphans` can likely
   stay as a general hang-recovery backstop (timeouts still happen for
   other reasons) but should no longer be reached for wineserver
   contention specifically.
3. **Keep (or introduce) an `flock` around ONLY the `mwld` link step** (not
   the compile steps) — scoped per-machine, not per-worktree. Unlike the
   original `_wait_wine_quiet` deadlock (which isolation genuinely
   eliminates — see Deadlock verdict), this flock is precautionary: this
   brief's 2-way link-concurrency data showed no aggregate slowdown, but
   didn't test 3-4 way concurrency or a link racing alongside active
   compile lanes. Given the link is a rare, gate-time event (not part of
   the per-edit iterate loop), serializing it costs almost nothing even if
   turns out to be unnecessary — keep it until a follow-up brief tests the
   untested conditions and can respond to instead of an untested guess.
4. Complements r7-11 (route the link to the PC's native `mwldarm` — no
   Rosetta, no wine — and schedule "gates = PC rounds"): if the PC lane
   absorbs the link step entirely, the Mac-side flock in (3) becomes a
   fallback rather than the primary serialization path.

A follow-up brief should land (1)-(3) into the actual worktree-setup
tooling and `batch_carve.py`; this brief intentionally stops at
measurement + recommendation per its own scope.

## Gates

This is a tooling/infra spike, not a source-code change — no `ninja sha1`
gate applies. Verification is the timing data itself, captured directly
from `ninja`/`wine` process output and `pgrep` process listings, both
included above.
