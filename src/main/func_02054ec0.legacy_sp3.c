int func_02054ec0(unsigned int *addr) {
    unsigned int v = *addr;
    int a;
    int b;

    v = ((v >> 24) & 0xff) | ((v >> 8) & 0xff00) | ((v << 8) & 0xff0000) | ((v << 24) & 0xff000000);
    a = (v >> 24) & 0xff;
    b = (v >> 16) & 0xff;
    if (a == 10) {
        return 1;
    }
    if (a == 172 && b >= 16 && b <= 31) {
        return 1;
    }
    if (a == 192 && b == 168) {
        return 1;
    }
    return 0;
}
