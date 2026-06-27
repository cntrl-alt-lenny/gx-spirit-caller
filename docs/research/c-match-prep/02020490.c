/* CAMPAIGN-PREP candidate for func_02020490 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     LCG seed add-chain, mul by const, store-order halfwords, tail switch
 *   risk:       orig add-chain is ((u16a + *0x027ffc3c) folded into r0, then +u16b, then u16c+acc) with operand-order add r1,r2,r1 (c first). mwcc may reassociate the three adds / pick a different accumulator reg -> add operand order flips. Also 0x10dcd*x+0x3039 split as +0x39 then +0x3000. reshape-able (operand-order) + struct-guessed
 *   confidence: low
 */
/* func_02020490: reseed RNG field and kick a transition.
 * func_02093a20(&tmp) fills three u16 (tmp0,tmp2,tmp4). seed =
 * ((u16)tmp0 + *(int*)0x027ffc3c) + (u16)tmp2 + (u16)tmp4;
 * f34 = seed*0x10dcd + 0x3039; fc=0; f8=0x65; func_0201f138(3);
 * branch on func_02020550(1): 0x18 -> teardown ret0; 2 -> ret1; else ret0.
 */
struct Tmp { unsigned short f0, f2, f4; };
struct Ctl { char pad0[8]; unsigned short f8; char padA[0xc-0xa]; unsigned short fc; char padE[0x34-0xe]; int f34; };
extern struct Ctl data_02191f40;
extern void func_02093a20(void *p);
extern void func_0201f138(int);
extern void func_0201f19c(int);
extern int  func_02020550(int);

int func_02020490(void)
{
    struct Tmp t;
    int seed;
    int r;
    func_02093a20(&t);
    seed = ((int)t.f0 + *(int *)0x027ffc3c) + (int)t.f2;
    seed = (int)t.f4 + seed;
    data_02191f40.f34 = seed * 0x10dcd + 0x3039;
    data_02191f40.fc = 0;
    data_02191f40.f8 = 0x65;
    func_0201f138(3);
    r = func_02020550(1);
    if (r == 0x18) {
        func_0201f19c(0x18);
        func_0201f138(9);
        return 0;
    }
    if (r == 2) return 1;
    func_0201f19c(r);
    func_0201f138(9);
    return 0;
}
