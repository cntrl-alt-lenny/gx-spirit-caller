void func_020a67cc(unsigned int *table, unsigned int poly) {
    unsigned int v;
    unsigned int outer;
    for (outer = 0; outer < 0x100; outer++) {
        unsigned int bit;
        v = outer;
        for (bit = 0; bit < 8; bit++) {
            if (v & 1) {
                v = (v >> 1) ^ poly;
            } else {
                v = v >> 1;
            }
        }
        table[outer] = v;
    }
}
