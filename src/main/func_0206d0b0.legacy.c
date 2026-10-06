extern int func_0206ceb8(char *s, int a, int b, int c, int d);
extern int func_0206cfa0(void *a, int b, int c, unsigned short *d, int *e);

int func_0206d0b0(char *s, int a, int b, int c, int d, int flags) {
    int r;

    if (*(signed char *)(s + 0x73) == 4) {
        return func_0206ceb8(s, a, b, c, d);
    }
    r = func_0206cfa0(s, a, b, (unsigned short *)c, (int *)d);
    if (r != -6) {
        return r;
    }
    if (!(flags & 1)) {
        return r;
    }
    return func_0206ceb8(s, a, b, c, d);
}
