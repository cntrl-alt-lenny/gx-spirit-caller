# cm-restock-carve-3 — third restock-census wave: the harder half (2026-08-08)

Third wave of the restock-census carve series. Waves 1
([`cm-restock-carve-1`](cm-restock-carve-1-2026-08-06.md)) and 2
([`cm-restock-carve-2`](cm-restock-carve-2-2026-08-08.md)) took the
census's easy geometry — `ov006`'s 33 and `main`'s 58, both 100%
4-aligned. This wave scopes what's left: the shape=struct census's
remaining 99 candidates, spread across 20 other overlay modules, of
which 64 are 4-aligned (Part 1) and 35 are 2-byte-misaligned (Part 2).

A fresh cross-reference of the census against the CURRENT delinks.txt
state (not the census's Aug-3 snapshot, which predates waves 1-2)
confirmed the exact split: 87 candidates already carved by waves 1-2,
64 uncarved-and-aligned, 35 uncarved-and-misaligned — the 35 figure
matches the kickoff's own count exactly, independent confirmation the
classification is correct.

## Part 1 result

**64 of 64 aligned candidates shipped, zero declined.** Unlike wave 2's
`main` (no consolidated header), most of these 20 overlay modules DO
have their own `ov0NN_core.h` (only `ov001`/`ov022` don't) — the wave-1
method applied directly. Several real dispatch-table/array families were
found and cross-validated against already-shipped, already-matched
consumer `.c` files (not just `.s` disassembly), including two
independent stride-proofs (`ov009`'s 7-element array, `ov014`'s
6-element `HitRect` array) and one honest lower-confidence flag
(`ov011`'s `data_ov011_021d2fe4`, typed by shape-analogy since its sole
consumer is a parked "wall" function shipped as raw opcode words).

CANARY discipline followed: Part 1's first group (ov018/ov020/ov021/
ov022, 10 symbols) carved and gate-verified before further batching.

## Part 2 result

**The ALIGNALL(2) wall is avoidable by TU composition** — see
[`docs/research/alignment-wall-tu-composition-recipe.md`](../alignment-wall-tu-composition-recipe.md)
for the full writeup. Pairing two adjacent 2-byte-misaligned symbols
(`data_ov016_021b9000` + `data_ov016_021b900a`) as separate named
globals of the same type, in address order, in one TU whose combined
`.data` section totals a 4-byte multiple, produced a clean EUR SHA1
PASS with zero cascade into the following already-shipped TU — verified
independently (compiled-`.o` ELF section inspection showing declaration
order preserved, plus direct byte comparison at 4 checkpoints) before
this wave's final gate. This resolves the open question three
consecutive waves have carried, and both symbols ship as real,
evidenced carves this wave (not just a scratch test) — they're real
data with real consumers (see the recipe doc for the full trace).

The remaining population (33 of the 35 misaligned candidates) is
**not** carved this wave — the kickoff scoped Part 2 to one bounded
test, and applying the recipe project-wide is future work (the recipe
doc's "Scope and next steps" section covers what to check per-candidate
before assuming n>2 groupings are equally safe).

## Per-symbol reconciliation table (built incrementally as groups landed)

All symbols, non-static; `const`/non-const set per each symbol's own
module `delinks.txt` section (`.rodata` → const, `.data` → not),
verified directly, never assumed from the C side.

| Symbol | Module | Address | Size | Section | Type | Evidence |
|---|---|---:|---:|---|---|---|
| `data_ov018_021ad2e4` | ov018 | `0x021ad2e4` | 12 | rodata | `unsigned short[6]` | 1 of 4 sibling tables (NOT a struct family — verified via 4 separate literal-pool bases); consumer `func_ov018_021aaddc.s` |
| `data_ov018_021ad2f0` | ov018 | `0x021ad2f0` | 12 | rodata | `unsigned short[6]` | Sibling 2/4; same consumer, 2 branches |
| `data_ov018_021ad2fc` | ov018 | `0x021ad2fc` | 12 | rodata | `unsigned short[6]` | Sibling 3/4 |
| `data_ov018_021ad308` | ov018 | `0x021ad308` | 12 | rodata | `unsigned short[6]` | Sibling 4/4, closes the `.rodata` section |
| `data_ov018_021ad71c` | ov018 | `0x021ad71c` | 28 | data | `Ov018StepFn[7]` | Dispatch table; consumer already-matched `func_ov018_021ace14.c` |
| `data_ov020_021addc8` | ov020 | `0x021addc8` | 8 | rodata | `unsigned short[4]` | Default ordering table `{2,3,4,5}`; consumer `func_ov020_021abbe8.s` |
| `data_ov020_021adf80` | ov020 | `0x021adf80` | 28 | data | `Ov020StepFn[7]` | Dispatch table; consumer already-matched `func_ov020_021ada1c.c` |
| `data_ov021_021abea0` | ov021 | `0x021abea0` | 24 | data | `Ov021StepFn[6]` | Dispatch table, all 5 real targets already-matched C; consumer `func_ov021_021aa4a0.c` |
| `data_ov021_021ac874` | ov021 | `0x021ac874` | 44 | data | `int[11]` | Identity table `{0..10}`, loop/branch-bound-proven; consumer `func_ov021_021aab7c.s` |
| `data_ov022_021ab9bc` | ov022 | `0x021ab9bc` | 28 | data | `Ov022StepFn[7]` | Dispatch table; consumer already-matched `func_ov022_021ab460.c` |
| `data_ov009_021ad82c` | ov009 | `0x021ad82c` | 16 | rodata | `unsigned char[16]` | Spiral-mapped palette table; consumer `func_ov009_021ab374.s` |
| `data_ov009_021ad84c` | ov009 | `0x021ad84c` | 12 | rodata | `unsigned short[6]` | 5 packed 15-bit colors + pad; consumer `func_ov009_021ab9f8.s` |
| `data_ov009_021ada90` | ov009 | `0x021ada90` | 12 | data | `Ov009HitRect021ada90` | Element 10 of a 12B-stride array (arithmetic-proven base `data_ov009_021ada18`); 2 consumers |
| `data_ov009_021ada9c` | ov009 | `0x021ada9c` | 12 | data | `Ov009HitRect021ada90` | Element 11, same family; 2 consumers |
| `data_ov009_021adaa8` | ov009 | `0x021adaa8` | 12 | data | `Ov009HitRect021ada90` | Element 12; 1 consumer (draw only) |
| `data_ov009_021adab4` | ov009 | `0x021adab4` | 12 | data | `Ov009HitRect021ada90` | Element 13; 1 consumer |
| `data_ov009_021adac0` | ov009 | `0x021adac0` | 12 | data | `Ov009HitRect021ada90` | Element 14; 2 consumers |
| `data_ov009_021adacc` | ov009 | `0x021adacc` | 12 | data | `Ov009HitRect021ada90` | Element 15, only `kind=0` member, conditionally gated; 2 consumers |
| `data_ov009_021adad8` | ov009 | `0x021adad8` | 12 | data | `Ov009HitRect021ada90` | Element 16 (last carved this wave); 1 consumer |
| `data_ov005_021b17e8` | ov005 | `0x021b17e8` | 16 | data | `Ov005StepFn[4]` | Dispatch table; consumer already-declares this exact extern, `func_ov005_021acfb0.c` |
| `data_ov005_021b1be0` | ov005 | `0x021b1be0` | 8 | data | `unsigned char[8]` | Shift-JIS "戻る" ("Back"); consumer `func_ov005_021adf3c.s` |
| `data_ov007_021b2fa0` | ov007 | `0x021b2fa0` | 16 | data | `StepFn[4]` | Dispatch table; consumer already-matched `func_ov007_021b2280.c`; caught a swapped `ov007_core.h` comment |
| `data_ov007_021b2ff4` | ov007 | `0x021b2ff4` | 132 | data | `unsigned char[132]` | Multi-line Shift-JIS score-breakdown template; consumer `func_ov007_021b299c.c` |
| `data_ov008_021b23b8` | ov008 | `0x021b23b8` | 8 | rodata | `unsigned short[4]` | RGB555 blend constants; consumer `func_ov008_021abcdc.s` |
| `data_ov008_021b2440` | ov008 | `0x021b2440` | 16 | data | `Ov008StepFn[4]` | Dispatch table; consumer already-declares this exact extern, `func_ov008_021aafa4.c` |
| `data_ov008_021b26c4` | ov008 | `0x021b26c4` | 12 | data | `char[12]` | "/Pack/s_pack" printf prefix (no implicit NUL); consumer `func_ov008_021aefd4.s` |
| `data_ov008_021b26dc` | ov008 | `0x021b26dc` | 16 | data | `char[16]` | "/card128/%04d.5t" printf prefix; consumer `func_ov008_021afa34.s` |
| `data_ov008_021b275c` | ov008 | `0x021b275c` | 36 | data | `char[36]` | "/card128/%04d.5bg" printf template; consumer `func_ov008_021b2268.s` |
| `data_ov000_021b55e4` | ov000 | `0x021b55e4` | 28 | rodata | struct (callback+6 ints) | Word0 genuine callback ptr (relocs.txt-proven); consumer `func_ov000_021ad660.s` |
| `data_ov000_021b5600` | ov000 | `0x021b5600` | 16 | rodata | struct (x0/y0+3 ints) | Consumer `func_ov000_021ad660.s`, screen-coordinate pair inferred |
| `data_ov000_021b5614` | ov000 | `0x021b5614` | 8 | rodata | struct (x0/y0+1 int) | Sibling of 021b5600; consumer `func_ov000_021ad8dc.s` (clone-pair fn) |
| `data_ov000_021b561c` | ov000 | `0x021b561c` | 12 | rodata | struct (w/h+2 ints) | Paired with 021b5600 in the same call; consumer `func_ov000_021ad660.s` |
| `data_ov000_021b5638` | ov000 | `0x021b5638` | 12 | rodata | `int[3]` | Fully-consumed 3-word arg block; consumer `func_ov000_021ad8dc.s` |
| `data_ov000_021b5650` | ov000 | `0x021b5650` | 12 | rodata | `int[3]` | Byte-identical sibling of 021b5638; consumer `func_ov000_021ad660.s` |
| `data_ov001_021ca384` | ov001 | `0x021ca384` | 20 | data | `Ov001StepFn[5]` | Dispatch table; consumer already-matched `func_ov001_021ca2f8.c` |
| `data_ov003_021cf160` | ov003 | `0x021cf160` | 16 | data | `int(*[])(void)` | Dispatch table; consumer already-matched `func_ov003_021ca1fc.c` |
| `data_ov003_021cf690` | ov003 | `0x021cf690` | 48 | data | `char[48]` | "/Bustup/bu%03d_e.LZNCLR"; consumer `func_ov003_021ccea4.s` |
| `data_ov010_021b8b7c` | ov010 | `0x021b8b7c` | 28 | data | `Ov010FnPtrCb[7]` | Dispatch table "B"; consumer already-matched `ov010_021b4028.c` |
| `data_ov010_021b8b98` | ov010 | `0x021b8b98` | 28 | data | `Ov010FnPtrCb[7]` | Dispatch table "A", sibling of 021b8b7c; consumer `ov010_021b4014.c` |
| `data_ov010_021b8c14` | ov010 | `0x021b8c14` | 12 | data | `char[12]` | "#" glyph-template placeholder; consumer (transitively traced) `func_020a6a28` strstr-equivalent |
| `data_ov011_021d35c8` | ov011 | `0x021d35c8` | 8 | rodata | `unsigned char[8]` | Bit-shift table; consumer `func_ov011_021cd190.s`, corroborated by existing prep draft |
| `data_ov011_021d300c` | ov011 | `0x021d300c` | 20 | rodata | `short[10]` | 5-slot (x,y) coord table; consumer `func_ov011_021ceebc.s`, matches existing dossier |
| `data_ov011_021d3fcc` | ov011 | `0x021d3fcc` | 52 | data | `char[52]` | "FaceIcon/Face%03d.LZ5bg"; consumer `func_ov011_021d1434.s` |
| `data_ov011_021d2fe4` | ov011 | `0x021d2fe4` | 20 | rodata | `unsigned short[10]` | 5-slot coord-shaped table; **lower confidence** — typed by shape-analogy, sole consumer is a parked raw-opcode wall function |
| `data_ov012_021cc0a4` | ov012 | `0x021cc0a4` | 12 | rodata | `unsigned char[12]` | 6-slot (x,y) OAM coord table; consumer `func_ov012_021ca18c.s`, matches existing prep draft |
| `data_ov012_021cc108` | ov012 | `0x021cc108` | 24 | rodata | `unsigned char[24]` | 6x4 D-pad nav table; consumer `func_ov012_021cb088.s`, own traced base-pointer-fold inference |
| `data_ov012_021cc3d0` | ov012 | `0x021cc3d0` | 20 | data | `Ov012StepFn[5]` | Dispatch table; consumer already-matched `func_ov012_021cc01c.c`, one target itself matched |
| `data_ov013_021cb9b0` | ov013 | `0x021cb9b0` | 20 | data | `Ov013StepFn[5]` | Dispatch table; consumer already-matched `func_ov013_021cb700.c` |
| `data_ov014_021b4cc0` | ov014 | `0x021b4cc0` | 24 | data | `Ov014StepFn[6]` | Dispatch table incl. 1 cross-module target (`ov005`, overlay-RAM-alias resolved); consumer already-matched `func_ov014_021b26ec.c` |
| `data_ov014_021b4d48` | ov014 | `0x021b4d48` | 12 | data | `HitRect` | Entry 0/6, stride proven by TWO independent consumers; reuses typedef from already-shipped `Ov014_HitTestPrimary.c` |
| `data_ov014_021b4d54` | ov014 | `0x021b4d54` | 12 | data | `HitRect` | Entry 1/6, same family |
| `data_ov014_021b4d60` | ov014 | `0x021b4d60` | 12 | data | `HitRect` | Entry 2/6 |
| `data_ov014_021b4d6c` | ov014 | `0x021b4d6c` | 12 | data | `HitRect` | Entry 3/6 |
| `data_ov014_021b4d78` | ov014 | `0x021b4d78` | 12 | data | `HitRect` | Entry 4/6 |
| `data_ov014_021b4d84` | ov014 | `0x021b4d84` | 12 | data | `HitRect` | Entry 5/6 (last), odd-one-out attr/size |
| `data_ov014_021b4f14` | ov014 | `0x021b4f14` | 12 | data | `unsigned char[12]` | First 12B of a 32B string, boundary lands mid-word; 2 `OS_SPrintf` consumers |
| `data_ov015_021b5cc8` | ov015 | `0x021b5cc8` | 28 | data | `Ov015StepFn[7]` | Dispatch table; consumer already-matched `func_ov015_021b5a14.c` |
| `data_ov016_021b8df8` | ov016 | `0x021b8df8` | 12 | rodata | `unsigned short[6]` | Template table; consumer `func_ov016_021b423c.s` |
| `data_ov016_021b8f80` | ov016 | `0x021b8f80` | 16 | data | `Ov016StepFn[4]` | Dispatch table, pre-declared in `ov016_core.h`; consumer `func_ov016_021b2824.c` |
| `data_ov016_021b9014` | ov016 | `0x021b9014` | 12 | data | `Ov016TouchCell` | Touch-cell record; field roles cross-confirmed via already-matched `func_ov016_021b3498.c`; 2 consumers |
| `data_ov016_021b91ac` | ov016 | `0x021b91ac` | 112 | data | `Ov016TouchCellSmTable` | 11-entry sub-table, algebraically `data_ov016_021b9184[4..14]`; consumer `func_ov016_021b423c.s` |
| `data_ov017_021b8020` | ov017 | `0x021b8020` | 16 | data | `Ov017StepFn[4]` | Dispatch table, pre-declared in `ov017_core.h`; consumer `func_ov017_021b2c8c.c` |
| `data_ov017_021b80c8` | ov017 | `0x021b80c8` | 12 | data | `Box` | Reuses exact type from already-shipped `func_ov017_021b4090.c`; consumer `func_ov017_021b312c.s`, matches existing retriage doc |
| `data_ov019_021b5b20` | ov019 | `0x021b5b20` | 16 | data | `Ov019StepFn[4]` | Dispatch table, pre-declared in `ov019_core.h`; consumer `func_ov019_021b26d0.c` |
| `data_ov016_021b9000` | ov016 | `0x021b9000` | 12 | data | `Ov016Record021b9000` | **Part 2 TU-composition experiment**, element 0 of a real 10B-stride record array; 2 consumers |
| `data_ov016_021b900a` | ov016 | `0x021b900a` | 12 | data | `Ov016Record021b9000` | **Part 2 TU-composition experiment**, element 1, same array; 2 consumers |

**64 Part-1 + 2 Part-2 = 66 symbols shipped this wave, zero declined.**
One symbol (`data_ov011_021d2fe4`) is flagged lower-confidence (typed by
shape-analogy rather than a directly-traced consumer read, since its
sole reader is a parked cross-overlay "wall" function shipped as raw
opcode words) — still byte-correct and gate-verified, just weaker
semantic evidence than its siblings.

## Byte-count deltas

```
Typed-array:   178,932 -> 179,888 bytes  (+956 B,  3.75% -> 3.77%)
Named-struct:   72,440 ->  73,188 bytes  (+748 B,  1.52% -> 1.53%)
```

Measured from `docs/state-table.md` against `origin/main` (confirmed
current — this branch's merge-base with `origin/main` is `origin/main`'s
own tip, no divergence). Independently re-derived by running the
project's own classifier (`tools/progress.py`'s
`_has_file_scope_array_decl` / `_tu_has_named_struct_decl`) directly
against all 65 new/changed files: 956 B Typed-array (exact match) and
752 B Named-struct (4 B over the real delta — not fully reconciled to
the byte, see below). One concrete, confirmed source of Typed-array/
Named-struct divergence this wave: `data_ov003_021cf160.c` declares
`int (*data_ov003_021cf160[])(void)`, a function-pointer-array
declarator the classifier's regex doesn't recognize as an array
declaration at all (it expects the simpler `Type name[N]` shape) — so
its 16 B count in *neither* bucket, a real classifier limitation
(documented as "a coverage metric, not a correctness one"), not a bug
in the carve. The remaining 4 B gap in the Named-struct
re-derivation was not chased further; `docs/state-table.md`'s own
numbers above are the authoritative source, consistent with the
project's own generator.
