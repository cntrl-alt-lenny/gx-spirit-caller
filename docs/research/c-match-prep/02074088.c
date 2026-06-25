/* CAMPAIGN-PREP candidate for func_02074088 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     setter store-first; arg reused -> callee-saved; addr-passed globals
 *   risk:       data globals as arrays vs scalars only affects reloc symbol, not encoding
 *   confidence: high
 */
/* func_02074088: cache arg in a global then push it to two subsystems.
 * Stores v to data_02101ea0 first, then calls func_0209181c twice with
 * two different object addresses; v is reused 3x so it lands in r4.
 */
extern int  data_02101ea0;
extern unsigned char data_0219f178[];   /* object, passed by address */
extern unsigned char data_0219f0b8[];   /* object, passed by address */
extern void func_0209181c(void *obj, int v);

void func_02074088(int v) {
    data_02101ea0 = v;
    func_0209181c(data_0219f178, v);
    func_0209181c(data_0219f0b8, v);
}
