/* CAMPAIGN-PREP candidate for func_0208ffec (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard (handle!=-1 && n>imm) -> 2-way void tail dispatch; +0x5000000 immediate base
 *   risk:       n must be unsigned (bls); 0x5000000 expected as rotated add-imm not pool; helper arg order assumed
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208ffec (main, class B) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: handle!=-1 && n>0x1c guard -> 2-way void tail dispatch; +0x5000000 IMMEDIATE base
 */
/* func_0208ffec: same dispatch as the 0x0500xxxx family, but the base
 * bias 0x5000000 is encodable as an ARM rotated immediate so it folds
 * into add-imm (no pool literal). */

extern void func_020944a4(void *src, void *dst, int n);
extern void func_02093fb8(int handle, void *a, void *b, int n);
extern int data_0210249c;

void func_0208ffec(void *a, int b, int n) {
    int handle = data_0210249c;
    if (handle != -1 && n > 0x1c)
        func_02093fb8(handle, a, (void *)(b + 0x5000000), n);
    else
        func_020944a4(a, (void *)(b + 0x5000000), n);
}
