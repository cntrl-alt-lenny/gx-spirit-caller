int func_020a7440(unsigned char *p0, unsigned char *p1, int count) {
    while (count != 0) {
        if (*p0++ != *p1++) {
            return (p0[-1] < p1[-1]) ? -1 : 1;
        }
        count--;
    }
    return 0;
}
