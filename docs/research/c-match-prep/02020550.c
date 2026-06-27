/* CAMPAIGN-PREP candidate for func_02020550 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: u16 wrap `(unsigned short)(n+1)` -> lsl;lsr; tst r0,1<<(n-1); u16 return widen
 *   risk:       reshape-able: the do/while-after-if structure must match `tst;bne .L_140` skip then loop. If mwcc reshapes the leading test, restructure as `for(; n<=0x10; n=(u16)(n+1))`. `1<<(n-1)` must stay `r2,lsl r1` (keep m as first tst operand).
 *   confidence: med
 */
/* func_02020550 (class D): bit-scan loop with u16 index wrap.
 *   r4=arg; m=func_0209e4f8();
 *   if(m==0x8000){ func_0201f19c(3); func_0201f138(9); return 3; }
 *   if(m==0){ func_0201f19c(0x16); func_0201f138(9); return 0x18; }
 *   if( !(m & (1<<(r4-1))) ) {
 *     do { r4=(u16)(r4+1); if(r4>0x10) return 0x18; } while( !(m & (1<<(r4-1))) );
 *   }
 *   r = (u16)func_020206b8(&func_020205ec, r4); return r;
 */
extern int  func_0209e4f8(void);
extern void func_0201f19c(int);
extern void func_0201f138(int);
extern int  func_020205ec(void);
extern int  func_020206b8(void (*cb)(void), int idx);

int func_02020550(int n) {
    int m = func_0209e4f8();
    if (m == 0x8000) {
        func_0201f19c(3);
        func_0201f138(9);
        return 3;
    }
    if (m == 0) {
        func_0201f19c(0x16);
        func_0201f138(9);
        return 0x18;
    }
    if (!(m & (1 << (n - 1)))) {
        do {
            n = (unsigned short)(n + 1);
            if (n > 0x10) return 0x18;
        } while (!(m & (1 << (n - 1))));
    }
    return (unsigned short)func_020206b8(func_020205ec, n);
}
