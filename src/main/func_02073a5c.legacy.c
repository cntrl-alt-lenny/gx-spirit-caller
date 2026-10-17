/* func_02073a5c: forward four arguments to func_02073ac0 (plus two zeros),
 * then, if the handle in data_0219ef20 is set and func_02091ae0 reports 0,
 * run func_020919d8 on it (the handle is re-read at each use). */
extern void *volatile data_0219ef20;
extern void func_02073ac0(int a, int b, int c, int d, int e, int f);
extern int func_02091ae0(void *h);
extern void func_020919d8(void *h);

void func_02073a5c(int a, int b, int c, int d) {
    func_02073ac0(a, b, c, d, 0, 0);
    if (data_0219ef20 == 0) {
        return;
    }
    if (func_02091ae0(data_0219ef20) == 0) {
        func_020919d8(data_0219ef20);
    }
}
