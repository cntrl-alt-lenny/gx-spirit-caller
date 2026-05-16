# Cluster B recipe — `.data` scalars + sub-classification

**Brief:** 117 (cloud research). Brief 113 identified cluster B as
".data scalar constants" (size ≤ 8 bytes). Brief 114's worklist v2
enumerated **247 cluster B candidates**. Brief 117 establishes the
recipe and resolves brief 113's **workflow wall W4** (does mwcc need
`__attribute__((section(".data")))`?).

## TL;DR

- **W4 resolution**: NO `__attribute__` / `#pragma section` needed.
  mwcc 2.0/sp1p5 places `int x = N;` in `.data` automatically.
- **Recipe: singleton-per-`.c` for isolated symbols; multi-symbol
  `.s` for contiguous runs**. mwcc reorders multi-global `.c` files
  by an internal heuristic (NOT declaration order, NOT address
  order), breaking byte placement. The `.s` approach (brief 115's
  DTCM pattern) guarantees address-ordered byte output.
- **47% of cluster B is actually small ASCII strings** (sub-
  classification finding, see below). Brief 114's `shape=scalar`
  filter is over-broad; future tooling brief should refine the
  4-byte-buffer heuristic.

## Workflow wall W4 — resolved

**Question:** does mwcc 2.0/sp1p5 place `int x = N;` in `.data`
automatically, or does it need `__attribute__((section(".data")))`?

**Answer:** automatic. Test:

```c
int data_020c3e48 = 1;
```

Compiled with default `mwccarm.exe ... -c test.c -o test.o`:

```text
$ arm-none-eabi-objdump -h test.o | grep '\.data'
  9 .data         00000004  00000000  00000000  ...

$ arm-none-eabi-objdump -s -j .data test.o
Contents of section .data:
 0000 01000000                             ....
```

mwcc emits ONE `.data` section containing the variable's bytes. The
delinks.txt TU entry pins the section to the target address; mwldarm
places the bytes correctly.

**End-to-end verified:** `src/main/data_020c3e48.c` (brief 117 worked
example) builds + byte-matches `extract/eur/arm9/arm9.bin` at
0x020c3e48. `dsd check modules` preserves 25/27 baseline.

## The multi-global wall (and why `.s` is the safe default for groups)

mwcc 2.0/sp1p5 emits **all globals in one `.c` file into one `.data`
section**, but the **ordering within that section is NOT declaration
order and NOT address order**. Test:

```c
int data_020c3e48 = 1;
int data_020c7b40 = 614;
int data_020fe468 = -1;
```

```text
$ arm-none-eabi-objdump -t test_multi.o | grep '^.*g.*data_'
00000000 g     O .data   00000004 data_020c7b40
00000004 g     O .data   00000004 data_020c3e48
00000008 g     O .data   00000004 data_020fe468
```

Order in `.o`: 020c7b40 → 020c3e48 → 020fe468. Not declaration order
(020c3e48 was first in source). Not address order (020c3e48 is
lowest). Some mwcc-internal heuristic — possibly hash-based.

**Consequence:** a multi-global `.c` file whose symbols span addresses
0x020c3e48 + 0x020c7b40 + 0x020fe468 would emit bytes in the wrong
order — link fails or produces non-matching output.

**Fix:** use a `.s` file (mwasmarm) with explicit address-ordered
`.global` + `.word` directives. The same pattern brief 115 used for
the DTCM `.data` section. Test:

```asm
        .data
        .global data_020c3e48
data_020c3e48:
        .word 1
        .global data_020c7b40
data_020c7b40:
        .word 614
        .global data_020fe468
data_020fe468:
        .word -1
```

```text
$ arm-none-eabi-objdump -t test_multi.s.o | grep 'data_'
00000000 g       .data   00000000 data_020c3e48
00000004 g       .data   00000000 data_020c7b40
00000008 g       .data   00000000 data_020fe468

$ arm-none-eabi-objdump -s -j .data test_multi.s.o
Contents of section .data:
 0000 01000000 66020000 ffffffff           ....f.......
```

Address-ordered ✓ — matches source declaration order verbatim.

## Recipe — when to pick `.c` vs `.s`

| Situation | File type | Rationale |
|---|---|---|
| Single isolated cluster B scalar | `.c` | One-global-per-file is safe with `.c`; simpler syntax, easier to add typedef context later |
| Run of ≥2 ADJACENT cluster B scalars | `.s` | mwasmarm preserves declaration order = address order |
| Pointer-typed value (resolves to code/data addr) | `.c` with typedef | Get a proper reloc + cross-region compatibility |
| 4-byte ASCII string buffer | `.s` with `.ascii` | Avoid char-array padding issues |

## Worked examples (brief 117)

### Example 1 — singleton `.c` (cluster B canonical pattern)

`src/main/data_020c3e48.c`:

```c
int data_020c3e48 = 1;
```

`config/eur/arm9/delinks.txt`:

```text
src/main/data_020c3e48.c:
    complete
    .data start:0x020c3e48 end:0x020c3e4c
```

**Result**: byte-identical at default mwcc 2.0/sp1p5. 5 cross-module
readers no longer block on placeholder name.

### Example 2 — 13-symbol run `.s` (cluster B + cluster C edge)

`src/main/data_02102be8.s`:

```asm
        .data

        .global data_02102be8
data_02102be8:
        .ascii "625"
        .byte 0x00

        .global data_02102bec
data_02102bec:
        .ascii "125"
        .byte 0x00

        ; ... 11 more 4-byte string slots ...
```

`config/eur/arm9/delinks.txt`:

```text
src/main/data_02102be8.s:
    complete
    .data start:0x02102be8 end:0x02102c1c
```

**Result**: byte-identical 13 × 4 = 52 bytes. Sub-classification
edge case (see next section).

## Sub-classification finding — cluster B is over-broad

Cluster B (`--shape scalar --size-max 8 --section data`) returns
247 candidates from `data_worklist.py v2`. Brief 117 byte-pattern
inspection of all 247 shows:

| Sub-class | Count | % | Recipe |
|---|---|---|---|
| **True scalar** (int / short / byte) | 86 | 35% | `.c` singleton or `.s` group |
| **4-byte ASCII string** | 115 | **47%** | `.s` with `.ascii` (matches cluster C recipe) |
| **Pointer** (4-byte value resolves to code addr) | 32 | 13% | `.c` with `extern T func();` typedef + `T (*data_X)() = func_Y;` |
| **Other / unclassified** | 14 | 6% | per-candidate inspection |

**Key finding:** **47% of cluster B is actually cluster-C-shape
strings** (size 4 — short power-of-2 number strings, abbreviations,
etc.). Brief 114's v2 shape heuristic doesn't inspect the bytes of
4-byte values (treats size ≤4 as scalar without further check). For
strict cluster B "true scalar" filtering, brief 114 would need a
secondary byte-pattern pass.

**Recommendation for brief 120** (cluster B application wave 1):
target the 86 true-scalar candidates first. The 115 string-like
candidates fold into cluster C's recipe (string detection + .ascii
declarations). The 32 pointer-typed candidates need per-symbol typedef
discovery — should be sequenced after typedef inference tooling
(brief 120+ in brief 113's plan).

## Cluster B candidate breakdown (per module)

| Module | Candidates | Contiguous pairs | Distinct runs |
|---|---:|---:|---:|
| main | 187 | 81 | 106 (73 singletons, max run 13) |
| ov002 | 20 | 5 | — |
| ov006 | 10 | 4 | — |
| ov004 | 7 | 4 | — |
| ov005 | 7 | 5 | — |
| ov020 | 4 | 2 | — |
| ov007/8/9/13/14/16/18 | ~13 total | — | mostly singletons |

**Main holds 76% of cluster B** (187 of 247). The largest contiguous
run is 13 symbols at 0x02102be8 (the brief 117 example 2 — the
power-of-2 strings).

**Wave-1 picking** (brief 120 hint):
- For 25-30 syms/wave (per brief 113 throughput estimate):
  - Pick ~10 singletons (highest cross-module readers first)
  - Pick 1-2 multi-symbol runs (5-10 syms each)
  - Cover ~20-25 syms in one wave

## Pointer sub-cluster (13% of cluster B) — example

`data_021015e0` has value `0xe4 0x15 0x10 0x02` = 0x021015e4 (4 bytes
ahead of itself — a self-relative pointer? Or a pointer to another
data symbol).

**Recipe sketch** (untested, brief 120+ application):

```c
extern void data_021015e4;        /* the target */
void *data_021015e0 = &data_021015e4;
```

If the target resolves cleanly, mwldarm emits a reloc and the bytes
match per-region (no cross-region byte divergence). Per-region siblings
might differ if the target moves; the reloc mechanism handles that.

## What this means for brief 113's plan

Brief 113 estimated **cluster B throughput as 20-30 syms/wave**. Brief
117 refines:

- **True-scalar wave**: 86 candidates / 25 per wave = ~4 waves to
  drain (brief 113's estimate holds for true scalars).
- **String-like sub-pool**: 115 candidates — fold into cluster C
  workflow (brief 119+). Could be drained in 5-6 cluster-C waves of
  20-25 syms each.
- **Pointer sub-pool**: 32 candidates — sequence after typedef tool
  (brief 120+). Likely 2-3 dedicated waves.

Total cluster B work: 86 + 115 + 32 = **233 of 247** candidates
addressable via current tooling. The remaining 14 unclassified need
per-candidate inspection.

## Cross-references

- [`docs/research/data-tier-scoping.md`](data-tier-scoping.md) —
  brief 113's cluster taxonomy.
- [`docs/research/dtcm-section-attribute.md`](dtcm-section-attribute.md)
  — brief 115's DTCM `.s` pattern (the multi-symbol-ordering precedent).
- [`tools/data_worklist.py`](../../tools/data_worklist.py) v2 —
  brief 114's filter implementation. Shape heuristic improvement
  candidate flagged above.
- [`src/main/data_020c3e48.c`](../../src/main/data_020c3e48.c) —
  brief 117 worked example 1 (singleton `.c`).
- [`src/main/data_02102be8.s`](../../src/main/data_02102be8.s) —
  brief 117 worked example 2 (13-symbol `.s` run, string-like edge).

## Outstanding items for brief 120+

1. **Brief 120 (decomper)** — cluster B wave 1 applying the recipe to
   25-30 true-scalar candidates per the wave-1 picking guidance above.
2. **Brief 121 (tooling, candidate)** — `data_worklist.py` v3
   refinement: secondary byte-pattern pass for size-4 buffers to
   distinguish int/string/pointer sub-classes.
3. **Brief 122+ (decomper)** — cluster B string sub-pool drain (folds
   into cluster C work).
4. **Brief 123+ (decomper)** — cluster B pointer sub-pool drain (after
   typedef inference tool).

## Methodology data point

Brief 117 is the **3rd data-tier brief** (after 113 scoping, 115
DTCM pilot). Pattern emerging: scoping briefs flag walls; pilot
briefs land 1-2 worked examples + resolve the wall; scale-out waves
apply the recipe at volume.

| Brief | Cluster | Worked examples | Wall resolved |
|---|---|---|---|
| 113 | (scoping) | — | 5 walls flagged (W1-W5) |
| 115 | E | 5 syms | W5 (DTCM section attr) |
| **117** | **B** | **2 (one .c + one .s)** | **W4 (mwcc default .data)** |
| (120+) | B | 25-30 syms/wave | (scale-out) |
