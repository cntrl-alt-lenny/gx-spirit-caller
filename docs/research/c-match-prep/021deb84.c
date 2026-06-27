/* CAMPAIGN-PREP candidate for func_021deb84 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: stack-struct field-store order; f2 bit0 as :1 bitfield (bic+orr); r1 pass-through
 *   risk:       STORE-ORDER: orig zeroes word0 first then writes the strh f2 LAST after the 5 word-stores; mwcc may emit f2 store earlier -> store-reorder near-miss. struct-guessed (0x18/6-word self type inferred). permuter-class.
 *   confidence: low
 */
/* func_ov002_021deb84: build a zeroed 0x18 self-struct on the stack, set its f2
 * bit0 to (arg0 & 1), and dispatch via func_ov002_021de134(self, arg1, 14, 0x1000).
 * arg1 is forwarded straight through to the sink (kept live in r1). */
#include "ov002_core.h"

extern int func_ov002_021de134(void *self, int mask, int kind, int d);

struct Ov002SelfArg {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short : 15;
    unsigned int w1;
    unsigned int w2;
    unsigned int w3;
    unsigned int w4;
    unsigned int w5;
};

int func_ov002_021deb84(int arg0, int arg1) {
    struct Ov002SelfArg s;
    s.f0 = 0;
    s.b0 = (unsigned short)arg0 & 1;
    s.w1 = 0;
    s.w2 = 0;
    s.w3 = 0;
    s.w4 = 0;
    s.w5 = 0;
    return func_ov002_021de134(&s, arg1, 14, 0x1000);
}
