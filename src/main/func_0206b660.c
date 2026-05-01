/* func_0206b660: thunk — `func_02054140(*(int *)(p + 0x4))`. */

extern int func_02054140(int v);

int func_0206b660(int *p) {
    return func_02054140(*(int *)((char *)p + 0x4));
}
