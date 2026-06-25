/* CAMPAIGN-PREP candidate for func_02068c08 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Lazy-init singleton guard; 6-arg call (2 on stack) returning the instance
 *   risk:       Stack-arg ordering for the two function-pointer args at [sp]/[sp+4]; return reloads the global; frame size 0xc.
 *   confidence: med
 */
/* func_02068c08: lazy singleton. If global already set, return it.
 * Else create via func_02054700(8, 0x64, 2, func_02068c90,
 * func_02068c7c, func_02068c6c), store into the global, return it.
 * The last two pointer args pass on the stack ([sp], [sp+4]). */

extern void *data_0219ecc8;
extern void func_02068c6c(void);
extern void func_02068c7c(void);
extern void func_02068c90(void);
extern void *func_02054700(int a, int b, int c, void (*f0)(void),
                           void (*f1)(void), void (*f2)(void));

void *func_02068c08(void) {
    if (data_0219ecc8 == 0) {
        data_0219ecc8 = func_02054700(8, 0x64, 2,
                                      func_02068c90, func_02068c7c, func_02068c6c);
    }
    return data_0219ecc8;
}
