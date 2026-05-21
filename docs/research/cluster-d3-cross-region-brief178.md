# Cross-region cluster D-3 apply — brief 178 outcome (SHIPPED)

**Brief:** 178 (decomper). **Outcome:** 74 cross-region D-3 chunks
shipped (37 per region × 2 regions). Brief 175's mechanical-port
falsification (PR #614, 0 chunks shipped) is now reversed by
brief 177's 3-phase chunk-extent adjuster (PR #618) plus a
recursive split-around-pre-existing-TUs pass added in this brief.

## Hypothesis tested

Take brief 175's 31 EUR D-3 Pattern 3 chunks (`src/{main,overlay002,
overlay006,overlay007,overlay021}/data/*.s`), shift each by the
per-overlay base offset (main=0, ov002=-0xe0, ov006/ov007=-0x100,
ov021=-0xe0), then run brief 177's
`tools/cross_region_chunk_extent.py` on each target range. For each
adjusted extent that overlaps a pre-existing region `.data` TU,
recursively split the target range around the conflict and re-run
the tool on each sub-range.

## Result

| Region | Claims | Bytes  | Modules     |
|--------|--------|--------|-------------|
| USA    | 37     | 40,076 | 5 (main + 4 ov) |
| JPN    | 37     | 40,076 | 5 (main + 4 ov) |
| Total  | 74     | 80,152 | -           |

Yield per region: 37 / 31 EUR chunks = 119% (sub-chunk splits
multiply the count). Bytes per region: 40 KB, far above the
250-byte gate.

## Approach

### Step 1 — Per-EUR-chunk target mapping

Apply the brief 175 shift table to each EUR chunk's `[start, end)`:

| Module | Shift   |
|--------|---------|
| main   |  0      |
| ov002  | -0xe0   |
| ov006  | -0x100  |
| ov007  | -0x100  |
| ov021  | -0xe0   |

### Step 2 — Brief 177 tool: first-pass extent adjustment

Run `tools/cross_region_chunk_extent.py --region <r> --module <m>
--start <s> --end <e> --json` for each target. The tool's 3 phases
(start-left, end-right, validate) absorb predecessor gap-extents
and round to 4-aligned named-symbol boundaries.

### Step 3 — Pre-existing TU conflict detection

Parse `config/<region>/arm9/{,overlays/<mod>/}delinks.txt` to
collect ALL pre-existing `.data` TU ranges. If the adjusted
extent overlaps any pre-existing TU, the chunk cannot ship as-is
(dsd's section-membership check would reject).

### Step 4 — Recursive split around conflicts

For each EUR chunk whose first-pass adjusted extent conflicts with
pre-existing TU(s), split the target range at the conflict
boundaries and recursively call the tool on each sub-range.
Surprisingly often, each sub-range produces a valid adjusted extent
that doesn't conflict with anything.

The recursive split is what bumped the yield from 13 per region
(brief 177's vanilla output, after conservative dedup) to 37 per
region.

### Step 5 — Generator + delinks claim

For each accepted sub-extent, call
`cluster_c_pattern3_gen.generate_chunk()` to produce `.s` text,
write to `src/<region>/<module_path>/data/data_<addr>.s`, and
append the TU entry to the region's `delinks.txt`.

## Per-module breakdown

USA (mirrors JPN exactly):

| Module | Claims | Bytes  |
|--------|--------|--------|
| main   | 18     | 27,392 |
| ov002  | 6      | 5,424  |
| ov006  | 11     | 5,896  |
| ov007  | 1      | 600    |
| ov021  | 1      | 764    |

## Generator path workaround (local-only)

`tools/cluster_c_pattern3_gen.py` resolves overlay binaries via
`extract/<ver>/arm9/arm9_ov<NNN>.bin`, but `dsd rom extract`
writes them to `extract/<ver>/arm9_overlays/ov<NNN>.bin`. A local
symlink farm (`extract/<ver>/arm9/arm9_ov*.bin` →
`../arm9_overlays/ov*.bin`) bridges the gap. The symlink set is
not committed (`extract/` is gitignored). Brief 180+ should fix
the tool to read the actual dsd path. Brief 178 stayed inside the
"❌ Touching tools/" scope by working around rather than
patching.

## What's left for brief 180+

1. **3 EUR chunks completely unportable** (no claim, no
   sub-split):
   - main `0x020c7b44..0x020c8e80` — split into
     `[0x020c7a64, 0x020c8da0)` (4924 B) and
     `[0x020c8da4, 0x020c95b0)` (2060 B); fully covered.
   - main `0x02101928..0x02101d20` — non-4-aligned predecessor
     `data_021018f6` blocks left-adjust. Truncated salvage to
     `[0x02101c40, 0x02101d20)` was attempted but conflicts
     with pre-existing TU. Listed as brief 180+ candidate.
2. **14.8 KB main "mega" residue** (brief 178 already absorbed
   it under the recursive split — chunk
   `[0x020c95b4, 0x020ccf60)` per region). If brain wants
   smaller/more-readable chunks for cluster D-3 hard residue,
   brief 180+ can refactor.
3. **Cluster C / D-1 / D-2 cross-region** — same recipe (brief
   177 tool + recursive split) should work; separate brief.

## Verification

| Region | `ninja sha1`     | `dsd check modules` |
|--------|------------------|---------------------|
| EUR    | PASS (regression) | 27/27 OK            |
| USA    | PASS (new)       | 27/27 OK            |
| JPN    | PASS (new)       | 27/27 OK            |

3-region sha1 + 27/27 modules preserved.

## Recommendation for brain

Brief 178 closes brief 175's "≥30 cross-region D-3 chunks" target
with significant headroom (74 chunks shipped vs ≥30). The recursive
split-around-pre-existing-TUs technique is generalizable — should
work for cluster C / D-1 / D-2 cross-region (separate briefs).

The generator path bug should be fixed by cloud (brief 180+) so
future runs don't need the symlink workaround.
