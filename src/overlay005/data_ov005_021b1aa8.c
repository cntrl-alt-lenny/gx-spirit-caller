/* data_ov005_021b1aa8 / _021b1ab2 (20 bytes, 0x021b1aa8-0x021b1abc):
 * TU-COMPOSITION carve (see docs/research/alignment-wall-tu-composition-
 * recipe.md) -- 2 adjacent 2-byte-misaligned .data scalars, combined span
 * 4-aligned at both ends (start%4==0, end%4==0, size 20 == 4*5), carved
 * as 2 separate named globals of the same 10-byte record type used by the
 * sibling file data_ov005_021b1a44.c, in address order, in this one TU
 * (cm-restock-carve-4 Part 1 screen: PASS).
 *
 * SPLIT FROM A 4-SYMBOL BUNDLE: this run and _021b1a44/_021b1a76 (in the
 * sibling file data_ov005_021b1a44.c) were originally investigated and
 * drafted as ONE 4-symbol, 120-byte TU. Compiling that draft and
 * inspecting the .o symbol table (per the recipe doc's explicit
 * "spot-test a 3+ symbol group for reordering" warning) showed mwcc does
 * NOT preserve declaration order at n=4 -- see data_ov005_021b1a44.c's
 * own header comment for the full finding. Since 0x021b1aa8 is itself
 * 4-aligned, the bundle splits cleanly into two independently
 * both-ends-passing n=2 TUs instead.
 *
 * Section: config/eur/arm9/overlays/ov005/delinks.txt:5 confirms
 * `.data start:0x021b17e0 end:0x021b1d40` -- covers this run, so neither
 * symbol may be `const`.
 *
 * Record shape (10 bytes; full evidence in data_ov005_021b1a44.c's header
 * -- both files' data belongs to the SAME logical 12-record table, split
 * by dsd's boundary deduction into 4 placeholder symbols total):
 *   +0x0 u16 x, +0x2 u16 y, +0x4 u8 w, +0x5 u8 h -- the already-matched
 *     `struct Ov005Rect` bounds-check view (src/overlay005/
 *     func_ov005_021aeefc.c, func_ov005_021aee84.c).
 *   +0x6 u16 f6, +0x8 u16 f8 -- proven READ (not padding) by
 *     func_ov005_021ad35c.s, forwarded into a `func_0201e964(2, ptr,
 *     &cfg)` slot-populate call.
 *
 * Consumers (both permanent GLOBAL_ASM "wall" .s files, brief 302/294):
 *  - src/overlay005/func_ov005_021ae5a4.s: literal-pool loads both
 *    symbols directly (relocs.txt:418 from:0x021aee74 to:0x021b1aa8,
 *    :419 from:0x021aee78 to:0x021b1ab2). Calls func_ov005_021aeefc
 *    (landed; struct Ov005Rect bounds check) on data_ov005_021b1aa8, then
 *    data_ov005_021b1ab2, as two of a 6-hotspot hit-test sequence.
 *  - src/overlay005/func_ov005_021ad35c.s: literal-pool loads
 *    data_ov005_021b1ab2 directly (relocs.txt:282 from:0x021adf1c
 *    to:0x021b1ab2), reading x/y/f6/f8 and forwarding to
 *    func_0201e964. data_ov005_021b1aa8 has no reader in this second
 *    function; its only proven consumer is func_ov005_021ae5a4.s above.
 */

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char  w;
    unsigned char  h;
    unsigned short f6;
    unsigned short f8;
} Ov005Record021b1a44;

Ov005Record021b1a44 data_ov005_021b1aa8 = { 0x0000, 0x0018, 0x10, 0x8a, 0x0000, 0x0000 };

Ov005Record021b1a44 data_ov005_021b1ab2 = { 0x00e1, 0x008a, 0x1a, 0x18, 0x0003, 0x0002 };
