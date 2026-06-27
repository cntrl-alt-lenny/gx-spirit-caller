/* CAMPAIGN-PREP candidate for func_020b3168 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     divmod/bit helper: union float bits + manual shift+saturate
 *   risk:       permuter-class/escape-to-.s: this is the __fixsfsi/_ftol intrinsic body; mwcc emits `bl _f2i` for an int<-float cast, never inlines bic/subs/lsr. Keep as .s.
 *   confidence: low
 */
/* func_020b3168: hand-written float->int convert helper (saturating cast).
 * r0 = IEEE-754 float bits. Returns (int) truncation of the float, saturating
 * to INT_MIN/INT_MAX on overflow.
 *   bic r1,r0,#0x80000000   ; abs mantissa+exp bits
 *   subs r2,#0x9e,r1>>23     ; 31 - (exp-127) = shift amount
 *   ble .L_818               ; exponent too big -> saturate by sign
 *   r1 = (r1<<8)|0x80000000  ; mantissa with implicit 1 at top
 *   r0 = r1 >> r2 ; rsbmi    ; negate if sign bit was set
 * .L_818: r0 = ~(r0>>31) + 0x80000000 ; INT_MIN if neg else INT_MAX
 * This IS the runtime __fixsfsi/_ftol intrinsic body; mwcc never inlines this
 * from a C cast (it emits a `bl` to the helper). Provided for reference only;
 * the campaign should keep this as .s. */
typedef union { float f; unsigned int u; } F2I;
int func_020b3168(float x) {
    F2I v; v.f = x;
    unsigned int bits = v.u;
    unsigned int mant = bits & 0x7fffffffu;
    int sh = 0x9e - (int)(mant >> 23);
    if (sh > 0) {
        unsigned int r = (mant << 8) | 0x80000000u;
        int out = (int)(r >> sh);
        if ((int)bits < 0) out = -out;
        return out;
    }
    return (int)(~((int)bits >> 31)) + (int)0x80000000;
}
