/* CAMPAIGN-PREP candidate for func_020385d8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store-order + forced s16 reload (truncation)
 *   risk:       mwcc could keep v<<8 in-reg instead of ldrsh reload; unlikely (s16 truncation forces re-read)
 *   confidence: high
 */
/* func_020385d8 - init 8-byte record: store v<<8 at +2, sign-ext reload into +0, zero +6/+4 */

typedef struct {
    short f0;
    short f2;
    short f4;
    short f6;
} S8;

void func_020385d8(S8 *p, int v)
{
    p->f2 = v << 8;
    p->f0 = p->f2;   /* forces ldrsh reload of the truncated halfword */
    p->f6 = 0;
    p->f4 = 0;
}
