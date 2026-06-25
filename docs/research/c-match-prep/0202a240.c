/* CAMPAIGN-PREP candidate for func_0202a240 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard+Task_InvokeLocked+clear, dual-pool alias, tail call
 *   risk:       if mwcc dedupes the two pool words the second .word collapses; volatile may add an extra reload
 *   confidence: high
 */
/* func_0202a240: null-check Task_InvokeLocked + clear, then tail call,
 * return 1. Uses the dual-pool-word trick: test reads data_0219a934,
 * store goes through data_0219a934_alias (same addr) so mwcc emits two
 * separate .word pool entries. volatile pointers force the reload. */

extern void Task_InvokeLocked(void *p);
extern void func_0202a998(void);

extern void *data_0219a934;
extern void *data_0219a934_alias;   /* SAME address - see symbols.txt */

int func_0202a240(void) {
    void * volatile *test_p  = (void * volatile *)&data_0219a934;
    void * volatile *store_p = (void * volatile *)&data_0219a934_alias;
    if (*test_p != 0) {
        Task_InvokeLocked(*store_p);
        *store_p = 0;
    }
    func_0202a998();
    return 1;
}
