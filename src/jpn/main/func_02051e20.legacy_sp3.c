/* func_02051e20: r = func_02051dc4(); if !r return 0; func_0204c16c(r); return 1.
 * SP3 tier (1.2/sp3). */
extern int func_02051dc4(void);
extern void func_0204c16c(int);
int func_02051e20(void){
    int r = func_02051dc4();
    if (!r) return 0;
    func_0204c16c(r);
    return 1;
}
