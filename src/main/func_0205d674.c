/* func_0205d674: thunk — `func_020544c8(*(int *)(*p + 0x428))`. */

extern int func_020544c8(int v);

int func_0205d674(int **p) {
    return func_020544c8(*(int *)((char *)*p + 0x428));
}
