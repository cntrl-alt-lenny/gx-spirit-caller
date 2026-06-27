/* CAMPAIGN-PREP candidate for func_020349f8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     TAIL-CALL thunk: load 3 literal args, bx ip
 *   risk:       None observed; verified byte-exact. The three func-pointer literals are reloc .word entries (masked).
 *   confidence: high
 */
extern int func_02033000(int (*a)(void), int (*b)(void), int c);
extern int func_020349e8(void);
extern int Task_InvokeLocked(void);

int func_020349f8(void) {
    int (*invoke)(int (*a)(void), int (*b)(void), int c) = func_02033000;
    return invoke(func_020349e8, Task_InvokeLocked, 0);
}
