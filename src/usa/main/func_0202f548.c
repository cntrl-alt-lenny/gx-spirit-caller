/* CAMPAIGN-PREP candidate for func_0202f548 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     chained-eq membership (|| of ==), base-CSE
 *   risk:       consecutive constants may instead emit a range/sub-compare; add-from-base offsets are 1 and 2
 *   confidence: high
 */
/* func_0202f548: membership over 0x1AD6, 0x1AD7(+1), 0x1AD8(+2).
 * Common base 0x1AD6 in r2, comparands via addne r1,r2,#1 / #2.
 *
 *     ldr r2,=0x1AD6; cmp r0,r2; addne r1,r2,#1; cmpne r0,r1
 *     addne r1,r2,#2; cmpne r0,r1; bne .L; mov r0,#1; bx lr
 */

int func_0202f548(int x) {
    switch (x) {
    case 0x1AD6:
    case 0x1AD7:
    case 0x1AD8:
        return 1;
    }
    return 0;
}
