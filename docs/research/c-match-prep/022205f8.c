/* CAMPAIGN-PREP candidate for func_022205f8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-chain dispatch; bit2 via (f4>>2)&1; inverted set-bit (bit0?0:0x8000)|0x19; byte-split d
 *   risk:       orig builds flag via rsbs r0,bit0,#1;movne#0x8000;moveq#0 (inverted polarity) and marshals all four 021d479c args as u16 in a fixed reg order; mwcc may pick cmp;moveq#0x8000 (wrong polarity) or reorder the byte-split. reshape-able (keep ternary as written; (u8) cast if byte-split mis-peepholes).
 *   confidence: med
 */
/* func_ov002_022205f8: dispatch on ce288+0x5a8. 0x7f->0226b204(1)->0. 0x80: if
 * bit2 of self->f4 set ret 0; gate 0223df38; fetch 0223de94(self,0); arg-pack a
 * kind-0x19 event (0x8000 set when bit0 clear) with byte-split payload into
 * 021d479c; ret 0x7f. */
#include "ov002_core.h"
extern int  func_ov002_0223df38(void *a, int b, int c);
extern void func_ov002_0226b204(int a);

int func_ov002_022205f8(struct Ov002Self *arg0) {
    int st = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (st == 0x7f) {
        func_ov002_0226b204(1);
        return 0;
    }
    if (st == 0x80) {
        int d;
        int flag;
        if ((*(unsigned short *)((char *)arg0 + 4) >> 2) & 1) return 0;
        if (func_ov002_0223df38(arg0, 0, 0) == 0) return 0;
        d = func_ov002_0223de94(arg0, 0);
        flag = arg0->b0 ? 0 : 0x8000;
        func_ov002_021d479c((u16)(flag | 0x19),
                            (u16)*(int *)(data_ov002_022cd3f4 + 0x1c),
                            (u16)((d >> 8) & 0xff),
                            (u16)(d & 0xff));
        return 0x7f;
    }
    return 0;
}
