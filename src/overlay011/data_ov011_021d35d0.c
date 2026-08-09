/* data_ov011_021d35d0 (28 bytes, 4-aligned): flat unsigned-byte "kind"
 * remap LUT, indexed by (arg0 - 0x66), i.e. valid arg0 range 0x66-0x81
 * inclusive. No stride/record evidence -- the sole consumer reads
 * exactly ONE byte at a linear offset with no secondary indexing, so
 * this ships as a flat byte array, not a forced record shape.
 *
 * Sole consumer: src/overlay011/func_ov011_021d1fc8.c (already shipped,
 * matched):
 *   extern char data_ov011_021d35d0[];
 *   int func_ov011_021d1fc8(int arg0, int arg1) {
 *       if (func_0201a498() != 0 && arg0 == 0x6A) return 0x2D;
 *       return func_ov011_021d1f04(
 *           *(unsigned char *)((char *)data_ov011_021d35d0 + (arg0 - 0x66)),
 *           arg1);
 *   }
 * Confirmed by relocs.txt:1205 `from:0x021d2004 kind:load
 * to:0x021d35d0`. The single `*(unsigned char *)` read fixes the
 * element type as `unsigned char`. Values are mostly small remap codes
 * (0x03-0x2d) with a run of 0x00 "no-op/default" entries and two
 * 0x7d/0x7e outliers near the end -- real ROM bytes, no further
 * structure beyond "byte LUT" is evidenced.
 *
 * .rodata ground truth (delinks.txt:2) -> `const`.
 */

const unsigned char data_ov011_021d35d0[28] = {
    0x00, 0x0c, 0x03, 0x1c, 0x16, 0x09, 0x0f, 0x2b,
    0x2c, 0x1f, 0x22, 0x12, 0x13, 0x16, 0x2d, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7d,
    0x7e, 0x00, 0x00, 0x00,
};
