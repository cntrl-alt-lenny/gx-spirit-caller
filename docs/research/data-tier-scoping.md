# Data-tier scoping — what would "matching the data tier" entail?

**Brief:** 113 (cloud scoping). The data tier is 0% matched across the
entire session (4.78 MB unaddressed — 2× the size of code). With the
function-tier walls-research pipeline mature (30 coercible + 10
permanent + 4 tooling entries) and cross-region tooling complete, data
tier is now the biggest unrealized lever. This is SCOPING — no
application work; outputs a future brief plan for the next session arc.

_Brief 113 (PR #?). Scoping-only — no application work. Outputs a future
brief plan for data-tier matching waves._

## Why this brief now

The function-tier matching pipeline has reached natural drain
multiple times this session — cap-raise, cross-region apply,
medium-tier follow-on, walls-research with 3 P-N → C-N permuter
promotions. The walls-research pipeline (briefs 084 / 088 / 099 /
100 / 103 / 105 / 107 / 109 / 111) keeps the function-tier
productive but per-round yields are now ~10-30 ports. Per-round
yield trajectory:

- briefs 080-091: 20-50 ports per round (cap-raise + medium-tier)
- briefs 094-110: 10-30 ports per round (cross-region + walls
  application)
- brief 113+: data-tier is the next major lever (this brief).

The data-tier has been at 0% across the entire session. Per
[`docs/research/data-tier-scouting.md`](data-tier-scouting.md)
(brief 081-era), the data-tier worklist was already identified
in 2026-04-23; the work just never got picked up because
function-tier was always higher-leverage per-round. With
function-tier yields tapering, data-tier moves to the front of
the queue.

This is a SCOPING brief. Brief 114+ will be the first
application wave per the plan in this note.

## Section landscape

Per `tools/progress.py --version eur`:

| Tier | Bytes | % of total | Status |
|---|---|---|---|
| Code (`.text` + `.init`) | 2.39 MB | 33% | 1.79% matched (42,692 bytes via 1624 complete TUs) |
| Data (`.rodata` + `.ctor` + `.data` + `.bss`) | 4.78 MB | 67% | **0.00% matched (0 bytes via 0 TUs with data sections)** |

**Data is 2× the size of code** and **completely unaddressed**. The
function-tier matching pipeline has accumulated 1624 complete TUs
but ZERO of them include data sections. Every existing `.c` source
file is `.text`-only — declares functions, `extern`-references
data symbols, never DEFINES the data.

### Per-section breakdown (cross-module sums)

| Section | Total bytes | % of data tier | Concentration |
|---|---|---|---|
| `.bss` (uninitialized) | 4,067,552 | 85% | runtime zero-fill; **no bytes in arm9.bin** |
| `.data` (initialized) | 382,976 | 8% | mostly game tables (lookup arrays, dispatch tables) |
| `.rodata` (read-only) | 325,796 | 7% | strings + palette tables + const arrays |
| `.ctor` (C++ constructors) | 204 | <0.01% | empty in C-only project; routinely 0 bytes |

### Per-module data concentration

| Module | Code | .rodata | .data | .bss | Data total |
|---|---:|---:|---:|---:|---:|
| **main** | 738,080 | 63,644 | 258,208 | 686,144 | **1,007,996** (21% of data) |
| **ov004** | 84,184 | 177,188 | 6,752 | 559,104 | **743,048** (16%) |
| **ov006** | 102,488 | 1,472 | 13,952 | 585,824 | **601,292** (13%) |
| **ov009** | 13,196 | 60 | 704 | 590,112 | **590,888** (12%) |
| **ov021** | 6,544 | 0 | 4,064 | 524,896 | **528,968** (11%) |
| **ov007** | 3,256 | 0 | 1,248 | 524,544 | **525,800** (11%) |
| **ov014** | 10,616 | 32 | 896 | 524,608 | **525,548** (11%) |
| **ov002** | 1,129,252 | 51,236 | 10,880 | 22,144 | **84,280** (1.8%) |
| ov000 | 21,296 | 27,692 | 69,600 | 10,624 | 107,916 |
| others (18) | 250,036 | 5,272 | 16,672 | 24,144 | 56,792 (1.2%) |
| **TOTAL** | **2,385,948** | **325,796** | **382,976** | **4,067,552** | **4,776,528** |

**85% of data is .bss** (zero-fill at runtime — no bytes to match,
just symbol-placement). The 7 overlays ov004/6/7/9/14/21 +
ov002 + main collectively hold **97% of the data tier**.

### Why .bss matters more than .data + .rodata combined

`.bss` is runtime-allocated zero-fill — **arm9.bin does NOT
contain .bss bytes** (verified: arm9.bin is 1059936 bytes = end
of .data exactly). For .bss matching, there are no bytes to
verify byte-for-byte:

- The recipe is purely SYMBOL PLACEMENT: declare `T data_X[N];`
  in a .c file at the right address.
- mwldarm computes the .bss section's size + alignment from the
  union of all declared .bss symbols, and that's the
  ROM-correctness target.
- Once a TU's .bss section size matches the orig's expected size
  for that address range, the TU is "matched" for .bss purposes.

This is **structurally easier than function matching** — there's
no byte-by-byte instruction comparison, only address + size
matching against `delinks.txt`'s authoritative section map.

## Symbol corpus

Per `tools/data_worklist.py --version eur`:

- **10,952 total data symbols** (across all modules)
- **0 matched** (all in placeholder form `data_<hex>` or
  `data_ov<N>_<hex>`)
- **2,020 worklist candidates** (data symbols with ≥1 reader)
- **1 SDK-fundamental candidate** with 14 cross-module readers
  (`data_020b4728`)
- **3 candidates** with 5 cross-module readers
- **2010 candidates** with ≥1 reader but only 1 module (per-game
  globals)

| Cross-module reader count | # data symbols |
|---:|---:|
| 14 | 1 (the SDK-fundamental anchor) |
| 5 | 3 |
| 3 | 2 |
| 2 | 4 |
| 1 | 2010 |

The cross-module density signal sorts naming priority: the
14-modules-touch candidate is almost certainly an NitroSDK
fundamental (e.g., `OSi_IrqCallbackTable`); the 1-module-touch
candidates are game-specific globals (per-module engine state,
scene tables, etc.).

## Tooling inventory + gaps

### What exists

| Tool | Tracks code | Tracks data | Notes |
|---|---|---|---|
| `tools/progress.py` | ✓ | ✓ | Already aggregates `matched_code` + `matched_data` from delinks.txt or objdiff `report.json`. **Data column shows 0/4,776,528 today.** |
| `tools/data_worklist.py` | — | ✓ | Ranks data symbols by cross-module reader density. Generates `build/<ver>/analysis/data_worklist.md`. Brief 081-era. |
| `dsd check modules` | ✓ | ✓ (implicit) | Module-level checksum includes .data + .rodata + .bss layouts. The 3 failing modules (ARM9 main, DTCM, ov004) fail partly due to data-tier divergence. |
| `objdiff-cli report` | ✓ | ✓ | Generates `build/<ver>/report.json` with per-unit data-section diff stats. Already wired into ninja graph. |
| `tools/rename_symbol.py` | ✓ | ✓ | Single-symbol rename. Works for data symbols. |
| `tools/nitro_suggest_renames.py` | ✓ (function only) | ✗ | Function-only. **GAP: no data-symbol naming suggester.** |
| `libs/nitro/include/` | — | partial | Brief 081 added `nitro/os.h` with NitroSDK type stubs. Many more SDK types not yet adopted. |

### Tooling gaps for application waves

1. **`tools/data_worklist.py` ranks by reader density but doesn't
   tier by structural complexity.** A scalar `data_X = 42;` is
   trivial; a 4 KB jump table requires a struct typedef + literal
   initializer. A wave-1 brief needs a "smallest cluster first"
   filter (size ≤ 16 bytes OR likely-scalar shape).

2. **No data-tier diff/report subcommand.** `dsd report` doesn't
   exist (only `dsd check`). `objdiff-cli report` includes data
   stats but doesn't break out per-section (just per-unit). Brief
   would need a small wrapper to surface "what's the .data % vs
   .bss % vs .rodata %?"

3. **No data-symbol typedef inference tool.** For
   `data_020b4728` (14 cross-module readers), the readers' usage
   patterns (`ldr rX, [data_X + 4]; bl <fn>`) imply a struct shape
   — but no tool aggregates these into a typedef candidate.
   Brief 081's `data-tier-scouting.md` did this hand-analysis for
   the top-7 candidates; scaling to 100s would need automation.

4. **Cross-region data-shift handling exists** (brief 095
   `port_to_region.py` D3). Once an EUR data symbol is named, the
   USA/JPN siblings follow via the existing cross-region pipeline.
   No new tooling here.

## Cluster taxonomy (5 clusters by shape + complexity)

Spot-checks of unmatched data symbols across `.rodata` / `.data` /
.bss + dqix conventions inform the following cluster taxonomy.
Each cluster has a distinct **recipe + application difficulty**.

### Cluster A — `.bss` symbol placement (lowest difficulty)

**Recipe**: declare uninitialized variables in a `.c` file at the
right address; mwldarm computes .bss layout from declarations.
**No bytes to match** — just symbol address + size.

**Pool size**: 1,587 explicitly-classified `.bss` symbols + a
large fraction of the 10,952 `data(any)` symbols whose addresses
fall in `.bss` ranges (estimate: ~8,000 of the 10,952).

**Per-module concentration**: ov004/6/7/9/14/21 + main hold 97%
of .bss bytes.

**Workflow**:

```c
/* src/main/main_bss_chunk_N.c — a 'chunk' covering N adjacent symbols */
typedef struct { /* whatever the layout is */ } T_X;
T_X data_021040ac;
char _pad_021041d0[0x100];  /* gaps where no symbol is named */
T_X data_021042d0;
/* ... */
```

Plus `delinks.txt` entry:

```text
src/main/main_bss_chunk_N.c:
    complete
    .bss start:0x021040ac end:0x02104500
```

**Difficulty**: LOW for individual symbol naming, MEDIUM for
"chunking" (deciding how to group symbols into TUs). The chunk
boundary is arbitrary but stable — once chosen, the bytes are
fixed.

**Estimated wave throughput**: 50-100 symbols per wave (a chunk
TU can cover ~50 adjacent .bss symbols at once).

### Cluster B — `.data` scalar constants (low difficulty)

**Status:** recipe established by **brief 117**, see
[`docs/research/cluster-b-recipe.md`](cluster-b-recipe.md) for full
write-up.

**Recipe summary**: declare initialized scalars at the right address.
W4 resolution confirmed: mwcc 2.0/sp1p5 places `int x = N;` in `.data`
automatically — NO `__attribute__((section))` needed. Multi-global
`.c` files reorder symbols (NOT declaration order, NOT address order),
so:

- **Singleton scalar → `.c` file** (one global per file).
- **Contiguous run of scalars → `.s` file** with mwasmarm
  (brief 115's DTCM pattern).

**Pool size (refined by brief 117 byte-pattern inspection of 247
candidates)**:

- **86 true scalars** (35%) — int/short/byte values; fit cluster B.
- **115 small ASCII strings** (47%) — fold into cluster C workflow.
- **32 pointers** (13%) — need typedef discovery; sequence after
  brief 121+ typedef-inference tooling.
- **14 unclassified** (6%) — per-candidate inspection.

**Estimated wave throughput**: 25-30 syms/wave for true scalars
(86 / 30 = ~3 waves to drain the scalar sub-pool). String + pointer
sub-pools sequence into later waves.

**Worked examples (brief 117 — both byte-identical):**
- `src/main/data_020c3e48.c` (singleton `.c`, value=1)
- `src/main/data_02102be8.s` (13-symbol ASCII-string run via `.s`)

### Cluster C — `.rodata` strings + const arrays (medium)

**Status:** recipe established by **brief 119**, see
[`docs/research/cluster-c-recipe.md`](cluster-c-recipe.md) for full
write-up + new wall W6.

**Recipe summary**: claim symbols (or symbol groups) whose total
size is a multiple of 4 bytes. mwldarm rounds `.rodata` section
size to 4-byte alignment; non-aligned claims cascade through the
`.ctor` ALIGN(32) directive to shift `.data` + `.bss` + overlays
by 32 bytes — ALL modules fail. New **W6 wall** documented.

Safe patterns:
- **Pattern 1**: claim symbols whose individual size is 4-aligned
  (e.g. 32-byte `const u16[16]`).
- **Pattern 2**: claim contiguous groups whose summed size is
  4-aligned (e.g. 5-byte string + 9-byte string + 2-byte pad =
  16 bytes).
- **Pattern 3**: chunk the entire `.rodata` section in one `.s`
  file (brief 116's cluster A approach scaled to .rodata).

**Pool size (refined per brief 119 + 117 sub-classification)**:
- 347 native cluster C candidates + 115 mis-classified cluster B
  4-byte strings = **~462 effective candidates**.
- Brief 113's original estimate of 200-500 was accurate.

**Estimated wave throughput**: 20-30 syms/wave for 4-aligned
candidates (Pattern 1, easy slice). Larger waves possible with
Pattern 3 (chunk-the-section) but require generator tooling or
manual transcription of ~60 KB of bytes.

**Worked example (brief 119)**: `src/main/data_020b4748.c` —
16-element `const unsigned short` array (32 bytes, naturally
4-aligned). Byte-identical at default mwcc 2.0/sp1p5; 25/27
baseline preserved.

### Cluster D — `.data` struct arrays + dispatch tables (medium-high)

**Status:** recipe established by **brief 121 Part 1**, see
[`docs/research/cluster-d-recipe.md`](cluster-d-recipe.md) for
the 3-sub-cluster classification + worked examples.

**3 sub-clusters**:

- **D-1** (dispatch / pointer tables): `void *[]` array of `extern`
  references — `.c` form, naturally 4-aligned size. ~71 candidates
  (39 native fnptr + 32 from brief 117's pointer sub-pool).
- **D-2** (scalar struct / byte arrays): typed C array
  (`unsigned char []` / `unsigned short []` / `unsigned int []`).
  ~30-40 candidates.
- **D-3** (complex nested struct arrays): defer to future
  typedef-inference brief. ~20 candidates (the large >0x100 ones).

**Pool size (refined per brief 121)**:
- 98 native cluster D candidates + 32 from brief 117 D-1 fold =
  **~130 effective**.

**Estimated wave throughput** (refined per brief 121):
- D-1: 5-10 tables/wave (mechanical, extern resolution)
- D-2: 10-15 arrays/wave (byte/short/int initializer transcription)
- D-3: 1-2 tables/wave (typedef discovery per candidate)

**Worked examples (brief 121, both byte-identical)**:
- `src/main/data_0210210c.c` (D-1: 20-byte data-pointer table)
- `src/main/data_02101f34.c` (D-2: 64-byte permutation array)

### Cluster E — DTCM / ITCM specials (one-shot)

**Recipe**: same as A-D but for the DTCM (`0x027e0000`) +
ITCM (`0x01ff8000`) sections. These hold critical-path SDK
state (IRQ handlers, scheduler queue, DMA bookkeeping).

**Pool size**: DTCM has 1568 bytes total; ITCM has 0 bytes
.data/.bss. Effectively a single-wave cluster.

**Difficulty**: LOW (small) but HIGH-LEVERAGE — the DTCM
failures are part of the 3-of-27 module checksum baseline.
Matching DTCM .data could be the single trigger that flips
DTCM from "failed" to "OK" in `dsd check modules`.

**Workflow**: brief 081 already wrote
[`data-tier-scouting.md`](data-tier-scouting.md) recommending
DTCM `0x027e0000` as the pilot — that scouting is reusable
verbatim.

## Walls / risks discovered during scoping

### W1 — .bss chunking arbitrary boundaries

`.bss` symbols are individually placed but don't naturally cluster
into "TUs." A single TU could declare 50 adjacent .bss symbols, or
500. The choice of chunk boundary is arbitrary — but it's STABLE
once made.

**Risk**: choosing chunks that span symbol-boundary diffs
between regions (EUR / USA / JPN) requires re-chunking per region.
**Mitigation**: align chunk boundaries with already-known
structural boundaries (e.g., a TU per "subsystem" — IRQ state,
heap state, etc.) rather than mechanically by address.

### W2 — Typedef instability

A wrong typedef for a cross-module data symbol breaks every reader
that uses it. Per `data-tier-scouting.md`:

> "A wrong typedef breaks more than one function. Naming `data_X`
> as `OSHeapInfo` and setting the wrong struct layout shifts every
> offset in every reader."

**Mitigation**: scout-before-name (brief 081's pattern). For each
high-cross-module-density symbol, hand-analyze 2-3 reader
disassemblies before committing to a typedef.

### W3 — Cross-region data-shift propagation

Brief 095 D3's data-shift consensus handles the cross-region
resolution for code. For data, the same mechanism applies — but
"data shift" semantics differ:

- Code shift: function body moves N bytes; relocations adjust
  automatically via address-translation.
- Data shift: struct layout might differ between regions (extra
  fields in EUR for additional languages; reordered fields).

**Mitigation**: spot-check 2-3 USA/JPN siblings of any EUR-named
data symbol BEFORE the cross-region port to confirm layout
identity.

### W4 — Section-attribute requirements

Some data symbols may need explicit `__attribute__((section(".rodata")))`
or `#pragma section` directives if the natural mwcc placement
chooses a different section. Particularly for:
- `const`-qualified arrays that mwcc might place in `.data` instead
  of `.rodata`
- Mixed-init arrays that mwcc splits across sections

**Mitigation**: per-cluster, the recipe brief should pin down the
exact attributes/pragmas needed. Spot-check before wave-2 of any
cluster.

### W5 — DTCM section attribute

DTCM symbols need `#pragma section "DTCM"` (or equivalent) for mwldarm
to place them in the DTCM segment rather than main `.data` / `.bss`.
The exact pragma syntax for this project's mwldarm is **TBD** — needs
research during cluster E's first wave.

**RESOLVED** by brief 115: no pragma needed — mwasmarm `.s` with
`.section .data` + dsd LCF auto-routing handles DTCM placement. See
[`docs/research/dtcm-section-attribute.md`](dtcm-section-attribute.md).

### W6 — mwldarm `.rodata` 4-byte size rounding + `.ctor` cascade (brief 119)

mwldarm rounds `.rodata` section size to 4-byte alignment when
assembling the linked output. A claim whose total size is NOT a
multiple of 4 bytes causes mwldarm to add 1-3 bytes of padding,
which shifts following `.rodata` bytes, cascades through the
`.ctor` section's `ALIGN(32)` directive, and shifts the entire
`.data` + `.bss` + overlay layout by **32 bytes** — failing every
module's checksum (25 OK → 1 OK).

**Mitigation** (brief 119, see
[`docs/research/cluster-c-recipe.md`](cluster-c-recipe.md)):
- Claim `.rodata` symbols whose individual size is 4-aligned
  (Pattern 1).
- Group contiguous non-aligned symbols into one TU whose summed
  size is 4-aligned (Pattern 2).
- Chunk the entire `.rodata` section in one `.s` file
  (Pattern 3, scales like brief 116's cluster A).

**Why not W4 / W5 forms?**
- `.bss` (cluster A): zero-fill at runtime → no padding bytes in
  file. Brief 116 saw no alignment cascade.
- `.data` (cluster B): section alignment 32 (per delinks.txt
  header). mwldarm pads each `.data` section internally; dsd's
  gap regen accounts for it. No cascading shift.
- `.rodata` (cluster C): section alignment 4 (per delinks.txt
  header). The 4-byte rounding interacts uniquely with the
  `.ctor` ALIGN(32) directive emitted by dsd's LCF gen.

## Cross-project leverage

Brief 074's pokediamond chain delivered 99 ports via cross-project
recipe transfer. **Does data-tier accumulate cross-project?**

**Partial yes** for NitroSDK fundamentals (cluster A's SDK-shaped
subset — ~10 data symbols). NitroSDK's `OSi_IrqCallbackTable`,
`OSi_ArenaInfo`, etc. exist identically across all DS games. Once
named in our project, the same name + typedef applies to
pokediamond / pokeheartgold / dqix. Brief 081's
`data-tier-scouting.md` already identified the top-7 candidates;
those could be cross-project-shippable.

**No** for game-specific globals (2010 of 2020 worklist
candidates). Game globals are project-specific by definition.

**Estimate cross-project unlock**: 10-30 data symbols per game,
batch-portable via a single brief. Smaller pool than function-tier
cross-project (which was hundreds) but still measurable.

## Future brief plan

### Brief 114 candidate — Tooling-gap: `data_worklist.py` v2

Extends `tools/data_worklist.py` to filter by:
- **Section** (`.bss` / `.data` / `.rodata`)
- **Size band** (`--max-size 16` for scalars)
- **Cluster shape inference** (heuristic: scalar / array / struct
  based on size + reader load patterns)

Adds:
- Per-cluster wave-size estimates (e.g., "wave-1 cluster A:
  est. 80 symbols, ~2 hour decomper time").
- DTCM-only and ITCM-only filters.

**Estimated effort**: 4-6 hours cloud research + tooling, +
decomper review.

**Priority**: HIGH — this unblocks cluster A wave-1.

### Brief 115 candidate — Cluster E (DTCM pilot)

**Wave 1**: name + match DTCM `0x027e0000` per
`data-tier-scouting.md`'s candidate #6. ~5-10 DTCM symbols
expected.

**Goal**: flip DTCM from "failed" to "OK" in `dsd check modules`
— first 25/27 baseline since session start.

**Estimated effort**: 4-8 hours decomper (NitroSDK type
identification + .c authoring + verification).

**Priority**: HIGH — clean DTCM unblocks `dsd check modules`
discriminator for future work AND validates the data-tier workflow
end-to-end on a small pool.

### Brief 116 candidate — Cluster A wave 1 (.bss chunk)

**Wave 1**: pick one mid-size .bss chunk in `main` (~50 adjacent
symbols, ~2 KB range). Author chunk TU, verify `dsd check modules`
unaffected (or improved).

**Estimated effort**: 6-10 hours decomper (chunk boundary
selection + .c authoring + structural verification).

**Priority**: HIGH — establishes the .bss-matching workflow + the
"chunking" convention.

### Brief 117 candidate — Cluster A wave 2-N (.bss scale-out)

Subsequent waves apply the brief 116 recipe to additional
chunks. Per-wave throughput estimate: 50-100 symbols. With 97% of
.bss concentrated in 7 modules, **15-25 waves** could cover all
of .bss (15-25 × 50-100 = 750-2500 symbols across the
~8000-symbol .bss pool).

**Priority**: MEDIUM (after wave 1 calibrates throughput).

### Brief 118 candidate — Cluster B (.data scalars)

After clusters A + E establish workflow, .data scalars are the
next-easiest. ~500-1000 candidates.

**Priority**: MEDIUM.

### Brief 119+ candidates — Clusters C + D

Strings, const arrays, dispatch tables — higher difficulty per
symbol. Schedule after A/B/E provide tooling foundation.

**Priority**: LOW-MEDIUM (each cluster needs its own typedef
research subbrief).

### Tooling-gap briefs (sub-track)

- **Brief 114 (above)** — `data_worklist.py` v2 (cluster + size
  filtering).
- **Brief 120-or-later** — data-symbol typedef inference tool.
  Aggregates reader usage patterns into typedef candidates.
  Useful for cluster D (dispatch tables); not needed for clusters
  A / B / E.
- **Brief 121-or-later** — `dsd report` equivalent for per-section
  data-tier stats. Currently `progress.py` aggregates; a focused
  CLI for "show me ov004 .bss matched %" would speed feedback
  loop.

## Workflow design — per-cluster ownership

| Cluster | Cloud research | Decomper application | Per-wave throughput |
|---|---|---|---|
| A (.bss) | chunk-boundary recommendation (mechanical) | declare + delink + verify | 50-100 symbols |
| B (.data scalars) | type inference from readers (per-symbol) | declare + initialize + verify | 20-30 symbols |
| C (.rodata) | shape inference (string vs array vs table) | declare + initialize + verify | 10-20 symbols |
| D (.data struct arrays) | typedef research (per-table) | declare + populate + verify | 3-5 tables |
| E (DTCM/ITCM) | NitroSDK type identification | declare + section attr + verify | 5-10 symbols (one-shot) |

## Realistic expectations

If data-tier waves yield 50 symbols / week (avg across clusters),
the 10,952-symbol pool takes **~200 weeks of wave throughput** to
fully name. That's not the target — the target is **module-level
checksum recovery**:

- **3 currently failing modules** (ARM9 main, DTCM, overlay 4)
  hold most of the unmatched data weight.
- **DTCM** is small (1568 bytes) — likely the first to flip OK.
- **Overlay 4** has 743 KB data, mostly .bss — likely the second
  major flip.
- **ARM9 main** has 1 MB data — the biggest target.

**Realistic 6-month roadmap**:
- Months 1-2: tooling + cluster A pilot + cluster E pilot
  (DTCM OK)
- Months 3-4: cluster A scale-out (ov004 .bss + main .bss)
- Months 5-6: cluster B + C + D backfill

End state: ~50% data-tier matched, 26/27 modules OK (DTCM + ov004
recovered; ARM9 main still failing on cross-module relocations).

## Cross-references

- [`docs/research/data-tier-scouting.md`](data-tier-scouting.md)
  — brief 081-era SDK-fundamental scouting; still actionable for
  cluster E wave 1.
- [`tools/data_worklist.py`](../../tools/data_worklist.py) — the
  worklist ranker. v2 needed (brief 114 candidate).
- [`tools/progress.py`](../../tools/progress.py) — already tracks
  data-tier; reports 0% / 4.78 MB.
- [`docs/research/cross-project-pipeline-lessons.md`](cross-project-pipeline-lessons.md)
  — cross-project unlock pattern; relevant for cluster A's SDK
  subset.
- [`docs/research/sp3-routing-decision.md`](sp3-routing-decision.md)
  + brief 044 routing-tier framework — analogous to data-tier
  cluster taxonomy.
- [`docs/research/codegen-walls.md`](codegen-walls.md) — function-
  tier walls catalog. **No data-tier walls discovered during this
  scoping pass.** Walls W1-W5 above are workflow risks, not
  codegen walls (no compiler-IR divergence is at stake). Brief
  115+ waves may surface real data-tier walls (e.g., mwldarm
  placing a `const` in `.data` instead of `.rodata`); those
  would warrant a new section type in `codegen-walls.md` (or a
  separate `data-walls.md`).

## Quick reference — data-tier vs function-tier comparison

| Dimension | Function-tier | Data-tier |
|---|---|---|
| Total bytes | 2.39 MB | 4.78 MB (2× more) |
| Currently matched | 1.79% (42.7 KB) | 0.00% (0 bytes) |
| Match unit | per-function (objdiff diff) | per-TU (delinks.txt section) |
| Verification | byte-identical .o for the function | bytes (for .data/.rodata) OR address+size (for .bss) |
| Recipe complexity | C body that compiles to right insns | C declaration with right type + initializer |
| mwcc-vs-orig walls | 30 codegen-walls + 10 permanent | **none identified yet** — likely few; data is data |
| Cross-region propagation | brief 095 port_to_region | brief 095 + data-shift consensus (already exists) |
| Cross-project leverage | high (briefs 074 / 081's nitro adoption) | partial (SDK fundamentals only) |
| Per-round yield range | 10-30 ports | 50-100 .bss symbols / 20-30 .data scalars / 3-5 .data tables |

## TL;DR for brain

- Data tier is **2× the size of code** and **0% matched**.
- 85% of data is `.bss` (no bytes to match — just symbol
  placement). The .bss recipe is structurally easier than
  function matching.
- **5 clusters identified** (A-E) with distinct recipes +
  per-cluster wave throughputs. Per-cluster ownership matrix
  documented above.
- **Next steps**: brief 114 (tooling — `data_worklist.py` v2),
  brief 115 (cluster E DTCM pilot — high-leverage, ~5-10 symbols
  to flip DTCM module OK), brief 116 (cluster A wave 1 — .bss
  chunk in main).
- **6-month realistic target**: 50% data-tier matched, 26/27
  modules OK.
- **No data-tier walls discovered during scoping.** Brief 115+
  waves may surface compiler-placement walls; those would warrant
  a new section in `codegen-walls.md`.
- Data tier is a **multi-quarter session arc**, not a near-term
  drain. The framing shifts from "we're near endpoint" to "we're
  entering a new major phase."
