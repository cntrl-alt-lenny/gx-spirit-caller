/* CAMPAIGN-PREP candidate for func_02077b5c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two inits then combine; const-add accumulator-first
 *   risk:       return value discarded vs original (likely returns the sum); frame 0x1c depends on a/b sizes+order
 *   confidence: low
 */
/* func_02077b5c: initialize two stack accumulators, combine them, and
 * bias the combined result by a fixed constant.
 */
extern void func_0209bc20(void *a);
extern void func_0209bb60(void *b);
extern int  func_0209bea0(void *a, void *b);

void func_02077b5c(void) {
    unsigned char a[0x10];
    unsigned char b[0x0c];
    func_0209bc20(a);
    func_0209bb60(b);
    /* call result first -> add r0,r0,#imm (accumulator-first) */
    (void)(func_0209bea0(a, b) + 0x386d4380);
}
