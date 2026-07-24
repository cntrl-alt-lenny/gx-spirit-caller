extern short data_021023b8;
extern short data_021a6220;

void func_0208c8a4(void) {
    volatile unsigned int *reg = (volatile unsigned int *)0x4000000;
    unsigned int val = *reg;

    data_021023b8 = 0;
    data_021a6220 = (short)((val & 0x30000) >> 16);
    *reg = val & ~0x30000;
}
