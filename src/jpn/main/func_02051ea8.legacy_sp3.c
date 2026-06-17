/* func_02051ea8: tick func_0204681c(), then clamp func_020624a4()-519 to >=0.
 * SP3 tier (1.2/sp3). */
extern void func_0204681c(void);
extern int func_020624a4(void);
int func_02051ea8(void){
    int r;
    func_0204681c();
    r = func_020624a4() - 519;
    if (r <= 0) r = 0;
    return r;
}
