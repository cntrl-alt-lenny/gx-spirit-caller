/* CAMPAIGN-PREP candidate for func_021d7268 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u16 d0250 :13 id; kind ternary 0xc/0xd; (arg2==0)?1:0 ternary; asym-shift packs
 *   risk:       reshape-able: kind=cond?0xc:0xd and the (arg2==0)?1:0 flag must emit movne/moveq pairs in the orig's order; if mwcc inverts the predicate or picks the wrong build reg, swap the ternary polarity / try if-assign for the flag.
 *   confidence: med
 */
/* func_ov002_021d7268 (ov002, cls D): guard (021b99b4>=0), pick kind 0xc/0xd
 * from a d0250 slot-id query, then arg-pack into 021d479c; returns 1 on the
 * packed path, 0 on the guard-fail tail. d0250 is a u16 table strided by
 * arg1*4; id is a 13-bit field. */
#include "ov002_core.h"

extern int  func_ov002_021b99b4(int a, int b, int c);
extern int  func_0202e2c8(int id);
extern void func_ov002_021d479c(int packed, int a, int b, int c);
extern void func_ov002_02244fe4(int a, int b);
extern char data_ov002_022d0250[];

struct SlotH { u16 id : 13; };

int func_ov002_021d7268(int arg0, int arg1, int arg2) {
    int kind;
    if (func_ov002_021b99b4(arg0, arg1, arg2) < 0)
        return 0;
    kind = func_0202e2c8(((struct SlotH *)(data_ov002_022d0250 + arg1 * 4))->id) ? 0xc : 0xd;
    func_ov002_021d479c(0x3f,
                        (u16)(((arg0 & 1) | 0x1c) | ((unsigned int)(arg1 << 22) >> 16)),
                        (u16)(((arg0 & 1) | ((kind & 0x1f) << 1)) | (((arg2 == 0) ? 1 : 0) << 6)),
                        0);
    func_ov002_02244fe4(0x24, 0);
    return 1;
}
