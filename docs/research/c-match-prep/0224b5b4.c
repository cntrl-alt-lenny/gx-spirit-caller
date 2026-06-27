/* CAMPAIGN-PREP candidate for func_0224b5b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     count<=0 early-out; do/while; :13 id; reload word; raw shifts; *2+topbit r3 arg
 *   risk:       loop holds consts r5=11,r4=0x12a1,fp=13 across iters; mwcc -O4 may reload/recolor these or fold the 021b3fd8 r3 packing differently across the loop body. reshape-able (hoist consts) but recolor risk = permuter-class.
 *   confidence: low
 */
/* func_ov002_0224b5b4: scan player's cf16c sub-array at +0x260 (count at
 * cf17c[player]); for each entry with func_0202e234(id) set, 021ca440(self,id)
 * set, and 021b3fd8(self, 11, 0x12a1, 2*B+topbit)==0, post kind 13 via 02253458.
 * cls D: count<=0 early-out, :13 id, B/C asymmetric extract from RELOADED word
 * passed as the 4th (r3) arg. */
#include "ov002_core.h"
extern int func_0202e234(int a);
extern int func_ov002_021ca440(int self, int id);
extern int func_ov002_021b3fd8(int a, int b, int c, int d);
void func_ov002_0224b5b4(int self, int arg1, int arg2) {
    char *base = (char *)data_ov002_022cf16c + (self & 1) * 0x868;
    char *ptr = base + 0x260;
    int i = 0;
    int count = *(int *)((char *)data_ov002_022cf17c + (self & 1) * 0x868);
    if (count <= 0)
        return;
    do {
        int id = ((struct Ov002Slot *)ptr)->id;
        if (func_0202e234(id) != 0 && func_ov002_021ca440(self, id) != 0) {
            unsigned int word = *(unsigned int *)ptr;
            if (func_ov002_021b3fd8(self, 11, 0x12a1,
                    (int)(((unsigned)(word << 2) >> 24) * 2 + ((unsigned)(word << 18) >> 31))) == 0)
                func_ov002_02253458(self, 13, i);
        }
        i++;
        ptr += 4;
    } while (i < *(int *)(base + 0x10));
}
