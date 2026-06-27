/* CAMPAIGN-PREP candidate for func_02205ca0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :5 bitfield gate + global==2 + call-guard, else forward
 *   risk:       reshape-able: short-circuit && must lay the three guards branching to the shared forward (.L_44). If mwcc inlines a return-2 path the branch topology diverges; reorder as nested ifs. Twin of matched 02205c30.
 *   confidence: med
 */
/* func_ov002_02205ca0 (ov002, D) — gate on f2.field5(:5) >= 5 AND a global
 * (d016c+0xcf8)==2 AND 021bb068(0x13f2)==0 -> return 2; else forward to
 * 022059d8(self, arg1).
 *   field5 = [r5,#2] lsl#0x1a;lsr#0x1b -> :5 after b0:1
 *   bcc .L_44 -> if field5 < 5 skip straight to the forward. */
typedef unsigned short u16;
struct S02205ca0 { u16 f0; u16 b0 : 1; u16 field5 : 5; u16 rest : 10; };

extern char data_ov002_022d016c[];
extern int  func_ov002_021bb068(int magic);
extern int  func_ov002_022059d8(struct S02205ca0 *self, int arg1);

int func_ov002_02205ca0(struct S02205ca0 *self, int arg1) {
    if (self->field5 >= 5
        && *(int *)(data_ov002_022d016c + 0xcf8) == 2
        && func_ov002_021bb068(0x13f2) == 0)
        return 2;
    return func_ov002_022059d8(self, arg1);
}
