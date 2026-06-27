/* CAMPAIGN-PREP candidate for func_0204c04c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload-each-use; stride2 (<<1)+0xa4 halfword and stride4 (<<2)+0x24 int index; stack out+flag args
 *   risk:       orig pins FIVE separate func_020498f0() results in r7/r5/r6/r4/r0 simultaneously (mla bases r4+(n<<1), r5+(n<<2)) - a textbook reg-alloc wall already shipped as .s. mwcc will almost certainly CSE the identical accessor calls and use one base, collapsing the 5 reloads. Will NOT byte-match by C reshape (permuter-class; likely stays .s).
 *   confidence: low
 */
/* func_0204c04c - main - class C
 * heavy reg-alloc: 5 accessor reloads kept in distinct regs (r7,r5,r6,r4 +
 * r0) though all return the same base. Builds args for func_0204ead0(0xc,...):
 *   hw  = ((u16*)(base + ((base->f0d+1)<<1)))->fA4   [stride2 array +0xa4]
 *   val = ((int*)(base + ((base->f0d+1)<<2)))->f24   [stride4 array +0x24]
 *   plus r1 = base->f20 (from a separate reload). out slot at sp+8, flag 1.
 * Then clears [+0x17],[+0x20]; returns func_0204ead0 result.
 * Offsets per src/main/func_0204c04c.s (currently shipped as .s, reg-alloc wall).
 */
extern unsigned char *func_020498f0(void);
extern int func_0204ead0(int a0, int a1, int val, int hw, int *outp, int flag);

int func_0204c04c(void)
{
    int r;
    int out;
    int n;
    int hw;
    int val;

    r = 0;
    out = 0;
    if (func_020498f0()[0x17] == 0)
        return 0;
    if (*(int *)(func_020498f0() + 0x20) == 0)
        return 0;
    if (*(int *)(func_020498f0() + 0x20) == *(int *)(func_020498f0() + 0x200))
        return 0;

    n = func_020498f0()[0xd] + 1;
    hw = *(unsigned short *)(func_020498f0() + (n << 1) + 0xa4);
    val = *(int *)(func_020498f0() + (n << 2) + 0x24);
    r = func_0204ead0(0xc, 1, val, hw, &out, 1);
    func_020498f0()[0x17] = 0;
    *(int *)(func_020498f0() + 0x20) = 0;
    return r;
}
