/* data_ov008_021b23b8 (8 bytes, 4-aligned): 4-entry u16 constant table,
 * copied halfword-by-halfword into a local buffer and forwarded to
 * func_ov008_021ab008 (Ov008_BlendPixelRow, RGB555 colour-blend loop) by
 * func_ov008_021abcdc (Ov008_DrawFieldOverlay) -- per docs/research/map/
 * overlay008.md naming.
 * Consumer: src/overlay008/func_ov008_021abcdc.s:25-38 (`_LIT0`, declared
 *   :251; `ldrh r4,[r2]` / `ldrh r3,[r2,#2]` / `ldrh ip,[r2,#4]` /
 *   `ldrh r4,[r2,#6]` copy all 4 halfwords to a stack buffer before
 *   `bl func_ov008_021ab008`) -- proven by
 *   config/eur/arm9/overlays/ov008/relocs.txt:247
 *   `from:0x021ac04c kind:load to:0x021b23b8 module:overlay(8)`.
 * No outgoing relocs from this range (checked relocs.txt for
 * from:0x021b23b8 / from:0x021b23bc) -- plain halfword data, not
 * pointers (values 0x4080/0x7e40/0x7f20/0x7f60 are all outside the
 * 0x02xxxxxx ARM9 range anyway).
 * .rodata-resident: config/eur/arm9/overlays/ov008/delinks.txt `.rodata
 *   start:0x021b23b8 end:0x021b2430` (this symbol opens the section) --
 *   declared const to match.
 */
const unsigned short data_ov008_021b23b8[4] = {
    0x4080, 0x7e40, 0x7f20, 0x7f60,
};
