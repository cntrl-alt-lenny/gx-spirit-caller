/* CAMPAIGN-PREP candidate for func_02233d2c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order (h before b0/b1); proven byte-unpack idiom; pass-through 6-arg sink; bind handle once
 *   risk:       orig holds handle in r7 (high callee) across the whole body while b0/b1 take r4/r5; if mwcc colors h to r4 the allocation rotates. reshape-able (decl h first) but long-live-range coloring may need permuter-class.
 *   confidence: med
 */
/* func_ov002_02233d2c: resolve a handle (02257750 -> 021de408), then on a
 * 3-guard pass byte-unpack coords and fire a 6-arg 021d5a08 event
 * (arg4=3, arg5=(u16)(021b4618(handle)*1000)). Always returns 0. */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Self { u16 f0; };

extern int  func_ov002_02257750(void *self, void *p);
extern int  func_ov002_021de408(void *self, int v);
extern void func_ov002_021e9ac4(void);
extern int  func_ov002_0223df38(void *self, int a, int b);
extern int  func_ov002_0223de94(void *self, int idx);
extern int  func_ov002_0225764c(void *self, int a, int b);
extern int  func_ov002_021b4618(int h);
extern int  func_ov002_021d5a08(void *self, int a1, int a2, int a3, u16 a4, u16 a5);

int func_ov002_02233d2c(void *arg0) {
    struct Self *self = (struct Self *)arg0;
    int h, t, b0, b1;
    t = func_ov002_02257750(self, (void *)func_ov002_021e9ac4);
    h = func_ov002_021de408(self, t);
    if (func_ov002_0223df38(self, 0, 0) == 0) goto end;
    t  = func_ov002_0223de94(self, 0);
    b0 = t & 0xff;
    b1 = ((u16)t >> 8) & 0xff;
    if (func_ov002_0225764c(self, b0, b1) == 0) goto end;
    func_ov002_021d5a08(self, b0, b1, self->f0, 3,
                        (u16)(func_ov002_021b4618(h) * 1000));
end:
    return 0;
}
