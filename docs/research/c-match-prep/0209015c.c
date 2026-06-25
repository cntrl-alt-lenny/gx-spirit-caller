/* CAMPAIGN-PREP candidate for func_0209015c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     handle!=-1 guard call + teardown call + four ordered zero-stores (6350,634c,633c,6348)
 *   risk:       prologue routing => *.legacy_sp3.c; four-store ORDER must match pool-load sequence; data_021a6348 reloaded for call+last store
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_0209015c (main, class A) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: handle!=-1 guard call + teardown call + four ordered zero-stores (STORE-ORDER)
 *   NOTE: stmfd{lr}/sub sp#4 ... ldmfd{lr}/bx lr prologue => route as *.legacy_sp3.c
 */
/* func_0209015c: like func_02090048 but flushes engine func_021a6348 via
 * func_0208d4f0 and clears FOUR globals. Asm store order is
 * 021a6350, 021a634c, 021a633c, 021a6348 (literal-pool ip reuse). */

extern void func_02093dc8(int handle);
extern void func_0208d4f0(int x);
extern int data_0210249c;
extern int data_021a6348;
extern int data_021a6350;
extern int data_021a634c;
extern int data_021a633c;

void func_0209015c(void) {
    if (data_0210249c != -1)
        func_02093dc8(data_0210249c);
    func_0208d4f0(data_021a6348);
    data_021a6350 = 0;
    data_021a634c = 0;
    data_021a633c = 0;
    data_021a6348 = 0;
}
