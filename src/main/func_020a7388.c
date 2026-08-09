signed char *func_020a7388(signed char *dst, signed char *src, int n) {
    signed char *d;
    if (src < dst) {
        goto backward;
    }
    d = dst;
    if (n == 0) {
        return dst;
    }
    do {
        *d++ = *src++;
    } while (--n != 0);
    return dst;
backward:
    {
        signed char *s = src + n;
        d = dst + n;
        if (n == 0) {
            return dst;
        }
        do {
            *--d = *--s;
        } while (--n != 0);
    }
    return dst;
}
