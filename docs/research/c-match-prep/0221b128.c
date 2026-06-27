/* CAMPAIGN-PREP candidate for func_0221b128 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit2 as `>>2&1`; :13 Slot bitfield + smulbb idx*20; if-assign r5; guarded df818 pair
 *   risk:       orig uses `smulbb idx,#20` (16x16) for the slot stride — mwcc emits plain `mul` for `idx*0x14` unless idx is provably 16-bit; the `&0xff` may not steer smulbb. permuter-class (1-insn mul/smulbb).
 *   confidence: med
 */
/* func_ov002_0221b128 (cls D): bit2(self+4) guard, resolve (player,idx) via
 * 0223df38, check the :13 slot id + cf1a4 gate, pick r5 (021c8470 or 0x3e8 by
 * self.f0==0x138d), then 021e2b3c / guarded 021df818 pair / 021e2c5c. */
typedef unsigned short u16;
struct Slot13 { unsigned int id : 13; };
struct Self { u16 f0; u16 b0 : 1; u16 _r : 15; };

extern char data_ov002_022cf16c[];
extern u16  data_ov002_022cf1a4[];

extern int  func_ov002_021c8470(void);
extern void func_ov002_021df818(int self, int a, int b);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int  func_ov002_0220e518(int self);
extern int  func_ov002_0223df38(void *self, int idx, int *out);

int func_ov002_0221b128(struct Self *self) {
    int packed, player, idx, r5;
    if (((*(u16 *)((char *)self + 4) >> 2) & 1) != 0) return 0;
    if (func_ov002_0223df38(self, 0, &packed) == 0) return 0;
    player = (packed & 0xff) & 1;
    idx = ((u16)packed >> 8) & 0xff;
    if (((struct Slot13 *)(data_ov002_022cf16c + player * 0x868 + idx * 0x14 + 0x30))->id == 0)
        return 0;
    if (*(u16 *)((char *)data_ov002_022cf1a4 + player * 0x868 + idx * 0x14) == 0)
        return 0;
    if (self->f0 != 0x138d) r5 = 0x3e8; else r5 = func_ov002_021c8470();
    func_ov002_021e2b3c();
    if (func_ov002_0220e518((int)self) != 0) {
        func_ov002_021df818((int)self, 1 - (self->b0 & 1), r5);
        func_ov002_021df818((int)self, self->b0 & 1, r5);
    }
    func_ov002_021e2c5c();
    return 0;
}
