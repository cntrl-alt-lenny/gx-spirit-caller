/* CAMPAIGN-PREP candidate for func_02034238 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard (ldmeqia) + nested guarded calls + global store 0
 *   risk:       func_02046ae0 modeled no-arg here (vs 020338b8 1-arg); data_0219b2dc assumed int global
 *   confidence: high
 */
/* func_02034238 — guarded calls then clear a global */

extern int  func_02034184(void);
extern int  func_02046ae0(void);
extern void func_0203268c(void);
extern void func_02033864(void);
extern int  data_0219b2dc;

void func_02034238(void)
{
    if (!func_02034184())
        return;
    if (func_02046ae0() > 1) {
        func_0203268c();
        func_02033864();
    }
    data_0219b2dc = 0;
}
