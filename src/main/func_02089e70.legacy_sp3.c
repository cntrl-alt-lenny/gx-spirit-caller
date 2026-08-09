extern int func_02089024(void);
extern int func_020893f0(void);
extern int func_02089f60(void *a0, void *fn, int a2, void *a3, int a4);
extern void func_02089008(void *a0, int a1);
extern int func_02089c0c(void);

int func_02089e70(void *param0, int param1, int param2) {
    int result = func_02089024();
    if (result == 0) {
        int x;
        if (param2 != 0) {
            x = func_020893f0();
        } else {
            x = 0;
        }
        result = func_02089f60(param0, (void *)func_02089c0c, x, param0, param1);
        if (param2 != 0 && result != 0) {
            func_02089008(param0, result);
        }
    }
    return result;
}
