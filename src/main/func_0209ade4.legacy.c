extern int func_0209b0b8(int a, unsigned short *out);

int func_0209ade4(int *p8, int *p4) {
    unsigned short status;
    int r;
    r = func_0209b0b8(0, &status);
    if (r != 0) {
        return r;
    }
    if (p8 != 0) {
        *p8 = (status & 8) ? 1 : 0;
    }
    if (p4 != 0) {
        *p4 = (status & 4) ? 1 : 0;
    }
    return r;
}

