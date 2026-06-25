/* CAMPAIGN-PREP candidate for func_022bdb18 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted stride-8 clear loop + trailing +0x80 store
 *   risk:       base must stay live for the +0x80 store vs cursor; loop may index off one ptr instead
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022bdb18 (ov002, class A).
 *   recipe:  counted stride-8 clear loop (2 words/iter x16) + trailing word @+0x80
 *   risk:    base (r0) must stay live for the final base[0x20]=0 store while a
 *            separate cursor strides; loop may keep one ptr and index instead
 *   confidence: med
 */

void func_ov002_022bdb18(int *base)
{
    int *p = base;
    int i;
    for (i = 0; i < 16; i++) {
        p[0] = 0;
        p[1] = 0;
        p += 2;
    }
    base[0x80 / 4] = 0;
}
