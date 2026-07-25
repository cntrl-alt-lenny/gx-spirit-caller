/* CAMPAIGN-PREP candidate for func_020347c0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     switch dispatch (cmp#1/cmp#2) + tail-return calls + default 0
 *   risk:       callee returns treated as int (tail bl;ldmia) — exact unless they are void with different r0 handling
 *   confidence: high
 */
/* func_020347c0 — mode dispatch to two calls */

extern int func_020325e0(void);
extern int func_0209e35c(void);
extern int func_020454bc(void);

int func_020347c0(void)
{
    switch (func_020325e0()) {
    case 1:
        return func_0209e35c();
    case 2:
        return func_020454bc();
    }
    return 0;
}
