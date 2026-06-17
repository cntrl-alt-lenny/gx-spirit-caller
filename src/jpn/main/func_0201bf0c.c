/* func_0201bf0c: tick GetSystemWork; query func_0201be68 into a local struct;
 * return (local[2] || local[4]). */
extern void GetSystemWork(void);
extern void func_0201be68(void *);
int func_0201bf0c(void){
    int local[8];
    GetSystemWork();
    func_0201be68(local);
    return (local[2] != 0 || local[4] != 0) ? 1 : 0;
}
