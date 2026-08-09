/* func_020a68e0: builds a 256-entry CRC-style table in `table` using the
 * given polynomial -- for each byte value 0..0xff, shift left 8 times,
 * XOR-ing in `poly` whenever the high bit was set before the shift.
 */
void func_020a68e0(unsigned char *table, int poly) {
    unsigned int v;
    unsigned int outer;

    for (outer = 0; outer < 0x100; outer++) {
        unsigned int bit;
        v = outer;

        for (bit = 0; bit < 8; bit++) {
            if (v & 0x80) {
                v = (v << 1) ^ poly;
            } else {
                v = v << 1;
            }
        }

        table[outer] = (unsigned char)v;
    }
}
