/* CAMPAIGN-PREP candidate for func_02005800 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     MMIO IE bit0 RMW bracket around setter store (offset 0x4)
 *   risk:       func_0209065c signature assumed (u32 in,r0); base-reload pattern for 0x4000210 may bind.
 *   confidence: med
 */
/* func_02005800: disable IE bit0, store arg to data_021040ac+0x4, re-enable.
 *   ldr r0,[0x4000210]; bic r0,r0,#1; bl func_0209065c
 *   str arg,[data_021040ac,#0x4]
 *   ldr r0,[0x4000210]; orr r0,r0,#1; bl func_0209065c
 */
extern char data_021040ac[];
extern void func_0209065c(unsigned int ie);

void func_02005800(int v) {
    volatile unsigned int *ie = (volatile unsigned int *)0x4000210;
    func_0209065c(*ie & ~1u);
    *(int *)(data_021040ac + 0x4) = v;
    func_0209065c(*ie | 1u);
}
