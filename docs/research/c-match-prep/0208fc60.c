/* CAMPAIGN-PREP candidate for func_0208fc60 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-branch + bind-vs-reload (reuse g in r0) + no-arg base helper
 *   risk:       reg-alloc-walled family: mwcc may permute callee-save assignment; func_0208e200 is a matched-C void* helper so its abi is firm
 *   confidence: med
 */
/* func_0208fc60 — threshold dispatch wrapper (sibling, base helper func_0208e200
 * which returns a void* VRAM page address). */

extern int data_0210249c;
extern void *func_0208e200(void);
extern void func_02093fb8(int n, void *dst, int src, int len);
extern void func_020944a4(void *dst, int src, int len);

void func_0208fc60(void *dst, int off, int len) {
    int base = (int)func_0208e200();
    int g = data_0210249c;
    if (g != -1 && len > 0x1c) {
        func_02093fb8(g, dst, base + off, len);
        return;
    }
    func_020944a4(dst, base + off, len);
}
