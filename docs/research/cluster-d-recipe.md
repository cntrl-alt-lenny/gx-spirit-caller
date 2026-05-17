# Cluster D recipe — `.data` struct arrays + dispatch tables

**Brief:** 121 Part 1 (cloud research). Brief 113 identified cluster D
as ".data struct arrays + dispatch tables." 98 native candidates per
brief 114's worklist v2. Brief 121 establishes 3 sub-clusters
(D-1 / D-2 / D-3) and the per-sub-cluster recipes.

## TL;DR

- **D-1** (dispatch / pointer tables): `void *[]` array of `extern`
  references — `.c` form works cleanly. ~71 candidates.
- **D-2** (scalar struct / byte arrays): typed C array with explicit
  initializer — `.c` form works for byte/short/int arrays. ~30-40
  candidates.
- **D-3** (complex nested struct arrays): defer to future
  typedef-inference brief. ~20 candidates (the large ones — size
  ≥0x100).
- **All sub-clusters respect brief 119's W6**: claim sizes
  naturally 4-aligned OR use Pattern 2/3 grouping.

## Worked examples (both byte-identical, 25/27 baseline preserved)

### D-1 — dispatch / data-pointer table (20 bytes)

`src/main/data_0210210c.c`:

```c
extern char data_02102120;
extern char data_02102138;
extern char data_02102150;
extern char data_02102168;
extern char data_02102180;

void *data_0210210c[5] = {
    &data_02102180,
    &data_02102168,
    &data_02102120,
    &data_02102150,
    &data_02102138,
};
```

`config/eur/arm9/delinks.txt`:

```text
src/main/data_0210210c.c:
    complete
    .data start:0x0210210c end:0x02102120
```

**Result**: byte-identical (20 bytes = 5 pointers × 4 bytes,
naturally 4-aligned, no W6 risk). 2 cross-module readers no longer
block on placeholder name. mwldarm resolves the extern references
via the target symbols' existing addresses in symbols.txt — no
need to wait for the targets to be cluster-D/B/C-recovered first.

### D-2 — 64-byte byte permutation array

`src/main/data_02101f34.c`:

```c
unsigned char data_02101f34[64] = {
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
    0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
    /* ... 48 more bytes of permutation table ... */
};
```

`config/eur/arm9/delinks.txt`:

```text
src/main/data_02101f34.c:
    complete
    .data start:0x02101f34 end:0x02101f74
```

**Result**: byte-identical (64 bytes, naturally 4-aligned, no relocs
needed — pure byte values).

## Sub-cluster classification

### D-1 — dispatch / pointer tables (~71 candidates)

**Signature**: every 4-byte word in the table resolves to a known
code or data symbol (per `tools/data_worklist.py --shape
fnptr_table`).

**Pool**: 39 `--shape fnptr_table` in `.data` + 32 from brief 117's
cluster B 4-byte pointer sub-pool = **~71 candidates total**.

**Recipe** (`.c` form):

```c
extern <type> <target_name>;   /* one per pointer target */

<element_type> <symbol_name>[N] = {
    &<target_1>, &<target_2>, /* ... */
};
```

- `void *[]` for opaque pointer arrays.
- Typed pointers (`fn_ptr_t []`, `T *[]`) when known.
- No `const` qualifier — keeps symbol in `.data` (vs `.rodata`).
- For pointers to functions: `extern void target_fn(void);` +
  `static_fn_ptr_t arr[] = { target_fn, ... };`.

**Difficulty**: LOW. Most fnptr tables are short (10-30 entries);
target resolution via `extern` declarations is mechanical.

**Estimated wave throughput**: 5-10 tables/wave.

**Per-region notes**: fnptr targets in `.text` resolve per-region
automatically (function addresses differ EUR / USA / JPN; reloc
mechanism handles it). Data-pointer targets in `.data` / `.bss` /
`.rodata` likewise.

### D-2 — scalar struct / byte arrays (~30-40 candidates)

**Signature**: pure value bytes (no relocs in the symbol's range);
size ≥0x40 (per brief 113's cluster D filter); shape `struct` or
`array` per brief 114 v2 heuristic.

**Pool**: estimated 30-40 candidates — the remainder of cluster D
after subtracting D-1 fnptr tables and D-3 complex structs.

**Recipe** (`.c` form, naturally 4-aligned sizes):

```c
unsigned char data_X[N] = { 0x00, 0x01, /* ... */ };       /* byte arr */
unsigned short data_Y[N] = { 0x0000, 0x0001, /* ... */ };  /* u16 arr */
unsigned int data_Z[N] = { 0x00000000, /* ... */ };        /* u32 arr */
```

- No `const` (preserves `.data` placement).
- For non-4-aligned sizes, apply brief 119 Pattern 2 (group with
  adjacent symbols) or Pattern 3 (chunk the section).

**Difficulty**: LOW-MEDIUM. Pure byte arrays are mechanical; need
to inspect bytes to choose element type. The choice between
`unsigned char []` (always works) vs typed array (preserves
intent) is decomper preference — recipes accept both.

**Estimated wave throughput**: 10-15 arrays/wave.

### D-3 — complex nested struct arrays (~20 candidates)

**Signature**: large size (≥0x100), shape `struct`, contains a mix
of pointer relocs + integer fields + sub-structs. Reader code
indexes into the struct via multiple field offsets.

**Pool**: ~20 candidates — the big ones in the cluster D filter.
Top by size:
- `data_020c9694` (main, 0x39ac = 14.8 KB)
- `data_02101928` (main, 0x3f8)
- `data_ov006_021ce650` (ov006, 0x258)
- `data_ov006_021ce8a8` (ov006, 0x258)
- `data_020c9694`/`data_020c3754`/etc. (main, 0x100-0x300 range)

**Recipe**: defer to future brief. Either:
- Manually inspect each candidate and hand-write struct typedef
  + initializer.
- Wait for `data_worklist v3` (typedef-inference tooling — brief
  113's brief 120+ candidate, now likely brief 124+).

**Difficulty**: HIGH. Requires per-candidate typedef discovery from
reader disassembly. Brief 081's `data-tier-scouting.md` does this
for the top-7 SDK-fundamental candidates; D-3 is the scale-out
equivalent for game-specific tables.

**Estimated wave throughput**: 1-2 tables/wave (each is a
multi-hour investigation).

## Recipe interactions with W6 (brief 119)

All three sub-clusters respect the **mwldarm 4-byte `.rodata`
rounding wall (W6)** from brief 119. Cluster D symbols are in
`.data`, which has section alignment 32 per delinks.txt header —
the W6 cascade doesn't fire for `.data`, BUT mwldarm still rounds
each `.data` section size to a multiple of the section's intrinsic
alignment.

For `.data` cluster D symbols:

- **D-1 fnptr tables**: size = 4 × N (always 4-aligned). ✓
- **D-2 byte arrays**: size depends on N elements × element size.
  Byte arrays of size N where N % 4 ≠ 0 need Pattern 2/3.
- **D-3 complex structs**: typedef-aligned per the struct layout.

**No W6 cascade observed for cluster D `.data` carves** (tested on
3 worked examples, all naturally 4-aligned). Future waves should
verify when carving non-aligned sizes.

## Pool sizing recap

| Sub-cluster | Native | + brief 117 | Total | % of cluster D |
|---|---|---|---|---|
| D-1 (pointer tables) | 39 | 32 | ~71 | 50-60% |
| D-2 (byte/array) | ~25 | — | ~30 | 30-35% |
| D-3 (complex struct) | ~20 | — | ~20 | 20% |
| **Total** | **98** | **+32** | **~130** | 100% |

Brief 117's cluster B 13% pointer sub-pool (32 candidates) folds
into D-1's recipe — sized correctly per their `void *[]` shape.

## Per-module concentration

D-1 (fnptr tables) by module (per `--shape fnptr_table`):

- main: ~5 candidates
- ov002: 1 (0xc4 — largest)
- ov006: 1
- ov010/11/15/17/18/20/21: 1-3 each (small 0x10-0x60 tables)

D-2 (scalar arrays) by module:

- main: ~15 candidates
- ov006: 5-8 (the 0x84-0x258 candidates)
- others: scattered

D-3 (complex structs) by module:

- main: 5-8 (the >0x100 candidates)
- ov006: 4-5 (the 0x258 / 0xe0 / 0x90 / 0x84 candidates)

## Estimated drain timeline

| Cluster D wave | Sub-cluster focus | Candidates | Notes |
|---|---|---|---|
| Wave 1 | D-1 small | 10 fnptr tables (≤0x30) | Easy first slice; brief 124 candidate |
| Wave 2 | D-1 medium | 15 more fnptr tables | |
| Wave 3 | D-2 scalar arrays | 15 byte/short/int arrays | |
| Wave 4 | D-1 large + D-2 remainder | 15-20 | |
| Wave 5+ | D-3 typedef-required | 1-2 per wave | Requires typedef tooling OR manual |

**Total drain**: ~10 waves for D-1 + D-2; D-3 is open-ended.

## Cross-references

- [`docs/research/data-tier-scoping.md`](data-tier-scoping.md) — brief
  113's 5-cluster taxonomy + W1-W5 wall list + brief 119's W6.
- [`docs/research/cluster-c-recipe.md`](cluster-c-recipe.md) — brief
  119's W6 details + Pattern 1/2/3 framework (referenced here).
- [`docs/research/cluster-b-recipe.md`](cluster-b-recipe.md) — brief
  117's 47% sub-classification finding (the 13% pointer sub-pool
  folds into D-1).
- [`docs/research/dtcm-section-attribute.md`](dtcm-section-attribute.md)
  — brief 115's DTCM `.s` precedent for fnptr-table layout.
- [`tools/data_worklist.py`](../../tools/data_worklist.py) — brief
  114 v2 (`--cluster D` filter, `--shape fnptr_table` filter).
- [`src/main/data_0210210c.c`](../../src/main/data_0210210c.c) —
  brief 121 D-1 worked example.
- [`src/main/data_02101f34.c`](../../src/main/data_02101f34.c) —
  brief 121 D-2 worked example.

## Outstanding for brief 124+

1. **Brief 124 (decomper)** — cluster D wave 1: 5-10 small D-1
   fnptr tables (highest cross-mod readers first). Recipe is
   established; mechanical apply.
2. **Brief 125 (decomper)** — cluster D wave 2: 10-15 D-2 byte
   arrays.
3. **Brief 126+ (cloud research candidate)** — typedef-inference
   tool design (`data_worklist v3` or new tool). Unlocks D-3
   sub-pool.
4. **Brief 127+ (decomper)** — cluster D D-3 application waves
   after typedef tool lands.

## Methodology data point

Brief 121 Part 1 is the **5th data-tier brief** (after 113
scoping, 115 DTCM pilot, 116 cluster A wave 1, 117 cluster B
recipe, 119 cluster C recipe). Pattern continues:

| Brief | Cluster | Outcome |
|---|---|---|
| 113 | (scoping) | W1-W5 walls flagged, 5-cluster taxonomy |
| 115 | E | W5 resolved (DTCM `.s` + LCF auto-routing) |
| 116 | A | recipe applied at scale (647 .bss symbols) |
| 117 | B | W4 resolved + 47% sub-classification |
| 119 | C | W6 discovered + 3-pattern recipe |
| **121** | **D** | **3-sub-cluster classification + 2 worked examples** |

Cluster D is more SUB-CLUSTER-heterogeneous than A/B/C: D-1, D-2,
D-3 each need a distinct recipe shape. D-1 + D-2 land cleanly in
brief 121; D-3 is the open question (typedef inference tooling).
