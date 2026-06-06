/* func_020627a8: guarded-call chain — func_02064500(a0) only if both
 * func_02063034(a0) and func_02064544(a0) are non-zero. */
extern int func_02063034(int);
extern int func_02064544(int);
extern void func_02064500(int);
void func_020627a8(int a0){
    if (!func_02063034(a0)) return;
    if (!func_02064544(a0)) return;
    func_02064500(a0);
}
