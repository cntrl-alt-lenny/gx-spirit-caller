/* CAMPAIGN-PREP candidate for func_0226bb58 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     identical to 0226baf8; only the gated sink symbol differs (e234)
 *   risk:       Same addressing-fold shape as 0226baf8 (mla + add arg2*4 + load@0x120). If the sibling matches, this matches identically. reshape-able.
 *   confidence: med
 */
/* func_ov002_0226bb58 (ov002, cls C) — clone of 0226baf8, sink is
 * func_0202e234 instead of func_0202e328.
 *   if (arg0 == *(int*)(d016c+0xd94)) return 0;
 *   if (arg1 != 11) return 0;
 *   v = ((Ov002Slot*)(cf16c + (arg0&1)*0x868 + arg2*4 + 0x120))->id;
 *   return func_0202e234(v) ? 0x800 : 0; */
typedef unsigned char  u8;
typedef unsigned short u16;
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int  func_0202e234(int a);
int func_ov002_0226bb58(int arg0, int arg1, int arg2) {
    int v;
    if (arg0 == *(int *)(data_ov002_022d016c + 0xd94))
        return 0;
    if (arg1 != 0xb)
        return 0;
    v = ((struct Ov002Slot *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 +
                              arg2 * 4 + 0x120))->id;
    if (func_0202e234(v))
        return 0x800;
    return 0;
}
