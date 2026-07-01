/* CAMPAIGN-PREP candidate for func_0207d994 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two flag-gated tail calls (bit tests), sp3 frame
 *   risk:       ROUTE AS *.legacy_sp3.c (3-reg push, sub sp #4, pop pc). r5/r4 arg cache order and the second-bit early-return epilogue may differ
 *   confidence: med
 */
/* func_0207d994 (main, class A, 0x38) — two flag-gated tail calls.
 *   push {r4,r5,lr}; sub sp,#4; mov r4,r1; mov r5,r0;
 *   ands r1,r4,#1; beq .L_1c; bl func_0207da8c;
 * .L_1c: ands r0,r4,#2; addeq sp,#4; ldmeqia sp!,{r4,r5,pc};
 *   mov r0,r5; bl func_0207da5c; add sp,#4; ldmia sp!,{r4,r5,pc}
 * if (flags & 1) func_0207da8c(p); if (flags & 2) func_0207da5c(p).
 * 3 saved regs + sub sp #4 + pop {regs,pc} == sp3 signature ->
 * MUST be compiled as *.legacy_sp3.c (mwcc 1.2/sp3).
 */

extern void func_0207da8c(void *p);
extern void func_0207da5c(void *p);

void func_0207d994(void *p, int flags) {
    if (flags & 1) {
        func_0207da8c(p);
    }
    if (flags & 2) {
        func_0207da5c(p);
    }
}
