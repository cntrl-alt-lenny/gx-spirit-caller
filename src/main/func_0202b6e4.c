extern int func_0202b6cc(int v);

int func_0202b6e4(int val, int *out, int max) {
    int i = 0xfa6;
    int n = 0;
    if (max == 0) {
        return -1;
    }
    do {
        if (val == func_0202b6cc(i)) {
            if (n >= max) {
                return -1;
            }
            out[n] = i;
            n++;
        }
        i++;
    } while (i < 0x1b80);
    if (n < max) {
        out[n] = 0;
    }
    return n;
}
