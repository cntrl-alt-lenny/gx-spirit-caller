unsigned int func_020905dc(unsigned int mask) {
    unsigned short ime = *(volatile unsigned short *)0x04000208;
    unsigned int old;
    *(volatile unsigned short *)0x04000208 = 0;
    old = *(volatile unsigned int *)0x04000210;
    *(volatile unsigned int *)0x04000210 = old & ~mask;
    *(volatile unsigned short *)0x04000208;
    *(volatile unsigned short *)0x04000208 = ime;
    return old;
}
