/* CAMPAIGN-PREP candidate for func_02005b1c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch returning consts/0 + commutative accumulator-first add
 *   risk:       mwcc may lay the two cmp/beq tests vs a jump-table; switch-vs-if-chain ordering could flip a branch.
 *   confidence: med
 */
/* func_02005b1c: switch(sel) returns base ptr/0, then adds (i << 5).
 *   cmp r0,#1; beq -> data_02103c8c[0]
 *   cmp r0,#2; beq -> data_02103c8c[1]
 *   else 0
 *   result = base + (i << 5)   (add r0,r0,r1,lsl#5  accumulator-first)
 */

extern int data_02103c8c[];

int func_02005b1c(int sel, int i) {
    int base;
    switch (sel) {
    case 1:
        base = data_02103c8c[0];
        break;
    case 2:
        base = data_02103c8c[1];
        break;
    default:
        base = 0;
        break;
    }
    return base + (i << 5);
}
