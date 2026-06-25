/* CAMPAIGN-PREP candidate for func_020b18c4 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     double-arg call chain, save-arg-across-call, &local out-param
 *   risk:       double calling-conv + r4 save + single int stack-slot may reorder/reg-flip (ships as .s historically, brief 302); 2nd-call arg shape inferred from f1 returning its double in r0:r1
 *   confidence: low
 */
/* func_020b18c4 (main, B) — double helper: m = f1(x,&e); e += n; return f2(m,e).
 * Callees are FP/double routines (f1: (double,int*)->double returning r0:r1 via
 * [sp,#8]/[sp,#0xc]; f2: (double,int)->double). r2 (3rd incoming = n) is saved
 * in r4 across the first call, then added to the &local out-param, then f2 is
 * called with the first call's double result (still in r0:r1) and the summed e.
 * This is an ldexp/scalb-family wrapper. */
extern double func_020b007c(double x, int *out_exp);
extern double func_020b0138(double m, int exp);

double func_020b18c4(double x, int n)
{
    int e;
    double m = func_020b007c(x, &e);
    e += n;
    return func_020b0138(m, e);
}
