void *func_0208dd9c(void) {
    unsigned int dispcnt = *(volatile unsigned int *)0x04001000;
    unsigned int bg2cnt = *(volatile unsigned short *)0x0400100e;
    int mode = dispcnt & 7;
    if (mode < 3) {
        goto compute;
    }
    if (mode >= 6) {
        goto zero;
    }
    if (bg2cnt & 0x80) {
        goto zero;
    }
compute:
    return (void *)((((bg2cnt & 0x3c) >> 2) << 14) + 0x6200000);
zero:
    return 0;
}
