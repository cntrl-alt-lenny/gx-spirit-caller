/* CAMPAIGN-PREP candidate for func_0204918c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind g->f18 to r4 across call; mla stride 0xc inline after func_02048108
 *   risk:       r4 must survive func_02048108() then feed mla — bind is right; but the (r==0)->0 / (r==-1)->0 dual exit may compile as one (r<=0?) compare instead of two cmp branches. reshape-able by ordering the two if's exactly as cmp#0 then cmp#-1.
 *   confidence: med
 */
/* func_0204918c (main, class C). g = *data_0219dc80.
 * base = g->f18; if base==0 return 0. func_02048108();
 * r = func_02052f04(base + a*0xc); if r==0 return 0;
 * if r != -1 return r; else return 0. */

typedef struct State0204918c {
    char  _pad0[0x18];
    int   f18;          /* +0x18 record array base */
} State0204918c;

extern State0204918c *data_0219dc80;
extern void func_02048108(void);
extern int  func_02052f04(int rec);

int func_0204918c(int a) {
    int base = data_0219dc80->f18;
    if (base == 0) return 0;
    func_02048108();
    {
        int r = func_02052f04(base + a * 0xc);
        if (r == 0) return 0;
        if (r != -1) return r;
        return 0;
    }
}
