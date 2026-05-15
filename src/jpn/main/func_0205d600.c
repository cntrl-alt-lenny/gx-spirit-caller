/* func_0205d600: thunk — `func_02054454(*(int *)(*p + 0x428))`. */

extern int func_02054454(int v);

int func_0205d600(int **p) {
    return func_02054454(*(int *)((char *)*p + 0x428));
}
