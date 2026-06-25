/* CAMPAIGN-PREP candidate for func_020740c4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     init store-order; calls in source order; addr-passed globals
 *   risk:       ef24/ef28 share the zero value; their two adjacent stores could reorder
 *   confidence: high
 */
/* func_020740c4: subsystem init sequence.
 * Exact call + zero-store order preserved:
 *   func_02074134(); af4(&f0b8); b5c(&f178);
 *   ef20=0; func_02074498(); ef24=0; ef28=0;
 */
extern int data_0219ef20;
extern int data_0219ef24;
extern int data_0219ef28;
extern unsigned char data_0219f0b8[];
extern unsigned char data_0219f178[];
extern void func_02074134(void);
extern void func_02074498(void);
extern void func_02091af4(void *p);
extern void func_02091b5c(void *p);

void func_020740c4(void) {
    func_02074134();
    func_02091af4(data_0219f0b8);
    func_02091b5c(data_0219f178);
    data_0219ef20 = 0;
    func_02074498();
    data_0219ef24 = 0;
    data_0219ef28 = 0;
}
