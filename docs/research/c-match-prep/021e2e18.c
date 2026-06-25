/* CAMPAIGN-PREP candidate for func_021e2e18 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     const-compare 0/1 via if/return (branch-form, not cmov)
 *   risk:       mwcc -O4 may still collapse to movne/moveq cond-move instead of the cmp;bne;mov;mov branch shape
 *   confidence: med
 */
/* func_ov002_021e2e18: leaf const-compare -> returns 0 when arg0==0x18ec else 1.
 * Written as if/return to bias toward the branch form (bne skip) the asm uses,
 * not the movne/moveq cond-move. */
int func_ov002_021e2e18(int arg0) {
    if (arg0 == 0x18ec)
        return 0;
    return 1;
}
