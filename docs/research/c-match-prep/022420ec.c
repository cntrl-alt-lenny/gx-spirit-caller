/* CAMPAIGN-PREP candidate for func_022420ec (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     022575c8 void form; k high-byte; bit0 bitfield; if-assign != / == arms
 *   risk:       orig predicates both arms (movne#1;moveq#0 and moveq#1;movne#0); the two `cmp arg1, b0,lsr#31` fold the bitfield into the cmp. If mwcc materialises b0 first (lsl#31;lsr#31 then cmp) instead of `cmp r4,r0,lsr#31`, one mov diverges. reshape-able (compare-against-bitfield fold).
 *   confidence: med
 */
/* func_ov002_022420ec: require 022575c8; on the high byte k of u16 (self+6):
 * k==0 -> arg1 != self.b0; k==1 -> arg1 == self.b0; else 1.
 * Class C: guard-chain, bit0 extract, sibling predicate arms. */
#include "ov002_core.h"
extern int func_ov002_022575c8(void);

int func_ov002_022420ec(void *arg0, int arg1) {
    int k;
    int b0;
    if (func_ov002_022575c8() == 0) return 0;
    k = (*(u16 *)((char *)arg0 + 6) << 16) >> 24;
    if (k == 0) {
        b0 = ((struct Ov002Self *)arg0)->b0;
        return arg1 != b0;
    }
    if (k == 1) {
        b0 = ((struct Ov002Self *)arg0)->b0;
        return arg1 == b0;
    }
    return 1;
}
