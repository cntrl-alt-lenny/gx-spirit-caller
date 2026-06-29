/* CAMPAIGN-PREP candidate for func_02034810 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     switch dispatch (cmp#1/cmp#2) + tail-return calls + default 0
 *   risk:       callee returns treated as int (tail bl;ldmia) — exact unless they are void with different r0 handling
 *   confidence: high
 */
/* func_02034810 — mode dispatch to two calls */

extern int func_02032634(void);
extern int func_0209e450(void);
extern int func_02045564(void);

int func_02034810(void)
{
    switch (func_02032634()) {
    case 1:
        return func_0209e450();
    case 2:
        return func_02045564();
    }
    return 0;
}
