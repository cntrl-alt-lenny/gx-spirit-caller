/* CAMPAIGN-PREP candidate for func_02244a74 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: field6 narrow + branch, bit0 narrow + rsb(1-x), per-step calls
 *   risk:       reshape-able/struct-guessed: .L_64 arg layout ambiguous — asm sets r3=ld0e6c+0xb2, r1=1-bit0?, r2=0xe; r0 origin unclear. data_022d0e6c +0xb2 u16 inferred. Recheck 0223de04 signature/arg order.
 *   confidence: low
 */
// func_ov002_02244a74 — bitfield narrow + branch dispatch (cls D)
// obj+0x2 -> field6 (bits6..11). if !=5 return 1.
// else step at base+0x5b8: 0->.L_34, 1->.L_64, else->ret1
// .L_34: rsb 1-bit0, call 0226b194(1-bit0, obj[0], 0); step++; ret0
// .L_64: call 0223de04(1? ...); note r0=(h2 bit0), r1=field?, r2=0xe, r3=data+0xb2; ret1

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022ce288[];
extern u8 data_ov002_022d0e6c[];

extern void func_ov002_0223de04(u32 a, u32 b, int c, u16 d);
extern void func_ov002_0226b194(u32 a, u16 b, int c);

int func_ov002_02244a74(u16 *obj) {
    u16 h2 = obj[1];                 /* obj+0x2 */
    u32 f6 = (u32)(h2 << 0x14) >> 0x1a;     /* bits6..11 */
    if (f6 != 5)
        return 1;
    {
        int step = *(int *)(data_ov002_022ce288 + 0x5b8);
        if (step == 0) {                /* .L_34 */
            u32 bit0 = (u32)(h2 << 0x1f) >> 0x1f;
            u16 h0 = obj[0];
            func_ov002_0226b194(1 - bit0, h0, 0);
            *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
            return 0;
        } else if (step == 1) {         /* .L_64 */
            u16 v = *(u16 *)(data_ov002_022d0e6c + 0xb2);
            u32 bit0 = (u32)(h2 << 0x1f) >> 0x1f;
            func_ov002_0223de04(0 /*r0 set by callee path*/, bit0, 0xe, v);
            return 1;
        }
    }
    return 1;                           /* .L_84 */
}
