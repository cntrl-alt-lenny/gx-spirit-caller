/* CAMPAIGN-PREP candidate for func_0207445c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard branch: ==0 fall-through else-call (bne to else)
 *   risk:       if mwcc inverts the test it would emit beq-to-else (768 first); low likelihood
 *   confidence: high
 */
/* func_0207445c: branch on a global flag to one of two void calls.
 * flag==0 -> func_020918d0 (fall-through), flag!=0 -> func_02091768
 * (the bne target). Both are plain calls, not tail-branches.
 */
extern int data_0219eef0;
extern void func_02091768(void);
extern void func_020918d0(void);

void func_0207445c(void) {
    if (data_0219eef0 == 0)
        func_020918d0();
    else
        func_02091768();
}
