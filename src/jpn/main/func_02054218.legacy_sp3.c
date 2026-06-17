/* func_02054218: r = func_0205405c(a0, a2); func_020a7274(r, a1, a0->f8). SP3 tier
 * (1.2/sp3). */
extern int func_0205405c(int *, int);
extern void func_020a7274(int, int, int);
void func_02054218(int *a0, int a1, int a2){
    int r = func_0205405c(a0, a2);
    func_020a7274(r, a1, a0[2]);
}
