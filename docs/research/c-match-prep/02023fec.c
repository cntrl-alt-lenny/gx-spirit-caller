/* CAMPAIGN-PREP candidate for func_02023fec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD + invoke + clear-global (bind base across call)
 *   risk:       mwcc may CSE all three global refs into one register instead of the guard/r4 split; value could be int not pointer
 *   confidence: high
 */
/* func_02023fec: if *data_0219a8e4 (a pointer) is non-null, call
 * Task_InvokeLocked(*data_0219a8e4) then clear it; always return 1.
 * Two pool words = guard load (r0) + body base held in r4 for the
 * call arg and the clear. */
extern char data_0219a8e4[];
extern void Task_InvokeLocked(void *p);

int func_02023fec(void) {
    if (*(void **)data_0219a8e4 != 0) {
        Task_InvokeLocked(*(void **)data_0219a8e4);
        *(void **)data_0219a8e4 = 0;
    }
    return 1;
}
