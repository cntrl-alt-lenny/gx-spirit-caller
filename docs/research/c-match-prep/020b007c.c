/* CAMPAIGN-PREP candidate for func_020b007c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     float decompose: mask/orr exponent pack, asr#0x14 exp extract, store-order eptr then frac
 *   risk:       struct-guessed/permuter-class: this is frexp-style soft-float operating on caller's stmdb {r0-r3} home slots (lo@sp+8, hi@sp+0xc) returned in r0/r1, not via *eptr alone; the in/out double passed by stacked args can't be modeled by this signature, and func_020b1e88's reg use is reconstructed.
 *   confidence: low
 */
extern int func_020b1e88(unsigned int lo, unsigned int hi, unsigned int s);

void func_020b007c(unsigned int lo, unsigned int hi, int *eptr, int d3)
{
    unsigned int frac;

    *eptr = 0;
    frac = hi & 0x7fffffff;
    if (frac >= 0x7ff00000) {
        return;
    }
    if ((frac | lo) == 0) {
        return;
    }
    if (frac < 0x100000) {
        unsigned long long r = (unsigned long long)(unsigned int)func_020b1e88(lo, hi, 0x43500000);
        lo = (unsigned int)r;
        hi = (unsigned int)(r >> 32);
        *eptr = ~0x35;
        frac = hi & 0x7fffffff;
    }
    hi = (hi & 0x800fffff) | 0xfe00000 | 0x30000000;
    *eptr = *eptr + (int)(0xfffffc02 + ((int)frac >> 0x14));
    /* lo unchanged in r0; hi written back to caller slot */
}
