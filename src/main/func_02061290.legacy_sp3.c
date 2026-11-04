int func_02061290(unsigned char *s) {
    int state = 0;
    int i;
    for (i = 1; i < 32; i++) {
        state = state ^ ((i ^ s[i - 1]) & 1) ^ (s[0] & 1) ^
            ((unsigned int)s[0] < 0x4f ? 1 : 0) ^
            ((unsigned int)s[i - 1] < (unsigned int)s[0] ? 1 : 0);
        if ((state != 0 && (s[i] & 1) == 0) ||
            (state == 0 && (s[i] & 1) == 1)) {
            return 0;
        }
    }
    return 1;
}

