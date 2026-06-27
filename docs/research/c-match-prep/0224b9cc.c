/* CAMPAIGN-PREP candidate for func_0224b9cc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if(arg2)else two do/while scans; rsb r6=1-p (and r6,#1); :13 id; two count<=0 outs
 *   risk:       the (1-player)&1 in the else: orig is `rsb r6,r7,#1; and r1,r6,#1` so r6=1-player is held and passed to 02253458 un-masked while only the index uses &1. If mwcc masks p everywhere, the 02253458 arg diverges. reshape-able (pass raw 1-player to sink, mask only the index).
 *   confidence: low
 */
/* func_ov002_0224b9cc: branch on arg2 into two near-identical scans of the
 * cf16c +0x418 sub-array (count cf180[p], at base+0x14). arg2==0 path uses
 * player arg0 + func_0202b878 type 2 + 021c33e4 guard; else path uses
 * (1-arg0) + func_0202e234 guard with no 021c33e4. Both post kind 14.
 * cls D: rsb (1-p) player flip, :13 id, two count<=0 early-outs. */
#include "ov002_core.h"
extern int func_0202b878(int a);
extern int func_0202e234(int a);
extern int func_ov002_021c33e4(int a, int b, int c);
void func_ov002_0224b9cc(int player, int arg1, int arg2) {
    int i;
    char *base;
    char *ptr;
    if (arg2 == 0) {
        base = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
        if (*(int *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) <= 0)
            return;
        ptr = base + 0x418;
        i = 0;
        do {
            int id = ((struct Ov002Slot *)ptr)->id;
            if (func_0202b878(id) == 2 && func_ov002_021c33e4(player, player, i) != 0)
                func_ov002_02253458(player, 14, i);
            i++;
            ptr += 4;
        } while (i < *(int *)(base + 0x14));
    } else {
        int p = 1 - player;
        base = (char *)data_ov002_022cf16c + (p & 1) * 0x868;
        if (*(int *)((char *)data_ov002_022cf180 + (p & 1) * 0x868) <= 0)
            return;
        ptr = base + 0x418;
        i = 0;
        do {
            int id = ((struct Ov002Slot *)ptr)->id;
            if (func_0202e234(id) != 0)
                func_ov002_02253458(p, 14, i);
            i++;
            ptr += 4;
        } while (i < *(int *)(base + 0x14));
    }
}
