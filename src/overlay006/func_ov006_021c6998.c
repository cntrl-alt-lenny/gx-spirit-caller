/* CAMPAIGN-PREP candidate for func_021c6998 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base in r4; movne/moveq mode select; orr/bic on call result
 *   risk:       mode select: orig uses movne r0,#1 then a fresh cmp+movne/moveq #2/#0 (not a clean if/elseif). if mwcc lays it as nested branches the cmp/mov pattern shifts. reshape-able (else-if order already matches the cmpne cascade).
 *   confidence: med
 */
/* func_ov006_021c6998: if active (+8), service the +0x14 latch by pushing a mode
   derived from +0xc/+0x10, run the per-frame chain, optionally fire +0x800, then
   set/clear bit2 of a status word via +0x10; return 0. */
extern int  data_02104bac;                  /* status block; +0x54 halfword */
extern void func_02022234(int a, int b);
extern int  func_0202224c(int a);
extern void func_0202cc8c(int mode);
extern int  func_0202cca4(int a);
extern int  func_0202cdf8(void);
extern void func_0202ce24(void);
extern void func_0202d9a0(void);
int func_ov006_021c6998(char *base) {
    if (*(int *)(base + 0x8)) {
        if (*(int *)(base + 0x14)) {
            int mode;
            if (*(int *)(base + 0xc)) mode = 1;
            else if (*(int *)(base + 0x10)) mode = 2;
            else mode = 0;
            func_0202cc8c(mode);
            *(int *)(base + 0x14) = 0;
        }
        func_0202cca4(*(int *)(base + 0x4));
        if (func_0202cdf8()) {
            if (*(unsigned short *)((char *)&data_02104bac + 0x54) & 0x800)
                func_0202ce24();
        }
        func_0202d9a0();
        {
            int r = func_0202224c(0);
            int v;
            if (*(int *)(base + 0x10)) v = r | 4;
            else v = r & ~4;
            func_02022234(0, v);
        }
    }
    return 0;
}
