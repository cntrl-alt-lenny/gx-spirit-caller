/* CAMPAIGN-PREP candidate for func_02098038 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-temp wrapper, ldmia unpack, two calls, bool tail (A)
 *   risk:       ldmia r1,{r1,r2} unpack vs two ldr loads may differ; predicated epilogue (addne/movne) reordering
 *   confidence: med
 */
/* func_02098038: build a 2-word scratch via func_0209815c(&tmp); on success
 * unpack tmp[0],tmp[1] and tail through func_02098088(self, tmp[0], tmp[1]),
 * returning its boolean; otherwise 0. Stack-temp + call + ldmia-unpack + call. */

extern int func_0209815c(void *out, void *a, void *b);
extern int func_02098088(void *self, int x, int y);

int func_02098038(void *self, void *a, void *b) {
    int tmp[2];
    if (func_0209815c(tmp, a, b) == 0)
        return 0;
    return func_02098088(self, tmp[0], tmp[1]) != 0;
}
