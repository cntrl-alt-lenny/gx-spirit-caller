/* CAMPAIGN-PREP candidate for func_020347f4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch + tail calls; bool-negate via ==0 (moveq/movne)
 *   risk:       None observed; verified byte-exact. Callee signatures inferred (all void->int); only bl reloc payloads differ, masked.
 *   confidence: high
 */
extern int func_0201cf8c(void);
extern int func_020325e0(void);
extern int func_02046a58(void);

int func_020347f4(void) {
    switch (func_020325e0()) {
    case 1:
        return func_0201cf8c();
    case 2:
        return func_02046a58() == 0;
    }
    return 0;
}
