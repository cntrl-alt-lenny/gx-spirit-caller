/* CAMPAIGN-PREP candidate for func_02217888 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     proven Ov002Slot.id recipe (mla byte1*20+base); predicated u16 +8 copy
 *   risk:       byte1 extract emits asr#8 in orig (signed) where ((u16)out>>8)&0xff gives lsr — 1-insn near-miss. reshape-able: try (short)((u16)out)>>8. Slot/mla path is brief-348-proven; field +8 u16 struct-guessed.
 *   confidence: med
 */
/* func_ov002_02217888 (ov002, class D) — 0223df38 out-param, Ov002Slot.id at
 * cf16c+(lo&1)*0x868 + byte1*20 + 0x30; if id!=0 copy u16 field +8 A->B. */
#include "ov002_core.h"
extern int  func_ov002_0223df38(void *a, int b, int *out);

struct Self02217888 {
    u16 f0;            /* +0 */
    u16 b0 : 1;        /* +2 */
    u16 _p2 : 15;
    u16 _p4;           /* +4 */
    u16 _p6;           /* +6 */
    u16 f8;            /* +8 */
};

int func_ov002_02217888(struct Self02217888 *arg0, struct Self02217888 *arg1) {
    int out;
    int lo, byte1;
    struct Ov002Slot *slot;
    if (func_ov002_0223df38(arg0, 0, &out) == 0) return 0;
    lo = out & 0xff;
    byte1 = ((unsigned short)out >> 8) & 0xff;
    slot = (struct Ov002Slot *)(data_ov002_022cf16c + (lo & 1) * 0x868 + byte1 * 20 + 0x30);
    if (slot->id != 0) arg1->f8 = arg0->f8;
    return 0;
}
