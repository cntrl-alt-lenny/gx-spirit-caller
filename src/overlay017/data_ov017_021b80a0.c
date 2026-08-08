/* data_ov017_021b80a0 / _021b80aa (20 bytes total, 4-aligned at both ends:
 * 0x021b80a0..0x021b80b4): TU-composition carve of 2 adjacent 2-byte-
 * misaligned candidates per docs/research/alignment-wall-tu-composition-
 * recipe.md -- data_ov017_021b80a0 (mod4=0 start, 10-byte size, mod4=2
 * end), data_ov017_021b80aa (mod4=2 start, mod4=0 end). Individually each
 * would hit the ALIGNALL(2) wall; declared here as 2 separate named
 * globals of the same 10-byte record type, in address order, in ONE TU
 * whose combined .data section is 20 bytes (4-aligned).
 *
 * SPLIT FROM A 4-SYMBOL BUNDLE: this run and _021b80b4/_021b80be (now
 * data_ov017_021b80b4.c) were originally investigated and drafted as ONE
 * 4-symbol, 40-byte TU. Compiling that draft and inspecting the .o symbol
 * table (per this recipe doc's explicit "spot-test a 3+ symbol group for
 * reordering, don't assume safe by extrapolation" warning) showed mwcc
 * does NOT preserve declaration order at n=4: the compiled .data section
 * came out as [_80b4, _80aa, _80a0, _80be] instead of source order
 * [_80a0, _80aa, _80b4, _80be], which would have shipped every symbol's
 * bytes at the wrong address. Since 0x021b80b4 (the midpoint) is itself
 * 4-aligned, the bundle splits cleanly into two independently
 * both-ends-passing n=2 TUs instead -- matching this wave's other two
 * n=4-bundles-that-had-to-split (see data_ov005_021b1a44.c/_1aa8.c and
 * data_ov016_021b9184.c/_9198.c).
 *
 * Both are real, independently-addressed elements of a 5-element,
 * 10-byte-stride array (elements 0-1 here; elements 2-3 in the sibling
 * data_ov017_021b80b4.c; element 4 the already-shipped, wave-3-carved
 * 12-byte `Box` data_ov017_021b80c8.c), not an artificial pairing --
 * confirmed by TWO independent consumers:
 *
 * 1. src/overlay017/func_ov017_021b312c.s (whole-function .s): loads each
 *    by its own literal-pool `.word` as a direct base pointer for a
 *    "menu row" hit-test+forward block (relocs.txt:162/164, from:
 *    0x021b33c0/33c8 kind:load to:0x021b80a0/80aa module:overlay(17)) --
 *    each block does `mov r0,<sym>; bl func_ov017_021b2ce4` (hit-test)
 *    then `mov r3,<sym>; ...; bl func_ov017_021b4090` (box-offset
 *    forward), e.g. lines 60-80 of that file for data_ov017_021b80a0.
 *    The SAME function also indexes across the full 5-element array
 *    generically: lines 172-181 compute `mov r0,#0xa; mla r3,r1,r0,r3`
 *    (r3=data_ov017_021b80a0, stride=10, r1=a runtime row index cached
 *    at self+0xc) before a 5th call into func_ov017_021b4090 (mode 0xb,
 *    the deck-cursor highlight). That index arithmetic lands exactly on
 *    the already-shipped data_ov017_021b80c8 at index 4
 *    (0x021b80a0 + 4*10 = 0x021b80c8).
 * 2. src/overlay017/func_ov017_021b3ca8.c (MATCHED C, a second and
 *    independent consumer): line 61,
 *    `func_ov017_021b2d5c(data_ov017_021b80a0 + self->f_c * 10)` -- same
 *    base, same stride=10, this time with a runtime index (self->f_c)
 *    computed directly in C (relocs.txt:271, from:0x021b3e64 kind:load
 *    to:0x021b80a0 module:overlay(17)). That same function's own clamp
 *    logic on self->f_c (`if (self->f_c > 4) self->f_c = 0;` /
 *    `if (self->f_c < 0) self->f_c = 4;`, lines 48-53) independently
 *    confirms this is a 5-element (idx 0-4) array. data_ov017_021b80aa
 *    has exactly one relocs.txt hit (line 164 above) -- direct literal
 *    only inside func_ov017_021b312c.s; git grep across the whole src/
 *    and config/ trees finds no other consumer.
 *
 * Field shape: each element is read as BOTH a `Rect` (docs/research/types/
 * Rect.md: u16 x, u16 y, u8 w, u8 h -- offsets +0/+2/+4/+5, HIGH
 * confidence, byte-exact `ldrb` loads at +4/+5 in the MATCHED
 * func_ov017_021b2ce4.c and func_ov017_021b2d5c.c) AND a `Box` (docs/
 * research/types/Box.md: func_ov017_021b4090.c's `Box *src` parameter,
 * which only ever touches src->f0/f2/f6/f8 -- offsets +0/+2/+6/+8).
 * Together every one of the 10 bytes is accounted for by a real, confirmed
 * read: +0/+1 (x), +2/+3 (y), +4 (w), +5 (h), +6/+7 (f6), +8/+9 (f8) --
 * unlike the neighboring 12-byte Box (data_ov017_021b80c8), these records
 * have NO trailing unread `fa` slot, because the next record/symbol
 * begins immediately at +10. This run's type is therefore declared fresh
 * at 10 bytes -- NOT a reuse of the existing 12-byte `Box` typedef, which
 * would be the wrong size and would misalign every subsequent element.
 * Field names below follow the Box lineage's offset-based f0/f2/.../f8
 * numbering (matching the immediately-adjacent shipped sibling
 * data_ov017_021b80c8.c) but split f4 into f4/f5 (u8 each) rather than
 * packing into one u16, matching this project's existing precedent
 * (src/overlay014/data_ov014_021b4d84.c) for a fresh (non-reused-type)
 * struct declaring a confirmed Rect-family layout.
 *
 * Values (both share y=165, w=h=26, f6=2, f8=1 -- matching the shipped
 * data_ov017_021b80c8's y=165/w=h=26/f6=2/f8=1 exactly; only x varies, in
 * a constant +32px stride across the menu rows: 19, 51): extracted via
 * extract_bytes.py from extract/eur/arm9_overlays/ov017.bin (pristine)
 * and cross-checked identical against build/eur/build/arm9_ov017.bin.
 *
 * Section: config/eur/arm9/overlays/ov017/delinks.txt line 5,
 * `.data start:0x021b8020 end:0x021b8520` -- this whole 20-byte span
 * falls inside, so neither symbol may be `const`. No field's value falls
 * in the 0x02xxxxxx ARM9/overlay address range and relocs.txt has zero
 * `from:` entries originating inside 0x021b80a0-0x021b80b4, so none of
 * the 10 bytes per element is itself a relocated pointer.
 */

typedef struct {
    unsigned short f0;  /* Rect x  == Box f0 */
    unsigned short f2;  /* Rect y  == Box f2 */
    unsigned char  f4;  /* Rect w */
    unsigned char  f5;  /* Rect h */
    unsigned short f6;  /* Box f6, forwarded verbatim by func_ov017_021b4090 */
    unsigned short f8;  /* Box f8, forwarded verbatim by func_ov017_021b4090 */
} Ov017Record021b80a0; /* sizeof = 10 */

Ov017Record021b80a0 data_ov017_021b80a0 = { 19, 165, 26, 26, 2, 1 };
Ov017Record021b80a0 data_ov017_021b80aa = { 51, 165, 26, 26, 2, 1 };
