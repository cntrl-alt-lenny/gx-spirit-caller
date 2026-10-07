int func_02097154(const unsigned char *a, const unsigned char *b, unsigned int n) {
    unsigned int i;
    for (i = 0; i < n; i++) {
        unsigned int c1 = a[i] - 'A';
        unsigned int c2 = b[i] - 'A';
        if (c1 <= 'Z' - 'A') {
            c1 += 0x20;
        }
        if (c2 <= 'Z' - 'A') {
            c2 += 0x20;
        }
        if (c1 != c2) {
            return c1 - c2;
        }
    }
    return 0;
}
