/* CAMPAIGN-PREP candidate for func_02019538 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D clamp store-order: u8 load+add, movgt/movlt if-assign, indexed b[off] store
 *   risk:       reshape-able: the three predicated stores (strgt/strlt/strge) must stay branch-predicated; if mwcc emits one merged store the early-return strgt diverges. Base+0x14 offset struct-guessed.
 *   confidence: med
 */
/* func_02019538 (main, class D) — clamp store-order on an unsigned byte field.
 * a0=r0(->r7), off=r1(->r5), delta=r2(->r4). w=GetSystemWork()(->r6). idx=func_02019210(a0).
 * b = (unsigned char*)(w + (idx-1)*0x18 + 0x14); v = delta + b[off];   // ldrb -> unsigned
 * if (v > 0xff) { v=0xff; b[off]=v; return; }
 * if (v < 0)    { v=0; }                          // movlt
 * b[off]=v;                                        // strge/strlt both store v
 * Clamp written as if-assign (movgt/movlt) matching the predicated stores; store happens on
 * every non->0xff path. Indexed store b[off] keeps r1 as the index register (ldrb [r1,r5]). */
extern char *GetSystemWork(void);
extern int func_02019210(int);

void func_02019538(int a0, int off, int delta) {
    char *w = GetSystemWork();
    int idx = func_02019210(a0);
    unsigned char *b = (unsigned char *)(w + (idx - 1) * 24 + 0x14);
    int v = delta + b[off];
    if (v > 0xff) {
        b[off] = (unsigned char)0xff;
        return;
    }
    if (v < 0)
        v = 0;
    b[off] = (unsigned char)v;
}
