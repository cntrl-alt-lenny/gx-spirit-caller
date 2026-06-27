/* CAMPAIGN-PREP candidate for func_021c30bc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     split cf188 vs blk+0x1c addressing kept; unsigned cmps; u16 [+0x8a]->[+0x88]; bound reload [blk+0x1c]
 *   risk:       VERIFIED very close (loop body, split addressing, u16 move, bound reload all match); residual: leading index>=count return-0 is inline movcs;popcs vs orig bcs->standalone mov r0,#0 tail — inline-vs-branch layout, permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c30bc (ov002, class C) — MED tier.
 * UNVERIFIED build-free draft. Drop into src/, ninja+objdiff, tweak per risk.
 *   recipe:  remove-at-index shift; cf188==cf16c+0x1c (split addressing kept); u16 move +0x788; bound reload [blk+0x1c]
 * func_021c30bc(player, index): remove element at index -> shift the u32 array
 *   (+0x5d0, via 021b91c4 copy i+1->i) and the parallel u16 array (+0x788) down.
 *   count lives at cf188[base] == (cf16c block)+0x1c; decremented then stored;
 *   loop bound re-read from blk[+0x1c] each iteration (unsigned).
 *   return 0 if index>=count (nothing to do), else 1.
 */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf188[];
extern void func_ov002_021b91c4(int *dst, int *src);

int func_ov002_021c30bc(int player, int index)
{
    int base = (player & 1) * 0x868;
    int count = *(int *)(data_ov002_022cf188 + base);

    if ((unsigned int)index >= (unsigned int)count)
        return 0;

    count -= 1;
    *(int *)(data_ov002_022cf188 + base) = count;
    if ((unsigned int)index < (unsigned int)count) {
        char *blk = data_ov002_022cf16c + base;
        int  *a   = (int *)(blk + 0x5d0);
        int  *ai  = a + index;
        int   i   = index;
        do {
            func_ov002_021b91c4(ai, a + (i + 1));
            *(unsigned short *)(blk + i * 2 + 0x788) =
                *(unsigned short *)(blk + i * 2 + 0x78a);
            i++;
            ai++;
        } while ((unsigned int)i < *(unsigned int *)(blk + 0x1c));
    }
    return 1;
}
