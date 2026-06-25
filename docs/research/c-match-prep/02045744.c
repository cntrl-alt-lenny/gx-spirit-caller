/* CAMPAIGN-PREP candidate for func_02045744 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD chain, void; s->f4 CSE'd; RELOAD singleton post-call/between stores
 *   risk:       second s->f4 may reload instead of CSE; final two stores' reload scheduling may differ; cluster is reg-alloc-walled
 *   confidence: low
 */
/* func_02045744: void state-machine guard chain on the data_0219dad0
 * singleton. s loaded once for the f4 dispatch (s->f4 read once, CSE'd across
 * the !=4 check). Post-call stores reload the singleton (no callee-saved). */

typedef struct {
    int            f0;       /* +0x00 */
    unsigned short f4;       /* +0x04 */
    unsigned short f6;       /* +0x06 */
} S;

extern S *data_0219dad0;
extern int func_0203cc58(void);
extern int func_0207b5f8(void);

void func_02045744(void) {
    S *s = data_0219dad0;

    if (s == 0) return;
    if (s->f4 == 2) {
        data_0219dad0->f0 = func_0203cc58();
        return;
    }
    if (s->f4 != 4) return;
    if (s->f6 == 0) return;
    if (func_0207b5f8() == 9) return;
    data_0219dad0->f6 = 0;
    data_0219dad0->f4 = 6;
}
