/* CAMPAIGN-PREP candidate for func_0226ad5c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D u16 flag-builder; lsl16/lsr16 = u16 local; if-set orr
 *   risk:       reshape-able: each orr is followed by lsl#16/lsr#16, so flags MUST be a u16 local (a plain int gives no truncation pair); ip starts 0 before the arg1==0 test, matching mov ip,#0 placement.
 *   confidence: high
 */
typedef unsigned short u16;
typedef signed int s32;

extern void func_ov002_0226acf8(s32 a, s32 b, u16 c, u16 d);

void func_ov002_0226ad5c(s32 arg0, s32 arg1, s32 arg2, s32 arg3) {
    u16 flags;

    if (arg1 == 0)
        return;

    flags = 0;
    if (arg2 != 0)
        flags |= 0x1;
    if (arg3 != 0)
        flags |= 0x2;

    func_ov002_0226acf8(arg0, 1, (u16)arg1, flags);
}
