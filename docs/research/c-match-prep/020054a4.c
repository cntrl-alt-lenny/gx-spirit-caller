/* CAMPAIGN-PREP candidate for func_020054a4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     local 0x40 buf; stmia sp,{0,b,fn} stack-arg block; return buf field +8
 *   risk:       orig packs the 3 stacked args (0, b, func_02003b14) with one stmia sp,{r2,r4,ip}; if mwcc emits 3 separate str the block diverges — reshape-able (args already adjacent/in order). buf[2]=offset 8 return slot struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020054a4 (main, class C/D) — front-load.
 *   recipe: 0x40 local buf; init via func_02001d0c; stmia-pack 3 stack args (store-order)
 * func_02001d0c(buf,0x80,2); ef4(buf,a,0,0, 0,b,func_02003b14); return buf[2] (off +8).
 */
extern void func_02001d0c(void *buf, int n, int m);
extern int func_02003b14(void);
extern int func_02004ef4(int a, int b, int c, int d, int e, int f, void *fn);

int func_020054a4(int a, int b) {
    int buf[16];
    func_02001d0c(buf, 0x80, 2);
    func_02004ef4((int)buf, a, 0, 0, 0, b, func_02003b14);
    return buf[2];
}
