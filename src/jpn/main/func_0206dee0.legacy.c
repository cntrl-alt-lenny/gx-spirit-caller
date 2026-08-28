/* func_0206dee0: three-guard chain — negative param0, then func_0206e430,
 * then func_0206e400 (this last guard succeeds by returning 1). */

extern int func_0206e430(int a0);
extern int func_0206e400(int a0);

int func_0206dee0(int param0) {
    if (param0 < 0) {
        goto ret0;
    }
    if (func_0206e430(param0) == 0) {
        goto ret0;
    }
    if (func_0206e400(param0) == 0) {
        return 1;
    }
ret0:
    return 0;
}
