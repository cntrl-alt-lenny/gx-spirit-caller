extern unsigned int func_0206e174(void);

unsigned int func_0206eb08(void) {
    unsigned int v = func_0206e174();

    return ((v >> 24) & 0xff) | ((v >> 8) & 0xff00) | ((v << 8) & 0xff0000) | ((v << 24) & 0xff000000);
}
