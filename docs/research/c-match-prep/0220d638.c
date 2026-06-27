/* CAMPAIGN-PREP candidate for func_0220d638 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order lo/mid/hi (r7/r5/r6); asr#8 signed mid; bind call-result; low13 deref
 *   risk:       reshape-able: the unpack uses (r<<16)>>16 then asr#8 for mid -- a signed-short narrow then arithmetic shift. If mwcc keeps r as a plain int and emits lsr not asr, mid diverges; the call return is reused as both the unpack source and the *q deref, so its binding must hold one reg.
 *   confidence: med
 */
/* func_ov002_0220d638 (ov002, class C, MED) -- batch p_0086.
 * guard 021ff3bc(self); r=021b947c(self->f14);
 * lo = r & 0xff ; mid = (signed)((r<<16)>>16) >> 8 & 0xff ; hi = (r>>16)&0xffff;
 * 021c93f0(lo, mid, hi); if mid != 0xe return 0;
 * v = *(int*)ret_of_021c93f0? -- orig: ldr r0,[r0] after call low13 -> 0202e234(v);
 * if 0202e234==0 return 0; return 021c33e4(self->f2.p, lo, hi) != 0.
 * decl order lo(r7), mid(r5), hi(r6) to match first-used-first-allocated.
 */
typedef unsigned short u16;
typedef unsigned char  u8;

struct Self0220d638 {
    u16 f0;
    struct { u16 p : 1; u16 _r : 15; } f2; /* +0x2 */
    u8  _pad4[0x10];
    int f14;                                /* +0x14 */
};

extern int  func_ov002_021ff3bc(struct Self0220d638 *self);
extern int *func_ov002_021b947c(int a);
extern int  func_ov002_021c93f0(int lo, int mid, int hi);
extern int  func_0202e234(int v);
extern int  func_ov002_021c33e4(int p, int lo, int hi);

int func_ov002_0220d638(struct Self0220d638 *self) {
    int packed;
    int lo, mid, hi;
    int *q;
    int v;
    if (func_ov002_021ff3bc(self) == 0) return 0;
    q = func_ov002_021b947c(self->f14);
    packed = (int)q;
    lo  = packed & 0xff;
    mid = (((packed << 16) >> 16) >> 8) & 0xff;
    hi  = (unsigned int)packed >> 16;
    func_ov002_021c93f0(lo, mid, hi);
    if (mid != 0xe) return 0;
    v = *q;
    v = (v << 19) >> 19;
    if (func_0202e234(v) == 0) return 0;
    return func_ov002_021c33e4(self->f2.p, lo, hi) != 0;
}
