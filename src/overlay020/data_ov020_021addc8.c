/* data_ov020_021addc8 (8 bytes, 4-aligned): const unsigned short[4] default
 * ordering table {2,3,4,5}. Sole consumer func_ov020_021abbe8.s (matched/
 * "complete" but permanently .s -- brief 207 permuter-class) reads all 4
 * halfwords wholesale via ldrh (lines 449-452) and copies them to a stack
 * scratch buffer (lines 453-456: `strh r3,[sp,#0]` .. `strh r0,[sp,#6]`),
 * which a later loop (.L_021ac1ec, calling func_ov020_021aa700 -- ov020's
 * documented "point-in-rect predicate") conditionally reorders. Table
 * label `.L_021ac390: .word data_ov020_021addc8` at line 597-598.
 * relocs.txt:269 `from:0x021ac390 kind:load to:0x021addc8 module:overlay(20)`.
 * Section: .rodata (delinks.txt 0x021addc0-0x021addd8) -> const, matching
 * the immediately-adjacent already-shipped sibling data_ov020_021addd0.c
 * (`const int data_ov020_021addd0[2] = {0, 1};`), which sits right after
 * this table in the same rodata section and uses the same decimal style.
 */
const unsigned short data_ov020_021addc8[4] = {
    2, 3, 4, 5,
};
