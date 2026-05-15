/* func_0206b5ec: thunk — `func_020540cc(*(int *)(p + 0x4))`. */

extern int func_020540cc(int v);

int func_0206b5ec(int *p) {
    return func_020540cc(*(int *)((char *)p + 0x4));
}
