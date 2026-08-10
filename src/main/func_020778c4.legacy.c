int func_020778c4(unsigned char *table, int kind) {
    unsigned int a;
    int b, c, d;
    int r4;

    a = table[0] * 10 + table[1] - 0x210;
    table += 2;

    if (kind == 23) {
        if (a < 50) {
            r4 = a + 0x7d0;
        } else {
            r4 = a + 0x76c;
        }
    } else {
        b = table[0] * 10 + table[1] - 0x210;
        table += 2;
        r4 = a * 100 + b;
    }

    {
        int partial;
        c = table[0] * 10 + table[1] - 0x210;
        partial = (r4 << 16) + (c << 8);
        d = table[2] * 10 + table[3] - 0x210;
        return partial + d;
    }
}
