/* func_02064cd4: thunk — `func_02061eac(*(int *)(p + 0x0))`. */

extern int func_02061eac(int v);

int func_02064cd4(int *p) {
    return func_02061eac(*(int *)((char *)p + 0x0));
}
