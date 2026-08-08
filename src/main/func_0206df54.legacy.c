/* func_0206df54: three-guard chain — negative param0, then func_0206e4a4,
 * then func_0206e474 (this last guard succeeds by returning 1). */

extern int func_0206e4a4(int a0);
extern int func_0206e474(int a0);

int func_0206df54(int param0) {
    if (param0 < 0) {
        goto ret0;
    }
    if (func_0206e4a4(param0) == 0) {
        goto ret0;
    }
    if (func_0206e474(param0) == 0) {
        return 1;
    }
ret0:
    return 0;
}
