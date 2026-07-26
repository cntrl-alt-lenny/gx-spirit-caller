/* data_ov002_022bdfec (288 bytes, 4-aligned): retyped from opaque bytes to
 * a typed 2D array as part of cm-data-inference-3.
 *
 * Independent of the 8-table "card-ID -> handler-pointer pair" family
 * (func_ov002_02257464.s/func_ov002_0228bcd0.s do not reference this
 * symbol) -- a standalone 6x24 signed-halfword ATK/DEF-delta grid.
 *
 * Evidence: sole consumer func_ov002_021c3e40.s computes a genuinely 2D
 * address, `base + row*0x30 + col*2` (`mov r0,#0x30; mla r0,row,r0,base`
 * then `ldrsh [base+row*0x30, col*2]`), where `row` (0..5) comes from a
 * runtime 6-way jump-table dispatch on a 13-bit field-spell ID
 * (0x10F0..0x10F5) and `col` (bounds-checked to [1,20]) comes from a
 * struct field. Outer stride 0x30=48=24*sizeof(short) and inner stride
 * 2 both directly evidenced; 6 rows * 48 bytes = 288 bytes exactly, no
 * slack. Columns 0/21-23 are always zero in every row (outside the
 * code's guarded [1,20] range) -- unused padding, not meaningful data.
 *
 * Byte content is an exact reinterpretation of the same bytes previously
 * shipped as `const unsigned char data_ov002_022bdfec[288]` --
 * mechanically parsed out of the previous literal and round-trip-
 * verified, never hand-transcribed.
 */
const short data_ov002_022bdfec[6][24] = {
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 200, 200, 200, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 200, 0, 0, 0, 200, 0, 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 200, 0, 0, 200, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 200, 0, 0, 200, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, -200, 200, 0, -200, 200, 0, 0, 0, 0, 0, 200, 0, 0, 0, 0, 200, 0, 0, 0, 0 },
    { 0, 0, 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -200, 200, 0, 0, 0, 0, 0 },
};
