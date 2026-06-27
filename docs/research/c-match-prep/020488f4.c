/* CAMPAIGN-PREP candidate for func_020488f4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl v first (stack temp [sp]); n=func_02052f04 in r5; reload f4 per call; mvn -1 compare
 *   risk:       the two `cmp r5,#0; ble` re-test n>0 (orig keeps r5 live, branches twice) - my second `n>0 && v==-1` flattens it; if mwcc fuses the re-test or reorders the &v store vs cmp, control-flow blocks diverge. reshape-able (split the two if/ble exactly).
 *   confidence: low
 */
/* func_020488f4 - main - class C
 * guard chain, func_02052f04 result drives two branches, stack temp [sp]=0
 * _LIT0 = data_0219dc80 : global pointer to control struct
 */
typedef struct {
    int f0;
    int f4;             /* +0x4 : passed as a0 to two callees */
} Ctrl;

extern Ctrl *data_0219dc80;
extern int  func_02047804(void);
extern void func_02048108(void);
extern int  func_02052f04(int a, int b);
extern int  func_02055738(int s4, int n, int *outp);
extern int  func_020557b8(int s4, int x, int y);

int func_020488f4(int a0, int a1)
{
    int v;       /* [sp] local, init 0, becomes out-param of func_02055738 */

    v = 0;
    if (data_0219dc80 == 0)
        return 0;
    if (func_02047804() == 0)
        return 0;

    func_02048108();
    {
        int n = func_02052f04(0, a0);
        if (n > 0) {
            if (func_02055738(data_0219dc80->f4, n, &v) != 0)
                return 0;
        }
        if (n > 0 && v == -1)
            ;
        else
            return 0;
    }

    if (func_020557b8(data_0219dc80->f4, 0, a1) != 0)
        return 0;
    return 1;
}
