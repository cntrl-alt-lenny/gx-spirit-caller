/* CAMPAIGN-PREP candidate for func_0226ada4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D u16 flag-builder; 4 if-equal orr; u16 truncation each
 *   risk:       reshape-able: condition order is arg2==1, arg3!=0, arg2==8, arg2==7 (must keep source order for the cmp sequence); flags is u16 (lsl16/lsr16 after every orr). Low divergence risk.
 *   confidence: high
 */
typedef unsigned short u16;
typedef signed int s32;

extern void func_ov002_0226acf8(s32 a, s32 b, u16 c, u16 d);

void func_ov002_0226ada4(s32 arg0, s32 arg1, s32 arg2, s32 arg3) {
    u16 flags;

    if (arg1 == 0)
        return;

    flags = 0;
    if (arg2 == 1)
        flags |= 0x1;
    if (arg3 != 0)
        flags |= 0x2;
    if (arg2 == 8)
        flags |= 0x4;
    if (arg2 == 7)
        flags |= 0x8;

    func_ov002_0226acf8(arg0, 1, (u16)arg1, flags);
}
