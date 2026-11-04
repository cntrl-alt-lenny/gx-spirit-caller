/* The callback wrapper is declared void in its own unit, but this caller uses its r0 result. */
extern int func_020a71e4(int a0, int a1, int a2);
extern int func_020aaddc(const char *s);

unsigned int func_020a7268(unsigned short *dst, const char *src, unsigned int size) {
    unsigned int used;
    int remaining = func_020aaddc(src);
    used = 0;
    int count;
    if (dst != 0) {
        for (; used < size; used++) {
            if (*src != 0) {
                count = func_020a71e4((int)dst++, (int)src, remaining);
                if (count > 0) {
                    src += count;
                    remaining -= count;
                } else {
                    return -1;
                }
            } else {
                *dst = 0;
                break;
            }
        }
    }
    return used;
}

