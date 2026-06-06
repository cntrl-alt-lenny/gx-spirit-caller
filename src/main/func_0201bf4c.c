/* func_0201bf4c: tick GetSystemWork; query func_0201bea8 into a local struct;
 * return (local[2] || local[4]). */
extern void GetSystemWork(void);
extern void func_0201bea8(void *);
int func_0201bf4c(void){
    int local[8];
    GetSystemWork();
    func_0201bea8(local);
    return (local[2] != 0 || local[4] != 0) ? 1 : 0;
}
