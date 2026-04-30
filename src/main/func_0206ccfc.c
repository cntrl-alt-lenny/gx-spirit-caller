/* func_0206ccfc: thunk — `func_0206ccbc(*(int *)(p + 0x4))`. */

extern int func_0206ccbc(int v);

int func_0206ccfc(int *p) {
    return func_0206ccbc(*(int *)((char *)p + 0x4));
}
