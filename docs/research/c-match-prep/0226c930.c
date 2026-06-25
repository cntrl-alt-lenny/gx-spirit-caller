/* CAMPAIGN-PREP candidate for func_0226c930 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global-compare guard chain + 5-arg sink (stack arg) + if-value-map
 *   risk:       Reg-alloc: reusing arg1+arg2 in r3 and the arg0/1-arg0 shuffle order; ships as .s (reg-walled)
 *   confidence: low
 */
/* func_ov002_0226c930: guard then dispatch.
 *   if (arg0 != *(int*)(d016c+0xd94)) return 0;
 *   if (arg1+arg2 > 4)               return 0;
 *   r = func_ov002_021bf294(1-arg0, *(u16*)(d0e6c+0xa2), arg0, arg1+arg2, 1);
 *   return r ? 0x800 : 0;
 * The sum arg1+arg2 is computed for the >4 guard and REUSED as the 4th call
 * arg (it stays live in r3); the stack arg (1) is the 5th parameter. */
typedef unsigned short u16;
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern int func_ov002_021bf294(int a, int b, int c, int d, int e);
int func_ov002_0226c930(int arg0, int arg1, int arg2) {
    int sum;
    int r;
    if (arg0 != *(int *)(data_ov002_022d016c + 0xd94))
        return 0;
    sum = arg1 + arg2;
    if (sum > 4)
        return 0;
    r = func_ov002_021bf294(1 - arg0, *(u16 *)(data_ov002_022d0e6c + 0xa2),
                            arg0, sum, 1);
    if (r)
        return 0x800;
    return 0;
}
