int func_02060fdc(const unsigned char *a, const unsigned char *b) {
    int i;
    for (i = 0; i < 0x20; i++) {
        if (i != 0 && i != 0xd) {
            if (a[i] != b[i]) return 0;
        }
    }
    return 1;
}
