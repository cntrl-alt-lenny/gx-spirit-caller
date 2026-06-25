/* CAMPAIGN-PREP candidate for func_02228fac (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl v/lo/hi first-use order; (u16)v>>8 for lsl16;lsr16;asr8; stacked arg4=0
 *   risk:       021d59cc 5th arg goes through sp (sub sp,#4); if my proto arity/stack-arg type mismatches, the str [sp] vs reg diverges. struct-guessed on 0223de94/021d59cc arg types.
 *   confidence: med
 */
/* func_ov002_02228fac: query 0223df38; unpack 0223de94 result into byte pair
 * bound r5(lo)/r6(hi); 0225764c guard; 021d59cc (5-arg, stack arg4=0); then
 * 021e276c(1-b0, f0, 1, 0). The hi byte uses (u16)v>>8 (zero-extend then signed
 * >>8 -> lsl16;lsr16;asr8 in orig). sub sp,#4 frame is the stacked arg4. */
typedef unsigned short u16;
struct S { u16 f0; u16 b0 : 1; };
extern int  func_ov002_0223df38(struct S *self, int a, void *out);
extern int  func_ov002_0223de94(struct S *self, int idx);
extern int  func_ov002_0225764c(struct S *self, int lo, int hi);
extern int  func_ov002_021d59cc(int lo, int hi, int f0, int k, u16 z);
extern void func_ov002_021e276c(int player, u16 f0, int k, int x);

int func_ov002_02228fac(struct S *self) {
    int v;
    int lo;
    int hi;
    if (func_ov002_0223df38(self, 0, 0) == 0) return 0;
    v = func_ov002_0223de94(self, 0);
    lo = v & 0xff;
    hi = ((u16)v >> 8) & 0xff;
    if (func_ov002_0225764c(self, lo, hi) == 0) return 0;
    func_ov002_021d59cc(lo, hi, self->f0, 2, 0);
    func_ov002_021e276c(1 - self->b0, self->f0, 1, 0);
    return 0;
}
