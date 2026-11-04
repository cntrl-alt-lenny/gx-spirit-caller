extern int func_0206ceb8(char *s, int a, int b, unsigned short *port, unsigned int *addr);
extern int func_0206cfa0(void *a, int b, int c, unsigned short *d, unsigned int *e);

int func_0206d0b0(char *s, int a, int b, unsigned short *port, unsigned int *addr, int flags) {
    int r;

    if (*(signed char *)(s + 0x73) == 4) {
        return func_0206ceb8(s, a, b, port, addr);
    }
    r = func_0206cfa0(s, a, b, port, addr);
    if (r != -6) {
        return r;
    }
    if (!(flags & 1)) {
        return r;
    }
    return func_0206ceb8(s, a, b, port, addr);
}
