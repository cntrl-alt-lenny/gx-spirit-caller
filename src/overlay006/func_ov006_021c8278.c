/* func_ov006_021c8278: program a 16-bit MMIO control register, return 1. */
int func_ov006_021c8278(void) {
    volatile unsigned short *reg = (volatile unsigned short *)0x0400100a;
    *reg = (*reg & ~3) | 1;
    *reg = (*reg & 0x43) | 0x210 | 0x2000;
    return 1;
}
