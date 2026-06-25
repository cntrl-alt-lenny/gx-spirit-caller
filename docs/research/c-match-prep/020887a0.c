/* CAMPAIGN-PREP candidate for func_020887a0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind data_021a524c base in r4; conditional-shift (sh>=0?1<<sh:0) as if-assign movge/movlt; reload fields each use
 *   risk:       Conditional shift: movge r0,#1;movge r2,r0,lsl r1;movlt r2,#0 — the mask temp is built in two movge then a movlt. if(sh>=0) if-assign should match, but the 1<<sh ordering may rotate the temp reg. reshape-able (if-assign, not ternary).
 *   confidence: med
 */
/* func_020887a0 (main, class C). linear calls + conditional shift.
 * r4=&data_021a524c held across. if(!f0) return.
 * f1c=0; Fill32(f0c?..., f10, f14)... exact:
 *   Fill32([+0xc], [+0x14])  with r0=0? -> Fill32(0, [+0xc], [+0x14])? see args.
 * ASM: 1st Fill32: r0=0(from str), r1=[+0xc], r2=[+0x14].
 *      2nd Fill32: r0=0, r1=[+0x10], r2=[+0x14].
 *      func_02092904([+0xc], [+0x14]); func_02092904([+0x10], [+0x14]).
 *      cond = [+0x2c]; func_020950a0([+0x24],[+0x28], cond>=0?1<<cond:0, 0).
 */

struct S887a0 {
    int  f0;                  /* +0x00 */
    char _pad04[0x0c - 0x04];
    int  fc;                  /* +0x0c */
    int  f10;                 /* +0x10 */
    int  f14;                 /* +0x14 */
    char _pad18[0x1c - 0x18];
    int  f1c;                 /* +0x1c */
    char _pad20[0x24 - 0x20];
    int  f24;                 /* +0x24 */
    int  f28;                 /* +0x28 */
    int  f2c;                 /* +0x2c shift */
};

extern struct S887a0 data_021a524c;
extern void Fill32(int v, int dst, int len);
extern void func_02092904(int a, int b);
extern void func_020950a0(int a0, int a1, int a2, int a3);

void func_020887a0(void) {
    int sh;
    int mask;
    if (data_021a524c.f0 == 0) return;
    data_021a524c.f1c = 0;
    Fill32(0, data_021a524c.fc, data_021a524c.f14);
    Fill32(0, data_021a524c.f10, data_021a524c.f14);
    func_02092904(data_021a524c.fc, data_021a524c.f14);
    func_02092904(data_021a524c.f10, data_021a524c.f14);
    sh = data_021a524c.f2c;
    if (sh >= 0) mask = 1 << sh; else mask = 0;
    func_020950a0(data_021a524c.f24, data_021a524c.f28, mask, 0);
}
