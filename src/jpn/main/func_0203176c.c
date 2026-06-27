/* CAMPAIGN-PREP candidate for func_0203176c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     single-constant eq test (branch-form bool)
 *   risk:       may emit moveq/movne instead of branch form; value 0x1A9F is exact
 *   confidence: high
 */
/* func_0203176c: x == 0x1A9F as a 0/1 result, branch form.
 *
 *     ldr r1,=0x1A9F; cmp r0,r1; bne .L; mov r0,#1; bx lr
 *  .L: mov r0,#0; bx lr
 */

int func_0203176c(int x) {
    switch (x) {
    case 0x1A9F:
        return 1;
    }
    return 0;
}
