/* func_02087ed4: thunk — `func_02087918(*(int *)(p + 0x0))`. */

extern int func_02087918(int v);

int func_02087ed4(int *p) {
    return func_02087918(*(int *)((char *)p + 0x0));
}
