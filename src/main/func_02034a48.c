/* CAMPAIGN-PREP candidate for func_02034a48 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     TAIL-CALL thunk: load 3 literal args, bx ip
 *   risk:       None observed; verified byte-exact. The three func-pointer literals are reloc .word entries (masked).
 *   confidence: high
 */
extern int func_02033054(int (*a)(void), int (*b)(void), int c);
extern int func_02034a38(void);
extern int Task_InvokeLocked(void);

int func_02034a48(void) {
    int (*invoke)(int (*a)(void), int (*b)(void), int c) = func_02033054;
    return invoke(func_02034a38, Task_InvokeLocked, 0);
}
