/* CAMPAIGN-PREP candidate for func_0207ce50 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     unsigned threshold ladder -> movcs/bcs cascade; sp2p3 tier
 *   risk:       mwcc may reorder thresholds or use a table; ladder must keep descending-test order; ret reg r1->r0 move
 *   confidence: high
 */
/* func_0207ce50: threshold ladder (class B) returning 0/1/2/3 by unsigned
 * thresholds of func_0207ce90(). cmp/movcs/bcs cascade == if/else-if with
 * UNSIGNED compares (>=). Style A epilogue with sub-sp, push {lr} ->
 * `.legacy.c` (mwcc 1.2/sp2p3). Default 0 then conditional moves. */

extern unsigned int func_0207ce90(void);

int func_0207ce50(void) {
    unsigned int v = func_0207ce90();
    int r = 0;
    if (v >= 0x1c) {
        r = 3;
    } else if (v >= 0x16) {
        r = 2;
    } else if (v >= 0x10) {
        r = 1;
    }
    return r;
}
