unsigned short *func_020aee58(unsigned short *dst, const unsigned short *src) {
    volatile unsigned short *p = dst;
    while ((*p++ = *src++) != 0) {
    }
    return dst;
}
