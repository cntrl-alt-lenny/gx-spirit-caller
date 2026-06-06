/* func_0205428c: r = func_020540d0(a0, a2); func_020a7368(r, a1, a0->f8). SP3 tier
 * (1.2/sp3). */
extern int func_020540d0(int *, int);
extern void func_020a7368(int, int, int);
void func_0205428c(int *a0, int a1, int a2){
    int r = func_020540d0(a0, a2);
    func_020a7368(r, a1, a0[2]);
}
