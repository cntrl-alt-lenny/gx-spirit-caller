extern void func_0202b30c(void *, unsigned int *);

int func_0202b380(void *arg0, int arg1) {
    unsigned int local[2];
    int idx;
    func_0202b30c(arg0, local);
    idx = arg1 / 32;
    return (local[idx] >> (arg1 & 0x1f)) & 1;
}
