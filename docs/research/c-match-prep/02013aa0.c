/* CAMPAIGN-PREP candidate for func_02013aa0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     compare-chain switch (few cases); bit0 test via &1; fallthrough case1->case3; OR-into-*ptr
 *   risk:       struct-guessed: SystemWork offsets 0x8d8/0x920/0x924 and dst+8 are inferred (no typedef). Also bit0 read: orig uses lsl#31;lsr#31 (a :1 bitfield); plain &1 may emit `and` not lsl/lsr. reshape-able (use unsigned :1 bitfield).
 *   confidence: low
 */
/* func_02013aa0(dst): if SystemWork enable-bit(0x8d8 bit0) clear, return.
 * Then dispatch on SystemWork[0x920]:
 *   1 -> nested dispatch on [0x924] (case1 promotes [0x924]=3 then shares
 *        the case3 body), writing packed status words to dst->f8 (off 8);
 *        the [0x924]==2 arm also OR's 0x2000 into *func_0201b75c().
 *   2 -> dst->f8 = 0x00010200
 *   3 -> dst->f8 = 0x00010300
 * SystemWork accessed via the codebase's char*+offset idiom. */
extern char *GetSystemWork(void);
extern int  *func_0201b75c(void);

void func_02013aa0(int *dst)
{
    char *sw = GetSystemWork();
    if ((*(int *)(sw + 0x8d8) & 1) == 0)
        return;
    switch (*(int *)(sw + 0x920)) {
    case 1:
        switch (*(int *)(sw + 0x924)) {
        case 1:
            *(int *)(sw + 0x924) = 3;
            /* fallthrough */
        case 3:
            dst[2] = 0x00010100;
            break;
        case 2:
            dst[2] = 0x00010101;
            {
                int *p = func_0201b75c();
                *p |= 0x2000;
            }
            break;
        }
        break;
    case 2:
        dst[2] = 0x00010200;
        break;
    case 3:
        dst[2] = 0x00010300;
        break;
    }
}
