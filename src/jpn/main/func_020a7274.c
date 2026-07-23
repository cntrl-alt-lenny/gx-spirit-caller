void *func_020a7274(void *dst, signed char *src, int count) {
    signed char *d = dst;
    if (count == 0) {
        return dst;
    }
    do {
        *d++ = *src++;
    } while (--count != 0);
    return dst;
}
