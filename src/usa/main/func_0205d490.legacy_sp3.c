/* func_0205d490: run func_0205d4ec(a0, func_0205d4c0, &out{a1,0}, 0) with
 * func_0205d4c0 as the per-item callback; return out[1]. SP3 tier (1.2/sp3). */
extern void func_0205d4c0(void);
extern void func_0205d4ec(int, void *, int *, int);
int func_0205d490(int a0, int a1){
    int local[2];
    local[0] = a1;
    local[1] = 0;
    func_0205d4ec(a0, (void *)func_0205d4c0, local, 0);
    return local[1];
}
