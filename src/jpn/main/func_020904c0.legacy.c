unsigned int func_020904c0(unsigned int value) {
    volatile unsigned short *ime = (volatile unsigned short *)0x04000208;
    volatile unsigned int *reg = (volatile unsigned int *)0x04000214;
    unsigned short saved_ime = *ime;
    unsigned int old;
    *ime = 0;
    old = *reg;
    *reg = value;
    *ime;
    *ime = saved_ime;
    return old;
}
