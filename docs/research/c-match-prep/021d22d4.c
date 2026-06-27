/* CAMPAIGN-PREP candidate for func_021d22d4 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D divmod: FX_Mul = (s64)a*b+0x800>>12 (smull;adds;adc;lsr#c;orr lsl#14); FX_Sqrt call
 *   risk:       permuter-class (DOCUMENTED, brief 457): orig homes all 4 fx32 args to stack (stmdb {r0-r3}) then reads back; direct C keeps them in regs -> arg-homing prologue diverges. The FX_Mul bodies themselves match.
 *   confidence: med
 */
/* func_ov011_021d22d4: 2D Q12 distance. dx = x1-x0, dy = y1-y0;
 * return FX_Sqrt(FX_Mul(dy,dy) + FX_Mul(dx,dx)).  FX_Mul = (s64)a*b rounded
 * (+0x800) >> 12, recombined via lsr#0xc/orr lsl#0x14. func_0208bf3c = FX_Sqrt.
 * Args homed to stack by the orig (stmdb {r0-r3}) then re-loaded as x0@8,
 * x1@10, y0@c, y1@14 (note the y pair brackets the x pair). */
extern int func_0208bf3c(int x);

#define FX_MUL(a, b) ((int)(((long long)(a) * (long long)(b) + 0x800LL) >> 12))

int func_ov011_021d22d4(int x0, int y0, int x1, int y1) {
    int dy = y1 - y0;
    int dx = x1 - x0;
    return func_0208bf3c(FX_MUL(dx, dx) + FX_MUL(dy, dy));
}
