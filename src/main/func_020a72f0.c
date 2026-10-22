/* The existing void definition discards the callback result; this caller uses r0. */
extern int func_020a724c(int a, int b);
extern char *func_020aaec0(char *dst, const char *src, unsigned int n);

unsigned int func_020a72f0(char *dst, const unsigned short *src, unsigned int size) {
    char *out;
    unsigned int used = 0;
    int count;
    int buf;
    if (dst == 0 || src == 0) return 0;
    do {
        if (*src == 0) {
            dst[used] = 0;
            break;
        }
        out = (char *)&buf;
        count = func_020a724c((int)out, *src++);
        if (used + count > size) break;
        func_020aaec0(dst + used, out, count);
        used += count;
    } while (used <= size);
    return used;
}








