/* CAMPAIGN-PREP candidate for func_02000e34 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT/CLEAR store-order globals + tail call passing func ptr
 *   risk:       Pool-word order/scheduling of the 3 literal loads may reorder vs orig.
 *   confidence: med
 */
/* func_02000e34: clear three global fields (different bases), then tail-call
 * func_020057c0 with func_02001520 as its argument.
 *
 *   str ip,[data_02104e6c,#0xa38]   ; r3 base
 *   str ip,[data_02102b80,#0]       ; r2 base
 *   str ip,[data_02103fcc,#0xb64]   ; r1 base
 *   bl  func_020057c0               ; r0 = func_02001520
 */
extern char data_02102b80[];
extern char data_02103fcc[];
extern char data_02104e6c[];
extern void func_02001520(void);
extern void func_020057c0(void *fn);

void func_02000e34(void) {
    *(int *)(data_02104e6c + 0xa38) = 0;
    *(int *)(data_02102b80) = 0;
    *(int *)(data_02103fcc + 0xb64) = 0;
    func_020057c0(func_02001520);
}
