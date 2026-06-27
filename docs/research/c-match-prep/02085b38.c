/* CAMPAIGN-PREP candidate for func_02085b38 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order via out[idx]; reload s16 each use; rsb=negate; asr=signed >>12
 *   risk:       dense liveness across 4 calls + interleaved out[0x30]/0x34 mul-shift; mwcc may reorder the two trig-result stores or pick different temp regs — permuter-class.
 *   confidence: low
 */
/* func_02085b38: fixed-point 2x2 rotation/scale matrix setup with 4 trig calls.
 * in @ r1: s16 @0x20,0x22 (angles); s32 @0x24,0x28 (scale); u16 @0x2c,0x2e (scale.frac).
 * out @ r0: fx32 @0x00,0x04,0x10,0x14,0x30,0x34.
 * func_0208be38(int,int) sets the DS divider/sincos; func_0208bed8() returns the result. */
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef signed long long s64;
typedef s32 fx32;

typedef struct {
    char _00[0x20];
    s16 a20;
    s16 a22;
    s32 a24;
    s32 a28;
    char _2c_pre[0]; /* placeholder */
    u16 a2c;
    u16 a2e;
} In;

extern void func_0208be38(int x, int y);
extern int  func_0208bed8(void);

void func_02085b38(fx32 *out, In *in) {
    int c2c = in->a2c << 12;
    int c2e = in->a2e << 12;
    int t;
    func_0208be38(c2e, c2c);
    out[0] = in->a22;
    out[5] = in->a22;
    t = func_0208bed8();
    out[1] = (-in->a20 * t) >> 12;
    func_0208be38(c2c, c2e);
    out[12] = ((in->a2c * (0x1000 - (in->a20 + in->a22))) << 3) - ((in->a24 * in->a2c) << 4);
    out[13] = ((in->a2e * (0x1000 + (in->a20 - in->a22))) << 3) + ((in->a28 * in->a2e) << 4);
    t = func_0208bed8();
    out[4] = (in->a20 * t) >> 12;
}
