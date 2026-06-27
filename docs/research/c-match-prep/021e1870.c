/* CAMPAIGN-PREP candidate for func_021e1870 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: d0250 :13 lookup; 3x if-assign flag pack (mov#0;movne); arg-pack; branch tail
 *   risk:       reg-alloc/decl-order: orig parks arg1->r4, arg0->r5, arg2->r7, id13->r6 across the first call (5 callee-saved). mwcc's allocation order for the 4 held values likely diverges before the 0x33 pack. permuter-class.
 *   confidence: low
 */
/* func_ov002_021e1870: if func_ov002_021ca5bc(arg1, id13) returns 0, post a 0x33
 * event via func_ov002_021d479c (flags from func_0202e2c8(id13), arg2, arg0) then
 * call func_ov002_02244fe4(0x24, 0); else tail func_ov002_021e1414(arg0, arg1, arg2).
 * id13 = 13-bit field of d0250[arg1]. */
#include "ov002_core.h"

extern unsigned short data_ov002_022d0250[];
extern int func_0202e2c8(int id);
extern int func_ov002_021ca5bc(int player, int id);
extern int func_ov002_021e1414(int a, int b, int c);
extern int func_ov002_02244fe4(int a, int b);

struct SlotU16e { unsigned short id : 13; };

int func_ov002_021e1870(int arg0, int arg1, int arg2) {
    unsigned int id = ((struct SlotU16e *)((char *)data_ov002_022d0250 + arg1 * 4))->id;
    int p1;
    int p2;
    if (func_ov002_021ca5bc(arg1, id) != 0)
        return func_ov002_021e1414(arg0, arg1, arg2);
    p1 = func_0202e2c8(id) ? 12 : 13;
    p2 = arg2 ? 1 : 0;
    func_ov002_021d479c((unsigned short)((arg0 ? 0x8000 : 0) | 0x33),
                        (unsigned short)p1,
                        (unsigned short)p2,
                        (unsigned short)arg1);
    return func_ov002_02244fe4(0x24, 0);
}
