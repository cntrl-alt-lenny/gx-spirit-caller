/* CAMPAIGN-PREP candidate for func_0226c6a8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     leaf no-frame; sum-first in ip; double-mla +0x30; :13 bitfield ternary-return
 *   risk:       Double-mla chain addressing (base + (arg0&1)*0x868 + sum*0x14, load@0x30): mwcc may use add for the second product or reorder mla operands. reshape-able (split/reorder the two index terms); else permuter-class.
 *   confidence: med
 */
/* func_ov002_0226c6a8 (ov002, cls C) — leaf (no frame): player+sum guards then
 * a :13 slot-set test.
 *   sum = arg1+arg2;
 *   if (arg0 != *(int*)(d016c+0xd94)) return 0;
 *   if (sum > 4) return 0;
 *   return ((Ov002Slot*)(cf16c + (arg0&1)*0x868 + sum*0x14 + 0x30))->id
 *          ? 0x800 : 0;
 * No call => leaf, bx lr, sum lives in ip (r12). Double-mla chain + load@0x30;
 * id :13 BITFIELD tested (movs lsr -> movne#0x800/moveq#0). sum computed
 * first (orig builds ip=arg1+arg2 before the first compare). */
typedef unsigned char  u8;
typedef unsigned short u16;
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
int func_ov002_0226c6a8(int arg0, int arg1, int arg2) {
    int sum;
    sum = arg1 + arg2;
    if (arg0 != *(int *)(data_ov002_022d016c + 0xd94))
        return 0;
    if (sum > 4)
        return 0;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 +
                              sum * 0x14 + 0x30))->id)
        return 0x800;
    return 0;
}
