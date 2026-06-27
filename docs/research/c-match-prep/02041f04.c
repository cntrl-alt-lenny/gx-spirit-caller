/* CAMPAIGN-PREP candidate for func_02041f04 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: store ip=0 to base[0xc0c] before calls; if/else explicit global store both arms
 *   risk:       struct-guessed: func_02091d24 arg packing — orig sets r1=func_02041978, r2=self, r3=self+0x1000, stack[0]=0x1000, stack[4]=arg. My param order/types are inferred; the r1 vs stack mapping of the callback may be wrong.
 *   confidence: low
 */
/* func_02041f04 - main - class C/D
 * cond store to global + struct base; ip=0 stored to base[0xc0c] first
 * r5=self, r4=arg1 (passed on stack to func_02091d24)
 */
extern int data_0219d9ec;
extern void func_02041978(void);             /* _LIT4 callback ptr */
extern void func_020919d8(void *p);
extern int  func_02091ae0(void *p);
extern void func_02091d24(void *p, int cap, void *self, void *base, int hw, int arg);
extern void func_02092844(void *p);

void func_02041f04(int self, int arg)
{
    *(int *)(self + 0x1c0c) = 0;
    func_02092844((void *)(self + 0x1bf4));
    func_02092844((void *)(self + 0x1a14));
    if (*(int *)(self + 0x1018) == 1)
        data_0219d9ec = 1;
    else
        data_0219d9ec = 0;
    if (*(int *)(self + 0x1ba0) != 0) {
        if (func_02091ae0((void *)(self + 0x1b34)) == 0)
            return;
    }
    func_02091d24((void *)(self + 0x1b34), 0x1000, (void *)self,
                  (void *)(self + 0x1000), (int)&func_02041978, arg);
    func_020919d8((void *)(self + 0x1b34));
}
