/* func_0207ded0: thunk — `func_0207d458(*(int *)(p + 0x4))`. */

extern int func_0207d458(int v);

int func_0207ded0(int *p) {
    return func_0207d458(*(int *)((char *)p + 0x4));
}
