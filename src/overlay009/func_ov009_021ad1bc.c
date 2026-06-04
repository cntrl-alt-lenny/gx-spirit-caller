/* func_ov009_021ad1bc: test whether slot `a`'s ready-bit is set in the global
 * mask at data_02105f4c[0x864]. Resolves the slot index via func_0202b6cc, but
 * short-circuits to 1 when func_0202bb20 reports the slot busy. (ov009_core.h) */
extern int func_0202b6cc(int);
extern int func_0202bb20(int);
extern char data_02105f4c[];
int func_ov009_021ad1bc(int dummy, int a) {
    int n = func_0202b6cc(a);
    if (func_0202bb20(a) != 0)
        return 1;
    return ((1 << (n - 1)) & *(int *)(data_02105f4c + 0x864)) != 0;
}
