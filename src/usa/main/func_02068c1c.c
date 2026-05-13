/* func_02068c1c: thunk — `func_02068554(*(int *)(p + 0x0))`. */

extern int func_02068554(int v);

int func_02068c1c(int *p) {
    return func_02068554(*(int *)((char *)p + 0x0));
}
