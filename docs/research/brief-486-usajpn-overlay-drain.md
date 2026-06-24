[//]: # (markdownlint-disable MD013 MD041)

# Brief 486 — USA/JPN overlay `.s` drain (new lane) + dual-lane CONTENTION finding

**Brief:** 486 (scaffolder), long autonomous session. New lane: drain USA/JPN
**overlay** `.s` (decomper owns USA/JPN **main** — disjoint files). Richest vein =
ov002 (~2,900 uncarved/region). Stack PRs 486/488/490 until ~4 PRs or dry.

## Headline — USA ov002 `.s` lane PROVEN (141 carved, gated byte-identical); STOPPED EARLY on a dual-lane throughput finding

The new USA-overlay `.s` pipeline **works end-to-end**: **141 byte-exact
`src/usa/overlay002/*.s` carved + committed**, each gated green on USA
`ninja sha1`. But this PR ships **141, not the briefed 1,000–1,500** — a
deliberate stop (user-confirmed) to surface a **dual-lane contention bottleneck**
that makes the briefed target a ~40-hour grind. Details below; the recommendation
is to **serialize the two lanes** (or remove the I/O bottleneck) before stacking
488/490.

Commits (smallest-first, sizes 0x8–0x44; the 867 pre-carved were stubs/sinit so
the uncarved start at 0x8):

- `+25 (0x8–0x10)` — `26ea5c2d`
- `+100 (0x14–0x44)` — `8da6be29`
- `+16 (0x44–…)` — salvage of the exit-127 death (see below)

## ✅ The pipeline (reusable for every USA/JPN overlay)

```text
python tools/batch_carve.py --version usa --overlay ov002 \
  --srcdir src/usa/overlay002 \
  --min-addr 0x0 --min-size 0x8 --max-size 0x2000 \
  --batch 100 --gate-retries 3
```

- **`--srcdir src/usa/overlay002`** is REQUIRED: batch_carve's default srcdir is
  `src/overlay002` (the EUR baseline, no region prefix). For USA/JPN you must
  point it at the region tree, or the `.s` + delink blocks land in the wrong dir.
  Delink blocks then correctly append to `config/usa/arm9/overlays/ov002/delinks.txt`.
- **`--min-addr 0x0`** is REQUIRED: the default `0x02234000` is EUR-ov002's
  upper-half guard; USA/JPN ov002 spans `0x021aa3c0–0x022bdea4`, so the default
  returns ~0. (`--overlay ov002` already scopes to ov002's symbols, so 0x0 is safe.)
- Collision-free with the decomper: different files (`src/usa/overlay002` +
  `config/usa/.../overlays/ov002/delinks.txt` vs the decomper's `src/usa/main` +
  `config/usa/arm9/delinks.txt`). 0 merge risk.
- **`--batch 100`** not 25: each USA gate is a full-USA-ROM relink (~15 min,
  fixed cost). At `--batch 25` the gate dominates (25 carves : 1 relink); `--batch
  100` amortises it 4×. (`--batch 25` was tried first and abandoned for this.)

## ⚠️⚠️ FINDING — dual-lane contention caps throughput at ~0.5 `.s`/min (I/O-bound, not CPU)

Running my overlay lane **concurrently with the decomper's USA/JPN main
`batch_carve`** starves both:

- **Steady-state ~0.5 `.s`/min** (variable 0.2–2.0): 141 carves took ~6 h.
- **NOT CPU-bound:** 16 logical cores, but all `python`/`mwasm`/`ninja` procs sat
  near-idle (my lane logged ~8 s CPU over a 50-min window). The lanes are
  **blocked-waiting on I/O / file-scan**, not computing — two lanes each doing
  thousands of small `.o`/`.s` file ops + per-func `mwasmarm` spawns saturate the
  disk/scan path, and batch_carve's `_wait_wine_quiet` (≤15 min) defers each gate
  to the co-lane's link.
- **Windows Defender real-time protection is ON**; the repo's exclusion status is
  unknown (needs admin to view/set). An AV scan on every `mwasmarm` spawn + `.o`
  write is a prime suspect for the I/O block.
- **Periodic `batch_carve` exit-127 deaths** (3rd occurrence — briefs 482/484/486):
  a subprocess-spawn failure under the concurrent load. Salvage recipe (proven):
  the python exits (no orphan), the in-flight `.s` are individually
  asm_escape-verified → `sort_delinks` + region gate by hand → commit. This PR's
  final `+16` is such a salvage.

At ~0.5/min the briefed 1,000–1,500 ships is ~40 h **of wall-clock for my lane
alone**, while the decomper's lane is simultaneously slowed — globally inefficient.

## ⚠️ RECOMMENDATION — serialize the lanes (or kill the I/O bottleneck) before stacking 488/490

The vein is huge and barely tapped — **2,764 USA + 2,905 JPN ov002 uncarved**
(+ ~700/region across the other overlays, skipping ov004/006/011). It WILL drain;
the only question is throughput. Options, best-first:

1. **Serialize the two lanes.** One agent drains solo (~2–4× faster with the box
   to itself), then swap — far higher *total* project throughput than both lanes
   crawling at ~0.5/min concurrently. Needs brain coordination.
2. **Add a Defender real-time-scan exclusion** for `C:\Users\leona\Dev\gx-spirit-caller`
   (+ the `tools/` toolchain) — likely speeds up BOTH lanes' I/O-bound builds.
   Needs admin.
3. Accept ~0.5/min and grind (slow, compute-heavy).

**Stacking 488/490 is PAUSED** pending this decision (per the user). The pipeline
above is turnkey for whatever lane plan is chosen.

## Gate — USA `ninja sha1`

`src/usa/overlay002/*.s` is USA-only (region-specific), so EUR/JPN are unaffected.
Each batch was USA-sha1-gated at commit; the final 141-ship tree re-confirmed
`gx-spirit-caller_usa.nds: OK`.

## Files

`src/usa/overlay002/` +141 `.s`; `config/usa/arm9/overlays/ov002/delinks.txt`
+141 (sort-normalised). No EUR/JPN/main change.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
