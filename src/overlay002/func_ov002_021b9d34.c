/* func_ov002_021b9d34: gated threshold test — false unless func_02030ea4 (of
 * the current handle) is nonzero, func_ov002_021b9bd4 is non-negative, and that
 * value exceeds player (arg0&1)'s cf1a8 row-arg1 u16. */
extern int func_ov002_021b9ecc(int a, int b);
extern int func_02030ea4(int a);
extern int func_ov002_021b9bd4(int a, int b);
extern int data_ov002_022cf1a8[];
int func_ov002_021b9d34(int arg0, int arg1) {
    int t = func_02030ea4(func_ov002_021b9ecc(arg0, arg1));
    if (t != 0 && func_ov002_021b9bd4(arg0, arg1) >= 0)
        return t > (unsigned short)*(int *)((char *)data_ov002_022cf1a8 + (arg0 & 1) * 0x868 + arg1 * 20);
    return 0;
}
