/* CAMPAIGN-PREP candidate for func_0208ff84 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard (handle!=-1 && n>imm) -> 2-way void tail dispatch; +0x05000400 literal base
 *   risk:       n must be unsigned (bls); literal-vs-add-imm pooling for 0x05000400; helper arg order assumed
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208ff84 (main, class B) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: handle!=-1 && n>0x1c guard -> 2-way void tail dispatch; +0x05000400 literal base
 */
/* func_0208ff84: identical dispatch to func_0208feb4/ff1c, pooled base
 * 0x05000400. */

extern void func_020944a4(void *src, void *dst, int n);
extern void func_02093fb8(int handle, void *a, void *b, int n);
extern int data_0210249c;

void func_0208ff84(void *a, int b, int n) {
    int handle = data_0210249c;
    if (handle != -1 && n > 0x1c)
        func_02093fb8(handle, a, (void *)(b + 0x05000400), n);
    else
        func_020944a4(a, (void *)(b + 0x05000400), n);
}
