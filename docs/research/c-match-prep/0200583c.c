/* CAMPAIGN-PREP candidate for func_0200583c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     clone of 5800; MMIO IE bit0 RMW around store (offset 0x8)
 *   risk:       func_0209065c signature assumed; 0x4000210 reload-vs-bind may differ.
 *   confidence: med
 */
/* func_0200583c: clone of func_02005800, store offset 0x8. */
extern char data_021040ac[];
extern void func_0209065c(unsigned int ie);

void func_0200583c(int v) {
    volatile unsigned int *ie = (volatile unsigned int *)0x4000210;
    func_0209065c(*ie & ~1u);
    *(int *)(data_021040ac + 0x8) = v;
    func_0209065c(*ie | 1u);
}
