/* func_ov006_021ca4b8: MMIO setup — configure sub-engine BG control register
 * 0x0400100a (clear low 2 bits, set bit0; then mask to 0x43 and OR in
 * 0x210|0x2000), then write the rotation param at +0xa from
 * (-self->f78 & 0x1ff) in the low half and (-self->f7c << 16) & 0x01ff0000
 * in the high half. Returns 1. */
int func_ov006_021ca4b8(char *self) {
    volatile unsigned short *reg = (volatile unsigned short *)0x0400100a;
    int lo, hi;

    *reg = (unsigned short)((*reg & ~3) | 1);
    *reg = (unsigned short)((*reg & 0x43) | 0x210 | 0x2000);

    lo = -*(int *)(self + 0x78);
    hi = -*(int *)(self + 0x7c);
    *(volatile unsigned int *)((char *)reg + 0xa) =
        (unsigned)(lo & 0x1ff) | ((unsigned)(hi << 16) & 0x01ff0000);
    return 1;
}
