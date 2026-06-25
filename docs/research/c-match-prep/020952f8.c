/* CAMPAIGN-PREP candidate for func_020952f8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     run-once flag guard (early return) + init call chain, &global as arg
 *   risk:       Frame sub sp,#4 for the calls; literal-pool order of the two globals and the hoisted _LIT1 load above the str may differ.
 *   confidence: med
 */
/* func_020952f8: run-once guard. If data_021a6730 is already set, return;
 * otherwise set it and run the three init calls. The first call takes the
 * address of the adjacent global data_021a6734. */
extern void func_02092844(void *p);
extern void func_02095a50(void);
extern void func_02095c18(void);
extern int  data_021a6730;
extern int  data_021a6734;

void func_020952f8(void) {
    if (data_021a6730 != 0)
        return;
    data_021a6730 = 1;
    func_02092844(&data_021a6734);
    func_02095a50();
    func_02095c18();
}
