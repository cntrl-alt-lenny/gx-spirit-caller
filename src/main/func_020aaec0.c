char *func_020aaec0(char *dst, const char *src, unsigned int n) {
    char *p = dst;
    if (n == 0) return dst;
    do {
        if ((*p++ = *src++) == 0) {
            if (--n == 0) return dst;
            do {
                *p++ = 0;
            } while (--n != 0);
            return dst;
        }
    } while (--n != 0);
    return dst;
}
