/* CAMPAIGN-PREP candidate for func_02079e4c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     popcount via clz: clz;rsbs;bxcc;bic highest;count++
 *   risk:       clz/rsbs idiom is mwcc-version-specific; if the compiler lacks the clz builtin pattern this falls back to a shift loop and will not match
 *   confidence: low
 */
/* func_02079e4c: population count of a 32-bit word using CLZ. Repeatedly
 * find the highest set bit (31 - clz(x)); if none remain (x==0, clz==32 so
 * 31-clz < 0 -> carry clear) return the count; otherwise clear that bit.
 *
 *   n = 0;
 *   for (;;) {
 *       int b = 31 - clz(x);     // rsbs r2,#0x1f sets C; bxcc when b<0
 *       if (b < 0) return n;     // x became 0
 *       x &= ~(1u << b);
 *       n++;
 *   }
 *
 * Assumes an mwcc CLZ intrinsic is available; named __builtin_clz here so
 * the front-load reviewer can swap it for the project's actual spelling
 * (some SDKs expose it as `_CLZ` / inline asm).
 */

extern int __builtin_clz(unsigned int x);

int func_02079e4c(unsigned int x) {
    int n = 0;
    for (;;) {
        int b = 31 - __builtin_clz(x);
        if (b < 0) {
            return n;
        }
        x &= ~(1u << b);
        n++;
    }
}
