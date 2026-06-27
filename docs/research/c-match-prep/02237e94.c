/* CAMPAIGN-PREP candidate for func_02237e94 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     n held in r4 across guards; 021ff3bc declared 2-arg to emit mov r1; asymmetric (x<<17)>>23 raw (no fold); mla index
 *   risk:       021ff3bc is 1-arg in core.h but the asm sets r1=arg1 (mov r1,r6) -> declared 2-arg here to reproduce it; if the real link-time prototype truncates that, the mov r1 vanishes. struct-guessed (f4/f8 offsets) + the 2-arg-call assumption.
 *   confidence: med
 */
/* func_ov002_02237e94: 3-guard validate (021c3b60 n>=0, 021ff3bc, 021ca3f0),
 * then 021d5a6c(field4, f0, 1, f8) and 0227adb8(self, per-player
 * row+0x120+n*4, 1, f0<<16). Returns 0. */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Self { u16 f0; struct { u16 b0:1; u16 r:15; } f2; u16 f4; u16 f6; u16 f8; };

extern int func_ov002_021c3b60(int bit, int f0);
extern int func_ov002_021ff3bc(void *self, int arg1);
extern int func_ov002_021ca3f0(int bit, int code);
extern int func_ov002_021d5a6c(int a0, int a1, int a2, int a3);
extern int func_ov002_0227adb8(void *self, int a1, int a2, int a3);
extern char data_ov002_022cf16c[];

int func_ov002_02237e94(void *arg0, int arg1) {
    struct Self *self = (struct Self *)arg0;
    int n;
    n = func_ov002_021c3b60(self->f2.b0, self->f0);
    if (n < 0) return 0;
    if (func_ov002_021ff3bc(self, arg1) == 0) return 0;
    if (func_ov002_021ca3f0(self->f2.b0, self->f0) == 0) return 0;
    func_ov002_021d5a6c(((unsigned)((u16)self->f4 << 17)) >> 23,
                        self->f0, 1, self->f8);
    func_ov002_0227adb8(self,
        (int)(data_ov002_022cf16c + (self->f2.b0 & 1) * 0x868 + 0x120 + n * 4),
        1, self->f0 << 16);
    return 0;
}
