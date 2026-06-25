/* CAMPAIGN-PREP candidate for func_021af704 (ov005, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     clamp via if-assign (min/movgt) then counted byte-sum loop, accumulator-first
 *   risk:       DOCUMENTED 47% miss (ov005_core.h): mwcc strength-reduces the byte index to a pointer bump (extra IV) where orig keeps base+index; no C form blocks the SR
 *   confidence: low
 */
/* func_ov005_021af704: clamp `count` to a per-object limit, then sum that
 * many bytes from the object's +0x68 array.
 * KNOWN near-miss (ov005_core.h wave 2): orig keeps base + running index;
 * mwcc strength-reduces to a pointer increment (extra induction var). This is
 * the canonical clean-C attempt regardless. */
extern int func_020aaddc(void *p);

int func_ov005_021af704(unsigned char *p, int count) {
    int limit = func_020aaddc(p + 0x48);
    int i;
    int sum;
    if (count > limit)
        count = limit;
    sum = 0;
    for (i = 0; i < count; i++)
        sum += p[0x68 + i];
    return sum;
}
