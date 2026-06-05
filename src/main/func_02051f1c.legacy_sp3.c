/* func_02051f1c: tick func_02046888(), then clamp func_02062518()-519 to >=0.
 * SP3 tier (1.2/sp3). */
extern void func_02046888(void);
extern int func_02062518(void);
int func_02051f1c(void){
    int r;
    func_02046888();
    r = func_02062518() - 519;
    if (r <= 0) r = 0;
    return r;
}
