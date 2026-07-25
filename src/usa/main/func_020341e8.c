/* CAMPAIGN-PREP candidate for func_020341e8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard (ldmeqia) + nested guarded calls + global store 0
 *   risk:       func_02046a74 modeled no-arg here (vs 020338b8 1-arg); data_0219b1fc assumed int global
 *   confidence: high
 */
/* func_020341e8 — guarded calls then clear a global */

extern int  func_02034134(void);
extern int  func_02046a74(void);
extern void func_02032638(void);
extern void func_02033814(void);
extern int  data_0219b1fc;

void func_020341e8(void)
{
    if (!func_02034134())
        return;
    if (func_02046a74() > 1) {
        func_02032638();
        func_02033814();
    }
    data_0219b1fc = 0;
}
