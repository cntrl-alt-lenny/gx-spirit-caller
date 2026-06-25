/* CAMPAIGN-PREP candidate for func_020a5e04 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     if-guard then do-while retry-poll calling helper
 *   risk:       hoisting of constants (r5=0xd,r4=0,r6=1) into loop may reorder; first vs loop call CSE
 *   confidence: med
 */
/* func_020a5e04: probe func_02096358(0xd,arg,0); if nonzero, spin
 * WaitByLoop(1) until it goes zero. sp2p3 (.legacy.c).
 *
 *   if (func_02096358(0xd, arg, 0) == 0) return;
 *   do { WaitByLoop(1); } while (func_02096358(0xd, arg, 0) != 0);
 */

extern int  func_02096358(int a, int b, int c);
extern void WaitByLoop(int count);

void func_020a5e04(int arg) {
    if (func_02096358(0xd, arg, 0) == 0) return;
    do {
        WaitByLoop(1);
    } while (func_02096358(0xd, arg, 0) != 0);
}
