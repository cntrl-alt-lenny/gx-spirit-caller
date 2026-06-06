/* func_0201ab80: tick GetSystemWork + func_02018f90; range-map func_02018f80()'s
 * result to {>=23:2, >=21:1, else 0}. */
extern void GetSystemWork(void);
extern int func_02018f80(void);
extern void func_02018f90(void);
int func_0201ab80(void){
    int v;
    GetSystemWork();
    v = func_02018f80();
    func_02018f90();
    if (v >= 23) return 2;
    if (v >= 21) return 1;
    return 0;
}
