### decomper/cluster-a-wave-3-overlays

**Goal:** Cluster A wave 3 — scale brief 116/118's
`.bss` placement recipe to remaining overlays. Brief
118 took ov004 + ov006 (307 syms). **~632 cluster A
candidates remaining** across ov007/9/14/21 + smaller
overlays. Wave 3 picks 2 large-pool overlays (per brief
118's self-extend pattern) to continue cluster A drain.

**Context — brief 118's findings:**

- Recipe scales linearly from main → overlay (no
  recipe adjustments needed).
- Per-wave: 2 overlays at brief 118's pace.
- Predicted outcome: overlay flips to OK iff `.bss`
  was the sole gap; if `.text`/`.data` residue exists
  (like ov004 and ARM9 main), the overlay stays
  FAILED but the cluster A coverage still ships value.
- ov004 (231) + ov006 (76) = 307 syms in one wave.

**Wave 3 selection:**

Pick 2 overlays from ov007/9/14/21 per brief 113's
per-module concentration. Each has ~525 KB of data
(per brief 113 estimate). Candidates:

| Overlay | Brief 113 data size | Brief 118 status |
|---|---|---|
| ov007 | ~525 KB | not attempted |
| ov009 | ~525 KB | not attempted |
| ov014 | ~525 KB | not attempted |
| ov021 | ~525 KB | not attempted |
| smaller (ov002/5/0/1/3/8/10..13/15..20/22/23) | varied | mostly OK already |

**Selection rule:**

1. Use `tools/data_worklist.py --version eur --cluster
   A --module ov<NNN>` to enumerate `.bss` candidates
   per overlay.
2. Pick the 2 overlays with the largest cluster A
   gap-list sizes (likely 2 of ov007/9/14/21).
3. Apply brief 116/118 recipe per-overlay.

**Method (per brief 116/118 recipe):**

For each selected overlay:

1. Find the gap `.o` containing `.bss`:
   `_dsd_gap@ov<NNN>_<idx>.o`.
2. Enumerate `.bss` symbols via `arm-none-eabi-objdump
   -t`.
3. Generate `src/overlay<NNN>/bss/data_ov<NNN>_bss.s`
   with all symbols in address order using mwasmarm
   `.bss` + `.space N`:

   ```asm
           .bss
           .global data_ov<NNN>_<addr>
   data_ov<NNN>_<addr>:
           .space 0x<size>
   ```

4. Add TU claim to `config/eur/arm9/overlays/ov<NNN>/
   delinks.txt`.
5. Verify per-overlay: `dsd check modules` should
   either flip the overlay to OK (if .bss was the sole
   gap) OR leave it FAILED (if `.text`/`.data` residue
   exists). Either is acceptable.

**Self-extend clause:**

If wave 3 covers 2 overlays cleanly with budget left,
optionally extend to a 3rd overlay. Cap at 3 overlays
per brief.

**Non-scope:**

- ❌ ARM9 main checksum recovery (separate brief
  pending cross-module reloc work).
- ❌ Cross-region cluster A apply (separate brief once
  EUR cluster A is mostly drained).
- ❌ Cluster B/C/D waves (separate briefs 122+).
- ❌ Function-tier carryovers.
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 200 cluster A `.bss` symbols claimed across 2
  overlays.
- All 3 regions stay at 25/27 baseline.
- **Stretch:** any overlay's checksum flips to OK =
  26/27 baseline (likely small overlays where .bss is
  the sole gap, not ov007/9/14/21 which probably have
  the same `.text`/`.data` shape as ov004 + ARM9 main).
- Per-wave PR with funnel + per-overlay breakdown.

**Branch:** `decomper/cluster-a-wave-3-overlays`

**After this brief lands:**

1. **Cluster A coverage estimate post-wave-3:** if
   wave 3 takes 200-300 syms from 2 overlays, cluster
   A drops from ~61% drained to ~75-80% drained. 1-2
   more waves close the cluster.
2. **Brief 122 candidate** — cluster C wave 1 (Pattern
   1, 150-185 4-aligned candidates per brief 119).
3. **Brief 123 candidate** — cluster A wave 4
   (remaining small overlays + any ov007/9/14/21 not
   covered by wave 3).
4. **Cross-region cluster A apply** — when EUR cluster
   A is mostly done (likely brief 124+ candidate).
