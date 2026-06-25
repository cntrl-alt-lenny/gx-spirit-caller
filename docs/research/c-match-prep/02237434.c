/* CAMPAIGN-PREP candidate for func_02237434 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sibling 02235904 idiom; signed /2 -> add r0,r0,lsr#31;asr#1; 1-bit0; 6-bit bitfield f6 vs 0x23
 *   risk:       021c848c result is held while ldrh f0 reloads before 021df818 (orig add r2,r0,r0,lsr#31;asr#1 keeps it in r2). a reload-vs-keep of b0/b1 across the unpack could rotate r5/r6. reshape-able via the goto-tail structure matching the sibling.
 *   confidence: med
 */
/* func_ov002_02237434: validate coords, then 021df818(self, 1-bit0,
 * 021c848c(b0,b1)/2); tail: unless a 6-bit field (bits 11-6 of u16 at +2) ==
 * 0x23, call 021e276c(bit0, f0, 1, 0). Returns 0. */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Self { u16 f0; struct { u16 b0:1; u16 a:5; u16 f6:6; u16 r:4; } f2; };

extern int  func_ov002_0223df38(void *self, int a, int b);
extern int  func_ov002_0223de94(void *self, int idx);
extern int  func_ov002_0225764c(void *self, int a, int b);
extern int  func_ov002_021c848c(int a, int b);
extern int  func_ov002_021df818(void *self, int v, int k);
extern void func_ov002_021e276c(int a0, u16 a1, int a2, int a3);

int func_ov002_02237434(void *arg0) {
    struct Self *self = (struct Self *)arg0;
    int b0, b1;
    if (func_ov002_0223df38(self, 0, 0) == 0) goto tail;
    {
        int t = func_ov002_0223de94(self, 0);
        b0 = t & 0xff;
        b1 = ((u16)t >> 8) & 0xff;
    }
    if (func_ov002_0225764c(self, b0, b1) == 0) goto tail;
    func_ov002_021df818(self, 1 - self->f2.b0,
                        func_ov002_021c848c(b0, b1) / 2);
tail:
    if (self->f2.f6 != 0x23)
        func_ov002_021e276c(self->f2.b0, self->f0, 1, 0);
    return 0;
}
