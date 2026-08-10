/* func_0206205c: 4-way guard chain over the same (a0, a1) pair — the
 * first 3 calls only gate an early return-0, the 4th call's result is
 * the actual boolean return value. */

extern int func_020620d8(int a0, int a1);
extern int func_02062118(int a0, int a1);
extern int func_02062164(int a0, int a1);
extern int func_020621dc(int a0, int a1);

int func_0206205c(int a0, int a1)
{
    if (func_020621dc(a0, a1) == 0)
        return 0;
    if (func_020620d8(a0, a1) == 0)
        return 0;
    if (func_02062164(a0, a1) == 0)
        return 0;
    return func_02062118(a0, a1) != 0;
}
