unsigned int func_02090574(unsigned int value) {
    volatile unsigned short *ime = (volatile unsigned short *)0x04000208;
    volatile unsigned int *ie = (volatile unsigned int *)0x04000210;
    unsigned short saved_ime = *ime;
    unsigned int old_ie;
    *ime = 0;
    old_ie = *ie;
    *ie = value;
    *ime;
    *ime = saved_ime;
    return old_ie;
}
