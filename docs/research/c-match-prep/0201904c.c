/* CAMPAIGN-PREP candidate for func_0201904c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D bitfield+clamp: 16-bit sat-add, if-assign branches, high-half preserved, store-order
 *   risk:       reshape-able: the two-branch clamp must stay if-assign (orrhi/movls predication) not a ternary-merged store; if mwcc merges, split further. Offset 0x8d4 struct-guessed.
 *   confidence: med
 */
/* func_0201904c (main, class D) — unsigned 16-bit saturating-add into sys->f8d4 low half.
 * arg=r0(->r4). sys=GetSystemWork(). f=*(int*)(sys+0x8d4).
 * sum = arg + (f & 0xffff); low16 = (sum > 0xffff) ? 0xffff : (sum & 0xffff);
 * *(int*)(sys+0x8d4) = (f & 0xffff0000) | low16.  high half preserved.
 * asm: cmp sum,0xffff; orrhi (high|0xffff) ; movls/orrls (high|(sum<<16>>16)) — clamp as if-assign,
 * NOT ternary on the whole word; the (sum<<16)>>16 low-extract is the bitfield-truncate idiom. */
extern char *GetSystemWork(void);

void func_0201904c(int arg) {
    char *sys = GetSystemWork();
    int *p = (int *)(sys + 0x8d4);
    int f = *p;
    unsigned int sum = arg + (f & 0xffff);
    if (sum > 0xffff)
        *p = (f & 0xffff0000) | 0xffff;
    else
        *p = (f & 0xffff0000) | ((sum << 16) >> 16);
}
