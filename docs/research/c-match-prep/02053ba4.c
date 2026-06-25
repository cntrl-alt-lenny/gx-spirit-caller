/* CAMPAIGN-PREP candidate for func_02053ba4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     linear search; dual counters index(r5)/byte-offset(r4); predicate(ctx, base+offset) via blx; mlaeq stride*index+base on match
 *   risk:       two parallel induction vars (index r5 for the mla return, byte-offset r4 += stride for the arg pointer) — mwcc may collapse to one and recompute, diverging from the separate-counter form. permuter-class (induction-var split + blx caller-saved)
 *   confidence: low
 */
/* func_02053ba4: linear search, predicate via fn ptr.
 * r0=ctx, r1=base, r2=count, r3=stride, arg5=pred.
 * Returns &base[i*stride] of first match (pred==0), else 0.
 * Note: arg ptr uses a running byte offset; the return recomputes via index.
 */

void *func_02053ba4(void *ctx, char *base, int count, int stride,
                    int (*pred)(void *ctx, void *elem)) {
    int i;

    if (count <= 0)
        return 0;

    for (i = 0; i < count; i++) {
        if (pred(ctx, base + i * stride) == 0)
            return base + i * stride;
    }
    return 0;
}
