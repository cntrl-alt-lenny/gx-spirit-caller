/* CAMPAIGN-PREP candidate for func_021d0f48 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     2-arm state-counter: post+inc / poll+predicated-clear; shared cmd hoist
 *   risk:       if mwcc fails to hoist the shared mov r0,#1, each arm materializes it separately (1-insn diff)
 *   confidence: high
 */
/* func_ov002_021d0f48: 2-arm state-counter. state==0 -> post event 1 and
 * increment the counter; else poll event 1 and on done clear f_80c. cmd=1
 * is the first arg to both sinks so mwcc hoists mov r0,#1 above the branch. */

typedef struct {
    char         _a[0x80c];
    unsigned int f_80c;
    unsigned int f_810;
} StateCe950;

extern StateCe950 data_ov002_022ce950;
extern int func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int func_ov002_0229c7f8(int a);

void func_ov002_021d0f48(void) {
    if (data_ov002_022ce950.f_810 == 0) {
        func_ov002_0229ade0(1, 0, 0, 0);
        data_ov002_022ce950.f_810++;
    } else if (func_ov002_0229c7f8(1) == 0) {
        data_ov002_022ce950.f_80c = 0;
    }
}
