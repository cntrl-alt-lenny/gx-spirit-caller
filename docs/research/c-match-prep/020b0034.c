/* CAMPAIGN-PREP candidate for func_020b0034 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BITWISE merge on stack-homed double words; orr x-operand-first
 *   risk:       exact homing + word reload order (read x.hi before y.hi) and bic/and/orr selection are source-form sensitive
 *   confidence: low
 */
/* func_020b0034 - copysign(double x, double y). soft-float doubles are
 * homed (stmdb r0-r3); little-endian so the sign-bearing word is the
 * high (second) word. result.hi = (x.hi & 0x7fffffff) | (y.hi & 0x80000000),
 * result.lo = x.lo. (bic x-sign first, and y-sign, orr x-first.) */

typedef union {
    double d;
    struct { unsigned int lo; unsigned int hi; } w;
} DblBits;

double func_020b0034(double x, double y)
{
    DblBits ux, uy;
    ux.d = x;
    uy.d = y;
    ux.w.hi = (ux.w.hi & 0x7fffffffU) | (uy.w.hi & 0x80000000U);
    return ux.d;
}
