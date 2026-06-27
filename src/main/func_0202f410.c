/* CAMPAIGN-PREP candidate for func_0202f410 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     single-constant eq test (branch-form bool)
 *   risk:       compare result may emit moveq/movne instead of the bne/mov branch form; value is exact
 *   confidence: high
 */
/* func_0202f410: x == 0x1A6C as a 0/1 result, branch form.
 *
 *     ldr r1,=0x1A6C; cmp r0,r1; bne .L; mov r0,#1; bx lr
 *  .L: mov r0,#0; bx lr
 */

int func_0202f410(int x) {
    switch (x) {
    case 0x1A6C:
        return 1;
    }
    return 0;
}
