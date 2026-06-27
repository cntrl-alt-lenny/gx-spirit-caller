/* CAMPAIGN-PREP candidate for func_0224b2e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ldmls count<=0; do/while; :13 id; min via if(v>=6)v=6 then re-call+movge branch
 *   risk:       min idiom: orig does `bl 0202b8a8; cmp #6; movge r0,#6; bge; bl 0202b8a8 again` (calls TWICE, GE skips second). A single `v=call();if(v>=6)v=6` won't re-emit the second call. permuter-class / may need explicit dup-call C.
 *   confidence: low
 */
/* func_ov002_0224b2e0: scan player's cf16c sub-array at +0x418 (count at
 * cf180[player]); for each entry whose :13 id has func_0202b878 type 0x11 and
 * 021c33e4(self,self,i) holds, take min(func_0202b8a8(id),6) and if it equals
 * arg2 post kind 14 via 02253458. cls D: count<=0 early-out (ldmls), min via
 * cmp/movge branch, :13 id bitfield. */
#include "ov002_core.h"
extern int func_0202b878(int a);
extern int func_0202b8a8(int a);
extern int func_ov002_021c33e4(int a, int b, int c);
void func_ov002_0224b2e0(int self, int arg1, int arg2) {
    char *base = (char *)data_ov002_022cf16c + (self & 1) * 0x868;
    char *ptr = base + 0x418;
    int i = 0;
    int count = *(int *)((char *)data_ov002_022cf180 + (self & 1) * 0x868);
    if (count <= 0)
        return;
    do {
        int id = ((struct Ov002Slot *)ptr)->id;
        if (func_0202b878(id) == 0x11 && func_ov002_021c33e4(self, self, i) != 0) {
            int v = func_0202b8a8(id);
            if (v >= 6)
                v = 6;
            if (arg2 == v)
                func_ov002_02253458(self, 14, i);
        }
        i++;
        ptr += 4;
    } while (i < *(int *)(base + 0x14));
}
