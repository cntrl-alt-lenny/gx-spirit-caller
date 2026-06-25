/* CAMPAIGN-PREP candidate for func_02052cdc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order ta(r5)/tb-temp reused per branch; equality compares in source order; 64-bit getters compared as long long (cmp hi then cmpeq lo)
 *   risk:       func_02053728/0205370c return long long (r0=lo,r1=hi); the `cmp r6,r1; cmpeq r5,r0` pair needs both halves bound to locals. If mwcc reorders the hi/lo compare or splits the ll differently, the cmpeq fuses break. reshape-able (compare as one `lla==llb` long-long equality)
 *   confidence: med
 */
/* func_02052cdc: typed-value equality dispatch.
 * r0=a, r1=b. Returns 0/1. func_02053688 returns a type tag.
 * Tag 3: compare u32 @+4. Tag 1: compare 64-bit(728) AND u32 @+8.
 * Tag 2: compare 64-bit(70c).
 */

extern int                func_02053688(void *p);   /* tag; arg ignored by callee */
extern int                func_02053704(void *p);   /* u32 @ +4 */
extern int                func_02053720(void *p);   /* u32 @ +8 */
extern unsigned long long func_02053728(void *p);   /* lo=r0, hi=r1 */
extern unsigned long long func_0205370c(void *p);   /* lo=r0, hi=r1 */

int func_02052cdc(void *a, void *b) {
    int ta;
    int tb;

    ta = func_02053688(a);
    tb = func_02053688(b);
    if (ta != tb)
        return 0;

    if (ta == 3) {
        if (func_02053704(a) == func_02053704(b))
            return 1;
        return 0;
    }
    if (ta == 1) {
        if (func_02053728(a) == func_02053728(b)) {
            if (func_02053720(a) == func_02053720(b))
                return 1;
        }
        return 0;
    }
    if (ta == 2) {
        if (func_0205370c(a) == func_0205370c(b))
            return 1;
        return 0;
    }
    return 0;
}
