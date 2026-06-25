/* CAMPAIGN-PREP candidate for func_020b005c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BIC sign bit on stack-homed double high word (union type-pun)
 *   risk:       may not reproduce add r2,sp,#0 base-bind + in-place str; &0x7fffffff must lower to bic not and
 *   confidence: low
 */
/* func_020b005c - fabs(double x). homes x (stmdb r0-r3), clears the sign
 * bit of the high (second, little-endian) word in place on the stack and
 * returns. lo word is unchanged. */

typedef union {
    double d;
    struct { unsigned int lo; unsigned int hi; } w;
} DblBits;

double func_020b005c(double x)
{
    DblBits u;
    u.d = x;
    u.w.hi &= 0x7fffffffU;
    return u.d;
}
