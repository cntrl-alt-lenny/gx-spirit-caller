/* data_ov005_021b1a44 / _021b1a76 (100 bytes, 0x021b1a44-0x021b1aa8):
 * TU-COMPOSITION carve (see docs/research/alignment-wall-tu-composition-
 * recipe.md) -- 2 adjacent 2-byte-misaligned .data symbols, combined span
 * 4-aligned at both ends (start%4==0, end%4==0, size 100 == 4*25), carved
 * as 2 separate named globals of ONE shared 10-byte record type, in
 * address order, in this one TU (cm-restock-carve-4 Part 1 screen: PASS).
 *
 * SPLIT FROM A 4-SYMBOL BUNDLE: this run and _021b1aa8/_021b1ab2 (now
 * data_ov005_021b1aa8.c) were originally investigated and drafted as ONE
 * 4-symbol, 120-byte TU. Compiling that draft and inspecting the .o
 * symbol table (per the recipe doc's explicit "spot-test a 3+ symbol
 * group for reordering, don't assume safe by extrapolation" warning)
 * showed mwcc does NOT preserve declaration order at n=4: the compiled
 * .data section came out as [_1ab2, _1aa8, _1a76, _1a44] -- a full
 * reversal of the source order [_1a44, _1a76, _1aa8, _1ab2] -- which
 * would have shipped every symbol's bytes at the wrong address. Since
 * 0x021b1aa8 (the midpoint between the array pair and the two scalars)
 * is itself 4-aligned, the bundle splits cleanly into two independently
 * both-ends-passing n=2 TUs instead, matching this wave's other three
 * proven n=2 shapes (see also data_ov016_021b9184.c/_9198.c and
 * data_ov017_021b80a0.c/_80b4.c, the other two n=4 groups this same
 * wave hit and split for the identical reason).
 *
 * Section: config/eur/arm9/overlays/ov005/delinks.txt:5 confirms
 * `.data start:0x021b17e0 end:0x021b1d40` -- covers the whole run, so
 * NONE of these four may be `const`.
 *
 * Record shape (10 bytes):
 *   +0x0 u16 x, +0x2 u16 y, +0x4 u8 w, +0x5 u8 h -- the already-matched
 *     `struct Ov005Rect` bounds-check view (src/overlay005/
 *     func_ov005_021aeefc.c, func_ov005_021aee84.c:
 *     `r->x<=A && r->x+r->w>A && r->y<=B && r->y+r->h>B`).
 *   +0x6 u16 f6, +0x8 u16 f8 -- proven READ (not padding) by
 *     func_ov005_021ad35c.s (`ldrh r4,[r8,#0x8]` / `ldrh r4,[r8,#0x6]`),
 *     forwarded verbatim into a `func_0201e964(2, ptr, &cfg)` slot-
 *     populate call as cfg+0x8/cfg+0xc; semantic role not further named.
 *
 * data_ov005_021b1a44[5] and data_ov005_021b1a76[5]: dsd split what the
 * consumer code treats as one virtual 10-entry table into two 5-entry
 * placeholder symbols -- func_ov005_021ad35c.s's `.L_210` block computes
 * `data_ov005_021b1a44 + (idx+6)*10`, which for idx=0..2 lands at byte
 * offsets 0x3c/0x46/0x50 from data_ov005_021b1a44's base, i.e. INSIDE
 * data_ov005_021b1a76 (starts at offset 0x32) -- proving both blocks
 * share the identical record layout, split at a real, independently-
 * referenced symbol boundary (relocs.txt separately shows a direct
 * base-pointer load of data_ov005_021b1a76 itself; same mechanism
 * documented for data_ov016_021b9000/_900a in the recipe doc).
 *
 * Consumers (both permanent GLOBAL_ASM "wall" .s files, brief 302/294 --
 * no .c exists or will exist for either; struct fields proven via the
 * already-matched leaf functions they call):
 *  - src/overlay005/func_ov005_021ae5a4.s: literal-pool loads all 4
 *    symbols (relocs.txt:416 from:0x021aee6c to:0x021b1a44, :418
 *    from:0x021aee74 to:0x021b1aa8, :419 from:0x021aee78 to:0x021b1ab2,
 *    :420 from:0x021aee7c to:0x021b1a76). Calls func_ov005_021aeefc
 *    (landed; struct Ov005Rect bounds check) on data_ov005_021b1aa8,
 *    then data_ov005_021b1ab2, then a 3-iteration loop over
 *    data_ov005_021b1a44[i] (i=0,1,2; `add r8,r8,#0xa` confirms 10-byte
 *    stride), then data_ov005_021b1a76 (record 0) -- a 6-hotspot
 *    hit-test sequence.
 *  - src/overlay005/func_ov005_021ad35c.s: literal-pool loads 3 of 4
 *    symbols (relocs.txt:280 from:0x021adef8 to:0x021b1a44, :282
 *    from:0x021adf1c to:0x021b1ab2, :285 from:0x021adf38 to:
 *    0x021b1a76). Two independent 3-iteration loops (`add r9,r9,#0xa`)
 *    walk data_ov005_021b1a44[0..2] reading x/y/f6/f8 each iteration and
 *    forwarding to func_0201e964; direct single-record reads of
 *    data_ov005_021b1ab2 and data_ov005_021b1a76[0] follow the identical
 *    pattern. See also docs/research/retriage/
 *    Ov011Ov016Ov010Ov005RetriageR9.md:69 ("4 small hit-rect tables
 *    passed to CardList_HitTestScreenB (021aeefc)").
 *
 * data_ov005_021b1a44[3],[4] and data_ov005_021b1a76[1..4] were not
 * individually traced to a specific reading call site in the two
 * consumers above (both traced loops stop at index 2); they are shipped
 * verbatim from the pristine ROM bytes on the strength of the identical,
 * proven record shape repeating across all ten records in this file
 * (in-range display coordinates for x/y/w/h; f6/f8 in {1,2,3} matching
 * the proven records). data_ov005_021b1aa8/_021b1ab2 (now the sibling
 * file's own two scalars) share this exact same proven record type.
 */

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char  w;
    unsigned char  h;
    unsigned short f6;
    unsigned short f8;
} Ov005Record021b1a44;

Ov005Record021b1a44 data_ov005_021b1a44[5] = {
    { 0x0065, 0x00ac, 0x32, 0x0f, 0x0002, 0x0001 },
    { 0x0033, 0x00ac, 0x32, 0x0f, 0x0002, 0x0001 },
    { 0x0097, 0x00ac, 0x32, 0x0f, 0x0002, 0x0001 },
    { 0x00e2, 0x0019, 0x18, 0x14, 0x0002, 0x0001 },
    { 0x00e2, 0x0075, 0x18, 0x14, 0x0002, 0x0001 },
};

Ov005Record021b1a44 data_ov005_021b1a76[5] = {
    { 0x00e4, 0x00a6, 0x1a, 0x1a, 0x0002, 0x0001 },
    { 0x0010, 0x008c, 0x26, 0x14, 0x0002, 0x0001 },
    { 0x003a, 0x008c, 0x26, 0x14, 0x0002, 0x0001 },
    { 0x0064, 0x008c, 0x26, 0x14, 0x0003, 0x0002 },
    { 0x008e, 0x008c, 0x50, 0x14, 0x0003, 0x0002 },
};
