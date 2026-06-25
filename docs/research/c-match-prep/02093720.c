/* CAMPAIGN-PREP candidate for func_02093720 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag-guard init (u16) + ordered zero stores + call + 2 trailing clears
 *   risk:       Original uses r12(ip) for the flag-1 and r3 for zero; mwcc may pick different scratch regs. Store order (data_..e8 pair before call, then ..e4 / ..e0 after) and arg-8 scheduling may reorder.
 *   confidence: med
 */
/* func_02093720: one-shot init guarded by a u16 flag at data_021a66dc.
 * Sets the flag, zeroes a two-word block at data_021a66e8, calls
 * func_020905dc(4), then clears data_021a66e4 and data_021a66e0.
 * Store order preserved (the two e8 words precede the call; e4 then e0
 * follow it). */

extern unsigned short data_021a66dc;   /* init flag */
extern int            data_021a66e0;
extern int            data_021a66e4;
extern int            data_021a66e8[2];
extern void           func_020905dc(int);

void func_02093720(void)
{
    if (data_021a66dc) return;
    data_021a66dc = 1;

    data_021a66e8[0] = 0;
    data_021a66e8[1] = 0;

    func_020905dc(4);

    data_021a66e4 = 0;
    data_021a66e0 = 0;
}
