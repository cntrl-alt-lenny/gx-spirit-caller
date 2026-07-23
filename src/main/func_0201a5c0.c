extern int func_020097d4(int);

int func_0201a5c0(void) {
    int i;
    unsigned int mask = 0;
    for (i = 0; i < 0x1a; i++) {
        if (func_020097d4(i + 1) >= 0x50) {
            mask |= 1u << i;
        }
    }
    return mask;
}
