/* func_02047e14: thunk — `func_02047d74(a, b, &func_02047e2c, 2)`. */

extern int func_02047d74(int a, int b, void *fn, int d);
extern void func_02047e2c(void);

int func_02047e14(int a, int b, int unused, int d) {
    return func_02047d74(a, b, (void *)func_02047e2c, 2);
}
