void func_020a6858(unsigned short *table, unsigned int polynomial) {
    unsigned int value;
    unsigned int i;
    unsigned int bit;

    for (i = 0; i < 0x100; i++) {
        value = i;
        for (bit = 0; bit < 8; bit++) {
            if (value & 1)
                value = polynomial ^ (value >> 1);
            else
                value >>= 1;
        }
        table[i] = value;
    }
}
