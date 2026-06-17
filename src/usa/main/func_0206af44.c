/* func_0206af44: func_020a7274(*a0, a1); then advance both *a3 and *a0 by a2. */
extern void func_020a7274(int, int);
void func_0206af44(int *a0, int a1, int a2, int *a3){
    func_020a7274(*a0, a1);
    *a3 += a2;
    *a0 += a2;
}
