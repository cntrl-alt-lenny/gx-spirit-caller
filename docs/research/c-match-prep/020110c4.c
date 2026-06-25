/* CAMPAIGN-PREP candidate for func_020110c4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store-order constant init; 0x1000 at f0/f10/f20, 0 elsewhere
 *   risk:       mwcc may reorder the zero stores or reuse the 0x1000 reg differently; struct vs array indexing
 *   confidence: high
 */
/* func_020110c4: initialise a 0x30-byte block: word[0],[4],[8]=0x1000
 * at indices 0,4,8 (offsets 0,0x10,0x20) and 0 everywhere else, in
 * ascending offset order. Leaf. */

void func_020110c4(int *p) {
    p[0] = 0x1000;
    p[1] = 0;
    p[2] = 0;
    p[3] = 0;
    p[4] = 0x1000;
    p[5] = 0;
    p[6] = 0;
    p[7] = 0;
    p[8] = 0x1000;
    p[9] = 0;
    p[10] = 0;
    p[11] = 0;
}
