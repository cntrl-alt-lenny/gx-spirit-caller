/* func_02068c6c: thunk — `func_020453b4(*(int *)(p + 0x0))`. */

extern int func_020453b4(int v);

int func_02068c6c(int *p) {
    return func_020453b4(*(int *)((char *)p + 0x0));
}
