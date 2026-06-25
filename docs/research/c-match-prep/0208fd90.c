/* CAMPAIGN-PREP candidate for func_0208fd90 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-branch + immediate base + bind-vs-reload (reuse g in r0)
 *   risk:       mwcc may schedule the 0x6400000 mov / reuse ip differently (orig reloads ip for base after the -1 cmp)
 *   confidence: med
 */
/* func_0208fd90 — threshold dispatch wrapper with an IMMEDIATE base (0x6400000).
 * Identical shape to func_0208fd30 with a different base constant. */

extern int data_0210249c;
extern void func_02094030(int n, void *dst, int src, int len);
extern void Copy32(void *dst, int src, int len);

void func_0208fd90(void *dst, int off, int len) {
    int g = data_0210249c;
    if (g != -1 && len > 0x30) {
        func_02094030(g, dst, 0x6400000 + off, len);
        return;
    }
    Copy32(dst, 0x6400000 + off, len);
}
