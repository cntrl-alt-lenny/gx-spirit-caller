extern char *data_021a9844;
extern void func_02094500(void *p, int val, int size);

void func_020a5c14(int a0) {
    char *base = data_021a9844;
    int idx;
    if (base == 0) {
        return;
    }
    idx = a0 - 1;
    func_02094500(base + (idx << 5), 0, 0x1e);
    base = data_021a9844;
    *(int *)(base + (idx << 2) + 0x1e0) = 0;
}
