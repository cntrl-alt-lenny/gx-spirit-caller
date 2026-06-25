/* CAMPAIGN-PREP candidate for func_0201942c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dense range switch -> addls jump-table, case0 returns 0 else 1
 *   risk:       case0-and-default both return 0 may collapse to a range compare instead of the 18-arm jump table; table arm layout must match exactly
 *   confidence: med
 */
/* func_0201942c: range classifier. asm subtracts 0x4c, range-checks <=0x11,
 * then an 18-entry `addls pc` jump table: index 0 -> return 0, indices 1..17 ->
 * return 1; out-of-range (x<0x4c or x>0x5d) falls through to `b .L_27c` -> 0.
 * Net: returns 1 iff x in [0x4d,0x5d], else 0. Written as a dense switch so
 * mwcc emits the jump table rather than a `sub;cmp;movls` range compare. */
int func_0201942c(int x) {
    switch (x) {
    case 0x4c: return 0;
    case 0x4d: case 0x4e: case 0x4f: case 0x50: case 0x51:
    case 0x52: case 0x53: case 0x54: case 0x55: case 0x56:
    case 0x57: case 0x58: case 0x59: case 0x5a: case 0x5b:
    case 0x5c: case 0x5d:
        return 1;
    default:
        return 0;
    }
}
