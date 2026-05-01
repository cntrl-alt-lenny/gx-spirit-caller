/* func_02068594: thunk — `func_020685c8(*(int *)(p + 0x0))`. */

extern int func_020685c8(int v);

int func_02068594(int *p) {
    return func_020685c8(*(int *)((char *)p + 0x0));
}
