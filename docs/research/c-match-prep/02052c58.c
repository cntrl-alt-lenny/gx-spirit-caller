/* CAMPAIGN-PREP candidate for func_02052c58 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     discriminant if-chain re-calling probe, three tail calls
 *   risk:       func_02053488 declared returning int but asm shows void tail; r5[9] is [r5,#0x24]. buf offsets 0x0/0xd from stack frame 0x24.
 *   confidence: low
 */
extern int func_0205337c(int a, int b, void *p);
extern void func_02053488(int a, int b, void *p);
extern int func_02053650(int a);
extern int func_02053688(int a);
extern int func_0205370c(int a);

int func_02052c58(int *r5, int r4) {
    char buf[0x24];
    if (func_02053688(r4) == 3) {
        return func_02053650(r4);
    }
    if (func_02053688(r4) == 2) {
        return func_02053488(func_0205370c(r4), r4, buf + 0);
    }
    if (func_02053688(r4) == 1) {
        return func_0205337c(r4, r5[9], buf + 0xd);
    }
    return 0;
}
