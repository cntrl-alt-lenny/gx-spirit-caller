/* CAMPAIGN-PREP candidate for func_020856a0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     test &4 then &2 in source order; reload obj->f0 for bit0 test; predicated return
 *   risk:       reshape-able: nested if(f&4){if(!(f&2))} else if(f&2) - mwcc may reorder the ands #4/#2 test chain or merge the trailing predicated ldmne. Clean structure, low divergence.
 *   confidence: med
 */
/* func_020856a0: flag-test dispatch. obj->f0 tested for bit2(0x4) then
 * bit1(0x2). Calls func_02084e0c(tag, obj+off, count). Then if !(obj->f0 & 1)
 * a trailing func_02084e0c(0x1b, obj+4, 3). obj->f0 reloaded for the bit0
 * test. */

extern int func_02084e0c(int tag, void *p, int count);

void func_020856a0(unsigned char *obj)
{
    int f = *(int *)obj;

    if (f & 0x4) {
        if (!(f & 0x2))
            func_02084e0c(0x1a, obj + 0x28, 0x9);
    } else if (f & 0x2) {
        func_02084e0c(0x1c, obj + 0x4c, 0x3);
    } else {
        func_02084e0c(0x19, obj + 0x28, 0xc);
    }

    if (*(int *)obj & 0x1)
        return;
    func_02084e0c(0x1b, obj + 0x4, 0x3);
}
