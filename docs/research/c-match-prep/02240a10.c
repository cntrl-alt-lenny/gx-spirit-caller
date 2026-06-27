/* CAMPAIGN-PREP candidate for func_02240a10 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (u8) byte-pack lever; fall-through via goto chk0; b0 bitfield; if-assign compare
 *   risk:       the k-dispatch order: orig tests cmp#0(beq),cmp#1,cmp#2,bne-default; the goto chk0 fall-through (k==0 and k==1-miss share L_84) must keep that exact branch layout. mwcc may reorder the switch arms or predicate the b0!=arg1 (movne/moveq). reshape-able (dispatch-order/if-assign) but fragile.
 *   confidence: low
 */
/* func_ov002_02240a10: require 022575c8; dispatch on the high byte k of u16
 * (self+6). k==2: self.b0 != arg1. k==1: 0 if 0223de94(self,0) equals the
 * (arg1,arg2) byte-pack, else fall to the k==0 test. k==0: 1 if arg1==self.b0.
 * default/else: 0. Class C: guard-chain + (u8) byte-pack. */
#include "ov002_core.h"
extern int func_ov002_022575c8(void *a, int b, int c);
extern u16 func_ov002_0223de94(void *node, int idx);

int func_ov002_02240a10(void *arg0, int arg1, int arg2) {
    int k;
    int b0;
    if (func_ov002_022575c8(arg0, arg1, arg2) == 0) return 0;
    k = (*(u16 *)((char *)arg0 + 6) << 16) >> 24;
    if (k == 0) goto chk0;
    if (k == 1) {
        if (func_ov002_0223de94(arg0, 0) ==
            (u16)((u8)arg1 | ((u8)arg2 << 8))) return 0;
        goto chk0;
    }
    if (k == 2) {
        b0 = ((struct Ov002Self *)arg0)->b0;
        return b0 != arg1;
    }
    return 0;
chk0:
    if (arg1 == ((struct Ov002Self *)arg0)->b0) return 1;
    return 0;
}
