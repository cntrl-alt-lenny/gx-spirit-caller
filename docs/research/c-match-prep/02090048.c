/* CAMPAIGN-PREP candidate for func_02090048 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     handle!=-1 guard call + teardown call + two ordered zero-stores (021a6344 then 021a6340)
 *   risk:       prologue routing => *.legacy_sp3.c filename else extra push reg; data_021a6344 reloaded for both call+store (matches); store order fixed
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_02090048 (main, class A) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: handle!=-1 guard call + teardown call + two zero-stores (STORE-ORDER)
 *   NOTE: stmfd{lr}/sub sp#4/...add sp#4/ldmfd{lr}/bx lr prologue => route as *.legacy_sp3.c
 */
/* func_02090048: if the DMA handle is live, stop it (func_02093dc8 takes
 * the handle); then flush channel func_021a6344 via func_0208d3fc and
 * clear two bookkeeping globals (func_021a6344 first, then 021a6340). */

extern void func_02093dc8(int handle);
extern void func_0208d3fc(int x);
extern int data_0210249c;
extern int data_021a6344;
extern int data_021a6340;

void func_02090048(void) {
    if (data_0210249c != -1)
        func_02093dc8(data_0210249c);
    func_0208d3fc(data_021a6344);
    data_021a6344 = 0;
    data_021a6340 = 0;
}
