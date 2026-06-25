/* CAMPAIGN-PREP candidate for func_0204b850 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign flag (movne r4,#0); stack-passed outptr+flag for func_0204ead0; u64 split store +1e8/+1ec
 *   risk:       func_0204ead0 takes 4 reg + 2 stack args; orig writes sp[0]=&out, sp[4]=flag, sp[8]=out. My extern signature forces that exact stack layout but mwcc's stack-arg ordering / the uninitialised-when-kind!=0xd 'out' slot may shift. Most likely divergence is the out/flag stack-slot assignment order (struct-guessed: confirm func_0204ead0 arity).
 *   confidence: low
 */
/* func_0204b850 - main - class C
 * stack-arg call: outvar at sp+8 (preloaded [+0x20c] iff a1==0xd, with flag
 * r4). Calls func_0204ead0(a1, a0, 0, 0) with stack {&out, flag}. If
 * func_0204d438()!=0 return 0; else store u64 from func_020930b0() at +0x1e8/+0x1ec; return 1.
 * Offsets per src/main/func_0204b850.s.
 */
extern unsigned char *func_020498f0(void);
extern void func_0204ead0(int a1, int a0, int z0, int z1, int *outp, int flag);
extern int  func_0204d438(void);
extern long long func_020930b0(void);

int func_0204b850(int a0, int a1)
{
    int kind;
    int base;
    int flag;
    int out;
    long long v;

    base = a0;
    kind = a1;
    if (kind == 0xd) {
        out = *(int *)(func_020498f0() + 0x20c);
        flag = 1;
    } else {
        flag = 0;
    }
    func_0204ead0(kind, base, 0, 0, &out, flag);
    if (func_0204d438() != 0)
        return 0;
    v = func_020930b0();
    *(int *)(func_020498f0() + 0x1e8) = (int)v;
    *(int *)(func_020498f0() + 0x1ec) = (int)(v >> 32);
    return 1;
}
