### decomper/cross-project-bulk-port-wave-1

**Goal:** First cross-project bulk-port wave. Consumes brief
068's ranked HIGH-confidence CSV (NitroSDK / MSL_C functions
from `pret/pokediamond` + `pret/pokeheartgold` already byte-
identical to our unmatched EUR functions). Mechanically copies
upstream `.c` source into our `libs/` tree, rewrites region-
specific identifiers, verifies byte-identical. Target 50-150
ports for this first wave to calibrate the cross-project
pipeline.

**Context:**

This brief is to brief 069 what brief 065 is to brief 064:
the production wave consuming the tool chain. Brief 068
(cloud, MEDIUM-HIGH, **gates this brief**) extends
`find_external_source.py` to byte-fingerprint matching and
ships a ranked CSV. Brief 069 ships
`tools/port_external_source.py` + decomper executes the
first bulk-port wave.

The destination differs from brief 065's:
`src/<region>/<module>/<func>.c` for region ports, but for
cross-project library code it's `libs/<category>/<file>.c`
(region-neutral — NitroSDK/MSL functions are identical
across EUR/USA/JPN). The `libs/` tree is already excluded
from per-region `configure.py` filtering (PR #420), so a
single port lands in all three regions' builds
simultaneously.

**Selection rule:**

- **Primary pool:** HIGH-confidence rows from
  `docs/research/cross-project-candidates.csv` (brief 068's
  output). Top 50–150 by `byte_similarity` × inverse
  `sp_distance`.
- **Per-SP-distance triage:**
  - **pokediamond (one SP rev):** start here. Brief 066
    projects 80–95% precision; brief 068 will refine the
    actual number. These are the safest first ports.
  - **pokeheartgold/nitrocrypto (exact SP match to our
    `.legacy.c`):** **route through `.legacy.c`**, expected
    ≥ 95% precision. Equally safe as pokediamond if not
    safer; prioritize equally.
  - **pokeheartgold main NitroSDK (SP-level shift):** defer
    to wave 2; gather wave-1 calibration first.
- **Apply list:**
  - `tools/port_external_source.py` (brief 068 deliverable —
    cloud-shipped before this brief opens). Same shape as
    `port_to_region.py` but external `.c` → `libs/<category>/`.
  - Header generation if the upstream source has its own `.h`
    sibling; vendor the header too.
- **Skip list:**
  - Functions where the upstream source uses an inline
    assembly recipe (the recipe is region-mismatched even for
    same-SP builds).
  - Functions with unresolved cross-references into upstream's
    private headers we don't have or don't want to vendor (use
    brief 069's `--dry-run` to surface these).
  - Anything below MEDIUM in brief 068's CSV.

**Workflow:**

1. Per port: `python tools/port_external_source.py
   <upstream_path>.c --target eur` writes `libs/<category>/X.c`
   and emits the `delinks.txt` TU header.
2. **Build EUR first** — `python tools/configure.py eur &&
   ninja rom`. Since `libs/` is region-neutral, USA + JPN pick
   up the same `libs/` build outputs automatically once EUR
   verifies.
3. Verify byte-identical via objdiff against EUR's matched
   target.
4. Build USA + JPN, verify each maintains 24/27 baseline.

**Scope:**

- Bulk-port **50–150 HIGH-confidence cross-project source
  functions** into `libs/`. Each one is potentially 3 matches
  (EUR + USA + JPN) since `libs/` is region-neutral.
- PR body reports actual byte-fingerprint precision rate vs
  brief 068's estimate. Per-SP-tier breakdown
  (pokediamond / pokeheartgold-main / nitrocrypto).
- Any new failure modes that need cloud-side tooling tuning.

**Non-scope:**

- ❌ Modifying upstream repos. Read-only access via
  `tools/_vendor/`.
- ❌ Tool / configure.py / Ninja changes (brief 068 owns
  those).
- ❌ Renaming EUR placeholder names (`func_<addr>` →
  `OS_GetTick` etc.) — symbol archaeology is downstream of
  this brief and can happen at decomper discretion as a
  separate pass.
- ❌ AGENTS.md, state.md, src/ edits beyond `libs/` adds.

**Success:**

- ≥ 50 byte-identical cross-project ports landing in `libs/`.
- Each port unlocks EUR + USA + JPN simultaneously (since
  `libs/` is region-neutral) — so ≥ 50 ports → ≥ 150
  cross-region match-equivalents.
- Per-SP-tier precision rate ≥ 0.80 (brief 068's projection).
- 24/27 baseline preserved across all three regions.
- PR body documents per-target byte counts + any HIGH→drop
  reclassifications for brief 068's v2 tuning.

**Branch:** `decomper/cross-project-bulk-port-wave-1`

## Self-extend clause

If precision ≥ 0.80 AND ports shipped ≥ 50 → up to **2**
follow-up bulk-port waves under the same rule, draining the
HIGH-confidence cross-project pool.

If precision < 0.80 OR < 50 ports → hand back to brain. Likely
follow-up: cloud research brief on whichever SP-tier dragged
precision down.

**After this brief (and self-extends) land:**

1. If precision holds → brain queues brief 071+ targeting the
   MEDIUM-confidence pool (looser fingerprint thresholds, more
   manual verification per port).
2. If precision degrades on a specific SP-tier → brain queues
   a cloud research brief on whichever SP transition cost the
   precision.
3. Cumulative target across waves 1+2+3: drain ~50% of brief
   068's HIGH CSV (≥150 ports = ~450 cross-region equivalents).
4. The `libs/` tree growth from this brief is the foundation
   for future EUR-side hard-tier work too — once NitroSDK
   functions are matched in `libs/`, decomper's EUR hard-tier
   work has fewer unresolved cross-module references.
