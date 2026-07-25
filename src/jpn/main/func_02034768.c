/* CAMPAIGN-PREP candidate for func_02034768 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     switch dispatch (cmp#1/cmp#2 sequential) + global guard + (>=2 movge)
 *   risk:       case 1 returns func_0201cf4c() value (may be void); data_0219b1fc assumed int
 *   confidence: high
 */
/* func_02034768 — mode dispatch (1,2) */

extern int func_020325e0(void);
extern int func_0201cf4c(void);
extern int func_02046a74(void);
extern int data_0219b1fc;

int func_02034768(void)
{
    switch (func_020325e0()) {
    case 1:
        return func_0201cf4c();
    case 2:
        if (data_0219b1fc != 0) {
            if (func_02046a74() >= 2)
                return 1;
        }
        return 0;
    }
    return 0;
}
