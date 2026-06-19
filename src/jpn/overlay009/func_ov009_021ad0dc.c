/* func_ov009_021ad0dc: test whether slot `a`'s ready-bit is set in the global
 * mask at data_02105e6c[0x864]. Resolves the slot index via func_0202b678, but
 * short-circuits to 1 when func_0202bacc reports the slot busy. (ov009_core.h) */
extern int func_0202b678(int);
extern int func_0202bacc(int);
extern char data_02105e6c[];
int func_ov009_021ad0dc(int dummy, int a) {
    int n = func_0202b678(a);
    if (func_0202bacc(a) != 0)
        return 1;
    return ((1 << (n - 1)) & *(int *)(data_02105e6c + 0x864)) != 0;
}
