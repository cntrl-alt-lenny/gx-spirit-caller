/* CAMPAIGN-PREP candidate for func_02086334 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag-branch dispatch; r5 carry flag via if-assign; smull>>12 FX_Mul; o+N word index
 *   risk:       reshape-able: branch order + early-return on (o[0]&1) ne path must match (addne/ldmneia tail) — if mwcc emits a join block instead of the conditional epilogue, restructure the final if into two returns.
 *   confidence: med
 */
/* func_02086334: flag-gated FX12 transform of obj fields then func_02084e0c dispatch.
 * obj @ r0. obj[0] flags: 0x18,4,2,1. smull>>12 = NitroSDK FX_Mul (no round). */
typedef signed int s32;
typedef signed long long s64;
typedef s32 fx32;

extern void func_02084e0c(int, int *, int);

void func_02086334(fx32 *o) {
    int v[4];                   /* sp..sp+0xc */
    int r5 = 0;
    int r4 = o[0] & 0x18;
    if (!r4) {
        func_02084e0c(0x1b, o + 7, 3);   /* obj+0x1c */
    }
    if (!(o[0] & 4)) {
        if (r4) { r5 = 1; }
        else {
            v[0] = (s32)(((s64)o[0x13] * o[4]) >> 12);  /* [0x4c]*[0x10] */
            v[1] = (s32)(((s64)o[0x14] * o[5]) >> 12);  /* [0x50]*[0x14] */
            v[2] = (s32)(((s64)o[0x15] * o[6]) >> 12);  /* [0x54]*[0x18] */
            func_02084e0c(0x1c, v, 3);
        }
    }
    if (!(o[0] & 2)) {
        if (r5) func_02084e0c(0x19, o + 10, 0xc);   /* obj+0x28 */
        else    func_02084e0c(0x1a, o + 10, 9);
    } else if (r5) {
        func_02084e0c(0x1c, o + 0x13, 3);            /* obj+0x4c */
    }
    if (!r4) {
        func_02084e0c(0x1b, o + 4, 3);              /* obj+0x10 */
    }
    if (!(o[0] & 1)) {
        func_02084e0c(0x1b, o + 1, 3);              /* obj+0x4 */
    }
}
