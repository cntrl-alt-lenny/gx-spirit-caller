/* CAMPAIGN-PREP candidate for func_0208feb4 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard (handle!=-1 && n>imm) -> 2-way void tail dispatch; +0x05000600 literal base
 *   risk:       n must be unsigned (bls); 0x05000600 may inline as add-imm vs pool literal; arg order of helpers assumed
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208feb4 (main, class B) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: handle!=-1 && n>0x1c guard -> 2-way void tail dispatch; +0x05000600 literal base
 */
/* func_0208feb4: same dispatch shape as func_0208fe58 but the OAM/VRAM
 * destination base is the pooled literal 0x05000600 and the size gate is
 * 0x1c. Valid handle + large n -> func_02093fb8, else func_020944a4. */

extern void func_020944a4(void *src, void *dst, int n);
extern void func_02093fb8(int handle, void *a, void *b, int n);
extern int data_0210249c;

void func_0208feb4(void *a, int b, int n) {
    int handle = data_0210249c;
    if (handle != -1 && n > 0x1c)
        func_02093fb8(handle, a, (void *)(b + 0x05000600), n);
    else
        func_020944a4(a, (void *)(b + 0x05000600), n);
}
