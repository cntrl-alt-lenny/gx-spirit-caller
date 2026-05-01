/* func_02047e88: thunk — `func_02047de8(a, b, &func_02047ea0, 2)`. */

extern int func_02047de8(int a, int b, void *fn, int d);
extern void func_02047ea0(void);

int func_02047e88(int a, int b, int unused, int d) {
    return func_02047de8(a, b, (void *)func_02047ea0, 2);
}
