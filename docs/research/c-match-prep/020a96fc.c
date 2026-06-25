/* CAMPAIGN-PREP candidate for func_020a96fc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack blk{p,n,0}; bind p=r5 across 3 uses; ip=#0 store; cc byte stores
 *   risk:       orig holds p in r5 and n in r4 across the call + all 3 cc-predicated stores (strccb/strneb) sharing one return-value cmp. mwcc may spill p/n or de-predicate stores into branches -> multiple ldr + extra labels. reshape-able partly (decl-order, single idx var); store-predication is permuter-class if mwcc won't fold movcc/strccb.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020a96fc (main, class C) - brief p_0053.
 * UNVERIFIED build-free draft.
 *   recipe:     stack arg-block {p,n,0}; bind p in r5 across 3 uses; cc-predicated byte stores
 *   confidence: low (struct-guessed call shape)
 */
/* bounds-check + conditional byte stores.
 * Builds a 3-word stack record {p, n, 0}, &record passed in r1 to func_020a8d50,
 * which also takes a fixed table ptr func_020a95a0 in r0. Returns an index in r0.
 * If p!=0: when idx<n write p[idx]=0; else when n!=0 write p[n-1]=0. */

extern int func_020a8d50(void *table, void *argblk);
extern unsigned char func_020a95a0[];

int func_020a96fc(unsigned char *p, unsigned int n)
{
    unsigned char *pp = p;   /* r5 */
    unsigned int nn = n;     /* r4 */
    unsigned int blk[3];     /* sp[0..2] */
    unsigned int idx;

    blk[0] = (unsigned int)pp;
    blk[1] = nn;
    blk[2] = 0;
    idx = (unsigned int)func_020a8d50((void *)func_020a95a0, blk);
    if (pp == 0)
        return idx;
    if (idx < nn) {
        pp[idx] = 0;
        return idx;
    }
    if (nn != 0)
        pp[nn - 1] = 0;
    return idx;
}
