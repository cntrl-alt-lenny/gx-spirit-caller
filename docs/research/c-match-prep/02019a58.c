/* CAMPAIGN-PREP candidate for func_02019a58 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod/64-bit: LCG advance + Lemire (hi*101>>32) bound, threshold tiers
 *   risk:       permuter-class / likely escape-to-.s: hand-coded 64-bit umull/mla/adc with no-op `mla ...,r2(0),...` artifacts; mwcc's 64-bit lowering won't reproduce the exact mul/adc schedule. r0 arg to func_02019940 is guessed.
 *   confidence: low
 */
/* func_02019a58 (main, class D) — 64-bit LCG advance on data_02102c64 + Lemire bound, tail-call.
 * VERY LOW confidence: this is hand-written 64-bit umull/mla/adc with mov-r2-#0 no-op multiplies
 * that natural C will NOT reproduce instruction-for-instruction. Best-effort model only.
 * State S = 6 u32 words at data_02102c64: {s0,s1,s2,s3,s4,s5}.
 *   adv_lo:hi = s2*s0 (umull) + (s2*s1<<32) + (s3*s0<<32); then s0_new = s4 + lo, s1_new = s5 + hi + carry.
 *   store s0=s0_new, s1=s1_new.
 *   bound = (uint64)s1_new * 101 >> 32;   // 0..100 (umull hi word of *101)
 *   tier = bound<5 ? 0 : (bound<0x1e ? 1 : 2);
 *   return func_02019940(<r0 leftover>, tier);   // tail bl, r1=tier
 * Modeled with explicit 64-bit ops; r0 arg to func_02019940 is the umull-lo leftover (approx). */
extern unsigned int data_02102c64[];
extern int func_02019940(int a, int b);

int func_02019a58(void) {
    unsigned int *s = data_02102c64;
    unsigned long long prod = (unsigned long long)s[2] * s[0];
    unsigned int hi = (unsigned int)(prod >> 32) + s[2] * s[1] + s[3] * s[0];
    unsigned int lo = (unsigned int)prod;
    unsigned long long sum_lo = (unsigned long long)s[4] + lo;
    unsigned int new_lo = (unsigned int)sum_lo;
    unsigned int new_hi = s[5] + hi + (unsigned int)(sum_lo >> 32);
    s[0] = new_lo;
    s[1] = new_hi;
    {
        unsigned int bound = (unsigned int)(((unsigned long long)new_hi * 0x65) >> 32);
        int tier;
        if (bound < 5)
            tier = 0;
        else if (bound < 0x1e)
            tier = 1;
        else
            tier = 2;
        return func_02019940(0, tier);
    }
}
