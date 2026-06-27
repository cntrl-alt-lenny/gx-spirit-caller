/* CAMPAIGN-PREP candidate for func_02229a88 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f6.hi :8 bitfield; (u16)v>>8 guard; v>>16&0xffff top; f0<<16 last arg
 *   risk:       021b947c result reg-alloc: orig interleaves r1/r3/r5 to share the >>16 (r3 reused for both r1 and r5). mwcc may not share, adding a shift/mov. reshape-uncertain -> permuter-class. 0x18+0x400 fold (see 02228b08).
 *   confidence: low
 */
/* func_ov002_02229a88: 021ff3bc guard; require self->f6.hi==1; 0223def4(self,0);
 * unpack 021b947c() result: lo=v&0xff(r4), hi8=(u16)v>>8&0xff must==0xe, top=
 * (v>>16)&0xffff(r5). 021c33e4(b0,lo,top) guard; then 0227adb8(b0, cf16c+(lo&1)*
 * 0x868+0x18+0x400+top*4, 1, f0<<16). f6.hi via :8 bitfield => lsl16;lsr24. The
 * hi8 extract: (u16)v>>8 (lsl16;lsr16;asr8); top: v>>16 unsigned. */
typedef unsigned short u16;
struct S { u16 f0; u16 b0 : 1; u16 : 15; u16 pad4; struct { u16 lo : 8; u16 hi : 8; } f6; };
extern char data_ov002_022cf16c[];
extern int  func_ov002_021ff3bc(struct S *self);
extern int  func_ov002_0223def4(struct S *self, int idx);
extern unsigned int func_ov002_021b947c(void);
extern int  func_ov002_021c33e4(int player, int lo, int top);
extern void func_ov002_0227adb8(int player, int *ptr, int one, int f0hi);

int func_ov002_02229a88(struct S *self) {
    unsigned int v;
    int lo;
    int top;
    if (func_ov002_021ff3bc(self) == 0) return 0;
    if (self->f6.hi != 1) return 0;
    func_ov002_0223def4(self, 0);
    v = func_ov002_021b947c();
    if (((u16)v >> 8 & 0xff) != 0xe) return 0;
    lo = v & 0xff;
    top = (v >> 16) & 0xffff;
    if (func_ov002_021c33e4(self->b0, lo, top) == 0) return 0;
    func_ov002_0227adb8(self->b0,
        (int *)(data_ov002_022cf16c + (lo & 1) * 0x868 + 0x18 + 0x400 + top * 4),
        1, self->f0 << 16);
    return 0;
}
