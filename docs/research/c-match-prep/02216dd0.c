/* CAMPAIGN-PREP candidate for func_02216dd0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     out-unpack + byte-split; flag via !=cmp(movne#1); pack (flag&0xf)<<4|1 u16; bit0 on stack
 *   risk:       orig leaves r2 (021d59cc arg3) unset in the .L_444 fall-through (stale) and reuses r6 for bit0 clobbering self; my arg3=0 guess is struct-guessed. Also movne-flag polarity. struct-guessed.
 *   confidence: low
 */
/* func_ov002_02216dd0: 0223df38 out-unpack -> lo/byte1 -> 0225764c guard; build a
 * 4-bit flag (set iff self->f0==0x13b0 and d016c+0xcec != self->b0), pack
 * ((flag&0xf)<<4)|1 + bit0-on-stack into 021d59cc, then 0226b11c. ret 0. */
#include "ov002_core.h"
extern int func_ov002_0223df38(void *a, int b, int *out);
extern int func_ov002_0225764c(int a, int b, int c);
extern void func_ov002_021d59cc(int a, int b, int c, int d, u16 e);
extern void func_ov002_0226b11c(int a, int b);

int func_ov002_02216dd0(struct Ov002Self *arg0) {
    int out;
    int lo, hi;
    int flag;
    int packed;
    if (func_ov002_0223df38(arg0, 0, &out) == 0) return 0;
    lo = out & 0xff;
    hi = ((u16)out >> 8) & 0xff;
    if (func_ov002_0225764c((int)arg0, lo, hi) == 0) return 0;
    flag = 0;
    if (*(u16 *)arg0 == 0x13b0) {
        if (*(int *)(data_ov002_022d016c + 0xcec) != arg0->b0) flag = 1;
    }
    packed = (u16)(((flag & 0xf) << 4) | 1);
    func_ov002_021d59cc(lo, hi, 0, packed, arg0->b0);
    func_ov002_0226b11c(lo, hi);
    return 0;
}
