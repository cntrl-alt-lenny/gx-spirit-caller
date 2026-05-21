# Cross-region cluster D-3 apply — FALSIFIED for mechanical apply

**Brief:** 175 (decomper). **Outcome:** mechanical cross-region apply of
EUR D-3 Pattern 3 chunks to USA + JPN does NOT work without a
brief-174-class smarter generator. Same failure mode as brief 172
cluster B residue.

## Hypothesis tested

Brief 175 specified ≥ 20 cross-region D-3 chunks per region. Approach:
for each of 59 EUR Pattern 3 .s chunks (under `src/{main,overlay*}/data/`),
compute the USA / JPN equivalent vaddr range via per-overlay base shift
(main = same vaddr; ov002 = -0xe0; ov006 / ov007 = -0x100; ov021 =
-0xe0), then run `cluster_c_pattern3_gen.py` with `--section auto` for
the target region.

## Result

**0 chunks shipped.** 72 chunks generated across USA + JPN; every one
failed dsd's section-membership check at link time with the same
shape:

```
Error: Last symbol 'data_<X>' in section '.data' of file
'_dsd_gap@<mod>_<idx>' has the range 0x<X>..0x<X+gap> but is not
contained within the file's section range (0x<a>..0x<chunk_start>)
```

## Failure mode

Each EUR chunk's vaddr range, mapped to the USA/JPN equivalent, slices
**through** USA/JPN gap-file inner symbols whose gap-inferred sizes
extend **past** the chunk's start boundary.

Example: EUR chunk `data_ov006_021ccb88..0x021cce08` → USA equivalent
`0x021cca88..0x021ccd08`. USA's `data_ov006_021cca68` (in
`_dsd_gap@ov006_7` covering `0x021cb9a0..0x021cca88`) has
gap-inferred extent to `0x021ccce8` — which extends 0x260 bytes past
the USA chunk's start address `0x021cca88`. dsd rejects:

```
Last symbol 'data_ov006_021cca68' in section '.data' of file
'_dsd_gap@ov006_7' has the range 0x021cca68..0x021ccce8 but is not
contained within the file's section range (0x021cb9a0..0x021cca88)
```

## Why EUR cluster A `.bss` apply (brief 169) worked but D-3 doesn't

- **Brief 169 (cluster A `.bss`):** generated USA/JPN `.bss` from each
  region's OWN `symbols.txt` + `delinks.txt` section bounds.
  Self-consistent per region; no cross-region symbol mapping required.
  Mechanical.
- **Brief 175 (cluster D-3 Pattern 3):** cross-region apply requires
  mapping EUR chunk vaddrs to USA/JPN equivalents (base shifts).
  USA/JPN's `.data` symbol layout differs from EUR's at the
  shifted addresses — the gap-file boundaries don't naturally align
  with EUR-derived chunk extents.

## Why brief 163 EUR D-3 worked but cross-region doesn't

EUR chunks were authored against EUR's symbol map; chunk extents were
chosen to land on EUR symbol boundaries cleanly. Re-applying those
extents to USA/JPN ignores the per-region symbol-map differences.

The fix requires either:

1. **Per-chunk per-region inspection** (manual): for each EUR chunk,
   audit USA/JPN's gap-file boundaries around the equivalent vaddr,
   adjust chunk extent to absorb conflicting inner symbols' full
   gap-extents. Per-candidate work; doesn't scale to 59 chunks × 2
   regions.

2. **Smarter generator** (brief 174-class research): a Pattern 3
   generator that, given a region + start address, computes the
   minimum chunk extent that fits cleanly within the region's
   gap-file structure. Likely the same heuristic brief 174 is
   building for the bundle-extent problem.

## What this brief shipped

**Source changes:** none. EUR baseline bit-identical; USA + JPN
baseline preserved. Research note documents the iteration count and
recommends brief 177+ cloud generator extension.

## Verification

| Region | `ninja sha1` |
|---|---|
| EUR | PASSES ✓ |
| USA | PASSES ✓ |
| JPN | PASSES ✓ |

## Recommendation for brain

Brief 175 outcome: same falsification class as brief 172
(cross-region cluster B residue). Both blocked by gap-file
boundary mismatch.

**Brief 177+ cloud research:** generalise brief 174's bundle-extent
heuristic into a "region-aware chunk extent" generator that:

1. Takes an EUR chunk's vaddr range + target region.
2. Computes the per-region equivalent vaddr range.
3. Audits the region's `symbols.txt` + delinks gap-file boundaries
   around the equivalent range.
4. Adjusts the chunk extent to absorb all inner symbols' full
   gap-extents (similar to brief 174's bundle-extent heuristic).
5. Falls back to "this chunk needs hand-tuning" with the offending
   inner-symbol list if no clean extent exists.

Then brief 178+ (decomper) re-runs cross-region D-3 apply with
the working generator.

Same recommendation as brief 172's research note — both this and
cluster B residue suffer from the same gap-file boundary issue. A
single brief 177 generalisation could unblock both.
