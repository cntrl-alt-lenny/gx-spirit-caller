extern int func_020b3870(int a, int b);
void func_ov015_021b2490(void *arg0, int arg1) {
    char *p = arg0;
    int span = *(short *)(p + 0x56) - *(short *)(p + 0x4e);
    int distance;
    *(int *)(p + 0x64) = arg1;
    if (!*(int *)(p + 0x64)) {
        *(int *)(p + 0xc) = 0;
        return;
    }
    if (*(int *)(p + 0x5c) == *(int *)(p + 0x60)) {
        *(int *)(p + 0xc) = 0;
        return;
    }
    distance = *(int *)(p + 0x5c) - *(int *)(p + 0x60);
    if (*(int *)(p + 0x64) >= distance * 2) {
        *(int *)(p + 0xc) = span;
        return;
    }
    *(int *)(p + 0xc) = func_020b3870(span * *(int *)(p + 0x64), distance * 2);
}
