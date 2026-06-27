/* CAMPAIGN-PREP candidate for func_022291fc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack out-param &out; decl out/lo/hi order; (u16)out>>8; 1-b0 via rsb
 *   risk:       the lo/hi extract order: orig computes hi (r1 chain) before lo's `and r4`; mwcc may emit `and lo` first -> reg r4/r5 swap. reshape-able by reordering the two assignments (hi before lo).
 *   confidence: med
 */
/* func_ov002_022291fc: 0223df38 with stack out-param (&out), unpack out into
 * byte pair r4(lo)/r5(hi), 0225764c guard, then 021e2b3c(); 021de4d8 guard ->
 * 021e05fc(1-b0,0x3e8); always 021e2c5c() before returning 0. hi = (u16)out>>8
 * (lsl16;lsr16;asr8). out is the sub sp,#4 slot. */
typedef unsigned short u16;
struct S { u16 f0; u16 b0 : 1; };
extern int  func_ov002_0223df38(struct S *self, int a, void *out);
extern int  func_ov002_0225764c(struct S *self, int lo, int hi);
extern int  func_ov002_021de4d8(struct S *self, int lo, int hi);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern void func_ov002_021e05fc(int notplayer, int x);

int func_ov002_022291fc(struct S *self) {
    int out;
    int lo;
    int hi;
    if (func_ov002_0223df38(self, 0, &out) == 0) return 0;
    lo = out & 0xff;
    hi = ((u16)out >> 8) & 0xff;
    if (func_ov002_0225764c(self, lo, hi) == 0) return 0;
    func_ov002_021e2b3c();
    if (func_ov002_021de4d8(self, lo, hi) != 0)
        func_ov002_021e05fc(1 - self->b0, 0x3e8);
    func_ov002_021e2c5c();
    return 0;
}
