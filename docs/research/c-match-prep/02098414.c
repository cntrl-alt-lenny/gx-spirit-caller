/* CAMPAIGN-PREP candidate for func_02098414 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     BIND old=*gA across call (r4 callee-saved); store-after-call ordering
 *   risk:       orig stores gA UNCONDITIONALLY before the branch (one str r6); my if/else may duplicate the store into both arms. reshape-able: hoist `data_021a8320=newval;` above the if.
 *   confidence: med
 */
/* func_02098414 (main, class C) — IRQ-guarded global swap.
 * Save *gA into r4 (held across the call), DisableIrq, call f_020972d4(&gB),
 * store the new value into gA, and if the call returned nonzero call
 * f_02097258(&gB). RestoreIrq, return the OLD *gA.
 * gA = data_021a8320 (an int cell), gB = data_021a8334 (a table/struct addr
 * passed by-address). The saved IRQ token lives in r5, the old value in r4 —
 * both callee-saved across the two bl's. */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int token);
extern int  data_021a8320;          /* int cell, swapped */
extern int  data_021a8334[];        /* table/struct, passed by address */
extern void func_02097258(void *p);
extern int  func_020972d4(void *p);

int func_02098414(int newval) {
    int token;
    int old;
    token = OS_DisableIrq();
    old = data_021a8320;
    if (func_020972d4(data_021a8334) != 0) {
        data_021a8320 = newval;
        func_02097258(data_021a8334);
    } else {
        data_021a8320 = newval;
    }
    OS_RestoreIrq(token);
    return old;
}
