/* func_02087dec: thunk — `func_02087830(*(int *)(p + 0x0))`. */

extern int func_02087830(int v);

int func_02087dec(int *p) {
    return func_02087830(*(int *)((char *)p + 0x0));
}
