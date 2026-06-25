/* CAMPAIGN-PREP candidate for func_021b2e00 (ov007, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Counted loop of fixed calls + movs/beq break (constant hoist)
 *   risk:       loop counter unbounded in asm (breaks only on null); the 5 hoisted constants (0xd,3,-0x1a,4,5) must stay in callee-saved regs across the loop or order may shift
 *   confidence: med
 */
/* func_ov007_021b2e00: for(i=0;;i++) build cells from func_02021660(a1,3,i);
 * stop when it returns 0. For each non-null h:
 *   func_020216b0(h, 0xd, a2);
 *   func_020216b0(h, 3, 0);
 *   func_020216b0(h, 4, 0);
 *   func_020216b0(h, 5, -0x1a);
 * Returns 1. (literal column index 3 reused from `mov fp,#0x3`.)
 */

extern int  func_02021660(int a, int b, int c);
extern void func_020216b0(int a, int b, int c);

int func_ov007_021b2e00(int unused, int a1, int a2) {
    int i = 0;
    int h;
    for (;;) {
        h = func_02021660(a1, 3, i);
        if (h == 0) break;
        func_020216b0(h, 0xd, a2);
        func_020216b0(h, 3, 0);
        func_020216b0(h, 4, 0);
        func_020216b0(h, 5, -0x1a);
        i++;
    }
    return 1;
}
