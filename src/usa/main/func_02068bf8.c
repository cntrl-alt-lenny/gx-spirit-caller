/* func_02068bf8: thunk — `func_02045364(*(int *)(p + 0x0))`. */

extern int func_02045364(int v);

int func_02068bf8(int *p) {
    return func_02045364(*(int *)((char *)p + 0x0));
}
