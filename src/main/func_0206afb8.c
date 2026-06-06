/* func_0206afb8: func_020a7368(*a0, a1); then advance both *a3 and *a0 by a2. */
extern void func_020a7368(int, int);
void func_0206afb8(int *a0, int a1, int a2, int *a3){
    func_020a7368(*a0, a1);
    *a3 += a2;
    *a0 += a2;
}
