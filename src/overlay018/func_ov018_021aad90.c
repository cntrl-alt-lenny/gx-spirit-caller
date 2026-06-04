/* func_ov018_021aad90: raise the same redraw flag (+0x9b4 bit 2) when either
 * of the two input bits (0x1 / 0x2) of data_02104bac+0x54 is set.
 *
 *     ldrh r0,[..#0x54]; tst r0,#1; beq .L1; <set flag>; bx
 *  .L1: tst r0,#2; bxeq lr; <set flag>; bx
 */

extern char data_02104bac[];
extern char data_ov018_021ad8a8[];

void func_ov018_021aad90(void) {
    unsigned short in = *(unsigned short *)(data_02104bac + 0x54);
    char *oam = data_ov018_021ad8a8;
    if (in & 1) {
        *(unsigned short *)(oam + 0x9b4) |= 4;
        return;
    }
    if (in & 2) {
        *(unsigned short *)(oam + 0x9b4) |= 4;
    }
}
