/* CAMPAIGN-PREP candidate for func_021c29bc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     void return; movcc lo/hi if-assign; mla cell at lo; cond f40 |= 0x20 (orrne) store-back
 *   risk:       VERIFIED matches orig except lo/hi register assignment (mine lo->r5,hi->r4 vs orig lo->r4,hi->r5; cmp/mla use swapped regs) = callee-saved register-mirror coin-flip, permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c29bc (ov002, class C) — MED tier.
 * UNVERIFIED build-free draft. Drop into src/, ninja+objdiff, tweak per risk.
 *   recipe:  0202e234 picks [0,4]/[5,9]; mla cell at lo; cond f40 |= 0x20 store-back
 * func_021c29bc(player, arg1): for idx in (0202e234(arg1)?[0,4]:[5,9]),
 *   if 021baca8(player,idx,arg1) != 0 then cell[idx].f40 |= 0x20.
 */

extern char data_ov002_022cf16c[];
extern int  func_0202e234(int x);
extern int  func_ov002_021baca8(int a, int b, int c);

void func_ov002_021c29bc(int player, int arg1)
{
    int lo, hi;
    char *cell;
    int i;

    if (func_0202e234(arg1) != 0) {
        lo = 0;
        hi = 4;
    } else {
        lo = 5;
        hi = 9;
    }
    if (lo > hi)
        return;

    cell = data_ov002_022cf16c + (player & 1) * 0x868 + lo * 0x14;
    i = lo;
    do {
        if (func_ov002_021baca8(player, i, arg1) != 0)
            *(int *)(cell + 0x40) |= 0x20;
        i++;
        cell += 0x14;
    } while (i <= hi);
}
