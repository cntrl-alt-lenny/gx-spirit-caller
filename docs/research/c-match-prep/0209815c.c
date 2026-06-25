/* CAMPAIGN-PREP candidate for func_0209815c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     init + single call + bool-normalize wrapper (A)
 *   risk:       0x4c frame size depends on tmp[] size mwcc picks; extra args a/b unused here may shift reg moves
 *   confidence: med
 */
/* func_0209815c: zero-init a ~0x4c scratch via func_02098388(&tmp), run
 * func_02098228(&tmp, a, self, 0), and return its result normalized to 0/1.
 * Two-call wrapper with boolean normalize (cmp;movne 1;moveq 0). */

extern void func_02098388(void *p);
extern int  func_02098228(void *p, void *a, void *self, int z);

int func_0209815c(void *self, void *a) {
    char tmp[0x4c];
    func_02098388(tmp);
    return func_02098228(tmp, a, self, 0) != 0;
}
