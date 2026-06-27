/* CAMPAIGN-PREP candidate for func_02018e0c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D bitfield: (f&0xFFFF0000)|((v<<16)>>16), high-half-first orr order
 *   risk:       reshape-able: mwcc may emit `and v,#0xffff` instead of lsl#16;lsr#16 — if so switch to a :16 bitfield store to force the shift pair. Offset 0xc struct-guessed.
 *   confidence: med
 */
/* func_02018e0c (main, class D) — 16-bit field insert into entry->fc, store-order.
 * a0=r0(->r6), v=r1(->r4). w=GetSystemWork()(->r5). idx=func_020191dc(a0).
 * e = w + (idx-1)*0x18. f = *(int*)(e+0xc);
 * *(int*)(e+0xc) = (f & 0xFFFF0000) | (v & 0xFFFF).
 * asm builds (v<<16)>>16 (lsl#16;lsr#16) for the low-16 truncate and ANDs f with
 * rsb(0x10000)= 0xFFFF0000; orr operand order = (high-preserved) | (v low16). */
extern char *GetSystemWork(void);
extern int func_020191dc(int);

void func_02018e0c(int a0, int v) {
    char *w = GetSystemWork();
    int idx = func_020191dc(a0);
    int *p = (int *)(w + (idx - 1) * 24 + 0xc);
    *p = (*p & 0xFFFF0000) | ((unsigned)(v << 16) >> 16);
}
