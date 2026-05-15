/* func_0206bde0: thunk — `func_0206bdf0(*(int *)(p + 0x64))`. */

extern int func_0206bdf0(int v);

int func_0206bde0(int *p) {
    return func_0206bdf0(*(int *)((char *)p + 0x64));
}
