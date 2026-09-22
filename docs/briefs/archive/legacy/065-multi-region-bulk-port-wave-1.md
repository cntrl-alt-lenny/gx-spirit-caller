### decomper/multi-region-bulk-port-wave-1

**Goal:** First bulk-porting wave consuming brief 064's
pipeline. Port HIGH-confidence EUR matches to USA + JPN
mechanically; aim for ~50-100 ports across the two regions
combined in this first wave. Calibrates the actual port rate
vs brief 061's 90.6% sweet-spot estimate.

**Context:**

Brief 061 (PR #414) returned GO: 74.8% HIGH-confidence pairings
across 500 EUR-sample, peaking at 90.6% in the ≤0x40 band.
Bootstrap (PR #415) landed `config/usa/` + `config/jpn/`.
Brief 064 (cloud, to land before this brief opens) ships:

- `find_region_siblings.py v2` with byte-level disambiguation
  (HIGH-confidence precision ≥ 0.95).
- `tools/port_to_region.py` for mechanical EUR-to-region
  source porting.
- `configure.py usa/jpn` + `ninja` integration for parallel
  per-region builds.

This brief is the first decomper wave consuming that pipeline.
It is **not** a research wave — the math is already done. The
wave's value is calibration data: real port rate, real per-tier
fall-through to MEDIUM/LOW, and the first verified-byte-
identical cross-region matches.

**Selection rule:**

- **Primary pool:** HIGH-confidence pairings from
  `find_region_siblings.py --sample N` against already-matched
  EUR functions in tiers `trivial` / `easy` / `sinit` /
  `named` (brief 061's per-tier survey peaks above 90% in
  these bands).
- **Secondary pool:** HIGH-confidence pairings from `medium`
  and `hard` matched EUR functions in the ≤0x40 band where
  brief 061 measured 90.6% HIGH rate.
- **Cap (this wave):** start with ~50-100 ports across both
  regions combined to validate the pipeline at moderate scale
  before committing to the full 1600-1700 pool.
- **Skip:** EUR functions matched via inline-asm (C-12 /
  C-16 / C-20a recipes) — the asm body is region-specific
  enough that mechanical porting needs more care. Defer to a
  follow-up wave once mechanical porting on the safe pool is
  validated.

**Workflow:**

1. `python tools/port_to_region.py <eur_func>` for each
   HIGH-confidence pair from `find_region_siblings`.
2. `python tools/configure.py usa && ninja rom` and same for
   jpn — verify both regions build clean.
3. `./dsd check modules -c config/usa/arm9/config.yaml` and
   same for jpn — confirm 24/27 baseline preserved (same
   expected diff pattern as EUR's ARM9 main / DTCM /
   overlay 4 placeholder fills).
4. Per port: objdiff confirms byte-identical to USA / JPN
   target. If yes, the port lands; if no (false-positive
   HIGH-confidence from the v2 disambiguator), demote to
   MEDIUM in the wave-1 PR body and skip.

**Scope:**

- Bulk-port 50-100 HIGH-confidence pairings across USA + JPN
  combined.
- PR body documents: actual HIGH-confidence precision rate
  (matches vs false-positives), per-tier port-rate
  breakdown, any new failure modes that need cloud-side
  tooling tuning.
- This wave's PR is large by file-count (each port is one
  new `.c` file) but each port is byte-mechanical — no
  decomper iteration loop per match. Verify with the
  existing `ninja rom` + `dsd check modules` gate against
  each region's baserom.

**Non-scope:**

- ❌ Hard-tier ports (defer to wave 2; first validate the
  easy pool).
- ❌ Inline-asm-recipe ports (C-12 / C-16 / C-20a).
- ❌ Tool / configure.py / Ninja changes (brief 064 owns those).
- ❌ Modifying EUR's `config/eur/` (port direction is one-way
  EUR → USA/JPN).
- ❌ AGENTS.md, state.md, libs/ edits.

**Success:**

- ≥ 50 byte-identical USA + JPN matches combined (this is the
  brief 061 sweet-spot floor — 50% of a 100-pair sample at
  90.6% HIGH rate).
- USA + JPN multi-region badges (PR #411) move from 0.00% to
  measurable non-zero — first time the visual reflects USA /
  JPN progress.
- 24/27 baseline preserved in both regions.
- PR body reports actual HIGH-confidence precision rate
  observed vs brief 061's 0.95 target (calibrates whether v2
  disambiguation needs further tuning).

**Branch:** `decomper/multi-region-bulk-port-wave-1`

## Self-extend clause

If HIGH-confidence precision ≥ 0.85 (i.e. ≥ 85% of HIGH
predictions matched byte-identical) AND ≥ 50 ports shipped →
up to **2** follow-up bulk-port waves under the same rule,
draining the HIGH pool.

If precision < 0.85 OR < 50 ports → hand back to brain. Brain
investigates: is the v2 disambiguator under-tuned, are there
unforeseen region-drift shapes, or did the sample selection
hit an unrepresentative subset? Likely follow-up: cloud
research brief to investigate the failure modes.

**After this brief (and self-extends) land:**

1. If precision holds at ≥ 0.85 → brain queues brief 067
   targeting the MEDIUM-confidence pool with byte-level
   disambiguation as the primary filter.
2. If precision collapses → brain pauses bulk-porting,
   queues a cloud research brief on the drift shapes.
3. Cumulative across waves 1+2+3: aim to drain ~50% of the
   HIGH-confidence pool (~400-800 ports across both
   regions) before re-scoping.
