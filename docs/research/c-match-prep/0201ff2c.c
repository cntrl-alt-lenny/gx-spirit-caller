/* CAMPAIGN-PREP candidate for func_0201ff2c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: declare a5 (f3c) and a3 (f10) as u16 locals; both zero-extend lsl;lsr
 *   risk:       reshape-able (decl/operand-order): orig loads f3c into r1 BEFORE f10 into r2; if mwcc reverses the two u16 widens or stack-stores, swap local decl order to match. struct-guessed.
 *   confidence: med
 */
/* func_0201ff2c (class D): two u16 bitfield zero-extends + stack-arg block.
 *   sub sp,#8
 *   r1 = (u16)[0x3c];  stmia sp,{r1,1}   (arg5=u16, arg6=1)
 *   r2 = (u16)[0x10]
 *   func_0209f404(&func_0201ff98, &data_02193380, (u16)[0x10], &data_02193320, (u16)[0x3c], 1)
 *   if(==2) return 1; func_0201f19c(); return 0
 */
typedef struct {
    char            _pad00[0x10];
    unsigned short  f10;        /* +0x10 */
    char            _pad12[0x3c - 0x12];
    unsigned short  f3c;        /* +0x3c */
} S2191f40;

extern S2191f40 data_02191f40;
extern void func_0201ff98(void);
extern void data_02193380;
extern void data_02193320;
extern void func_0201f19c(void);
extern int  func_0209f404(void (*cb)(void), void *a, unsigned short b, void *c, unsigned short d, int e);

int func_0201ff2c(void) {
    unsigned short a3 = data_02191f40.f10;   /* r2, arg3 */
    unsigned short a5 = data_02191f40.f3c;   /* arg5 (stack) */
    if (func_0209f404(func_0201ff98, &data_02193380, a3, &data_02193320, a5, 1) == 2)
        return 1;
    func_0201f19c();
    return 0;
}
