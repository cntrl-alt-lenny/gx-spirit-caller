extern void func_0202b360(void *, unsigned int *);

int func_0202b3d4(void *arg0, int arg1) {
    unsigned int local[2];
    int idx;
    func_0202b360(arg0, local);
    idx = arg1 / 32;
    return (local[idx] >> (arg1 & 0x1f)) & 1;
}
