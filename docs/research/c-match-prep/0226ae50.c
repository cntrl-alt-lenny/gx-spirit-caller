/* CAMPAIGN-PREP candidate for func_0226ae50 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D u16 flag-builder; tail-call via return; final unconditional |0x10
 *   risk:       reshape-able: must be a tail call (orig ends bx ip), so write as last stmt with no return value capture; flags|=0x10 is unconditional AFTER the if-chain, then truncated to u16 (orr #0x10; lsl16; lsr16).
 *   confidence: med
 */
typedef unsigned short u16;
typedef signed int s32;

extern void func_ov002_0226acf8(s32 a, s32 b, u16 c, u16 d);

void func_ov002_0226ae50(s32 arg0, s32 arg1, s32 arg2) {
    u16 flags;

    flags = 0;
    if (arg2 == 1)
        flags |= 0x1;
    if (arg2 == 8)
        flags |= 0x4;
    if (arg2 == 7)
        flags |= 0x8;
    flags |= 0x10;

    func_ov002_0226acf8(arg0, 2, (u16)arg1, flags);
}
