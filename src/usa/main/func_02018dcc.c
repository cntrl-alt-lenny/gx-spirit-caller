/* CAMPAIGN-PREP candidate for func_02018dcc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D bitfield: (f&~1)|(b&1) insert, bic-result-first orr operand order
 *   risk:       reshape-able: if mwcc binds (idx-1)*24 base differently or reloads *p the and/bic/orr/str ldr-count diverges; offset 0x10 struct-guessed.
 *   confidence: med
 */
/* func_02018dcc (main, class D) — bitfield insert bit0 into entry->f10, store-order.
 * a0=r0(->r6), b=r1(->r5). w=GetSystemWork()(->r4). idx=func_020191dc(a0).
 * e = w + (idx-1)*0x18 (mla r2,(idx-1),#0x18,r4). f = *(int*)(e+0x10);
 * *(int*)(e+0x10) = (f & ~1) | (b & 1). orr operand-order is (cleared)|(b&1) -> bic result first.
 * Stride 0x18 written as *24 decimal per the matched func_02018d64 family. */
extern char *GetSystemWork(void);
extern int func_020191dc(int);

void func_02018dcc(int a0, int b) {
    char *w = GetSystemWork();
    int idx = func_020191dc(a0);
    int *p = (int *)(w + (idx - 1) * 24 + 0x10);
    *p = (*p & ~1) | (b & 1);
}
