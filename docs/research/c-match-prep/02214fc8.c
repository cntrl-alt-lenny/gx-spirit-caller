/* CAMPAIGN-PREP candidate for func_02214fc8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard + 0223de94 split (lo&0xff, (short)res>>8); flag-pack (cond?0x8000:0)|kind; two posts
 *   risk:       reshape-able: second post's flag uses self->f2.bit0 RELOADED (orig ldrh[r4,#2]+<<31>>31), first uses lo -- keep distinct; the (short)res>>8 must emit asr#8 (int-promote of the signed half) else lsr diverges.
 *   confidence: med
 */
/* func_ov002_02214fc8: guard func_0223df38(self,0,0); fetch pair via
 * func_0223de94(self,0) -> lo=res&0xff, hi=((short)res>>8)&0xff; guard
 * func_021c1e44(self,lo,hi)==0; then two func_021d479c arg-pack posts:
 *   (1) id=(lo?0x8000:0)|0x1b, payload (u16)hi, kind 1, 0;
 *   (2) id=(self->f2.bit0?0x8000:0)|0x1c, 0, 0, 0.
 * Returns 0. lo/hi held in r5/r6 across the calls. */

typedef unsigned short u16;

struct Self02214fc8 { u16 f0; u16 bit0 : 1; };

extern int func_ov002_0223df38(struct Self02214fc8 *self, int b, int c);
extern int func_ov002_0223de94(struct Self02214fc8 *self, int idx);
extern int func_ov002_021c1e44(struct Self02214fc8 *self, int lo, int hi);
extern int func_ov002_021d479c(int id, int a, int b, int c);

int func_ov002_02214fc8(struct Self02214fc8 *self) {
    int res, lo, hi;
    if (func_ov002_0223df38(self, 0, 0) == 0) return 0;
    res = func_ov002_0223de94(self, 0);
    lo = res & 0xff;
    hi = (int)((short)res >> 8) & 0xff;
    if (func_ov002_021c1e44(self, lo, hi) != 0) return 0;
    func_ov002_021d479c((u16)((lo ? 0x8000 : 0) | 0x1b), (u16)hi, 1, 0);
    func_ov002_021d479c((u16)((self->bit0 ? 0x8000 : 0) | 0x1c), 0, 0, 0);
    return 0;
}
