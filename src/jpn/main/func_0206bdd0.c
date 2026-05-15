/* func_0206bdd0: thunk — `func_0206bdf0(*(int *)(p + 0x68))`. */

extern int func_0206bdf0(int v);

int func_0206bdd0(int *p) {
    return func_0206bdf0(*(int *)((char *)p + 0x68));
}
