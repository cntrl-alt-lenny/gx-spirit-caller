# Cluster B pointer pool — survey + recipe + size-1/2 spot-check

**Brief:** 148 (cloud research). Brief 143 wave 2 drained cluster B's
W6-eligible true-scalar pool. Brief 148 surveys the remaining
pointer + size-1/2 sub-pools, locks in a recipe for pointers, and
spot-checks the naive size-1/2 recipe (it doesn't work — flagged for
brief 149's research).

## TL;DR

- **Pointer recipe is settled.** The `extern char X; void *Y = &X;`
  template from brief 121 / 130 (D-1 wave 2) applies cleanly to
  singleton pointer slots in cluster B too. **23 cluster B
  pointer candidates** enumerated; **3 worked examples** ship in
  this PR with 3-region `ninja sha1` PASS.
- **Size-1 naive recipe doesn't match.** A bare `unsigned char
  data_X = 0xAB;` declaration triggers a 32-byte alignment cascade
  in `.data`, producing 1308 byte diffs vs orig. Surveyed pool:
  19 candidates total (1 main, 18 across overlays). Recipe
  research deferred to **brief 149**.
- Cluster B's pointer sub-pool overlaps with cluster D-1's
  dispatch-table sub-pool — they share the same recipe; brief 117
  classified the "pointer slot" cases as cluster B (32 candidates
  in brief 117's table); brief 123 v3's worklist reclassified
  them as `pointer-data` / `pointer-code` shape and folded them
  into cluster D-1.

## Pointer pool survey

**Method:** enumerate unmatched placeholder `data_*` symbols in
`.data` sections across all modules whose 4-byte content
(little-endian) resolves to a known module section per
`tools/data_worklist.py`'s `_pointer_target_section`. Pointee
symbol resolved via the global `(addr → symbol_name)` index built
from all `symbols.txt` files.

23 candidates total — **22 in main, 1 in ov004**:

| slot vaddr | slot name | ptr value | tgt sect | pointee name | pointee type |
|---|---|---|---|---|---|
| 0x020c3e68 | data_020c3e68 | 0x020c3e5c | data | data_020c3e5c | data |
| 0x020c3f54 | data_020c3f54 | 0x020c3f58 | data | data_020c3f58 | data |
| 0x020fe4dc | data_020fe4dc | 0x020fe50c | data | data_020fe50c | data |
| 0x020fe4e0 | data_020fe4e0 | 0x020fe4ec | data | data_020fe4ec | data |
| 0x020fe4e4 | data_020fe4e4 | 0x020fe4fc | data | data_020fe4fc | data |
| 0x020fe4e8 | data_020fe4e8 | 0x020fe528 | data | data_020fe528 | data |
| 0x020fea14 | data_020fea14 | 0x020fea18 | data | data_020fea18 | data |
| 0x020fec48 | data_020fec48 | 0x020fec4c | data | data_020fec4c | data |
| 0x02101358 | data_02101358 | 0x0210135c | data | data_0210135c | data |
| 0x021015e0 | data_021015e0 | 0x021015e4 | data | data_021015e4 | data (claimed as `unsigned char[272]`) |
| 0x02101d84 | data_02101d84 | 0x02101d88 | data | data_02101d88 | data |
| 0x021020f4 | data_021020f4 | 0x0207df00 | code | func_0207df00 | function (arm, claimed as `int (void)`) |
| 0x021020f8 | data_021020f8 | 0x0207def8 | code | func_0207def8 | function (arm, claimed as `int (void)`) |
| 0x021020fc | data_021020fc | 0x0207df10 | code | func_0207df10 | function (arm, claimed as `int (void)`) |
| 0x02102100 | data_02102100 | 0x0207df08 | code | func_0207df08 | function (arm, claimed as `int (void)`) |
| 0x021021ac | data_021021ac | 0x02082494 | code | func_02082494 | function (arm) |
| 0x021021b0 | data_021021b0 | 0x02082504 | code | func_02082504 | function (arm) |
| 0x021021b4 | data_021021b4 | 0x0208285c | code | func_0208285c | function (arm, claimed legacy_sp3) |
| 0x021024bc | data_021024bc | 0x020c35f0 | data | data_020c35f0 | data |
| 0x02102688 | data_02102688 | 0x02099928 | code | func_02099928 | function (arm) |
| 0x021026e4 | data_021026e4 | 0x020c363c | data | data_020c363c | data |
| 0x021026fc | data_021026fc | 0x02102704 | data | data_02102704 | data |
| 0x0220a33c | data_ov004_0220a33c | 0x02292acc | data | data_ov004_02292acc | bss |

**Breakdown:** 15 data-pointers + 8 code-pointers.

**Structural observations:**

- `data_021020f4..0x02102104` is a 4-element function-pointer
  table (sequential 4-byte slots, all pointing into a tight band
  of `func_0207d…` arm functions). Candidate for a single
  `int (*data_021020f4[4])(void)` array claim rather than 4
  singletons.
- `data_020fe4dc..0x020fe4ec` is a 4-element data-pointer table
  (4 slots, 4 distinct targets within the same `.data` cluster).
  Same single-array-claim candidate shape.
- `data_021021ac..0x021021b8` is a 3-element function-pointer
  table (3 slots, 3 distinct arm functions in 0x02082xxx).
- The remaining 16 are isolated singletons, each pointing at a
  sibling within 4..64 bytes of itself (self-referencing list
  nodes, header pointers, etc.).

## Pointer recipe (verified)

```c
extern char <pointee>;          /* opaque forward-declaration */

void *<slot_name> = &<pointee>;
```

For function pointees, the recipe is identical:

```c
extern char <func_name>;        /* opaque — mwldarm doesn't enforce
                                   data-vs-function across TUs */

void *<slot_name> = &<func_name>;
```

For ARM-mode functions the address is used as-is. **Thumb-mode
functions** would need a `+1` offset (per brief 121); none of the
8 code-pointer candidates in the survey target thumb functions,
so the +1 path is not exercised here.

### Why opaque `extern char` and not typed `extern T[N]`

Some pointees are already source-claimed with a definite type (e.g.
`data_021015e4` is `unsigned char[272]` in
`src/main/data_021015e4.c`). Declaring `extern unsigned char
data_021015e4[272];` in the slot's TU would clash with the
definition's type at the language level — `unsigned char *p =
data_021015e4[272];` doesn't compile.

The brief 121 / 130 D-1 wave 2 worked-example convention is to use
the **opaque** `extern char <pointee>;` form in every slot TU
regardless of the pointee's actual declaration. C technically
treats this as a type mismatch across TUs, but the linker
resolves both to the same address — the `void *` slot ends up
with the correct 4 bytes after mwldarm runs the reloc. **Brief 148
confirms this works**: 3 worked examples build and SHA1-PASS on
all 3 regions even when the pointee has a richer source-level
type.

### Decision: no `(T *)0x021abcde` literal cast

The brief sketched a `typedef struct ... *foo_t; foo_t data_X =
(foo_t)0x021abcde;` literal-cast alternative. **Rejected** for
two reasons:

1. **No reloc.** Literal-cast emits the bytes directly as a
   constant, not as a relocation. The bytes would be EUR-correct
   but USA / JPN pointees live at different addresses — mwldarm's
   reloc mechanism is the only path that gives byte-identity
   across all 3 regions.
2. **Mismatch with brief 121's settled recipe.** Cluster D-1 wave
   2 (PR #542) already shipped 15 dispatch tables using the
   `extern + &` pattern. Using a different shape for cluster B's
   singletons would fragment the recipe surface for no win.

## Worked examples (3 — SHA1 PASS verified all 3 regions)

### Example 1 — data-pointer to unclaimed sibling

`src/main/data/data_020c3e68.c`:

```c
extern char data_020c3e5c;

void *data_020c3e68 = &data_020c3e5c;
```

Pointee `data_020c3e5c` is a 4-byte sibling 12 bytes earlier in the
same `.data` run (an int constant `0x23`); not claimed in any
source file. The recipe works regardless — the linker resolves the
extern via the placeholder's address in `symbols.txt`.

### Example 2 — data-pointer to claimed typed-array

`src/main/data/data_021015e0.c`:

```c
extern char data_021015e4;

void *data_021015e0 = &data_021015e4;
```

Pointee `data_021015e4` is already claimed as `unsigned char[272]`
in `src/main/data_021015e4.c`. The opaque `extern char`
declaration in the slot's TU compiles cleanly and the linker
resolves it to the same address — no type-clash error from
mwldarm.

### Example 3 — code-pointer to ARM function

`src/main/data/data_02102688.c`:

```c
extern char func_02099928;

void *data_02102688 = &func_02099928;
```

Pointee `func_02099928` is an arm-mode function (per
`symbols.txt`'s `kind:function(arm,size=0xN)`). Identical recipe
shape to the data-pointer examples; mwldarm doesn't enforce
data-vs-function type compatibility across TUs.

### `delinks.txt` entries

```text
src/main/data/data_020c3e68.c:
    complete
    .data start:0x020c3e68 end:0x020c3e6c

src/main/data/data_021015e0.c:
    complete
    .data start:0x021015e0 end:0x021015e4

src/main/data/data_02102688.c:
    complete
    .data start:0x02102688 end:0x0210268c
```

## Size-1/2 scalar spot-check — naive recipe DOES NOT WORK

**Surveyed pool:** 19 unmatched `.data` size-1/2 placeholders
across modules (1 main + 18 overlays). Distribution:

| Module | size=1 | size=2 |
|---|---:|---:|
| main | 1 | 0 |
| ov002 | 0 | 3 |
| ov006 | 0 | 13 |
| ov008 | 0 | 1 |
| (others, by module) | 0 | 1 |

The lone main candidate is `data_021020b4` (1 byte, value `0x80`).
Bytes around it in `extract/eur/arm9/arm9.bin`:

```text
0x021020b0  91d386eb              data_021020b0 (4 bytes — open)
0x021020b4  80                    data_021020b4 (1 byte — open)
0x021020b5  00 00 00              data_021020b5 (3 bytes — open)
0x021020b8  00000000              data_021020b8 (4 bytes — open)
```

Naive recipe attempt:

```c
unsigned char data_021020b4 = 0x80;
```

**Result: FAIL.** EUR `ninja sha1` mismatches with **1308 byte
diffs** in `build/eur/build/arm9.bin` and a **+32-byte** size
delta vs orig. The diffs are concentrated in literal-pool loads
in `.text` that point at shifted `.data` symbols — every load of
an absolute `.data` address that the linker re-resolved post-shift
shows a new value.

**Diagnosis:** mwcc emits an `unsigned char` global with **4-byte
section alignment** by default (rather than 1-byte tight
emission). The 1-byte-into-4-byte-slot mismatch breaks `.data`'s
byte layout downstream, cascading until the next 32-byte-aligned
section boundary recovers — hence 32 bytes of shift.

**The orig `.o` for the surrounding region presumably uses
explicit `.byte` directives in a `.s` file (or an `__attribute__
((aligned(1)))` hint in C) to emit byte-tight without a
4-byte-alignment cushion.** Brief 148 doesn't attempt to recover
the correct shape — that's the same W6-class problem brief 117
flagged for the unaligned cluster B sub-pool, and resolving it is
explicitly brief 149's territory per the brief 148 spec.

**Workaround sketches for brief 149 to falsify:**

1. **`.s` recipe** — write the 1-byte slot via mwasmarm:

   ```asm
           .data
           .global data_021020b4
   data_021020b4:
           .byte 0x80
   ```

2. **`__attribute__((aligned(1)))`** — force byte-tight emission:

   ```c
   __attribute__((aligned(1))) unsigned char data_021020b4 = 0x80;
   ```

3. **Group claim** — bundle the 4-byte slot
   `[data_021020b4 + data_021020b5]` into a single 4-byte chunk so
   alignment matches naturally:

   ```c
   unsigned int data_021020b4_block = 0x00000080;
   ```

   (delinks entry covers `0x021020b4..0x021020b8`; subsumes both
   placeholders.)

Each of these is one experimental commit away from a verdict. The
spot-check confirms only that the **trivial** path doesn't work —
none of the workarounds were tested by brief 148.

### Brief 152 update — workaround verdicts

Workaround verdicts after brief 149 + 152 (both detailed in
[`cluster-b-size-1-2-recipe.md`](cluster-b-size-1-2-recipe.md)):

| # | Recipe | Verdict |
|---|---|---|
| 1 | `.s` with `.byte` | **FAIL** (brief 149) |
| 2 | `__attribute__((aligned(1)))` | **FAIL** (brief 152) — mwcc honours the hint, but `arm9.lcf`'s `ALIGNALL(2)` re-aligns at link time |
| 3a | `unsigned int[N]` bundle | **PASS** (brief 152) |
| 3b | `struct {...}` bundle | **PASS** (brief 152) |

The bundle recipes succeed because the TU's `.data` section is
a multiple of 4 bytes and naturally 4-aligned — `ALIGNALL(2)`
adds zero padding. Brief 152 ships `data_021020b4` as a worked
example using #3a. Brief 153 (decomper) is unblocked to apply
to the remaining 18 size-1/2 overlay candidates.

## Brief 149 hand-off

The pointer recipe is fully settled and re-applicable to the
remaining 20 candidates surveyed above. Brief 149 (decomper) should:

1. **Apply the pointer recipe to the remaining 20 pointer
   candidates** — ~10-20 minutes per region of `ninja sha1`
   re-verification after each batch. Estimated 1 wave.
2. **Bundle the 3 contiguous fn-ptr / data-ptr tables** flagged
   in the structural-observations section as single-array claims
   rather than singletons:
   - `data_020fe4dc[4]` (4 data pointers)
   - `data_021020f4[4]` (4 fn pointers)
   - `data_021021ac[3]` (3 fn pointers)
   This collapses 11 singleton TUs into 3 array TUs.
3. **Falsify one of the 3 size-1/2 workarounds above** on a
   single candidate before scaling. If `.s` shape (workaround #1)
   works on `data_021020b4`, apply across all 19 size-1/2
   candidates.

After brief 149, the only cluster B sub-pool left is the 21
W6-rejected size=4 (unaligned `addr % 4 != 0` or value=0) entries;
those need a separate `.s`-vs-BSS recipe study (brief 150
candidate).

## Cross-references

- [`docs/research/cluster-b-recipe.md`](cluster-b-recipe.md) —
  brief 117's cluster B sub-classification (pointer sub-pool was
  first noted there with a "untested recipe sketch").
- [`docs/research/cluster-d-recipe.md`](cluster-d-recipe.md) —
  brief 121's D-1 dispatch-table recipe — the same `extern + &`
  template brief 148 confirms applies to cluster B singletons.
- [`src/main/data_020c3e6c.c`](../../src/main/data_020c3e6c.c) —
  brief 130 / D-1 wave 2 worked example. The original proof point
  for the recipe.
- [`src/main/data/data_020c3e68.c`](../../src/main/data/data_020c3e68.c),
  [`src/main/data/data_021015e0.c`](../../src/main/data/data_021015e0.c),
  [`src/main/data/data_02102688.c`](../../src/main/data/data_02102688.c)
  — brief 148 worked examples shipped in this PR.
