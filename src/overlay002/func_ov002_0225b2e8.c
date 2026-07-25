/* func_ov002_0225b2e8: gate on a != cd3f4[0] and (arg1+arg2) <= 4, then call
 * 021bf294(cd3f4[0], cd3f4.f1c, a, arg1+arg2, 1); return 0x800 if nonzero. */

extern char data_ov002_022cd3f4[];
extern int func_ov002_021bf294(int a, int b, int c, int d, int e);

int func_ov002_0225b2e8(int a, int arg1, int arg2)
{
    int g0 = *(int *)(data_ov002_022cd3f4 + 0x0);
    int sum;

    if (a == g0)
        goto ret0;
    sum = arg1 + arg2;
    if (sum > 4)
        goto ret0;
    if (func_ov002_021bf294(g0, *(int *)(data_ov002_022cd3f4 + 0x1c), a, sum, 1) != 0)
        return 0x800;
ret0:
    return 0;
}
