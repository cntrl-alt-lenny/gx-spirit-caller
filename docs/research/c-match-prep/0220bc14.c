/* CAMPAIGN-PREP candidate for func_0220bc14 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: movs r4,r1 -> if(arg1==0) first; w2 :N bitfields; arg1.f0 reloaded per call; b0!=b0 compare
 *   risk:       reshape-able: orig does movs r4,r1 (sets flags + saves) so the arg1==0 test must be FIRST and share the move; arg1->f0 is reloaded before each call (two ldrh) -- two reads force that. Low residual reg-alloc risk.
 *   confidence: med
 */
/* func_ov002_0220bc14 (ov002, class D, MED) — batch p_0027.
 * two same-type ptrs (self, arg1). arg1!=0; arg1.w2.f1<=0xa; arg1.w2.f12==0;
 * arg1.w2.b0 != self.w2.b0; 0202b878(arg1.f0)==0x16; 0202b8c0(arg1.f0)==0;
 * ret 021ff2c8(self, self.w2.b0)!=0. */
typedef unsigned short u16;

struct Self0220bc14 {
    u16 f0;
    struct { u16 b0:1; u16 f1:5; u16 kind:6; u16 f12:2; u16 _t:2; } w2; /* +0x2 */
};

extern int func_0202b878(int id);
extern int func_0202b8c0(int id);
extern int func_ov002_021ff2c8(struct Self0220bc14 *self, int b0);

int func_ov002_0220bc14(struct Self0220bc14 *self, struct Self0220bc14 *arg1) {
    if (arg1 == 0) return 0;
    if (arg1->w2.f1 > 0xa) return 0;
    if (arg1->w2.f12 != 0) return 0;
    if (arg1->w2.b0 == self->w2.b0) return 0;
    if (func_0202b878(arg1->f0) != 0x16) return 0;
    if (func_0202b8c0(arg1->f0) != 0) return 0;
    return func_ov002_021ff2c8(self, self->w2.b0) != 0 ? 1 : 0;
}
