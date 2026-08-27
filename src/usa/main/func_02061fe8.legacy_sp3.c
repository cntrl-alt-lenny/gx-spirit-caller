/* func_02061fe8: 4-way guard chain over the same (a0, a1) pair — the
 * first 3 calls only gate an early return-0, the 4th call's result is
 * the actual boolean return value. */

extern int func_02062064(int a0, int a1);
extern int func_020620a4(int a0, int a1);
extern int func_020620f0(int a0, int a1);
extern int func_02062168(int a0, int a1);

int func_02061fe8(int a0, int a1)
{
    if (func_02062168(a0, a1) == 0)
        return 0;
    if (func_02062064(a0, a1) == 0)
        return 0;
    if (func_020620f0(a0, a1) == 0)
        return 0;
    return func_020620a4(a0, a1) != 0;
}
