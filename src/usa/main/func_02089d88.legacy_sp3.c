extern int func_02088f3c(void);
extern int func_02089308(void);
extern int func_02089e78(void *a0, void *fn, int a2, void *a3, int a4);
extern void func_02088f20(void *a0, int a1);
extern int func_02089b24(void);

int func_02089d88(void *param0, int param1, int param2) {
    int result = func_02088f3c();
    if (result == 0) {
        int x;
        if (param2 != 0) {
            x = func_02089308();
        } else {
            x = 0;
        }
        result = func_02089e78(param0, (void *)func_02089b24, x, param0, param1);
        if (param2 != 0 && result != 0) {
            func_02088f20(param0, result);
        }
    }
    return result;
}
