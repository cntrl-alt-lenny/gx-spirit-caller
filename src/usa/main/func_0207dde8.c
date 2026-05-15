/* func_0207dde8: thunk — `func_0207d370(*(int *)(p + 0x4))`. */

extern int func_0207d370(int v);

int func_0207dde8(int *p) {
    return func_0207d370(*(int *)((char *)p + 0x4));
}
