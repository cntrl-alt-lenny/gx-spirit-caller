int func_ov007_021b28c4(int unused, int enabled) {
    volatile unsigned int *reg = (volatile unsigned int *)0x04001000;
    if (enabled) {
        unsigned int planes = (*reg & 0x1f00) >> 8;
        *reg = (*reg & ~0x1f00) | ((planes | 8) << 8);
    } else {
        unsigned int planes = (*reg & 0x1f00) >> 8;
        *reg = (*reg & ~0x1f00) | ((planes & ~8) << 8);
    }
    return 1;
}
