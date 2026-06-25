/* CAMPAIGN-PREP candidate for func_020a7200 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard early returns + conditional u8->u16 store + bool
 *   risk:       store wants ldrb but test wants ldrsb on same src — cast may not yield the exact ldrb/ldrsb split
 *   confidence: med
 */
/* func_020a7200 (main, class A) — null guards then a conditional
 * zero-extended byte->halfword store, returns (signed)*src != 0.
 *   r1 (src) is RELOADED twice: ldrb for the store, ldrsb for the test.
 *   r2 is only null-tested (never dereferenced). r0 is the u16 out ptr.
 *   recipe: null-guard early returns + conditional store + bool 1/0
 */
int func_020a7200(unsigned short *out, signed char *src, void *guard)
{
    if (src == 0)   return 0;
    if (guard == 0) return -1;
    if (out != 0)
        *out = (unsigned char)*src;
    return *src != 0;
}
