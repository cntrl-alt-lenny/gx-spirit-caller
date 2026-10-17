extern int func_ov002_021b00d0(int n);

int func_ov002_0228cb48(int a, unsigned int mask) {
    int list[11];
    int i;
    int n;
    int shift;

    n = 0;
    shift = a * 16;
    for (i = 0; i <= 10; i++) {
        if (mask & (1 << shift)) {
            list[n] = i;
            n++;
        }
        shift++;
    }
    if (n <= 0) {
        return -1;
    }
    return list[func_ov002_021b00d0(n)];
}
