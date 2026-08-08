/* data_ov012_021cc0a4 (12 bytes, 4-aligned): 6-slot (x,y) byte
 * coordinate table for spirit-icon OAM placement.
 * Consumer: src/overlay012/func_ov012_021ca18c.s:17-28 (6x2-byte copy
 * loop onto the stack) and :62-70 (`ldrb r3,[r2,r1,lsl#1]` pair read,
 * each half <<12'd and passed to func_ov012_021caea8 = Ov012_SetSpiritOamPos,
 * "Takes (tableIdx, x12, y12) ... sets OAM position for a spirit
 * sprite" per docs/research/map/overlay012.md:27); relocs.txt
 * from:0x021ca294 kind:load to:0x021cc0a4.
 * Matches docs/research/c-match-prep/021ca18c.c verbatim: `loA =
 * dst16[idx*2]<<12; loB = dst16[idx*2+1]<<12;
 * func_ov012_021caea8(&loA,0,&loB,-1,0x10,bytes[idx]);`.
 * .rodata ground truth -> const.
 */

const unsigned char data_ov012_021cc0a4[12] = {
    0xe3, 0x36, 0x93, 0x81, 0x95, 0x29, 0x00, 0x35, 0x57, 0x8e, 0x18, 0x81,
};
