/* CAMPAIGN-PREP candidate for func_0222b030 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f6.hi :8 read for arg + decrement; clean r>=0 signed guard; mla parity +0x5d0+r*4
 *   risk:       orig reloads f6 (ldrh) for the arg AND again for the decrement (2 ldrh); if mwcc binds f6 across the call it drops one ldrh. reshape-able: read self->f6.hi twice (don't cache). Minor: r*4 add ordering.
 *   confidence: med
 */
/* func_ov002_0222b030: smaller twin of 0222a3e0 body. if f6.hi==0 return 0;
 * 0223def4(self,hi-1); 021b9a30(b0, def4result); if result<0 skip to decrement;
 * else 021d7ee4(self, b0, cf16c+(b0&1)*0x868+0x5d0+result*4). Always decrement
 * f6.hi (:8 insert) and return 0x80. result<0 is a clean signed test on the call
 * value (movs ip; bmi). f6.hi via :8 bitfield (lsl16;lsr24). */
typedef unsigned short u16;
struct S { u16 f0; u16 b0 : 1; u16 : 15; u16 pad4; struct { u16 lo : 8; u16 hi : 8; } f6; };
extern char data_ov002_022cf16c[];
extern int  func_ov002_0223def4(struct S *self, int idx);
extern int  func_ov002_021b9a30(int player, int x);
extern void func_ov002_021d7ee4(struct S *self, int player, int *ptr);

int func_ov002_0222b030(struct S *self) {
    int idx;
    int r;
    if (self->f6.hi == 0) return 0;
    idx = func_ov002_0223def4(self, self->f6.hi - 1);
    r = func_ov002_021b9a30(self->b0, idx);
    if (r >= 0)
        func_ov002_021d7ee4(self, self->b0,
            (int *)(data_ov002_022cf16c + (self->b0 & 1) * 0x868 + 0x5d0 + r * 4));
    self->f6.hi = self->f6.hi - 1;
    return 0x80;
}
