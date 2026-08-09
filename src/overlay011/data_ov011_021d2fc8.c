/* data_ov011_021d2fc8 / _021d2fc9 (12 bytes, 0x021d2fc8-0x021d2fd4):
 * TU-COMPOSITION carve (docs/research/alignment-wall-tu-composition-
 * recipe.md), cm-restock-carve-5 Part 2 -- two adjacent symbols forming
 * an INDEPENDENTLY both-ends-4-aligned n=2 span: data_ov011_021d2fc8's
 * own start (0x021d2fc8) is already 4-aligned (0xc8=200=4*50, %4==0) --
 * unlike this recipe's usual "2-byte-misaligned-start" candidate shape.
 * It is a 1-byte symbol (deduced from the next symbol, data_ov011_
 * 021d2fc9, starting immediately at 0x021d2fc9) whose own end is
 * misaligned (%4==1). data_ov011_021d2fc9 is 11 bytes (0x021d2fc9-
 * 0x021d2fd4, start %4==1, end %4==0, 0xd4=212=4*53). Combined: start
 * %4==0, end %4==0, size 12 = 4*3 -- the CONFIRMED WORKING n=2 shape (2
 * real, adjacent, independently-referenced symbols, declared as separate
 * named globals of their own types, in address order, in one TU).
 *
 * This file does NOT depend on, or require, merging with the already-
 * shipped data_ov011_021d2fb4.c (data_ov011_021d2fb4/_021d2fbe,
 * wave 4/#1481) into one 4-symbol TU. Given this project's own precedent
 * (docs/research/data/cm-restock-carve-4-2026-08-08.md Part 1: mwcc
 * reordered declaration order in 3 of 3 tested n=4 groups when compiled
 * standalone, fixed every time by splitting at an interior 4-aligned
 * symbol into two n=2 TUs -- exactly what 0x021d2fc8 offers here),
 * carving this file directly and skipping any n=4 merge attempt entirely
 * is the recommended path. The already-shipped data_ov011_021d2fb4.c is
 * left completely untouched (still its own 20-byte
 * 0x021d2fb4-0x021d2fc8 span); this is a second, independent TU
 * immediately after it.
 *
 * NOTE on 0x021d2fd4: this address is 4-aligned and is the real start
 * address of the next symbol per symbols.txt (data_ov011_021d2fd4, 16
 * bytes), but that symbol is NOT part of any currently-shipped TU --
 * delinks.txt has no entry for it; it remains an uncarved gap between
 * this file's end and the already-shipped data_ov011_021d2fe4.c (starts
 * 0x021d2fe4, confirmed at delinks.txt:1138). This file does not claim
 * or touch data_ov011_021d2fd4.
 *
 * SEMANTIC CONTENT: a "scroll target X/Y" LUT consumed by THREE
 * independent, already-shipped, permanent GLOBAL_ASM functions
 * (delinks.txt: all "complete"; each file's own header says "no C match
 * -- GLOBAL_ASM endgame, brief 294/302"): func_ov011_021cb3b4.s
 * (relocs.txt:222-223, from:0x021cb4f4/f8), func_ov011_021cca04.s
 * (relocs.txt:421-422, from:0x021ccad0/d4), and func_ov011_021ce50c.s
 * (relocs.txt:687-688, from:0x021ceeac/eb0) -- see docs/research/
 * dossiers/021cb3b4.md, docs/research/dossiers/021cca04.md, docs/
 * research/retriage/OverlayEFRetriage.md:590-604, and docs/research/
 * retriage/Ov011Deep.md:643-662. All three use the same two-pointer,
 * stride-2 idiom: `ldrb rX, [data_ov011_021d2fc8, slot, lsl #1]` (X) and
 * `ldrb rX, [data_ov011_021d2fc9, slot, lsl #1]` (Y), slot = 4-bit
 * actor-slot from data_ov011_021d403c[0x268] (`lsl #0x17 / lsr #0x1c`,
 * the standard OV011_ACTOR_SLOT idiom). Because the two base pointers
 * are 1 byte apart and each reads with stride 2, the physical bytes are
 * interleaved: X[0]=0x021d2fc8, Y[0]=0x021d2fc9, X[1]=0x021d2fca,
 * Y[1]=0x021d2fcb, X[2]=0x021d2fcc, Y[2]=0x021d2fcd, X[3]=0x021d2fce,
 * Y[3]=0x021d2fcf, X[4]=0x021d2fd0, Y[4]=0x021d2fd1, X[5]=0x021d2fd2,
 * Y[5]=0x021d2fd3 (confirmed against the real bytes below;
 * func_ov011_021cca04.s's own separate `cmp r0,#0x5` special case on the
 * same slot field independently corroborates up to 6 slots). This table
 * is adjacent in ROM address to the already-shipped data_ov011_021d2fb4/
 * _021d2fbe pair (same per-actor-slot table cluster, same slot-indexing
 * idiom) but is semantically UNRELATED: those feed rotation-matrix/task-
 * template selection (func_ov011_021cb574.s / func_ov011_021ca538
 * draft); this pair feeds a scroll-position clamp
 * ([(tgt_x*8-0x100)<<12, 0] / [(tgt_y*8-0xc0)<<12, extra<<12], per
 * func_ov011_021cca04.s) with three entirely different consumers.
 *
 * WHY OPAQUE BYTE BLOBS, NOT NAMED X/Y FIELDS: the interleaving crosses
 * the data_ov011_021d2fc8 / data_ov011_021d2fc9 symbol boundary --
 * data_ov011_021d2fc8 (1 byte) is ONLY X[0]; X[1..5] and Y[0..5] live
 * inside data_ov011_021d2fc9's own 11-byte span. A named-field struct on
 * either symbol alone would misrepresent which global "owns" which
 * slot's data, so both ship as honestly-labeled opaque byte arrays,
 * wrapped in a struct (matching this project's Ov011Bytes10 convention
 * from the sibling data_ov011_021d2fb4.c -- NOT bare arrays: mwcc splits
 * top-level array-typed globals into their own separate section each,
 * defeating composition, regardless of element count including this
 * degenerate 1-byte case).
 *
 * Bytes extracted via extract_bytes.py from extract/eur/arm9_overlays/
 * ov011.bin (pristine), cross-checked identical against
 * build/eur/build/arm9_ov011.bin. relocs.txt has zero `from:` entries
 * originating in 0x021d2fc8-0x021d2fd4 -- neither symbol contains a
 * relocated pointer.
 *
 * Section: config/eur/arm9/overlays/ov011/delinks.txt:2 confirms
 * `.rodata start:0x021d2f90 end:0x021d3620` -- covers this span, so both
 * symbols are `const`.
 */

typedef struct {
    unsigned char b[1];
} Ov011Bytes1;

typedef struct {
    unsigned char b[11];
} Ov011Bytes11;

const Ov011Bytes1 data_ov011_021d2fc8 = {{
    0x20,
}};

const Ov011Bytes11 data_ov011_021d2fc9 = {{
    0x20, 0x35, 0x3a, 0x40, 0x40, 0x40, 0x30, 0x32, 0x40, 0x40, 0x40,
}};
