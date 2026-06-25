/* CAMPAIGN-PREP candidate for func_02073e68 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     gated mask-complete predicate, inv-first AND, result/arg decl-order regs (.legacy.c)
 *   risk:       Relies on inv-first operand order for `and r0,r1,r5` and r4=result/r5=arg via decl order; data_0219eee8 typed int; sp2p3 routing.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02073e68 (main, class B).
 * UNVERIFIED build-free draft. Route -> src/main/func_02073e68.legacy.c
 * (mwcc 1.2/sp2p3): stmdb{r4,r5,lr}+sub sp,#4 + 2-step (ldmia{r4,r5,lr};
 * bx lr) epilogue => Style A .legacy.c.
 *   recipe:     predicate: gate on func_02073ed8(), mask-complete test
 *               ((~g & arg) == ~g) -> bool; inv-first commutative AND;
 *               result in r4, arg saved in r5 (decl order)
 */
/* func_02073e68(arg): r = 0; if (func_02073ed8()) {
 *   inv = ~data_0219eee8; if ((inv & arg) == inv) r = 1; } return r. */

extern int data_0219eee8;
extern int func_02073ed8(void);

int func_02073e68(int arg) {
    int r = 0;
    if (func_02073ed8() != 0) {
        int inv = ~data_0219eee8;
        if ((inv & arg) == inv)
            r = 1;
    }
    return r;
}
