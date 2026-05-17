# Cluster C recipe — `.rodata` strings + const arrays

**Brief:** 119 (cloud research). Brief 113 identified cluster C as
".rodata strings + const arrays" (medium difficulty). Brief 117's
sub-classification finding revealed that 47% of cluster B is actually
4-byte ASCII strings → fold to cluster C, raising the effective pool
to **~462 candidates** (347 native + 115 from brief 117).

## TL;DR — and a new wall

- **Workflow wall W6 (new)**: mwldarm rounds `.rodata` section size
  to 4-byte alignment when assembling the linked output. A claim
  whose total size is **NOT a multiple of 4 bytes** causes mwldarm to
  add 1-3 bytes of padding, which shifts following `.rodata` bytes,
  cascades through the `.ctor` section's `ALIGN(32)` directive, and
  shifts the entire `.data` + `.bss` + overlay layout by **32
  bytes** — failing every module's checksum (ALL 25 OK modules drop
  to 1 OK).
- **Safe recipe**: claim `.rodata` symbols (or symbol groups) whose
  **total size is a multiple of 4 bytes**. A 32-byte `const u16[16]`
  array works cleanly; a 5-byte `const char []` string does NOT.
- **Workaround for non-aligned symbols**: claim a CONTIGUOUS GROUP
  of adjacent symbols whose summed size is 4-aligned. dsd's
  delinks.txt accepts multiple symbols inside one TU range; the .s
  file uses multiple `.global` directives at the right offsets.
- **Either approach (`.c` or `.s`) hits W6.** The wall is in
  mwldarm's section assembly, not in the source language. Both forms
  must respect the 4-byte total constraint.

## Worked example (byte-identical, 25/27 baseline preserved)

`src/main/data_020b4748.c` — 16-element `const unsigned short` array
(32 bytes, naturally 4-aligned):

```c
const unsigned short data_020b4748[16] = {
    0x0000, 0x0010, 0x0010, 0x0200, 0x4200, 0x4000, 0x4010, 0x4210,
    0x0000, 0x699f, 0x03ff, 0x03e0, 0x7fe0, 0x7c00, 0x7c1f, 0x7fff,
};
```

`config/eur/arm9/delinks.txt`:

```text
src/main/data_020b4748.c:
    complete
    .rodata start:0x020b4748 end:0x020b4768
```

**Result**: byte-identical at default mwcc 2.0/sp1p5. 3 cross-module
readers no longer block on placeholder name.

## Workflow wall W6 — mwldarm 4-byte `.rodata` rounding

### Discovery sequence

Brief 119 picked 3 representative cluster C candidates:

1. `data_020c387c` (5 bytes, ASCII string `"NAN(\0"`)
2. `data_020b5a34` (14 bytes, ASCII string `"LNOPQRSUVXYZ[\0"`)
3. `data_020b4748` (32 bytes, const u16 array)

End-to-end testing of (1) alone:

- `.c` form: `const char data_020c387c[] = "NAN(";`
  → mwcc emits `.rodata` section of size **8** (5 bytes + 3 padding)
- `.s` form: `.section .rodata; .global data_020c387c; .ascii "NAN("; .byte 0`
  → mwasmarm emits `.rodata` section of size **8** (same padding,
  default `.section .rodata` alignment is `2**2` = 4 bytes)

Both forms produce an 8-byte section. The dsd LCF then concatenates:

```
ARM9_RODATA_START
_dsd_gap@main_529.o(.rodata)   ; 0xf55c bytes
data_020c387c.o(.rodata)       ; 0x8 bytes (3 bytes of padding past 5-byte symbol)
_dsd_gap@main_528.o(.rodata)   ; 0x33b bytes
ARM9_RODATA_END
ALIGN(4)
ARM9_CTOR_START
WRITEW(0)                      ; 4-byte zero
ALIGN(32)                      ; ← cascade point
ARM9_CTOR_END
ARM9_DATA_START
```

Original `.rodata` total: `0xf89c` (63644 bytes). My carved layout:
`0xf55c + 0x8 + 0x33b = 0xf89f` (3 bytes more). After ALIGN(4) on
RODATA_END, that's 4 bytes more. The CTOR section's WRITEW(0) +
ALIGN(32) then snaps to the next 32-byte boundary, shifting
DATA_START by **32 bytes**.

`.data + .bss + overlay layout all shift by 32 bytes` →
`dsd check modules` fails everything except DTCM (which doesn't share
the shifted layout).

### Why 4-byte rounding?

mwldarm respects the `.rodata` section's intrinsic alignment of 4
bytes (which mwcc + mwasmarm both default to for `.rodata`). The
4-aligned section size is a normal output-formatter constraint —
section sizes must be a multiple of the section alignment.

### Why doesn't this fire for `.bss` or `.data`?

- **`.bss`**: alignment 4 (default) but `.bss` section bytes are
  zero-fill at runtime → mwldarm doesn't add padding bytes to the
  file; the `.bss` size in delinks.txt header is the runtime size.
  Brief 116's cluster A wave (`.bss` carving) saw no alignment
  issues.
- **`.data`**: alignment 32 (per delinks.txt header
  `align:32`) → mwldarm pads each `.data` section to 32-byte
  boundary internally. A 4-byte scalar `int` claim → mwldarm emits
  a 32-byte-aligned section. The padding fits within the section's
  declared alignment, which dsd accounts for in its gap regen. No
  cascading shift.
- **`.rodata`**: alignment 4 (per delinks.txt header `align:4`) but
  the alignment cascade through `.ctor`'s ALIGN(32) is unique to
  this section.

### The cascade in detail

The LCF for ARM9 has a strict section ordering:

```text
.text → .rodata → .ctor → .data → .bss
```

`.ctor` is a special section: dsd's lcf gen emits a single
`WRITEW(0)` (4 bytes of zero) representing the C++ static
constructor table (empty in C-only code). The trick is the
post-`.ctor` `ALIGN(32)` which snaps to the next 32-byte boundary.

If `RODATA_END` is at a 32-aligned address (orig:
`0x020c3bbc`, ALIGN(4) → `0x020c3bbc`, WRITEW(0) →
`0x020c3bc0` which is 32-aligned), the ALIGN(32) is a no-op.

If `RODATA_END` shifts even 1 byte past a 32-aligned address,
the ALIGN(32) inserts up to 31 bytes of padding before
DATA_START.

This means the `.rodata` carving constraint isn't just "4-byte
aligned size" but more specifically "preserve the final
RODATA_END byte address" — which in practice means preserve
the total `.rodata` byte count.

## Recipe — safe cluster C patterns

### Pattern 1 — claim symbols whose size is naturally 4-aligned (preferred)

| Size | Status |
|------|--------|
| 4 bytes (single `int` / 1 `u16`-pair / 4-char string ending in null) | ✓ safe |
| 8 bytes (2 `int`s / array of 4 `u16`s / 8-char string) | ✓ safe |
| 12 bytes | ✓ safe |
| 16 bytes (or any multiple of 4) | ✓ safe |
| 32 bytes (worked example `data_020b4748`) | ✓ safe |

### Pattern 2 — claim contiguous groups whose total is 4-aligned

For symbols whose individual size isn't 4-aligned, group them
into one TU whose total bytes are 4-aligned. dsd's delinks.txt
TU range covers all enclosed symbol addresses; the .s file
uses multiple `.global` directives at the right offsets.

**Constraint**: dsd validates that every symbol declared in
symbols.txt within the TU's range has its declared size fully
contained in the TU. So the group must end exactly at the
last enclosed symbol's `addr + size`.

Worked sketch (not tested in brief 119 — see "Outstanding" below):

```text
src/main/data_strings.s:
    complete
    .rodata start:0x020c387c end:0x020c388c
```

```asm
        .section .rodata

        .global data_020c387c
data_020c387c:
        .ascii "NAN("
        .byte 0x00

        .global data_020c3881
data_020c3881:
        .ascii "INFINITY"
        .byte 0x00, 0x00, 0x00  ; padding to next 4-aligned offset
```

This groups `data_020c387c` (5 bytes) + `data_020c3881` (9 bytes)
+ 2 bytes padding = **16 bytes total**, 4-aligned.

**VERIFIED brief 121 Part 2** — but on a different candidate.
The `data_020c387c` + `data_020c3881` chunk FAILS dsd validation
because the next symbol after `data_020c3881` is at 0x020c398c
(0x10b bytes past); dsd's size deduction (next-symbol-distance)
exceeds the chunk's 16-byte range.

**Working Pattern 2 worked example** (brief 121 Part 2):

```text
src/main/data_020b52d4.s:
    complete
    .rodata start:0x020b52d4 end:0x020b52d8
```

```asm
        .section .rodata

        .global data_020b52d4
data_020b52d4:
        .byte 0x00, 0x00

        .global data_020b52d6
data_020b52d6:
        .byte 0x00, 0x00
```

Two 2-byte symbols summing to 4 bytes. dsd deduces each symbol's
size from `next_symbol_addr - this_addr`:

- `data_020b52d4` (at 0x020b52d4): next = 0x020b52d6 → size 2
- `data_020b52d6` (at 0x020b52d6): next = 0x020b52d8 → size 2

Both deduced sizes fit within the chunk (end 0x020b52d8). dsd
accepts the TU; build succeeds; bytes byte-identical.

**The Pattern 2 constraint**: dsd's deduced-size for the LAST
embedded symbol must fit within the chunk. I.e., the symbol AFTER
the chunk's last embedded must be AT OR BEFORE the chunk's end.

**Pattern 2 eligibility scan** (per brief 121's analysis of main
.rodata): **17 dsd-compatible 4-aligned runs** found across the
127 main `.rodata` data symbols. Larger pools available in
overlays (not yet enumerated).

**Workaround for non-eligible Pattern 2 candidates** (like the
NAN/INFINITY example): the only fix is to **add an explicit-size
hint to symbols.txt for the embedded symbol** — dsd doesn't
support this currently. Alternative is Pattern 3 (chunk the whole
section) which sidesteps the per-symbol deduction.

### Pattern 3 — chunk a `.rodata` region via the generator tool

**Status:** generator shipped by **brief 125** at
[`tools/cluster_c_pattern3_gen.py`](../../tools/cluster_c_pattern3_gen.py).

The generator takes a 4-aligned `.rodata` chunk range and produces:
- A `.s` file at `src/<module>/data/data_<addr>.s` with per-symbol
  `.global` + `.ascii` / `.word` / `.byte` directives.
- A `delinks.txt` TU entry to append.

Byte-pattern selection (priority order):
1. Printable-ASCII + null-term → `.ascii "..."` + `.byte 0x00`.
2. 4-byte aligned word whose value resolves to a known symbol →
   `.word <symbol_name>` (cross-module pointer resolution).
3. Otherwise → `.byte 0x.., 0x.., ...` (wraps at 8 bytes/line).

Usage:

```bash
python tools/cluster_c_pattern3_gen.py --version eur --module main \
    --start 0x020c387c --end 0x020c398c
```

**Worked example (brief 125)**:
`src/main/data/data_020c387c.s` — 272-byte chunk covering
`data_020c387c` ("NAN(\0") + `data_020c3881` (`"INFINITY\0"` + 263
bytes of trailing data). Byte-identical end-to-end; 25/27 baseline
preserved.

**Second worked example (brief 125)**:
`src/main/data/data_020b4320.s` — 48-byte chunk covering 6 ×
8-byte struct entries. Demonstrates the generator handles
non-string non-pointer raw byte content.

Brief 116's cluster A approach (one big `.s` per `.bss` section)
scales naturally to a per-chunk approach for `.rodata`. The
generator's per-chunk output keeps the changes reviewable; brief
116's per-section approach (~1888-line `.s`) is fine for `.bss`
because it has only zero-fill bytes, but `.rodata` byte content
benefits from chunk-sized files.

## What this means for brief 113's plan

Brief 113 estimated **cluster C throughput as 10-20 syms/wave**.
Brief 119 refines:

- **Singleton .c approach is UNSAFE** unless the symbol size is
  naturally 4-aligned. Only ~30-40% of cluster C candidates have
  4-aligned sizes by inspection.
- **Group-claim approach (Pattern 2)** is the path forward for
  most candidates but requires dsd-side symbol size hint OR
  scoping past the "first" symbol's declared size.
- **Chunk-the-whole-section approach (Pattern 3)** sidesteps both
  problems but requires writing a 60+ KB `.s` file by hand or
  via a generator tool.

Recommendation: brief 121 wave 1 picks **20-30 4-aligned-size
candidates** as the easy first slice; brief 122+ tackles the
group / chunk approaches for the remaining ~430.

## Cross-references

- [`docs/research/data-tier-scoping.md`](data-tier-scoping.md) —
  brief 113's cluster taxonomy + workflow wall W1-W5 list.
  Brief 119 adds **W6 — mwldarm `.rodata` 4-byte rounding +
  `.ctor` ALIGN(32) cascade**.
- [`docs/research/cluster-b-recipe.md`](cluster-b-recipe.md) —
  brief 117's cluster B recipe + sub-classification finding.
- [`docs/research/dtcm-section-attribute.md`](dtcm-section-attribute.md)
  — brief 115's DTCM `.s` pattern (the `.section .data` + `.global`
  scheme this brief inherits).
- [`tools/data_worklist.py`](../../tools/data_worklist.py) — brief
  114 v2 + brief 117 sub-classification note.
- [`src/main/data_020b4748.c`](../../src/main/data_020b4748.c) —
  brief 119 worked example.

## Outstanding for brief 121+

1. **Brief 121 (decomper)** — cluster C wave 1: pick 20-30
   4-aligned-size candidates (Pattern 1) for the easy first
   slice. Most-cross-module-readers first per `data_worklist`
   sort.
2. **Brief 121b OR brief 122 (cloud)** — verify Pattern 2 group
   claim end-to-end. May require a small dsd fix or a sibling
   symbols.txt edit to declare explicit sizes for embedded
   non-aligned symbols.
3. **Brief 122+ (cloud research candidate)** — Pattern 3 chunk
   approach scope: one .s file per .rodata section per module.
   ~60 KB file for main; smaller for overlays.
4. **Brief 123+ (decomper)** — apply Patterns 2 + 3 to scale out
   the remaining ~430 non-4-aligned candidates.

## Methodology data point

Brief 119 is the **4th data-tier brief** (after 113 scoping, 115
DTCM, 116 cluster A pilot, 117 cluster B recipe). Pattern emerging:

| Brief | Cluster | Outcome |
|---|---|---|
| 113 | (scoping) | W1-W5 walls flagged, 5-cluster taxonomy |
| 115 | E | W5 resolved (DTCM `.s` + LCF auto-routing) |
| 116 | A | recipe applied at scale (647 .bss symbols in wave 1) |
| 117 | B | W4 resolved (mwcc default `.data` placement) + 47% sub-classification finding |
| **119** | **C** | **W6 discovered (mwldarm `.rodata` 4-byte rounding cascade)**, 1 worked example, group/chunk recipes flagged for follow-up |

Each data-tier brief surfaces a new wall AND a new recipe pattern.
The cluster C work is more constrained than A / B / E — singleton
recipes don't work universally; group / chunk approaches are
required for the majority of candidates.

## Updated W-list snapshot

Brief 113 enumerated W1-W5. Brief 119 adds W6:

| Wall | Cluster | Status |
|------|---------|--------|
| W1 | (general) | .bss chunking arbitrary boundaries — mitigated by subsystem alignment |
| W2 | (general) | Typedef instability — mitigated by scout-before-name (brief 081 pattern) |
| W3 | (general) | Cross-region data-shift propagation — handled by brief 095 D3 |
| W4 | B (.data) | **RESOLVED** brief 117: mwcc places `int x = N;` in `.data` automatically; no attribute needed |
| W5 | E (DTCM) | **RESOLVED** brief 115: mwasmarm `.section .data` + dsd LCF auto-routing |
| W6 | C (.rodata) | **DISCOVERED** brief 119: mwldarm 4-byte `.rodata` section-size rounding cascades through `.ctor` ALIGN(32) to shift `.data` + `.bss` + overlays by 32 bytes. Mitigation: claim 4-aligned-size symbols (or group claims summing to 4-aligned total). |
