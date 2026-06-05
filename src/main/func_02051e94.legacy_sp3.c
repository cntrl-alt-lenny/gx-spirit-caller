/* func_02051e94: r = func_02051e38(); if !r return 0; func_0204c1e0(r); return 1.
 * SP3 tier (1.2/sp3). */
extern int func_02051e38(void);
extern void func_0204c1e0(int);
int func_02051e94(void){
    int r = func_02051e38();
    if (!r) return 0;
    func_0204c1e0(r);
    return 1;
}
