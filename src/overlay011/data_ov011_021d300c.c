/* data_ov011_021d300c (20 bytes, 4-aligned): 5-slot (x,y) short
 * coordinate table, selected when data_ov011_021d4000+0x2a0==1 (sibling
 * data_ov011_021d3034 covers the else-branch, not in this carve).
 * Indexed at idx*4 by a bitfield nibble of data_ov011_021d403c+0x268;
 * both halves sign-extended (ldrsh) and <<12'd into fixed-point .12
 * view-X/Y fields.
 * Consumer: src/overlay011/func_ov011_021ceebc.s:26-33 (`ldrsh
 * r3,[lr]` / `ldrsh r3,[lr,#2]`, lr = &data_ov011_021d300c + (idx-1)*4;
 * relocs.txt from:0x021cef30 kind:load to:0x021d300c).
 * Matches docs/research/dossiers/021ceebc.md /
 * docs/research/c-match-prep/021ceebc.c verbatim ("Table entry = 4
 * bytes = 2 shorts (x,y); both <<12"; `tbl[idx*2]`/`tbl[idx*2+1]`).
 * .rodata ground truth -> const.
 */

const short data_ov011_021d300c[10] = {
    0x0039, 0x0156, 0x0159, 0x0158, 0x00dc, 0x00b0, 0x00e7, 0x00ec, 0x0125, 0x0140,
};
