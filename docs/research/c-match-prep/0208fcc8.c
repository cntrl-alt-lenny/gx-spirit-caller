/* CAMPAIGN-PREP candidate for func_0208fcc8 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-branch + bind-vs-reload (reuse g in r0) + no-arg base helper
 *   risk:       reg-alloc-walled family: mwcc may permute the r4/r5/r6/ip callee-save assignment vs the shipped .s
 *   confidence: med
 */
/* func_0208fcc8 — threshold dispatch wrapper (sibling, base helper func_0208e220). */

extern int data_0210249c;
extern void *func_0208e220(void);
extern void func_02093fb8(int n, void *dst, int src, int len);
extern void func_020944a4(void *dst, int src, int len);

void func_0208fcc8(void *dst, int off, int len) {
    int base = (int)func_0208e220();
    int g = data_0210249c;
    if (g != -1 && len > 0x1c) {
        func_02093fb8(g, dst, base + off, len);
        return;
    }
    func_020944a4(dst, base + off, len);
}
