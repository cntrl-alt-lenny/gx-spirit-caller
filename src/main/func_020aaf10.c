char *func_020aaf10(char *dst, const char *src) {
    char *p = dst;
    while (*p++) {}
    p--;
    while ((*p++ = *src++) != 0) {}
    return dst;
}
