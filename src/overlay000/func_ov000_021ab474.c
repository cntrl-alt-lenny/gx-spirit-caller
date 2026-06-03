/* func_ov000_021ab474: write the 3-bit field [15:13] of the selected display
 * engine's control reg +0x00 from val. (021ab8b4 MMIO-switch family.) */
void func_ov000_021ab474(int which, int val) {
    switch (which) {
    case 0: {
        volatile unsigned *p = (volatile unsigned *)0x04000000;
        *p = (*p & ~0xe000) | (val << 13);
        break;
    }
    case 1: {
        volatile unsigned *p = (volatile unsigned *)0x04001000;
        *p = (*p & ~0xe000) | (val << 13);
        break;
    }
    }
}
