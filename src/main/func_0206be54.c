/* func_0206be54: thunk — `func_0206be64(*(int *)(p + 0x64))`. */

extern int func_0206be64(int v);

int func_0206be54(int *p) {
    return func_0206be64(*(int *)((char *)p + 0x64));
}
