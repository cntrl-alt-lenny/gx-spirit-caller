void func_020a5f44(int *out) {
    volatile unsigned short *reg = (volatile unsigned short *)0x04000204;
    out[0] = (*reg & 0xc) >> 2;
    out[1] = (*reg & 0x10) >> 4;
    *reg = (*reg & ~0xc) | 0xc;
    *reg = *reg & ~0x10;
}
