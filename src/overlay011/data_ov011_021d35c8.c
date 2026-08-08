/* data_ov011_021d35c8 (8 bytes, 4-aligned): per-field bit-SHIFT table
 * (values 1,3,6,9,12 + 3 pad bytes), indexed by (id-1), used as
 * (shift-1) to pull a variable-width bitfield out of func_0201b770()'s
 * return value; paired with width table data_ov011_021d334a (stride
 * 0x72, not in this carve).
 * Consumer: src/overlay011/func_ov011_021cd190.s:22 (`ldrb ip,[r3,ip]`,
 * r3=&data_ov011_021d35c8, ip=id-1; relocs.txt from:0x021cd1f0
 * kind:load to:0x021d35c8).
 * Corroborated by docs/research/c-match-prep/021cd190.c ("shift =
 * data_021d35c8[id-1] - 1"), which already types this
 * `extern unsigned char data_ov011_021d35c8[];` -- reused verbatim.
 * .rodata ground truth -> const.
 */

const unsigned char data_ov011_021d35c8[8] = {
    0x01, 0x03, 0x06, 0x09, 0x0c, 0x00, 0x00, 0x00,
};
