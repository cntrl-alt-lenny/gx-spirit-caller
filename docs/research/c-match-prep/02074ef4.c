/* CAMPAIGN-PREP candidate for func_02074ef4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two state==const guards returning bool
 *   risk:       second check emits movne#1/moveq#0 pair; mwcc may fold differently if written as ==
 *   confidence: high
 */
extern int func_02075928(void *a);

int func_02074ef4(void *p)
{
    if (func_02075928(p) != 7)
        return 1;
    if (func_02075928(p) != 6)
        return 1;
    return 0;
}
