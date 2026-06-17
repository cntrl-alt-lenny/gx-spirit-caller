/* func_02062734: guarded-call chain — func_0206448c(a0) only if both
 * func_02062fc0(a0) and func_020644d0(a0) are non-zero. */
extern int func_02062fc0(int);
extern int func_020644d0(int);
extern void func_0206448c(int);
void func_02062734(int a0){
    if (!func_02062fc0(a0)) return;
    if (!func_020644d0(a0)) return;
    func_0206448c(a0);
}
