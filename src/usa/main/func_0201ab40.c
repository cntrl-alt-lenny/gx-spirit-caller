/* func_0201ab40: tick GetSystemWork + func_02018f5c; range-map func_02018f4c()'s
 * result to {>=23:2, >=21:1, else 0}. */
extern void GetSystemWork(void);
extern int func_02018f4c(void);
extern void func_02018f5c(void);
int func_0201ab40(void){
    int v;
    GetSystemWork();
    v = func_02018f4c();
    func_02018f5c();
    if (v >= 23) return 2;
    if (v >= 21) return 1;
    return 0;
}
