/* CAMPAIGN-PREP candidate for func_0222e1bc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl lo(r5) before hi(r6); and r5 first then asr#8 hi; mapped m as u16 zero-ext
 *   risk:       orig computes lo (and r5,r0,#0xff) BEFORE deriving hi (lsl#10;lsr#10;asr#8) from the same r0; declaring hi first would swap r5/r6. reshape-able (lo declared first) — the &0xff before >>8 ordering is the lever.
 *   confidence: med
 */
/* func_ov002_0222e1bc: gate on 0223df38(self,0,0); decode 0223de94(self,0)
 * into (lo, hi) bytes; if 0225764c(self,lo,hi) passes, map (lo,hi) via
 * 021c84e0 and notify 021e276c(f2.bit0, f0, 17, mappedu16). */
typedef unsigned short u16;
struct F0222e1bc_F2 { u16 bit0:1; u16 rest:15; };
struct F0222e1bc_Self { u16 f0; struct F0222e1bc_F2 f2; };
extern int  func_ov002_0223df38(void *self, int a, int b);
extern int  func_ov002_0223de94(void *self, int a);
extern int  func_ov002_0225764c(void *self, int lo, int hi);
extern int  func_ov002_021c84e0(int lo, int hi);
extern void func_ov002_021e276c(int bit0, int f0, int k, int v);

int func_ov002_0222e1bc(struct F0222e1bc_Self *self) {
    if (func_ov002_0223df38(self, 0, 0) == 0)
        return 0;
    {
        int r  = func_ov002_0223de94(self, 0);
        int lo = r & 0xff;
        int hi = (int)(((u16)r >> 8) & 0xff);
        if (func_ov002_0225764c(self, lo, hi) != 0) {
            int m = func_ov002_021c84e0(lo, hi);
            func_ov002_021e276c(self->f2.bit0, self->f0, 0x11, (int)(u16)m);
        }
    }
    return 0;
}
