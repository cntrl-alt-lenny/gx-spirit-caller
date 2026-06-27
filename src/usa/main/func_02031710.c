/* CAMPAIGN-PREP candidate for func_02031710 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     chained-eq membership (|| of ==), base-CSE
 *   risk:       mwcc may emit comparands as separate literals; add-from-base offsets 0xB8 and 0x180
 *   confidence: high
 */
/* func_02031710: membership over 0x1652, 0x170A(+0xB8), 0x17D2(+0x180).
 * Common base 0x1652 held in r2, comparands via addne r1,r2,#K.
 *
 *     ldr r2,=0x1652; cmp r0,r2; addne r1,r2,#0xB8; cmpne r0,r1
 *     addne r1,r2,#0x180; cmpne r0,r1; bne .L; mov r0,#1; bx lr
 */

int func_02031710(int x) {
    switch (x) {
    case 0x1652:
    case 0x170A:
    case 0x17D2:
        return 1;
    }
    return 0;
}
