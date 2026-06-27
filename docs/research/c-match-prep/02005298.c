/* CAMPAIGN-PREP candidate for func_02005298 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     single load t=a->f_24; (t<<k)>>28 unsigned -> lsl;lsr; precompute hi held across call
 *   risk:       orig computes hi=(t<<11)>>28 BEFORE the first call and keeps it in callee-saved r4 across two calls; mwcc may recompute or spill hi, and store-order to data_02102c7c (0x4 then 0x8) must follow asm — reshape-able (hoist hi, keep store order); reg-pressure across 7 saves could go permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02005298 (main, class C/D) — front-load.
 *   recipe: read t=a->f_24 ONCE; bitfield extracts (t<<7)>>28 / (t<<11)>>28 (unsigned)
 * a->f_24|=0x10000; data_02102c7c.f_10=1; .f_4=(t<<7)>>28; hi=(t<<11)>>28 (held r4);
 * func_02001ef4(a,0,0); ef4(a,b,c,d+1,e+1,f,func_02003400);
 * data_02102c7c.f_10=0; .f_8=hi; func_02001ef4(a,1,1); ef4(a,b,c,d,e,f,func_02003400).
 */
extern char data_02102c7c[];
extern void func_02001ef4(void *p, int x, int y);
extern int func_02003400(void);
extern int func_02004ef4(int a, int b, int c, int d, int e, int f, void *fn);

void func_02005298(void *a, int b, int c, int d, int e, int f) {
    unsigned int t = *(unsigned int *)((char *)a + 0x24);
    int hi;
    *(unsigned int *)((char *)a + 0x24) = t | 0x10000;
    *(int *)(data_02102c7c + 0x10) = 1;
    *(int *)(data_02102c7c + 0x4) = (t << 7) >> 28;
    hi = (t << 11) >> 28;
    func_02001ef4(a, 0, 0);
    func_02004ef4((int)a, b, c, d + 1, e + 1, f, func_02003400);
    *(int *)(data_02102c7c + 0x10) = 0;
    *(int *)(data_02102c7c + 0x8) = hi;
    func_02001ef4(a, 1, 1);
    func_02004ef4((int)a, b, c, d, e, f, func_02003400);
}
