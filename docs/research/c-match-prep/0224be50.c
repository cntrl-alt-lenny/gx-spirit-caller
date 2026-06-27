/* CAMPAIGN-PREP candidate for func_0224be50 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     count<=0 out; do/while; :13 id; reload word; raw shifts *2+topbit r3; arg2 live in r9
 *   risk:       deep loop reg pressure (sl,r9,fp,r4 held: self, arg2, 0x12a1, 11 const across iters). mwcc -O4 likely recolors / reloads these vs the orig's fixed callee-saved assignment. permuter-class (whole-loop register colouring), C reshape unlikely to fully fix.
 *   confidence: low
 */
/* func_ov002_0224be50: scan player's cf16c +0x260 sub-array (count cf17c[p], at
 * base+0x10); for each entry with func_0202e234(id), func_0202df78(id,arg2),
 * and 021ca440(self,id) all set, and 021b3fd8(self, 11, 0x12a1, 2*B+topbit)==0,
 * post kind 13 via 02253458. cls D: count<=0 out, :13 id, B/C asymmetric extract
 * from RELOADED word as r3 arg; arg2 held in r9 across loop. */
#include "ov002_core.h"
extern int func_0202e234(int a);
extern int func_0202df78(int id, int arg2);
extern int func_ov002_021ca440(int self, int id);
extern int func_ov002_021b3fd8(int a, int b, int c, int d);
void func_ov002_0224be50(int self, int arg1, int arg2) {
    char *base = (char *)data_ov002_022cf16c + (self & 1) * 0x868;
    char *ptr;
    int i = 0;
    int count = *(int *)((char *)data_ov002_022cf17c + (self & 1) * 0x868);
    if (count <= 0)
        return;
    ptr = base + 0x260;
    do {
        int id = ((struct Ov002Slot *)ptr)->id;
        if (func_0202e234(id) != 0 && func_0202df78(id, arg2) != 0
            && func_ov002_021ca440(self, id) != 0) {
            unsigned int word = *(unsigned int *)ptr;
            if (func_ov002_021b3fd8(self, 11, 0x12a1,
                    (int)(((unsigned)(word << 2) >> 24) * 2 + ((unsigned)(word << 18) >> 31))) == 0)
                func_ov002_02253458(self, 13, i);
        }
        i++;
        ptr += 4;
    } while (i < *(int *)(base + 0x10));
}
