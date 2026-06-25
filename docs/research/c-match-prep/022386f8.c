/* CAMPAIGN-PREP candidate for func_022386f8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sibling of 02237e94 tail; 021ff3bc 1-arg here; bit0 bitfield; mla per-player index +0x120+n*4; f0<<16
 *   risk:       orig parks n in lr (movs lr,r0; add r1,r1,lr lsl#2) — an unusual callee reg mwcc won't pick for a plain int local, so n likely lands in r4 and the add reg differs. permuter-class (the lr placement is mwcc-internal); also f8 offset struct-guessed.
 *   confidence: med
 */
/* func_ov002_022386f8: guard 021ff3bc; n = 021b9aa8(bit0, f8); if n>=0 store
 * via 0227adb8(self, per-player row + 0x120 + n*4, 1, f0<<16). Returns 0. */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Self { u16 f0; struct { u16 b0:1; u16 r:15; } f2; char _p4[4]; u16 f8; };

extern int func_ov002_021ff3bc(void *self);
extern int func_ov002_021b9aa8(int bit, int field);
extern int func_ov002_0227adb8(void *self, int a1, int a2, int a3);
extern char data_ov002_022cf16c[];

int func_ov002_022386f8(void *arg0) {
    struct Self *self = (struct Self *)arg0;
    int n;
    if (func_ov002_021ff3bc(self) == 0) return 0;
    n = func_ov002_021b9aa8(self->f2.b0, self->f8);
    if (n < 0) return 0;
    func_ov002_0227adb8(self,
        (int)(data_ov002_022cf16c + (self->f2.b0 & 1) * 0x868 + 0x120 + n * 4),
        1, self->f0 << 16);
    return 0;
}
