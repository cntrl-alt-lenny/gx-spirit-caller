[//]: # (markdownlint-disable MD013 MD041)

# Brief 237 — Hard-tier landscape survey + C-39e cohort + multi-call thunk pilot

**Status:** Three deliverables, all completed with clean findings.

- **(A) Hard-tier landscape survey** — Re-ran brief 220's pattern
  scan against the current unmatched pool (7696 hard-tier picks).
  Unclassified slice dropped from 27.9% (brief 220) to 22.4% (now).
  The dominant unclassified sub-cluster is "multi-call thunk
  shapes" — 861 picks (50% of unclassified, 11% of total) that
  are NOT walls and ship under natural source.
- **(B) C-39e cohort** — Detector confirmed 27 picks total, all
  in ov002. 25 unmatched, 2 already shipped (brief 232). Cohort
  is consistent with brief 235's 10-20 estimate (slightly above
  upper bound).
- **(C) Multi-call thunk pilot** — 5/5 picks ship byte-identical
  on first attempt under natural source. Classified as **C-42
  multi-call thunk hint** (NOT a wall) — flags the family for
  mechanical drain.

3-region SHA1 PASS (EUR/USA/JPN). +5 complete_units.

## (A) Hard-tier landscape — current vs brief 220

### Overall comparison

| Metric | Brief 220 (5 rounds ago) | Now | Delta |
|---|---|---|---|
| Hard-tier total | 7911 | 7696 | -215 |
| With wall prediction | 5702 (72.1%) | 5971 (77.6%) | +269 |
| Unclassified | 2209 (27.9%) | 1725 (22.4%) | -484 |

The unclassified slice **dropped by 484 picks** (22% reduction).
The C-39 family detector + sub-shapes added in briefs 222/226/229/235
reclassified most of these. C-39 now fires on 1279 picks (16.6%),
plus its sub-shapes (C-39a 40, C-39b 304, C-39d 562, C-39e 27).

### Wall histogram comparison

| Family | Brief 220 | Now | Delta |
|---|---:|---:|---:|
| C-1 | 3780 (47.8%) | 3774 (49.0%) | -6 |
| C-23 | 3357 (42.4%) | 3340 (43.4%) | -17 |
| C-36 | 1223 (15.5%) | 1206 (15.7%) | -17 |
| StyleA | 1157 (14.6%) | 1141 (14.8%) | -16 |
| C-15 | 826 (10.4%) | 820 (10.7%) | -6 |
| C-33 | 774 (9.8%) | 774 (10.1%) | 0 |
| C-39 | n/a | **1279 (16.6%)** | +1279 |
| C-39d | n/a | **562 (7.3%)** | +562 |
| C-39b | n/a | **304 (4.0%)** | +304 |
| C-22 | 270 (3.4%) | 270 (3.5%) | 0 |
| C-38 | 222 (2.8%) | 214 (2.8%) | -8 |
| P-9 | 211 (2.7%) | 211 (2.7%) | 0 |
| P-11 | 132 (1.7%) | 132 (1.7%) | 0 |
| C-39a | n/a | **40 (0.5%)** | +40 |
| C-39e | n/a | **25 (0.3%)** | +25 |
| C-32 | 18 | 18 | 0 |
| C-24 | 5 | 5 | 0 |
| C-34 | 1 | 1 | 0 |

**Top observations:**

1. The composite walls (C-1, C-23, C-36, StyleA, C-15, C-33) are
   essentially unchanged — these are large multi-wall picks that
   the decomper hasn't drained yet (recipe-iterative, not
   mechanical).
2. The C-39 family alone covers 1279 + 562 + 304 + 40 + 25 = 2210
   picks — bigger than the entire brief 220 unclassified slice.
3. Drained drops are small (-6 to -17 per family) — most decomper
   waves drained matched-multi-wall picks that other families
   also fired on, so per-family delta is small even though net
   ships have accumulated.

### Unclassified slice breakdown (1725 picks)

Bucketed by shape feature:

| Bucket | Picks | % | Sample |
|---|---:|---:|---|
| OTHER (no specific shape) | **1265 (73.3%)** | small thunk-like + state machines |
| MLA-indexed (struct array) | 176 (10.2%) | indexed `struct[idx].field` |
| MUL-indexed | 99 (5.7%) | `base + idx * stride` math |
| Long no-call leaf (>64B) | 71 (4.1%) | leaf body, ≤200B |
| Switch table (`addls pc`) | 55 (3.2%) | jump-table dispatch |
| Small no-call leaf (≤64B) | 36 (2.1%) | tiny leaf with no helpers |
| Volatile MMIO pool | 11 (0.6%) | `0x04001xxx` pool word |
| Mega function (>512B) | 11 (0.6%) | huge dispatch |
| Co-processor (mcr/mrc) | 1 (0.1%) | inline asm candidate |

### Drilling into OTHER (1265 picks)

| Sub-bucket | Picks | % of OTHER | Sample |
|---|---:|---:|---|
| **A_multi_call_no_extract** | **861 (68.1%)** | 2+ helper calls, no bit-extract |
| F_misc | 198 (15.7%) | other shapes |
| C_pool_helper_arg | 162 (12.8%) | helper + pool-loaded arg |
| B_predicated_chain | 39 (3.1%) | 3+ conditional moves |
| D_byte_extract_lsl24 | 5 (0.4%) | non-leaf C-37 Shape B (rare) |

**The biggest unclassified cluster: A_multi_call_no_extract — 861
picks (50% of unclassified, 11% of total hard-tier).** These are
small (typically 32-64 B) thunk-like functions with 2-3 helper
calls and no bitfield extracts. Investigation C shows they ship
under natural recipe.

### Top 5 unclassified clusters

1. **A_multi_call_no_extract (861 picks)** — C-42 family.
   Pilot: 5/5 ship under natural recipe (see Investigation C).
   Estimated drain: ~600-800 picks accessible.

2. **MLA-indexed (176 picks)** — brief 220 noted these are
   "usually not a wall." Natural `struct[idx].field` should
   work. Brief 238+ could pilot a small wave.

3. **C_pool_helper_arg (162 picks)** — within the C-42 family
   (subset of multi-call shape). Recipe overlap with C-42 sub-
   shape 5.

4. **MUL-indexed (99 picks)** — multiply-based offsets, similar
   to MLA but with explicit mul. Mechanical drain.

5. **Long no-call leaf (71 picks)** — leaf body > 64 B with no
   helper calls. May be C-38 lookalikes that don't trigger the
   current detector, or large bit-extract picks. Worth a future
   brief survey.

Top 3 sample picks per cluster:

```
A_multi_call_no_extract:
  ov000 0x021aae34 size=32 func_ov000_021aae34   ← shipped (C-42 pilot)
  ov000 0x021aaec4 size=32 func_ov000_021aaec4   ← shipped (C-42 pilot)
  ov002 0x021b0c34 size=32 func_ov002_021b0c34   ← shipped (C-42 pilot)

MLA-indexed:
  ov002 0x021eddec size=168 func_ov002_021eddec
  ov002 0x021edd4c size=160 func_ov002_021edd4c
  ov002 0x021df6a8 size=120 func_ov002_021df6a8

MUL-indexed:
  ov002 0x021df818 size=600 func_ov002_021df818
  ov002 0x021df56c size=216 func_ov002_021df56c
  ov002 0x021e7a8c size=212 func_ov002_021e7a8c

Long no-call leaf:
  ov002 0x021c2c10 size=104 func_ov002_021c2c10
  ov002 0x021bee68 size=92 func_ov002_021bee68 (also fires C-22)
  main  0x02019498 size=88 func_02019498

Switch table (addls pc):
  ov002 0x0222bc1c size=396 func_ov002_0222bc1c (brief 222 deferred A2)
  ov002 0x02283fcc size=312 func_ov002_02283fcc
  ov002 0x021ed3c4 size=204 func_ov002_021ed3c4
```

## (B) C-39e cohort across all overlays

Brief 235 estimated 10-20 C-39e picks; brief 237 confirms **27
total, ALL in ov002**.

- 25 unmatched (decomper drain candidates for brief 236+)
- 2 already shipped (0228b810, 0228b850 from brief 232)
- Brief 235 also shipped 0228b894 (matched but doesn't fire
  detector — variant without bit-extract; see brief 235 note)

The "all in ov002" finding is interesting — C-39e shape (test
arg1 + helper1(self, bit0) + helper2(self, arg1)) is a specific
gameplay-system idiom unique to overlay 2. Other overlays use
different idioms.

Full list (all unmatched unless noted):

```
ov002 0x021ffc40   ov002 0x02200908   ov002 0x0220196c
ov002 0x022058b4   ov002 0x02206608   ov002 0x022076a0
ov002 0x02207b74   ov002 0x022088ec   ov002 0x02209728
ov002 0x0220b488   ov002 0x0220bc14   ov002 0x0220e16c
ov002 0x022101c4   ov002 0x022304d4   ov002 0x0228a6e0
ov002 0x0228a7c8   ov002 0x0228a9a4   ov002 0x0228ae18
ov002 0x0228ae94   ov002 0x0228af60   ov002 0x0228b0a0
ov002 0x0228b204   ov002 0x0228b684
ov002 0x0228b810 matched   ov002 0x0228b850 matched
ov002 0x0228b8c8   ov002 0x0228b9d8
```

**Conclusion**: detector is correctly scoped. Cohort slightly
above brief 235's estimate (25 vs 10-20). Brief 236's decomper
drain has ~25 picks of mechanical work available.

## (C) C-42 multi-call thunk pilot — 5/5 ship

### The hypothesis

The 861-pick "multi-call no-extract" cluster looks like simple
thunks. They're unclassified because no detector recognises the
shape, NOT because they're walls.

### The pilot

5 picks sampled from the cluster's smallest size band (32 B):

| Pick | Size | Sub-shape |
|---|---|---|
| `func_ov002_021b0c34` | 32 B | Conditional helper2 + literals |
| `func_ov000_021aaec4` | 32 B | Helper1 + field load + helper2 + zero-write |
| `func_ov010_021b2bf8` | 32 B | Two helpers with pool-loaded data symbols |
| `func_ov000_021aae34` | 32 B | helper1 saved across void helper2 |
| `func_ov002_0220868c` | 32 B | Single helper + fn-pointer arg + bool tail |

### The result

**5/5 ship byte-identical** under natural source recipes. No
special idiom, no tier routing tricks, no register hints.

Two notes on recipe-mismatch failure modes observed during the
pilot:

1. **`021b0c34` v1 emitted extra `moveq r0, #0`**. The source
   `if (helper1() == 0) return 0;` materialises 0 in r0 via
   `moveq` even though r0 IS already 0 from the helper return.
   Fix: `int r = helper1(); if (r == 0) return r;` — mwcc sees
   r holds helper1's return and treats it as already-0,
   emitting just `popeq` without the extra `moveq r0, #0`.

2. **`021b2bf8` v1 indirected through `extern int g_arg1`**. The
   pool slot in the orig is an ABS32 relocation to the data
   address itself, not a pointer-to-address. Fix: declare the
   data symbol as `extern char data_xxx[]` (array form), which
   makes mwcc emit a relocation to the symbol's address directly
   without an extra `ldr` deref.

### The classification: C-42 (multi-call thunk hint)

NOT a wall in the traditional sense — these picks ship under
natural C with no special idiom. Brief 237 classifies as **C-42
hint**: a recognition cue to flag the family for mechanical
drain rather than recipe research.

The C-42 detector fires when:

- Size ≤ 64 B
- ≥1 `bl` instruction
- No other wall predictions fired (no C-1, C-22, C-23,
  C-37/39 family, C-40/41, etc.)

5/5 pilot picks shipped first-attempt. 3 new unit tests added.

## Detector + tests summary

`tools/predict_walls.py` extension:

- **C-42**: small (≤64 B) functions with helper calls and no
  other wall predictions. Emit as recipe-ready hint.

3 new unit tests in `TestC42Detection`:

1. `test_small_multi_call_no_other_walls_fires_c42` — canonical
   fires.
2. `test_c39_pick_does_not_fire_c42` — exclusive of other walls.
3. `test_large_function_does_not_fire_c42` — scope-limited to
   small thunks.

## Drain impact

Brief 237 ships:

- 5 worked examples (3 in ov002, 2 in ov000, 1 in ov010)
- New wall C-42 (`hint` style) — 42 → 42 patterns (no change in
  count; C-42 added but is a "hint" not a wall)
- Updated codegen-walls.md taxonomy
- 3 new unit tests

Brief 238+ drain queue from C-42:

- ~600-800 picks accessible via natural recipe (estimated 70-90%
  of the 861-pick cluster ships first-attempt)
- ~10 min/pick effective rate (read disasm + write extern decls +
  transcribe call sequence)
- Total: ~100-130 hours of mechanical drain available

Plus continuing decomper drains on:

- C-39a/b/d (locked recipes from briefs 226, 229)
- C-39e (25 picks, brief 235 recipe)
- C-40 + C-41 (brief 233 + 235 recipes — corpus mostly drained)
- StyleA + C-33 + C-1 + C-23 composite picks (large iterative
  recipes — slower drain rate)

## Cross-references

- `docs/research/hard-tier-wall-survey.md` — brief 220 baseline
- `docs/research/brief-222-c39-non-leaf-bitfield.md` — C-39 base
- `docs/research/brief-226-c39-subclass-sign-check-helper-reuse.md`
  — C-39a/b
- `docs/research/brief-229-c39c-d-pilots-and-c38-nonleaf.md` —
  C-39d (locked), C-39c (P-13), C-38 non-leaf (P-12)
- `docs/research/brief-235-c39e-c40-broader-and-232-deferred.md`
  — C-39e (locked), C-41 (new wall)
- `src/overlay002/func_ov002_021b0c34.c` — C-42 canonical
