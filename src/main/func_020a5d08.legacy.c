extern char *data_021a9924;
extern void func_020945f4(void *p, int val, int size);

void func_020a5d08(int a0) {
    char *base = data_021a9924;
    int idx;
    if (base == 0) {
        return;
    }
    idx = a0 - 1;
    func_020945f4(base + (idx << 5), 0, 0x1e);
    base = data_021a9924;
    *(int *)(base + (idx << 2) + 0x1e0) = 0;
}
