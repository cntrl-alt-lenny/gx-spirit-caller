/* func_0205d504: run func_0205d560(a0, func_0205d534, &out{a1,0}, 0) with
 * func_0205d534 as the per-item callback; return out[1]. SP3 tier (1.2/sp3). */
extern void func_0205d534(void);
extern void func_0205d560(int, void *, int *, int);
int func_0205d504(int a0, int a1){
    int local[2];
    local[0] = a1;
    local[1] = 0;
    func_0205d560(a0, (void *)func_0205d534, local, 0);
    return local[1];
}
