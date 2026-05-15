/* func_0206cc88: thunk — `func_0206cc48(*(int *)(p + 0x4))`. */

extern int func_0206cc48(int v);

int func_0206cc88(int *p) {
    return func_0206cc48(*(int *)((char *)p + 0x4));
}
