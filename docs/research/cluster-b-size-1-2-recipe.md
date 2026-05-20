# Cluster B size-1/2 scalar recipe — alignment cascade + workarounds

**Brief:** 152 (cloud research). Brief 148 spot-checked the naive
`unsigned char data_X = N;` recipe (FAILED — 1308-byte cascade).
Brief 149 falsified workaround #1 (`.s` recipe with explicit
`.byte`). Brief 152 tests workarounds #2 + #3 and locks the
working recipe.

## TL;DR

- **Root cause:** `arm9.lcf`'s `ALIGNALL(2)` directive forces
  every section to a 4-byte alignment at link time, overriding
  any per-source alignment hint. Sub-4-byte sections leave a
  3-byte padding gap before the next section, cascading through
  `.data`.
- **Workaround #1 (`.s` with `.byte`):** FAILED (brief 149).
  mwasmarm respects the same LCF cascade.
- **Workaround #2 (`__attribute__((aligned(1)))`):** FAILED
  (this brief). mwcc DOES emit the section with 1-byte alignment
  (verified in the `.o` ELF header), but `ALIGNALL(2)` in the
  LCF re-aligns at link time.
- **Workaround #3a (`unsigned int` bundle):** **PASS.** Bundling
  the size-1 scalar plus its zero-padded neighbours into a
  single `unsigned int[N]` TU produces a naturally 4-aligned
  TU whose section size is a multiple of 4 — `ALIGNALL(2)` adds
  no padding. **Shipped as the worked example.**
- **Workaround #3b (struct bundle):** **PASS.** Same byte
  effect as #3a; gives field-level naming when the
  surrounding bytes have meaning beyond zero-pad. Identical
  link-time outcome — pick `#3a` for raw byte arrays, `#3b`
  for known-struct shapes.

3-region `ninja sha1` PASS verified for the worked example.

## Workaround details + diagnoses

### Workaround #1 — `.s` recipe with explicit `.byte` (FAILED)

Brief 149 tested:

```asm
        .section .data
        .global data_021020b4
data_021020b4:
        .byte 0x80
```

**Result:** identical 1308-byte / 32-byte cascade as the naive
`.c` recipe. mwasmarm-generated `.data` sections respect the
same `ALIGNALL(2)` cascade at link time.

### Workaround #2 — `__attribute__((aligned(1)))` (FAILED)

Tested:

```c
__attribute__((aligned(1))) unsigned char data_021020b4 = 0x80;
```

**Result:** identical 1308-byte / 32-byte cascade vs orig.
EUR build produces `b2453580…` SHA1 expected `1da50df7…`.

**Diagnosis:** mwcc DID honour the attribute. Inspection of
`build/eur/src/main/data/data_021020b4.o` via
`arm-none-eabi-objdump -h`:

```text
Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  9 .data         00000001  00000000  00000000  00000450  2**0
                  CONTENTS, ALLOC, LOAD, DATA
```

Algn `2**0` = 1-byte alignment. So the source-level hint works.

The cascade comes from one layer up: **`arm9.lcf`** has

```text
.arm9 : {
    ALIGNALL(2);
    ...
}
```

`ALIGNALL(2)` is an mwldarm directive that floors every section's
alignment to 2^2 = 4 bytes at link time, overriding the `.o`'s
per-section value. The next `.data` section after the 1-byte
`data_021020b4.o` is `_dsd_gap@main_148.o`, then
`data_021020f4.o` (whose `.data` is `Algn 2**2` natively). At each
section boundary, mwldarm pads up to the next 4-byte alignment;
the cumulative pad ends up being 32 bytes by the next 32-byte-
aligned `.data` boundary mwldarm rounds to.

LCF edits to drop `ALIGNALL(2)` to `ALIGNALL(0)` would defeat
the cascade everywhere but risk breaking other code paths that
depend on 4-byte alignment in `.data` (e.g. word loads). Brief
152 does NOT pursue LCF edits — workaround #3 succeeds without
touching `arm9.lcf`.

### Workaround #3a — `unsigned int` bundle (PASS)

Tested:

```c
unsigned int data_021020b4[16] = {
    0x00000080,
    0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0,
};
```

`delinks.txt` entry covers the full 64-byte gap until the next
named symbol at `0x021020f4`:

```text
src/main/data/data_021020b4.c:
    complete
    .data start:0x021020b4 end:0x021020f4
```

**Result: PASS.** EUR + USA + JPN all SHA1-PASS.

**Why it works:** the TU's `.data` section is 64 bytes (= multiple
of 4) and naturally 4-aligned. `ALIGNALL(2)` adds zero padding
before or after — the section slots in exactly between the
preceding `_dsd_gap@main_147.o` (`Algn 2**0`, ends at `0x021020b4`)
and the following `data_021020f4.o` (`Algn 2**2`, starts at
`0x021020f4`).

**Symbol identity:** the bundle subsumes the placeholder
`data_021020b5` (a deduced 63-byte span from `0x021020b5` to
`0x021020f4` — every byte zero). The upstream load reloc
(`from:0x02078494 kind:load to:0x021020b5 module:main` per
`relocs.txt`) resolves correctly: the load encodes the absolute
address `0x021020b5`, and that byte exists in the linked binary
as the second byte of the first `unsigned int` in the bundle
(value `0x00`). The reloc machinery uses addresses, not symbol
names.

### Workaround #3b — struct bundle (PASS)

Tested (on the same 64-byte slot):

```c
struct {
    unsigned char a;
    unsigned char b;
    unsigned char c;
    unsigned char d;
    unsigned char rest[60];
} data_021020b4 = { 0x80, 0, 0, 0, { 0 } };
```

**Result: PASS.** EUR + USA + JPN all SHA1-PASS.

Same link-time outcome as #3a (same byte content, same
section alignment). Use #3b when the field structure carries
meaning beyond raw zero-pad — e.g. when the orig source likely
declared a typed struct with named fields (per brief 117's "32
typed pointer sub-cluster" hint, similar would apply to typed
size-1/2 fields).

Sub-shape `#3a` is simpler for the common case where the
trailing bytes are zero-pad. Sub-shape `#3b` is preferable
when the trailing bytes encode separate semantic fields.

## Why no `data_021020b8`-only short bundle worked

I first attempted a 4-byte-only claim covering just
`0x021020b4..0x021020b8`:

```c
unsigned int data_021020b4 = 0x00000080;
/* delinks: .data start:0x021020b4 end:0x021020b8 */
```

dsd refused:

```text
Error: Last symbol 'data_021020b5' in section '.data' of
file 'src/main/data/data_021020b4.c' has the range
0x021020b5..0x021020f4 but is not contained within the
file's section range (0x021020b4..0x021020b8)
```

The deduced size of `data_021020b5` (= next-named-symbol-addr
- this-addr = `0x021020f4` - `0x021020b5` = 63 bytes) is
**larger** than the 3 bytes that follow my 1-byte size-1 scalar
within the immediate 4-byte aligned slot. dsd's "complete TU
must contain all enclosed symbols' deduced ranges" rule means
the claim has to extend to at least `0x021020f4` (where the
next named symbol begins).

This pushes the workaround's effective scope from "claim the
4-byte slot" to "claim the full gap until the next named
symbol". For `data_021020b4`, that's 64 bytes. For other
size-1/2 candidates the gap size varies and should be
inspected per-candidate before scoping the bundle.

If the gap is large and contains internal placeholder symbols
that ARE referenced via `kind:load` relocs with their own
named-symbol semantics, the bundle approach risks losing them.
For `data_021020b4`'s case, `data_021020b5` is referenced only
as an address-load (per `relocs.txt`), not as a typed
declaration — so absorbing it into the bundle is safe.

## Worked example (shipped in this PR)

`src/main/data/data_021020b4.c`:

```c
unsigned int data_021020b4[16] = {
    0x00000080,
    0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0,
};
```

`config/eur/arm9/delinks.txt`:

```text
src/main/data/data_021020b4.c:
    complete
    .data start:0x021020b4 end:0x021020f4
```

3-region `ninja sha1`:

| Region | Result |
|---|---|
| EUR | PASS (`1da50df7…b4f75`) |
| USA | PASS (`9e53dcc7…c2a83`) |
| JPN | PASS (`761fbfc6…424f6`) |

## Brief 153 hand-off

The recipe locks for application to the remaining ~13 size-1/2
candidates in cluster B (per brief 148's pool survey: 1 in
main — drained by this PR — plus 18 in overlays).

Per-candidate application steps:

1. **Inspect the orig ROM bytes** at the size-1/2 slot's
   4-byte aligned address. Confirm the trailing 3 bytes (for
   size-1) or 2 bytes (for size-2) are zeros or known-content
   neighbours.
2. **Find the next named symbol** after the candidate. The
   bundle must extend to that address (dsd's "complete TU
   contains all enclosed symbols' deduced ranges" rule).
3. **Check `relocs.txt`** for any other `kind:load` references
   to addresses inside the bundle range. If found, the bundle
   subsumes those placeholders — verify each load resolves
   correctly post-subsumption (the address-based load mechanism
   handles it for typical zero-pad neighbours; non-zero
   named-symbol neighbours need workaround #3b struct fields
   instead).
4. **Pick #3a or #3b**:
   - **#3a `unsigned int[N]`** if the trailing bytes are
     zero-pad with no individual semantic.
   - **#3b struct** if the trailing bytes are separate
     semantic fields (e.g. `unsigned char a, b, c, d`).
5. **Build + 3-region SHA1 PASS** verify after each batch.

Brief 153 throughput estimate: 1 wave should drain all 18
overlay candidates (most are likely zero-pad-followed singletons
in `.data` clusters similar to `data_021020b4`).

## Open follow-ups (out of brief 152's scope)

- **Pool survey for size-1/2 candidates in overlays.** Brief
  148 noted 18 overlay candidates (3 in ov002, 13 in ov006, 1
  in ov008, 1 in others) but did not enumerate them or their
  surrounding placeholders. Brief 153 will need that survey
  before applying the recipe.
- **Workaround #2 LCF rescue.** If a future brief finds a way
  to keep `ALIGNALL(2)` for code/text but loosen `.data`
  alignment, the single-symbol size-1/2 recipe could work
  without bundling. Low priority while #3a / #3b succeed at
  the worked-example layer.
- **Cluster B value=0 sub-pool.** Brief 117 flagged 21
  size=4-W6-rejected entries where `addr%4 != 0` or `value==0`.
  Value=0 needs `.bss` semantics; unaligned needs `.s` recipe.
  Separate research brief.

## Cross-references

- [`docs/research/cluster-b-recipe.md`](cluster-b-recipe.md) —
  brief 117's cluster B sub-classification (size-1/2 sub-pool
  was first noted there as "unverified — signedness +
  alignment unverified").
- [`docs/research/cluster-b-pointer-pool.md`](cluster-b-pointer-pool.md)
  — brief 148 / 149 — naive size-1/2 + workaround #1
  falsification. Source of the workaround sketches this brief
  validated.
- [`src/main/data/data_021020b4.c`](../../src/main/data/data_021020b4.c)
  — brief 152 worked example.
- [`build/eur/arm9.lcf`](../../build/eur/arm9.lcf) — the
  `ALIGNALL(2)` directive that drives the cascade. Generated by
  `tools/configure.py`; not edited by brief 152.
