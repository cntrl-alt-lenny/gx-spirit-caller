[//]: # (markdownlint-disable MD013 MD041)

# Post-small-pool strategy — the decision memo, written before the experiment lands

**Status:** decision rules pre-staged 2026-08-22 (round 0822b), keyed to the
outcome of `cm-main-exploit-drain-2`'s 193–256 B boundary experiment (in flight
at time of writing). Final priority ordering is cntrl_alt_lenny's call; this
memo exists so the fleet redirects the day the result lands instead of drifting
for a round. Written by the brain on owner instruction.

## Why this memo exists now

The code-side campaign's engine for the last several rounds has been one pool:
full EUR, `.text` ≤192 B, ≥4 `bl`/`blx`, unattempted — ship rate 34–36% →
60.8% → **73%** across three rounds once selector science stopped and pool
exploitation started. That pool is now **32 drainable candidates / 4,916 B**
(brain re-derivation, round 0822). Whatever the boundary experiment says, the
≤192 B frontier is weeks from exhaustion, not months. The question "what does
the CC Decomper lane do next" needs an answer ready in advance.

## The standing facts every option must respect

- **Band prior:** `cm-main-tier-sweep-7` Part 2 (4+ calls, 200–376 B) shipped
  **8/50 = 16%** — the only measured rate above 192 B. The 193–256 B slice
  (264 candidates / 59,560 B at round-0822 counts) has never been isolated;
  that is exactly what `cm-main-exploit-drain-2` Part 2 measures, n=40, with
  its falsification test written into the kickoff.
- **Ceiling model:** the published tractable-C ceiling has already been shown
  to be a policy artifact once — `progress.py` froze `{main, ov002}` at a 0.10
  headroom fraction until the r8 review reclassified `main` finishable
  (29.97% → 47.88%, [`rnd-swarm-2026-07-24-r8.md`](rnd-swarm-2026-07-24-r8.md),
  executed via `q-ceiling-measured`). The durable empirical facts underneath:
  **zero functions >1024 B have ever matched**, and the 513–1023 B band's
  model-vs-observed rate carries a flagged, never-probed disagreement (brain
  memory, ~round 0810 era — re-derive before quoting a number from it). That
  band is a cheap, high-information census probe nobody has run.
- **Automation ceiling:** m2c-drafted readable C caps at compile-but-not-match
  ([`readable-c-automation-ceiling.md`](readable-c-automation-ceiling.md));
  its value is draft-ASSIST for human
  judgment, not auto-ship. The m2c pin was refreshed (#1515) and fixes a real
  stack-argument misresolution — the assist is better than when the ceiling was
  measured.
- **Permuter:** remains blocked on a real prerequisite — `import.py` cannot
  stage `.s` TUs, independently rediscovered in #1512. Reviving it is a scoped
  tooling item, not a mystery.
- **Data side is now the largest proven pool.** `cm-restock-carve-9` (#1507)
  proved the ~227,820 B "zero-reader" pool is reader-visible via data→data
  edges; `cm-restock-carve-10` (#1526, pending brain gate at time of writing)
  reports the extended call graph working and its first 739 strings /
  15,732 B shipped. Data work is not blocked on any experiment.
- **Ports stay deferred.** Phased-EUR-first is standing strategy: USA/JPN are
  derivative and cheap *after* EUR content lands, wasteful before.

## Decision rules

### Outcome A — the slice ships ≥50%

The ~192 B cap was an artifact of measuring the 200–376 B band whole. The pool
extends. Response: **band ladder**.

1. Drain 193–256 B to completion (same recipe: frozen partitions, canary-first,
   ledger both results, three single-region `--clean` gates).
2. Probe 257–320 B with the identical n=40 falsification pattern before
   committing to it. Never step two bands on one band's evidence.
3. Data campaign continues in parallel on the CC Scaffolder lane, unchanged.

### Outcome B — the slice ships ≤25%

Sweep-7 Part 2 reproduces; the small-function well is genuinely near dry. The
CC Decomper lane redirects, in this order:

1. **Data becomes the primary axis for both CC lanes.** The proven ~220 KB
   pool dwarfs the remaining small-code headroom (~60 KB even in the
   optimistic case). The Decomper takes carve tranches alongside the
   Scaffolder's tooling work — same gate, same ledger discipline.
2. **One bounded mid-tier pilot, then stop or scale:** 257–512 B, n=25,
   m2c-as-draft-assist plus human judgment (the post-#1515 m2c), full ledger
   recording. Kill criterion stated in advance: **<15% ships ⇒ the tier is
   closed for this method generation** and the result is written to the wall
   catalog, not retried next quarter by someone who forgot.
3. **513–1023 B census probe** (cheap, single round, CX-D-shaped): re-derive
   and resolve the flagged model-vs-observed disagreement on that band (the
   banked 4.2× magnitude is round-0810-era; measure, don't quote) — it decides
   whether anything above 512 B is worth a pilot at all.
4. **Permuter prerequisite** (`import.py` `.s`-TU staging) only if the pilot in
   (2) produces a cluster of high-percentage near-misses that permutation
   plausibly closes. Do not build it speculatively.
5. **Ports remain deferred** until EUR plateaus on *both* code and data.

### Outcome C — between 25% and 50%

Diminishing returns, not a verdict. Run **one more n=40 sample in the same
193–256 B band** (the reserve is large enough) to tighten the estimate before
choosing A or B. Do not average the two runs into a story — report both.

## What this memo is not

Not a commitment device against evidence. If `cm-main-exploit-drain-2` comes
back with a surprise that none of A/B/C anticipates (e.g. a new wall family
dominating the band, or a tooling artifact contaminating the sample), the
brain writes what happened and re-derives — the memo's job is to prevent
*drift*, not to prevent *thought*. And the ordering inside Outcome B is the
brain's recommendation; cntrl_alt_lenny re-orders it by saying so in plain
English, per standing practice.

## Cross-references

- [`cm-main-exploit-drain-1-2026-08-19.md`](cm-main-exploit-drain-1-2026-08-19.md) — the 73% round and the pool re-derivation.
- [`readable-c-automation-ceiling.md`](readable-c-automation-ceiling.md) — why m2c is assist, not auto-ship.
- [`codegen-walls.md`](codegen-walls.md) — where a closed tier's evidence gets recorded.
- [`data/cm-restock-carve-9-2026-08-17.md`](data/cm-restock-carve-9-2026-08-17.md) — the finding that opened the data pool.
