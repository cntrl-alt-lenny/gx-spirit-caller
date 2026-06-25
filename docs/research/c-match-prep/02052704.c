/* CAMPAIGN-PREP candidate for func_02052704 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     cmp chain returning constant (DISPATCH); leaf bx lr
 *   risk:       pure leaf; (r0 in {2,3,4})->0xc else 0x8; compare-order matches source 2,3,4
 *   confidence: high
 */
/* func_02052704 -> src/main/func_02052704.c (mwcc 2.0/sp1p5 default; leaf, bx lr) */
int func_02052704(int x) {
    if (x == 2 || x == 3 || x == 4)
        return 0xc;
    return 0x8;
}
