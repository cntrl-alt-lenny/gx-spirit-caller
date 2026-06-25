/* CAMPAIGN-PREP candidate for func_0209d488 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     while-rotation (dup call) + loop-invariant const hoist; .legacy.c
 *   risk:       hoist of 0xe->r5 / 0->r4 callee-saved could pick different regs; otherwise structurally exact
 *   confidence: med
 */
/* file: src/main/func_0209d488.legacy.c  (mwcc 1.2/sp2p3)
 * `sub sp,#4` + 2-step `ldmia {...,lr}; bx lr` (incl. ldmeqia guard) =>
 * Style A => .legacy.c. Send a command (func_02096358(0xe,a,0)); if it
 * fails (0) return; otherwise poll: WaitByLoop(delay) then resend, while
 * it keeps returning nonzero. -O4 while-rotation duplicates the call
 * (matches the two bl func_02096358) and hoists the loop-invariant
 * constants 0xe and 0 into callee-saved r5/r4. WaitByLoop is the BIOS
 * SWI-3 thunk (src/main/WaitByLoop.c). */

extern int  func_02096358(int cmd, int a, int c);
extern void WaitByLoop(int count);

void func_0209d488(int a, int delay) {
    while (func_02096358(0xe, a, 0) != 0) {
        WaitByLoop(delay);
    }
}
