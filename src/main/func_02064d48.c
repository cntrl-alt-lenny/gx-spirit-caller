/* func_02064d48: thunk — `func_02061f20(*(int *)(p + 0x0))`. */

extern int func_02061f20(int v);

int func_02064d48(int *p) {
    return func_02061f20(*(int *)((char *)p + 0x0));
}
