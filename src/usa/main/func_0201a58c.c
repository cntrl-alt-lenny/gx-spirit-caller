extern int func_020097b8(int);

int func_0201a58c(void) {
    int i;
    unsigned int mask = 0;
    for (i = 0; i < 0x1a; i++) {
        if (func_020097b8(i + 1) >= 0x50) {
            mask |= 1u << i;
        }
    }
    return mask;
}
