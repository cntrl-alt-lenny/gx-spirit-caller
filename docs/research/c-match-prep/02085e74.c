/* CAMPAIGN-PREP candidate for func_02085e74 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     declare carried bool a=(f&4)==0 first so it lands in callee-saved r4 across calls
 *   risk:       reshape-able/permuter: bool a must stay in r4 across 4 calls (moveq r4,#1); if mwcc recomputes (f&4)==0 or picks another callee-saved reg, the predicated moves shift. Decl-first is the lever.
 *   confidence: med
 */
/* func_02085e74: flag-test dispatch with a carried bool a = !(f & 4) (r4,
 * callee-saved across calls). First block runs iff (f & 0x20) && !(f & 8):
 * if a -> func_02084e0c(0x1c,obj+0x4c,3),a=0; then func_02084e0c(0x1b,obj+0x10,3).
 * Reload f: if (f&2) { if a -> 0x1c/0x4c } else if a -> 0x19/0x28/0xc else
 * 0x1a/0x28/0x9. Trailing: if !(obj->f0&1) func_02084e0c(0x1b,obj+4,3). */

extern int func_02084e0c(int tag, void *p, int count);

void func_02085e74(unsigned char *obj)
{
    int f = *(int *)obj;
    int a = (f & 0x4) == 0;

    if ((f & 0x20) && !(f & 0x8)) {
        if (a) {
            func_02084e0c(0x1c, obj + 0x4c, 0x3);
            a = 0;
        }
        func_02084e0c(0x1b, obj + 0x10, 0x3);
    }

    f = *(int *)obj;
    if (f & 0x2) {
        if (a)
            func_02084e0c(0x1c, obj + 0x4c, 0x3);
    } else if (a) {
        func_02084e0c(0x19, obj + 0x28, 0xc);
    } else {
        func_02084e0c(0x1a, obj + 0x28, 0x9);
    }

    if (*(int *)obj & 0x1)
        return;
    func_02084e0c(0x1b, obj + 0x4, 0x3);
}
