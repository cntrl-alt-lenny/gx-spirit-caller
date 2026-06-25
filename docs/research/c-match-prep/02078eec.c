/* CAMPAIGN-PREP candidate for func_02078eec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     64-bit return (r0=lo/r1=hi) + two orr-shift packs
 *   risk:       lo/hi mapping to r0/r1 assumed EABI; load scheduling of the four ldrh may reorder
 *   confidence: med
 */
/* func_02078eec: read four halfwords p[0]..p[-3], return a 64-bit value
 * lo=p[-3]|(p[-2]<<16), hi=p[-1]|(p[0]<<16). EABI r0=lo, r1=hi, so the
 * low half is the lower-address pair. p[0] is genuinely used (no
 * volatile). Operand order picks the dest reg (unshifted operand first).
 */

unsigned long long func_02078eec(unsigned short *p) {
    unsigned int lo = (unsigned int)p[-3] | ((unsigned int)p[-2] << 16);
    unsigned int hi = (unsigned int)p[-1] | ((unsigned int)p[0]  << 16);
    return ((unsigned long long)hi << 32) | lo;
}
