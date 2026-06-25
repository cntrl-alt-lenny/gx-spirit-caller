/* CAMPAIGN-PREP candidate for func_0208881c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     global held in r3 (not callee-saved across mask); conditional-shift if-assign; r4 caches func_020955a8 result across func_02095678(1)
 *   risk:       Same movge/movge/movlt conditional-shift temp as 020887a0 — reg rotation of the mask temp is the likely diff; also r4 caches the func_020955a8 result across the next call. reshape-able (if-assign); residual rotation is permuter-class.
 *   confidence: med
 */
/* func_0208881c (main, class C). conditional shift + call sequence.
 * r3=&data_021a524c. if(!f0) return.
 * cond=[+0x2c]; m = cond>=0 ? 1<<cond : 0;
 * func_02095030([+0x24], [+0x28], m, 0);
 * r4 = func_020955a8(); func_02095678(1); func_020955e8(r4).
 */

struct S8881c {
    int  f0;                  /* +0x00 */
    char _pad04[0x24 - 0x04];
    int  f24;                 /* +0x24 */
    int  f28;                 /* +0x28 */
    int  f2c;                 /* +0x2c shift */
};

extern struct S8881c data_021a524c;
extern void func_02095030(int a0, int a1, int a2, int a3);
extern int  func_020955a8(void);
extern void func_020955e8(int h);
extern void func_02095678(int v);

void func_0208881c(void) {
    int sh;
    int mask;
    int h;
    if (data_021a524c.f0 == 0) return;
    sh = data_021a524c.f2c;
    if (sh >= 0) mask = 1 << sh; else mask = 0;
    func_02095030(data_021a524c.f24, data_021a524c.f28, mask, 0);
    h = func_020955a8();
    func_02095678(1);
    func_020955e8(h);
}
