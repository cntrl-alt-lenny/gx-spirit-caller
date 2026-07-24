extern short data_02102498;
extern short data_021a6300;

void func_0208c98c(void) {
    volatile unsigned int *reg = (volatile unsigned int *)0x4000000;
    unsigned int val = *reg;

    data_02102498 = 0;
    data_021a6300 = (short)((val & 0x30000) >> 16);
    *reg = val & ~0x30000;
}
