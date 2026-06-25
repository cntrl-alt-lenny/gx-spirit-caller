/* CAMPAIGN-PREP candidate for func_020054f0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     local 0x40 buf; init+sub-init; stmia sp,{0,b} + str fn; return buf field +8
 *   risk:       orig uses stmia sp,{r2,r5} for first two stack words then a separate str for fn at sp+8; if mwcc fuses all three or reorders the str the stack-store sequence diverges — reshape-able (write 0,b adjacent, fn last). buf[2] return slot struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020054f0 (main, class C/D) — front-load.
 *   recipe: 0x40 local buf; two inits then stmia-pack 2 stack args + str fn (store-order)
 * func_02001d0c(buf,0x20,2); func_02001d84(buf,c,0);
 * ef4(buf,a,0,0, 0,b,func_02003b14); return buf[2] (off +8).
 */
extern void func_02001d0c(void *buf, int n, int m);
extern void func_02001d84(void *buf, int x, int y);
extern int func_02003b14(void);
extern int func_02004ef4(int a, int b, int c, int d, int e, int f, void *fn);

int func_020054f0(int a, int b, int c) {
    int buf[16];
    func_02001d0c(buf, 0x20, 2);
    func_02001d84(buf, c, 0);
    func_02004ef4((int)buf, a, 0, 0, 0, b, func_02003b14);
    return buf[2];
}
