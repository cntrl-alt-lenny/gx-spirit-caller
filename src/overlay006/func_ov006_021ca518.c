int func_ov006_021ca518(char *self) {
    unsigned short *reg = (volatile unsigned short *)0x0400100c;
    int lo, hi;
    *reg = (unsigned short)(*reg & ~3);
    *reg = (unsigned short)((*reg & 0x43) | 0x410);
    lo = -*(int *)(self + 0x78);
    hi = -*(int *)(self + 0x7c);
    *(unsigned int *)((char *)reg + 0xc) =
        (unsigned)(lo & 0x1ff) | ((unsigned)(hi << 16) & 0x01ff0000);
    return 1;
}
