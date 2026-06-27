/* CAMPAIGN-PREP candidate for func_0226c5f4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sum-first; double-mla +0x30; :13 bitfield ==0; bare a!=b -> movne#1/moveq#0 3rd arg
 *   risk:       Double-mla chain (mla then mla onto its result, load@0x30): mwcc may emit add instead of the second mla, or reorder. arg0/sum=r5/r4 across both calls. reshape-able-ish; chain-shape possibly permuter-class.
 *   confidence: med
 */
/* func_ov002_0226c5f4 (ov002, cls C) — player+sum guards, :13 slot-set check,
 * then two guarded calls before success.
 *   sum = arg1+arg2;
 *   if (arg0 != *(int*)(d016c+0xd94)) return 0;
 *   if (sum > 4) return 0;
 *   if (((Ov002Slot*)(cf16c + (arg0&1)*0x868 + sum*0x14 + 0x30))->id == 0)
 *       return 0;
 *   if (func_021c1a2c(arg0, sum, 0x142a) == 0) return 0;
 *   if (func_021c1d28(arg0, sum, arg0 != *(u16*)(d0e6c+0xa2))) return 0;
 *   return 0x800;
 * Double-mla chain: base + (arg0&1)*0x868 + sum*0x14, +0x30 folds into the
 * load; id is a :13 BITFIELD tested for ==0 (movs lsr). sum computed first
 * (orig hoists arg1+arg2 above the first guard). */
typedef unsigned char  u8;
typedef unsigned short u16;
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern int  func_ov002_021c1a2c(int a, int b, int c);
extern int  func_ov002_021c1d28(int a, int b, int c);
int func_ov002_0226c5f4(int arg0, int arg1, int arg2) {
    int sum;
    sum = arg1 + arg2;
    if (arg0 != *(int *)(data_ov002_022d016c + 0xd94))
        return 0;
    if (sum > 4)
        return 0;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 +
                              sum * 0x14 + 0x30))->id == 0)
        return 0;
    if (func_ov002_021c1a2c(arg0, sum, 0x142a) == 0)
        return 0;
    if (func_ov002_021c1d28(arg0, sum,
                            arg0 != *(u16 *)(data_ov002_022d0e6c + 0xa2)))
        return 0;
    return 0x800;
}
