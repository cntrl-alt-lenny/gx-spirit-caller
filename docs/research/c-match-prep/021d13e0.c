/* CAMPAIGN-PREP candidate for func_021d13e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: set/clear via 1<<bit / ~(1<<bit); value-temp form (read+compute per arm) for the single merged str; sel before bit decl-order
 *   risk:       reshape-able: store-merge. Orig has ONE str at the join (value-temp). If mwcc emits two stores, this IS the value-temp form; if it hoists the d016c base undesirably, switch to bound-p with |=/&= (gives the 021c9b2c two-store shape).
 *   confidence: med
 */
/* func_ov002_021d13e0 (cls D): set/clear bit (idx) of the d016c+0xd0 word
 * depending on the @+4 selector, post 0x24, clear ce950+0x80c. Single merged
 * store => value-temp form (compute new word per arm, store once). */
typedef unsigned short u16;
extern char data_ov002_022ce950[];
extern char data_ov002_022d016c[];
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);

void func_ov002_021d13e0(void) {
    int sel = *(u16 *)(data_ov002_022ce950 + 4);
    int bit = *(u16 *)(data_ov002_022ce950 + 2);
    int v;
    if (sel != 0)
        v = *(int *)(data_ov002_022d016c + 0xd0) | (1 << bit);
    else
        v = *(int *)(data_ov002_022d016c + 0xd0) & ~(1 << bit);
    *(int *)(data_ov002_022d016c + 0xd0) = v;
    func_ov002_0229ade0(0x24, 0, 0, 0);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
