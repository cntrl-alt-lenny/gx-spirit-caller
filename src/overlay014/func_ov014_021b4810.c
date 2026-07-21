int func_ov014_021b4810(void) {
    volatile unsigned int *reg = (volatile unsigned int *)0x04001000;
    unsigned int t;

    t = (*reg & 0x1f00) >> 8;
    *reg = (*reg & ~0x1f00u) | ((t & ~3u) << 8);
    *(int *)(0x04001000 + 0x10) = 0;
    *(int *)(0x04001000 + 0x14) = 0;

    return 1;
}
