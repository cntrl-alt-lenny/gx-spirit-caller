/* CAMPAIGN-PREP candidate for func_020347b8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     switch dispatch (cmp#1/cmp#2 sequential) + global guard + (>=2 movge)
 *   risk:       case 1 returns func_0201cfa0() value (may be void); data_0219b2dc assumed int
 *   confidence: high
 */
/* func_020347b8 — mode dispatch (1,2) */

extern int func_02032634(void);
extern int func_0201cfa0(void);
extern int func_02046ae0(void);
extern int data_0219b2dc;

int func_020347b8(void)
{
    switch (func_02032634()) {
    case 1:
        return func_0201cfa0();
    case 2:
        if (data_0219b2dc != 0) {
            if (func_02046ae0() >= 2)
                return 1;
        }
        return 0;
    }
    return 0;
}
