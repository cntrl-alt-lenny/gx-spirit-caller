/* func_02089d10: if func_02088f3c(obj0) is nonzero, returns it
 * immediately. Otherwise picks a context (0 if !flag, else
 * func_02089308()), registers via func_02089e78(obj0, &func_02089aec,
 * ctx, obj0, obj1), and if flag and the result are both nonzero,
 * notifies func_02088f20(obj0, result). Returns the result.
 */
extern unsigned int func_02088f3c(unsigned int a0);
extern void *func_02089308(void);
extern int func_02089e78(int a0, void *fn, void *a2, int a3, int a4);
extern void func_02088f20(int a0, int a1);
extern void func_02089aec(int, int, int, int);

int func_02089d10(int obj0, int obj1, int flag) {
    int result;
    void *ctx;

    result = func_02088f3c(obj0);
    if (result != 0) {
        goto end;
    }

    if (flag == 0) {
        ctx = 0;
    } else {
        ctx = func_02089308();
    }

    result = func_02089e78(obj0, (void *)func_02089aec, ctx, obj0, obj1);

    if (flag != 0 && result != 0) {
        func_02088f20(obj0, result);
    }

end:
    return result;
}
