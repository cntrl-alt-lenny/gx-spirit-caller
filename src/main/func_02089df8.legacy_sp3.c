/* func_02089df8: if func_02089024(obj0) is nonzero, returns it
 * immediately. Otherwise picks a context (0 if !flag, else
 * func_020893f0()), registers via func_02089f60(obj0, &func_02089bd4,
 * ctx, obj0, obj1), and if flag and the result are both nonzero,
 * notifies func_02089008(obj0, result). Returns the result.
 */
extern unsigned int func_02089024(unsigned int a0);
extern void *func_020893f0(void);
extern int func_02089f60(int a0, void *fn, void *a2, int a3, int a4);
extern void func_02089008(int a0, int a1);
extern void func_02089bd4(int, int, int, int);

int func_02089df8(int obj0, int obj1, int flag) {
    int result;
    void *ctx;

    result = func_02089024(obj0);
    if (result != 0) {
        goto end;
    }

    if (flag == 0) {
        ctx = 0;
    } else {
        ctx = func_020893f0();
    }

    result = func_02089f60(obj0, (void *)func_02089bd4, ctx, obj0, obj1);

    if (flag != 0 && result != 0) {
        func_02089008(obj0, result);
    }

end:
    return result;
}
