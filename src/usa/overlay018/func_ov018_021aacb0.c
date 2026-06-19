/* func_ov018_021aacb0: raise the same redraw flag (+0x9b4 bit 2) when either
 * of the two input bits (0x1 / 0x2) of data_02104acc+0x54 is set.
 *
 *     ldrh r0,[..#0x54]; tst r0,#1; beq .L1; <set flag>; bx
 *  .L1: tst r0,#2; bxeq lr; <set flag>; bx
 */

extern char data_02104acc[];
extern char data_ov018_021ad7c8[];

void func_ov018_021aacb0(void) {
    unsigned short in = *(unsigned short *)(data_02104acc + 0x54);
    char *oam = data_ov018_021ad7c8;
    if (in & 1) {
        *(unsigned short *)(oam + 0x9b4) |= 4;
        return;
    }
    if (in & 2) {
        *(unsigned short *)(oam + 0x9b4) |= 4;
    }
}
