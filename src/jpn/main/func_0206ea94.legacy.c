extern unsigned int func_0206e100(void);

unsigned int func_0206ea94(void) {
    unsigned int v = func_0206e100();

    return ((v >> 24) & 0xff) | ((v >> 8) & 0xff00) | ((v << 8) & 0xff0000) | ((v << 24) & 0xff000000);
}
