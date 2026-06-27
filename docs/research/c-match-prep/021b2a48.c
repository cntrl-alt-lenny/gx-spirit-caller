/* CAMPAIGN-PREP candidate for func_021b2a48 (ov019, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: a5/32 as plain signed '/'; hoist hi-pack before loop; orr-operand order accumulator-first; decl w,hh,n first.
 *   risk:       permuter-class: 10 callee-saved live (a1,a3,a4,n,i,hi + const 2 + fp=0) — whole-function register rotation across r3..fp likely diverges; mwcc may not keep const 2 / fp=0 parked in regs across the call.
 *   confidence: low
 */
// func_ov019_021b2a48 : counted loop, bit-packs a 6-byte stack struct, two calls per iter
// args: r0=arg1(base coord), r1=arg2(byte), r2=arg3, r3=arg4, [sp,#0x30]=arg5(count*32)
extern int func_02005dac(int a, int b, int *w, short *h);
extern int func_020944a4(int *src, int handle, int len);

void func_ov019_021b2a48(int a1, int a2, int a3, int a4, int a5)
{
    int w[1];
    short hh[1];
    int n = a5 / 32;            // signed div by 32 (orig: (x + ((x>>4)>>>27)) >> 5)
    int i;
    int hi;

    if (n <= 0) return;

    hi = (a2 & 0xff) | 0x4000 | (int)0x80000000;   // r7, hoisted
    for (i = 0; i < n; i++) {
        int r;
        w[0]  = hi | (((unsigned)(a1 << 23)) >> 7);     // r7 | ((a1 & 0x1ff)<<16)
        hh[0] = (short)((a3 | 0x800) | (a4 << 12));
        r = func_02005dac(2, 0, w, hh);
        func_020944a4(w, r, 6);
        a1 += 0x20;
        a3 += 2;
    }
}
